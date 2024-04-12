package com.ezen.mall.domain.cart;

import com.ezen.mall.domain.product.dto.Product;

import java.util.ArrayList;
import java.util.List;

public class CartService  {

    private List<Product> items;

    public CartService(){
        items = new ArrayList<>();
    }
    // 카트에 상품 담기 기능
    public void addItem(Product product){
        items.add(product);
    }

    // 카트 전체목록 반환 기능
    public List<Product> ListAll(){
        return items;
    }

    // 아이템 삭제기능


    // 아이템 전체삭제
    public void removeAll(){
        items.clear();
    }

}

