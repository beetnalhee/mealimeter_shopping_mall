package com.ezen.mall.domain.product.dao;

import com.ezen.mall.domain.board.dto.Article;
import com.ezen.mall.domain.member.dto.Member;
import com.ezen.mall.domain.product.dto.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {
    public List<Product> findByAll() throws SQLException;
    public Product findProduct(int prodId);
}
