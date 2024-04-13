package com.ezen.mall.domain.cart;

import com.ezen.mall.domain.product.dto.Product;

public class CartList {
    private Product product;
    private int quantity;

    public CartList(){}

    public CartList(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "CartList{" +
                "product=" + product +
                ", volume=" + quantity +
                '}';
    }
}
