package com.ezen.mall.domain.product.dto;

public class Product {
    private int prodId;
    private String prodType;
    private String prodDate;
    private String price;
    private String brief;
    private String prodImg;
    private String prodName;
    private String prodStatus;
    private String prodServings;
    private String prodCookingTime;


    public Product(){}

    public Product(int prodId, String prodType, String prodDate, String price, String brief, String prodImg, String prodName, String prodStatus, String prodServings, String prodCookingTime) {
        this.prodId = prodId;
        this.prodType = prodType;
        this.prodDate = prodDate;
        this.price = price;
        this.brief = brief;
        this.prodImg = prodImg;
        this.prodName = prodName;
        this.prodStatus = prodStatus;
        this.prodServings = prodServings;
        this.prodCookingTime = prodCookingTime;
    }

    public int getProdId() {
        return prodId;
    }

    public void setProdId(int prodId) {
        this.prodId = prodId;
    }

    public String getProdType() {
        return prodType;
    }

    public void setProdType(String prodType) {
        this.prodType = prodType;
    }

    public String getProdDate() {
        return prodDate;
    }

    public void setProdDate(String prodDate) {
        this.prodDate = prodDate;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getProdImg() {
        return prodImg;
    }

    public void setProdImg(String prodImg) {
        this.prodImg = prodImg;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getProdStatus() {
        return prodStatus;
    }

    public void setProdStatus(String prodStatus) {
        this.prodStatus = prodStatus;
    }

    public String getProdServings() {
        return prodServings;
    }

    public void setProdServings(String prodServings) {
        this.prodServings = prodServings;
    }

    public String getProdCookingTime() {
        return prodCookingTime;
    }

    public void setProdCookingTime(String prodCookingTime) {
        this.prodCookingTime = prodCookingTime;
    }

    @Override
    public String toString() {
        return "Product{" +
                "prodId=" + prodId +
                ", prodType='" + prodType + '\'' +
                ", prodDate='" + prodDate + '\'' +
                ", price=" + price +
                ", brief='" + brief + '\'' +
                ", prodImg='" + prodImg + '\'' +
                ", prodName='" + prodName + '\'' +
                ", prodStatus='" + prodStatus + '\'' +
                ", prodServings='" + prodServings + '\'' +
                ", prodCookingTime='" + prodCookingTime + '\'' +
                '}';
    }
}
