package com.cat.rufull.domain.model;

import com.cat.rufull.domain.common.util.DateUtils;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 * 订单类
 */
public class Order implements Serializable {

    // 订单状态 status:
    public static final String STATUS_UNPAID      = "UNPAID";      // 未付款
    public static final String STATUS_PAID        = "PAID";        // 已付款
    public static final String STATUS_CANCELED    = "CANCELED";    // 已取消
    public static final String STATUS_ACCEPTED    = "ACCEPTED";    // 已接单
    public static final String STATUS_DELIVERY    = "DELIVERY";    // 运送中
    public static final String STATUS_COMPLETED   = "COMPLETED";   // 已完成
    public static final String STATUS_AUDITING    = "AUDITING";    // 审核中
    public static final String STATUS_UNCOMPLETED = "UNCOMPLETED"; // 未完成
    public static final String STATUS_EVALUATED   = "EVALUATED";   // 已评价

    // 支付方式 paymentMethod:
    public static final String PAYMENT_METHOD_ONLINE  = "ONLINE";  // 在线支付
    public static final String PAYMENT_METHOD_OFFLINE = "OFFLINE"; // 货到付款

    // 支付状态 paymentStatus:
    public static final String PAYMENT_STATUS_UNPAID  = "UNPAID";  // 未付款
    public static final String PAYMENT_STATUS_PAID    = "PAID";    // 已付款
    public static final String PAYMENT_STATUS_IGNORED = "IGNORED"; // 忽略

    // 发货状态 shippingStatus:
    public static final String SHIPPING_STATUS_PENDING  = "PENDING";  // 听候中
    public static final String SHIPPING_STATUS_SHIPPING = "SHIPPING"; // 运送中
    public static final String SHIPPING_STATUS_ARRIVED  = "ARRIVED";  // 已送达
    public static final String SHIPPING_STATUS_CANCELED = "CANCELED"; // 已取消

    private Integer id;                 // 主键

    private String orderNumber;         // 订单号

    private Date createdTime;           // 创建时间

    private Date completedTime;         // 完成时间

    private Date acceptedTime;          // 受理时间

    private String status;              // 订单状态

    private String paymentMethod;       // 支付方式

    private String paymentStatus;       // 支付状态

    private String shippingStatus;      // 发货状态

    private String notes;               // 订单备注

    private BigDecimal total;           // 订单总额

    private Integer accountId;          // 用户id

    private Shop shop;                  // 商店

    private Integer businessId;         // 商家id

    private List<LineItem> lineItems;   // 订单项列表

    private Address address;            // 地址

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getCompletedTime() {
        return completedTime;
    }

    public void setCompletedTime(Date completedTime) {
        this.completedTime = completedTime;
    }

    public Date getAcceptedTime() {
        return acceptedTime;
    }

    public void setAcceptedTime(Date acceptedTime) {
        this.acceptedTime = acceptedTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getShippingStatus() {
        return shippingStatus;
    }

    public void setShippingStatus(String shippingStatus) {
        this.shippingStatus = shippingStatus;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public Integer getBusinessId() {
        return businessId;
    }

    public void setBusinessId(Integer businessId) {
        this.businessId = businessId;
    }

    public List<LineItem> getLineItems() {
        return lineItems;
    }

    public void setLineItems(List<LineItem> lineItems) {
        this.lineItems = lineItems;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public int getTotalQuantity() {
        int totalQuantity = 0;
        for (LineItem item: lineItems)
            totalQuantity += item.getQuantity();
        return totalQuantity;
    }

    public String getCreateDateString() {
        // 获取今天
        Calendar today = Calendar.getInstance();

        // 获取订单下单时间
        Calendar createDate = new GregorianCalendar();
        createDate.setTime(createdTime);

        // 获取下单时间距离今天的天数
        long daysBetween = DateUtils.calendarDaysBetween(createDate, today);

        if      (daysBetween == 0) return "今天";
        else if (daysBetween == 1) return "昨天";
        else return String.format("%d-%02d",
                    createDate.get(GregorianCalendar.MONTH) + 1, createDate.get(Calendar.DAY_OF_MONTH));
    }

    @Override
    public String toString() {
        return "Order - Id: " + id +
                ", Order number: " + orderNumber +
                ", Created time: " + createdTime +
                ", Completed time: " + completedTime +
                ", Accepted time: " + acceptedTime +
                ", Status: " + status +
                ", Payment method: " + paymentMethod +
                ", Payment status: " + paymentStatus +
                ", Shipping status: " + shippingStatus +
                ", Notes: " + notes +
                ", Total: " + total +
                ", Account id: " + accountId +
                ", Business id: " + businessId;
    }
}
