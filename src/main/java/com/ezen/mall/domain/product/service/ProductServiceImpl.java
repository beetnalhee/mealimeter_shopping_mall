package com.ezen.mall.domain.product.service;

import com.ezen.mall.domain.board.dao.ArticleDao;
import com.ezen.mall.domain.board.dao.Board;
import com.ezen.mall.domain.board.dao.JdbcArticleDao;
import com.ezen.mall.domain.board.dto.Article;
import com.ezen.mall.domain.board.service.BoardService;
import com.ezen.mall.domain.product.dao.JdbcProductDao;
import com.ezen.mall.domain.product.dao.ProductDao;
import com.ezen.mall.domain.product.dto.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements ProductService {

    ProductDao productDao = new JdbcProductDao();


    @Override
    public List<Product> productList() {
        try {
            return productDao.findByAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Product searchProduct(int prodId) {
        return productDao.findProduct(prodId);
    }

    public static void main(String[] args) {
    }
}
