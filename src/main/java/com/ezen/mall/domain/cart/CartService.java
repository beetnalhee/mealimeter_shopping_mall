package com.ezen.mall.domain.cart;

import com.ezen.mall.domain.product.dto.Product;

import java.util.ArrayList;
import java.util.List;

public class CartService  {

    private List<CartList> cartLists;

    public CartService(){
        cartLists = new ArrayList<>();
    }
    // 카트에 상품 담기 기능
    public void addCart(CartList cartList){
        cartLists.add(cartList);
    }

    // 카트 전체목록 반환 기능
    public List<CartList> ListAll(){
        return cartLists;
    }

    // 아이템 전체삭제
    public void removeAll(){
        cartLists.clear();
    }

}

