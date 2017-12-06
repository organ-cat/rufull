package com.cat.rufull.test.order;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.LineItem;
import com.cat.rufull.domain.model.Order;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:META-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class OrderControllerTest {
    private static Logger logger = LoggerFactory.getLogger(OrderControllerTest.class);

    @Autowired
    private WebApplicationContext ctx;

    private MockMvc mockMvc;
    private MockHttpSession session;

    @Before
    public void before() {
        mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
        session = new MockHttpSession();

        Account account = new Account();
        account.setId(4);

        session.setAttribute("account", account);
    }

    @Test
    public void testList() throws Exception {
        MvcResult result = mockMvc
                .perform(get("/order").session(session))
                .andExpect(view().name("order/list"))
                .andDo(print())
                .andReturn();

        List<Order> orders = (List<Order>) result.getModelAndView().getModel().get("orders");

        Assert.assertNotNull(orders);

        listOrder(orders);
    }

    @Test
    public void testShow() throws Exception {
        MvcResult result = mockMvc
                .perform(get("/order/2"))
                .andExpect(view().name("order/show"))
                .andDo(print())
                .andReturn();

        Order order = (Order) result.getModelAndView().getModel().get("order");

        Assert.assertNotNull(order);

        showOrder(order);
    }

    @Test
    public void testCancel() throws Exception {
        // 取消订单
        mockMvc.perform(post("/order/cancel/3"))
                .andExpect(redirectedUrl("/order/3"))
                .andDo(print())
                .andReturn();

        MvcResult result = mockMvc
                .perform(get("/order/3"))
                .andExpect(view().name("order/show"))
                .andDo(print())
                .andReturn();

        Order order = (Order) result.getModelAndView().getModel().get("order");

        Assert.assertNotNull(order);
        Assert.assertEquals(Order.STATUS_CANCELED, order.getStatus());

        showOrder(order);
    }

    public void listOrder(List<Order> orders) {
        for (Order order : orders) {
            showOrder(order);
        }
    }

    public void showOrder(Order order) {
        System.out.println(order);

        System.out.println("  The order's shop is: ");
        System.out.println("    " + order.getShop());

        System.out.println("  The order's address is: ");
        System.out.println("    " + order.getAddress());

        System.out.println("  The order's items are: ");
        for (LineItem lineItem: order.getLineItems()) {
            System.out.println("    " + lineItem);
        }
    }
}
