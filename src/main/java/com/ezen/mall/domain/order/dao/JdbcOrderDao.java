package com.ezen.mall.domain.order.dao;

import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.mall.domain.order.dto.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class JdbcOrderDao implements OrderDao{
    private ConnectionFactory connectionFactory;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public JdbcOrderDao() {
        connectionFactory = ConnectionFactory.getInstance();
    }

    @Override
    public void createOrder(Order order) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO orders (order_id, orderdetail_id, user_id, order_date, destination_name, destination_zip_code, destination_address, destination_phonenumber, payment, delivery_charge, total_amount)")
                .append(" VALUES(orders_seq.nextval, 103, ? ,SYSDATE, ?, ?, ?, ?, ?, 0, ? )");

        conn = connectionFactory.getConnection();
        pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, order.getUserId());
            pstmt.setString(2, order.getName());
            pstmt.setInt(3, order.getZipCode());
            pstmt.setString(4, order.getAdress());
            pstmt.setString(5, order.getPhoneNumber());
            pstmt.setString(6, order.getPayment());
            pstmt.setInt(7, order.getTotalPrice());
            pstmt.executeUpdate();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public List<Order> findByAll() throws SQLException {
        List<Order> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT order_id, orderdetail_id, user_id, order_date, destination_name, destination_zip_code, destination_address, payment, total_amount")
                .append(" FROM orders ");


        conn = connectionFactory.getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setOrderDetailId(rs.getInt("orderdetail_id"));
                order.setUserId(rs.getString("user_id"));
                order.setOrderDate(rs.getString("order_date"));
                order.setName(rs.getString("destination_name"));
                order.setZipCode(rs.getInt("destination_zip_code"));
                order.setAdress(rs.getString("destination_address"));
                order.setPayment(rs.getString("payment"));
                order.setTotalPrice(rs.getInt("total_amount"));
                list.add(order);
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
    public List<Map<String, Object>> findByUserId(String userId) {
        List<Map<String, Object>> resultList = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT o.order_id, o.orderdetail_id, o.user_id, o.order_date, o.destination_name, o.destination_zip_code, o.destination_address, o.payment, o.total_amount, ol.order_volume, p.product_name, p.product_img, TO_CHAR(p.price, 'FM999,999') price")
                .append(" FROM ORDERS o")
                .append(" JOIN ORDER_LISTS ol ON o.ORDERDETAIL_ID = ol.ORDERDETAIL_ID")
                .append(" JOIN PRODUCTS p ON ol.PRODUCT_ID = p.product_id")
                .append(" WHERE o.user_id = ?");

        try {
            conn = connectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Map<String, Object> orderMap = new HashMap<>();
                orderMap.put("orderId", rs.getInt("order_id"));
                orderMap.put("orderDetailId", rs.getInt("orderdetail_id"));
                orderMap.put("userId", rs.getString("user_id"));
                orderMap.put("orderDate", rs.getString("order_date"));
                orderMap.put("name", rs.getString("destination_name"));
                orderMap.put("zipCode", rs.getInt("destination_zip_code"));
                orderMap.put("address", rs.getString("destination_address"));
                orderMap.put("payment", rs.getString("payment"));
                orderMap.put("totalPrice", rs.getInt("total_amount"));
                orderMap.put("orderVolume", rs.getInt("order_volume"));
                orderMap.put("productName", rs.getString("product_name"));
                orderMap.put("productImg", rs.getString("product_img"));
                orderMap.put("price", rs.getString("price"));
                resultList.add(orderMap);
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
        return resultList;
    }
}
