package com.ezen.mall.domain.product.service;

import com.ezen.mall.domain.board.dao.Board;
import com.ezen.mall.domain.board.dto.Article;
import com.ezen.mall.domain.product.dto.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductService {
    public List<Product> productList();
    public Product searchProduct(int prodId);
}
