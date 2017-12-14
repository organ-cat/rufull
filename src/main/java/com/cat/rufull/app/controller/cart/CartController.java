package com.cat.rufull.app.controller.cart;

import com.cat.rufull.domain.model.*;
import com.cat.rufull.domain.service.account.AddressService;
import com.cat.rufull.domain.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    protected Carts carts;

    private ProductService productService;

    private AddressService addressService;

    private static final String SESSION_ACCOUNT = "account";

    @ModelAttribute
    public Carts getCarts() {
        return carts;
    }

    /**
     * 显示所有购物车
     *
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String list() {
        return "cart/list";
    }

    /**
     * 显示当前商店的购物车
     *
     * @param shopId
     * @param uiModel
     * @return
     */
    @RequestMapping(value = "/{shopId}", method = RequestMethod.GET)
    public String show(@PathVariable("shopId") Integer shopId, Model uiModel) {
        uiModel.addAttribute("cart", carts.getCart(shopId));
        return "cart/show";
    }

    /**
     * 添加商品到购物车
     *
     * @param shopId
     * @param productId
     * @return
     */
    @RequestMapping(value = "/add/{shopId}/{productId}", method = RequestMethod.POST)
    public String add(@PathVariable("shopId") Integer shopId,
                      @PathVariable("productId") Integer productId,
                      @RequestParam("shopName") String shopName) {
        Cart cart = carts.getCart(shopId); // 获取当前商店的购物车

        if (cart == null) { // 如果不存在,创建对应商店的购物车
            cart = new Cart(shopId, shopName);
            carts.addCart(shopId, cart);
        }
        if (cart.containsProductId(productId)) { // 如果购物车有此商品
            cart.increaseQuantityById(productId); // 增加该商品数量
        } else { // 否则,新增一个商品
            Product product = productService.findProductById(productId);
            cart.addItem(product);
        }
        return "redirect:/cart";
    }

    /**
     * 更新当前商店的购物车
     *
     * @param shopId
     * @param cartForm
     * @return
     */
    @RequestMapping(value = "/update/{shopId}", method = RequestMethod.POST)
    public String update(@PathVariable("shopId") Integer shopId, CartForm cartForm) {
        Cart cart = carts.getCart(shopId); // 获取当前商店的购物车
        Iterator<CartItem> cartItems = cart.getCartItems();

        while (cartItems.hasNext()) { // 遍历购物车条目
            CartItem cartItem = cartItems.next();
            Integer productId = cartItem.getProduct().getId();
            try {
                // 修改购物车中对应商品的数量
                int quantity = cartForm.getQuantity().get(productId);
                cart.setQuantityById(productId, quantity);
                if (quantity < 1) { // 如果数量为0,移除该商品
                    cartItems.remove();
                    cart.removeItemById(productId);
                }
            } catch (Exception e) {

            }
        }

        if (cart.isEmpty()) carts.clearCart(shopId); // 如果购物车为空,移除购物车

        return "redirect:/cart";
    }

    /**
     * 移除商品
     *
     * @param shopId
     * @param productId
     * @return
     */
    @RequestMapping(value = "/remove/{shopId}/{productId}")
    public String remove(@PathVariable("shopId") Integer shopId,
                         @PathVariable("productId") Integer productId) {
        Cart cart = carts.getCart(shopId); // 获取当前商店的购物车
        cart.removeItemById(productId); // 移除商品
        if (cart.isEmpty()) carts.clearCart(shopId); // 如果该购物车为空,移除购物车
        return "redirect:/cart";
    }

    /**
     * 跳转到结算页面
     *
     * @param shopId
     * @param uiModel
     * @return
     */
    @RequestMapping(value = "/checkout/{shopId}")
    public String checkOut(@PathVariable("shopId") Integer shopId, Model uiModel, HttpSession session) {
        Cart cart = carts.getCart(shopId); // 获取当前商店的购物车

        Account account = getSessionAccount(session);
        List<Address> addresses = addressService.queryAddressList(account.getId()); // 获取当前登录用户的地址列表

        uiModel.addAttribute("cart", cart);
        uiModel.addAttribute("addresses", addresses);
        return "cart/checkout";
    }

    /**
     * 清空所有购物车
     *
     * @return
     */
    @RequestMapping(value = "/clear")
    public String clearAll() {
        carts.clearAllCart();
        return "redirect:/cart";
    }

    /**
     * 清空对应商店的购物车
     *
     * @param shopId
     * @return
     */
    @RequestMapping(value = "/clear/{shopId}")
    public String clear(@PathVariable("shopId") Integer shopId) {
        carts.clearCart(shopId);
        return "redirect:/cart";
    }

    @RequestMapping(value = "/init")
    public String InitCartData() {
        add(1,1, "皮皮虾");
        add(1,1, "皮皮虾");
        add(1,2, "皮皮虾");
        add(1,3, "皮皮虾");
        add(2,6, "佳士顿");
        add(2,6, "佳士顿");
        add(2,7, "佳士顿");
        add(3,12, "美味源");
        return "redirect:/cart";
    }

    /**
     * 获取登录用户
     * @param session
     * @return 返回当前登录用户
     */
    private Account getSessionAccount(HttpSession session) {
        return (Account) session.getAttribute(SESSION_ACCOUNT);
    }


    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @Autowired
    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }
}
