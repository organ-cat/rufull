package com.cat.rufull.test.order;

import com.cat.rufull.domain.model.*;
import com.cat.rufull.domain.service.order.OrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:META-INF/spring/root-context.xml"})
public class OrderServiceTest {
    private static Logger logger = LoggerFactory.getLogger(OrderServiceTest.class);

    @Autowired
    private OrderService orderService;

    @Test
    public void testFindOrderByAccountId() {
        List<Order> orderList = orderService.findOrderByAccountId(1);

        logger.info("OrderService.FindOrderByAccountId: " + 1);
        listOrder(orderList);
    }

    @Test
    public void testFindOrderById() {
        Order order = orderService.findOrderById(2);

        logger.info("OrderService.findOrderById: " + 2);
        showOrder(order);
    }

    public void testCancelOrder() {
        Order order = orderService.findOrderById(3);

        orderService.cancelOrder(order);

        order = orderService.findOrderById(3);
        logger.info("After canceled: " + 3);
        showOrder(order);
    }

//    @Test
//    public void testUpdateOrder() {
//        Order order = orderMapper.findOrderById(4);
//        logger.info("Before updated: " + 4);
//        showOrder(order);
//
//        order.setStatus("已完成");
//
//        orderMapper.updateOrder(order);
//
//        order = orderMapper.findOrderById(4);
//        logger.info("After updated: " + 4);
//        showOrder(order);
//    }
//
//    @Test
//    public void testInsertOrder() {
//        Account account = new Account();
//        account.setId(2);
//
//        Address address = new Address();
//        address.setId(3);
//
//        Business business = new Business();
//        business.setId(3);
//
//        Shop shop = new Shop();
//        shop.setId(3);
//
//        Product product = new Product();
//        product.setId(11);
//        product.setProductName("白切鸡饭");
//        product.setPrice(new BigDecimal("12.00"));
//
//        List<LineItem> itemList = new ArrayList<LineItem>();
//
//        LineItem lineItem = new LineItem();
//        lineItem.setProductName(product.getProductName());
//        lineItem.setPrice(product.getPrice());
//        lineItem.setProductId(product.getId());
//        lineItem.setQuantity(2);
//
//        itemList.add(lineItem);
//
//        Order order = new Order();
//        order.setOrderNumber("2017113001");
//        order.setCreatedTime(new Date());
//        order.setStatus("等待支付");
//        order.setPaymentMethod("在线支付");
//        order.setPaymentStatus("未支付");
//        order.setNotes("测试插入订单");
//        order.setAccountId(account.getId());
//        order.setShop(shop);
//        order.setBusinessId(business.getId());
//        order.setLineItems(itemList);
//        order.setAddress(address);
//
//        BigDecimal total = new BigDecimal("0");
//        Iterator<LineItem> iterator = itemList.iterator();
//        for (LineItem item: itemList) {
//            BigDecimal price = item.getPrice();
//            BigDecimal quantity = new BigDecimal(String.valueOf(item
//                    .getQuantity()));
//            total = total.add(price.multiply(quantity));
//        }
//        order.setTotal(total);
//
//        logger.info("Before order inserted: ");
//        showOrder(order);
//
//        // 插入订单
//        orderMapper.insertOrder(order);
//
//        logger.info("after order inserted: ");
//        logger.info("Order - id: " + order.getId());
//
//        for (LineItem item: order.getLineItems()) {
//            item.setOrderId(order.getId());
//        }
//
//        // 插入订单项
//        lineItemMapper.insertLineItems(order.getLineItems());
//
//        logger.info("after items inserted: ");
//        for (LineItem item: order.getLineItems()) {
//            logger.info("LineItem - id: " + item.getId());
//        }
//
//        Order persistOrder = orderMapper.findOrderById(order.getId());
//        logger.info("Show Order detail: ");
//        showOrder(persistOrder);
//    }

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
