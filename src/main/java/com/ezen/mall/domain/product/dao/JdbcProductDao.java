package com.ezen.mall.domain.product.dao;

import com.ezen.mall.domain.board.dto.Article;
import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.mall.domain.member.dto.Member;
import com.ezen.mall.domain.product.dto.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcProductDao implements ProductDao {
    private ConnectionFactory connectionFactory;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public JdbcProductDao() {
        connectionFactory = ConnectionFactory.getInstance();
    }

    @Override
    public List<Product> findByAll() throws SQLException {
        List<Product> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT product_id, product_type, product_date, TO_CHAR(price, 'FM999,999') price, brief, product_img, product_name, product_status, product_servings, product_cookingtime")
                .append(" FROM products ");


        conn = connectionFactory.getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProdId(rs.getInt("product_id"));
                product.setProdType(rs.getString("product_type"));
                product.setProdDate(rs.getString("product_date"));
                product.setPrice(rs.getString("price"));
                product.setBrief(rs.getString("brief"));
                product.setProdImg(rs.getString("product_img"));
                product.setProdName(rs.getString("product_name"));
                product.setProdStatus(rs.getString("product_status"));
                product.setProdServings(rs.getString("product_servings"));
                product.setProdCookingTime(rs.getString("product_cookingtime"));
                list.add(product);
            }
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (rs != null) rs.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    @Override
    public Product findProduct(int prodId) {
        Product product = null;
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT product_id, product_type, product_date, TO_CHAR(price, 'FM999,999') price, brief, product_img, product_name, product_status, product_servings, product_cookingtime")
                .append(" FROM products")
                .append(" WHERE product_id = ?");

        try {
            conn = connectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, prodId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                product = new Product();
                product.setProdId(rs.getInt("product_id"));
                product.setProdType(rs.getString("product_type"));
                product.setProdDate(rs.getString("product_date"));
                product.setPrice(rs.getString("price"));
                product.setBrief(rs.getString("brief"));
                product.setProdImg(rs.getString("product_img"));
                product.setProdName(rs.getString("product_name"));
                product.setProdStatus(rs.getString("product_status"));
                product.setProdServings(rs.getString("product_servings"));
                product.setProdCookingTime(rs.getString("product_cookingtime"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (rs != null) rs.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return product;
    }

    public static void main(String[] args) throws SQLException {
        ProductDao productDao = new JdbcProductDao();
        Product product = productDao.findProduct(101);
        System.out.println(product);
    }
}