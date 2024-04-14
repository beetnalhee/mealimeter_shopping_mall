package com.ezen.mall.domain.order.dao;

import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.mall.domain.order.dto.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcOrderDao implements OrderDao{
    private ConnectionFactory connectionFactory;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public JdbcOrderDao() {
        connectionFactory = ConnectionFactory.getInstance();
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
    public List<Order> findByUserId(String userId) {
        List<Order> list = new ArrayList<>();
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
                order.setProdName(rs.getString("product_name"));
                order.setProdImg(rs.getString("product_img"));
                order.setOrderVolume(rs.getString("order_volume"));
                order.setProdPrice(rs.getString("price"));
                list.add(order);
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
        return list;
    }

    public static void main(String[] args) throws SQLException {
        OrderDao orderDao = new JdbcOrderDao();
        List<Order> list = orderDao.findByUserId("chan999");
        for (Order order : list) {
            System.out.println(order);
        }
    }
}
