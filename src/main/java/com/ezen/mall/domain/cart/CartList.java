package com.ezen.mall.domain.cart;

import com.ezen.mall.domain.product.dto.Product;

public class CartList {
    private Product product;
    private int volume;

    public CartList(){}

    public CartList(Product product, int volume) {
        this.product = product;
        this.volume = volume;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getVolume() {
        return volume;
    }

    public void setVolume(int volume) {
        this.volume = volume;
    }

    @Override
    public String toString() {
        return "CartList{" +
                "product=" + product +
                ", volume=" + volume +
                '}';
    }
}
