package com.ezen.mall.domain.order.service;

import com.ezen.mall.domain.order.dao.JdbcOrderDao;
import com.ezen.mall.domain.order.dao.OrderDao;
import com.ezen.mall.domain.order.dto.Order;

import java.sql.SQLException;
import java.util.List;

public class OrderServiceImpl implements OrderService{

    OrderDao orderDao = new JdbcOrderDao();

    @Override
    public List<Order> orderList() {
        try {
            return orderDao.findByAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Order> searchOrder(String userId) {
        return orderDao.findByUserId(userId);
    }
}
