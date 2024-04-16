package com.ezen.mall.domain.order.dao;

import com.ezen.mall.domain.order.dto.Order;
import com.ezen.mall.domain.product.dto.Product;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface OrderDao {
    public List<Order> findByAll() throws SQLException;
    public List<Map<String, Object>> findByUserId(String userId);
    public void createOrder(Order order) throws SQLException;
}
