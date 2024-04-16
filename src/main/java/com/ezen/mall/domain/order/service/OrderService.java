package com.ezen.mall.domain.order.service;

import com.ezen.mall.domain.order.dto.Order;
import java.util.List;
import java.util.Map;

public interface OrderService {
    public List<Order> orderList();
    public List<Map<String, Object>> searchOrder(String userId);
    public void writeOrder(Order order);
}
