package com.ezen.mall.domain.order.service;

import com.ezen.mall.domain.order.dto.Order;
import java.util.List;

public interface OrderService {
    public List<Order> orderList();
    public List<Order> searchOrder(String userId);
    public void writeOrder(Order order);
}
