package com.ezen.mall.domain.order.dto;

public class Order {
    private int orderId;
    private String userId;
    private int orderDetailId;
    private String orderDate;
    private String name;
    private int zipCode;
    private String adress;
    private String phoneNumber;
    private String payment;
    private int deliveryCharge;
    private int totalPrice;
    private String prodName;
    private String prodImg;
    private String orderVolume;
    private String prodPrice;


    public Order(){}

    public Order(int orderId, String userId, int orderDetailId, String orderDate, String name, int zipCode, String adress, String phoneNumber, String payment, int deliveryCharge, int totalPrice){
        this(orderId, userId, orderDetailId, orderDate, name, zipCode, adress, phoneNumber, payment, deliveryCharge,totalPrice, null, null, null, null);
    }

    public Order(int orderId, String userId, int orderDetailId, String orderDate, String name, int zipCode, String adress, String phoneNumber, String payment, int deliveryCharge, int totalPrice, String prodName,
    String prodImg, String orderVolume, String prodPrice) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderDetailId = orderDetailId;
        this.orderDate = orderDate;
        this.name = name;
        this.zipCode = zipCode;
        this.adress = adress;
        this.phoneNumber = phoneNumber;
        this.payment = payment;
        this.deliveryCharge = deliveryCharge;
        this.totalPrice = totalPrice;
        this.prodName = prodName;
        this.prodImg = prodImg;
        this.orderVolume = orderVolume;
        this.prodPrice = prodPrice;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(String prodPrice) {
        this.prodPrice = prodPrice;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getProdImg() {
        return prodImg;
    }

    public void setProdImg(String prodImg) {
        this.prodImg = prodImg;
    }

    public String getOrderVolume() {
        return orderVolume;
    }

    public void setOrderVolume(String orderVolume) {
        this.orderVolume = orderVolume;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getZipCode() {
        return zipCode;
    }

    public void setZipCode(int zipCode) {
        this.zipCode = zipCode;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public int getDeliveryCharge() {
        return deliveryCharge;
    }

    public void setDeliveryCharge(int deliveryCharge) {
        this.deliveryCharge = deliveryCharge;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }


    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", userId='" + userId + '\'' +
                ", orderDetailId=" + orderDetailId +
                ", orderDate='" + orderDate + '\'' +
                ", name='" + name + '\'' +
                ", zipCode=" + zipCode +
                ", adress='" + adress + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", payment='" + payment + '\'' +
                ", deliveryCharge=" + deliveryCharge +
                ", totalPrice=" + totalPrice +
                ", prodName='" + prodName + '\'' +
                ", prodImg='" + prodImg + '\'' +
                ", orderVolume='" + orderVolume + '\'' +
                ", prodPrice=" + prodPrice +
                '}';
    }
}
