package com.cat.rufull.domain.service.order;

import com.cat.rufull.domain.common.exception.order.BusinessProcessingOrderException;
import com.cat.rufull.domain.common.exception.order.UserProcessingOrderException;
import com.cat.rufull.domain.common.util.DateUtils;
import com.cat.rufull.domain.common.util.UUIDUtil;
import com.cat.rufull.domain.mapper.lineItem.LineItemMapper;
import com.cat.rufull.domain.mapper.order.OrderMapper;
import com.cat.rufull.domain.model.LineItem;
import com.cat.rufull.domain.model.Order;
import com.cat.rufull.domain.model.Shop;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
    private static Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

    private AmqpTemplate amqpTemplate;

    private OrderMapper orderMapper;

    private LineItemMapper lineItemMapper;

    @Override
    @Transactional(readOnly = true)
    public List<Order> findOrderByAccountId(Integer accountId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("accountId", accountId);

        return orderMapper.findOrdersByAccountId(map);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> findUnratedOrderByAccountId(Integer accountId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("accountId", accountId);
        map.put("searchBy", "unrated");

        return orderMapper.findOrdersByAccountId(map);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> findRefundOrderByAccountId(Integer accountId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("accountId", accountId);
        map.put("searchBy", "refund");

        return orderMapper.findOrdersByAccountId(map);
    }

    @Override
    @Transactional(readOnly = true)
    public Order findOrderById(Integer id) {
        return orderMapper.findOrderById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public Order findOrderByOrderNumber(String orderNumber) {
        return orderMapper.findOrderByOrderNumber(orderNumber);
    }

    @Override
    public void cancelOrder(Order order) {
        if (Order.STATUS_UNPAID.equals(order.getStatus())) {
            order.setStatus(Order.STATUS_CANCELED);
            orderMapper.updateOrder(order);
        } else {
            throw new UserProcessingOrderException("该订单无法申请取消");
        }
    }

    @Override
    public void confirmOrder(Order order) {
        if (Order.STATUS_DELIVERY.equals(order.getStatus())) {
            order.setCompletedTime(new Date());
            order.setStatus(Order.STATUS_COMPLETED);
            order.setShippingStatus(Order.SHIPPING_STATUS_ARRIVED);
            orderMapper.updateOrder(order);
        } else {
            throw new UserProcessingOrderException("该订单无法申请确认收货");
        }
    }

    @Override
    public void refundOrder(Order order) {
        if (Order.STATUS_DELIVERY.equals(order.getStatus())) {
            order.setStatus(Order.STATUS_AUDITING);
            orderMapper.updateOrder(order);
        } else {
            throw new UserProcessingOrderException("该订单无法申请退单");
        }
    }

    @Override
    public void confirmRefund(Order order) {
        if (Order.STATUS_AUDITING.equals(order.getStatus())) {
            order.setStatus(Order.STATUS_UNCOMPLETED);
            orderMapper.updateOrder(order);
        } else {
            throw new BusinessProcessingOrderException("该订单无法确认退单");
        }
    }

    @Override
    public void cancelRefundOrder(Order order) {
        if (Order.STATUS_AUDITING.equals(order.getStatus())) {
            order.setStatus(Order.STATUS_DELIVERY);
            orderMapper.updateOrder(order);
        } else {
            throw new UserProcessingOrderException("该订单无法申请取消退单");
        }
    }

    @Override
    public void submitOrder(Order order) {
        Shop shop = order.getShop();

        // 商店不是营业中,抛出异常
        if (!Shop.SHOP_STATUS_NORMAL.equals(shop.getOperateState()))
            throw new UserProcessingOrderException("商店休息中");
        // 订单收货地址不在商店的配送范围之内,抛出异常
        if (false)
            throw new UserProcessingOrderException("订单的收货地址不在商店的配送范围之内");
        // 订单总额未达到商店的起送价,抛出异常
        if (order.getTotal().compareTo(shop.getShippingPrice()) < 0)
            throw new UserProcessingOrderException("订单总额未达到商店的起送价");

        // 设置创建时间
        order.setCreatedTime(new Date());

        // 为订单生成订单号
        order.setOrderNumber(createOrderNumber());

        // 设置订单状态为未付款
        order.setStatus(Order.STATUS_UNPAID);

        // 根据支付方式设置支付状态
        if (Order.PAYMENT_METHOD_ONLINE.equals(order.getPaymentMethod()))
            order.setPaymentStatus(Order.PAYMENT_STATUS_UNPAID);
        else if (Order.PAYMENT_METHOD_OFFLINE.equals(order.getPaymentMethod()))
            order.setPaymentStatus(Order.PAYMENT_STATUS_IGNORED);

        logger.info(order.toString());

        // 插入订单记录
        orderMapper.insertOrder(order);

        // 遍历订单项列表,为订单项设置id
        List<LineItem> items = order.getLineItems();
        for (LineItem item : items)
            item.setOrderId(order.getId());

        // 插入订单项列表
        lineItemMapper.insertLineItems(items);

        // 将订单id放进延时队列,15分钟后若未支付则自动关闭
        amqpTemplate.convertAndSend(order.getId().toString());
    }

    @Override
    public void acceptOrder(Order order) {
        if (Order.STATUS_PAID.equals(order.getStatus())) {
            order.setAcceptedTime(new Date());
            order.setStatus(Order.STATUS_ACCEPTED);
            order.setShippingStatus(Order.SHIPPING_STATUS_PENDING);
            orderMapper.updateOrder(order);
        } else {
            throw new BusinessProcessingOrderException("该订单无法申请接单");
        }
    }

    @Override
    public void deliverOrder(Order order) {
        if (Order.STATUS_ACCEPTED.equals(order.getStatus())) {
            order.setStatus(Order.STATUS_DELIVERY);
            order.setShippingStatus(Order.SHIPPING_STATUS_SHIPPING);
            orderMapper.updateOrder(order);
        } else {
            throw new BusinessProcessingOrderException("该订单无法申请发货");
        }
    }

    @Override
    public void paidOrder(Order order) {
        if (Order.STATUS_UNPAID.equals(order.getStatus())) {
            order.setStatus(Order.STATUS_PAID);
            order.setPaymentStatus(Order.PAYMENT_STATUS_PAID);
            orderMapper.updateOrder(order);
        } else {
            throw new UserProcessingOrderException("该订单无法完成支付");
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> findOrdersBetween(Date beginDate, Date endDate) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (beginDate != null) map.put("beginDate", beginDate);
        if (endDate != null) map.put("endDate", endDate);
        return orderMapper.findOrdersBetween(map);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> findOrdersByAccountIdBetween(Integer accountId, Date beginDate, Date endDate) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("accountId", accountId);
        if (beginDate != null) map.put("beginDate", beginDate);
        if (endDate != null) map.put("endDate", endDate);
        return orderMapper.findOrdersByAccountIdBetween(map);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> findAllOrders() {
        return orderMapper.findAllOrders();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> findShopOrdersByStatus(Integer shopId, String orderStatus) {
        return orderMapper.findShopOrdersByStatus(shopId, orderStatus);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> findShopAcceptedOrders(Integer shopId) {
        return orderMapper.findShopAcceptedOrders(shopId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> findShopRefundOrders(Integer shopId) {
        return orderMapper.findShopRefundOrders(shopId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> findShopCompletedOrders(Integer shopId) {
        return orderMapper.findShopCompletedOrders(shopId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> findBusinessOrdersByStatus(Integer businessId, String orderStatus) {
        return orderMapper.findBusinessOrdersByStatus(businessId, orderStatus);
    }

    @Override
    @Transactional(readOnly = true)
    public Integer getMonthlySales(Integer shopId) {
        // 获取今日 yyyy-MM-"dd+1" 00:00:00
        Calendar today = DateUtils.getCalendarToday();
        today.add(Calendar.DATE, 1);

        // 获取上月今日 yyyy-"MM-1"-dd 00:00:00
        Calendar todayLastMonth = getTodayLastMonth();

        return orderMapper.getMonthlySales(shopId, today.getTime(), todayLastMonth.getTime());
    }

    @Override
    @Transactional(readOnly = true)
    public BigDecimal getMonthlyTotal(Integer shopId) {
        // 获取今日 yyyy-MM-"dd+1" 00:00:00
        Calendar today = DateUtils.getCalendarToday();
        today.add(Calendar.DATE, 1);

        // 获取上月今日 yyyy-"MM-1"-dd 00:00:00
        Calendar todayLastMonth = getTodayLastMonth();

        return orderMapper.getMonthlyTotal(shopId, today.getTime(), todayLastMonth.getTime());
    }

    /**
     * 获取上月今日
     * @return
     */
    private static Calendar getTodayLastMonth() {
        Calendar todayLastMonth = new GregorianCalendar();

        todayLastMonth.setTime(DateUtils.getCalendarToday().getTime());
        todayLastMonth.add(Calendar.MONTH, -1);

        return todayLastMonth;
    }

    private static String createOrderNumber() {
        return UUIDUtil.uuid();
    }

    @Autowired
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Autowired
    public void setLineItemMapper(LineItemMapper lineItemMapper) {
        this.lineItemMapper = lineItemMapper;
    }

    @Autowired
    public void setAmqpTemplate(AmqpTemplate amqpTemplate) {
        this.amqpTemplate = amqpTemplate;
    }
}
