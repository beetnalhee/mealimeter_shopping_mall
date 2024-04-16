<%@ page import="com.ezen.mall.domain.member.dto.Member" %>
<%@ page import="com.ezen.mall.domain.order.service.OrderService" %>
<%@ page import="com.ezen.mall.domain.order.service.OrderServiceImpl" %>
<%@ page import="com.ezen.mall.domain.order.dto.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.mall.domain.cart.CartList" %>
<%@ page import="com.ezen.mall.domain.product.dto.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Member loginMember = (Member) pageContext.findAttribute("loginMember"); %>

<jsp:useBean id="order" class="com.ezen.mall.domain.order.dto.Order" scope="session" />


<%
    order.setUserId(loginMember.getId());
    order.setZipCode(loginMember.getZipCode());
    order.setName(loginMember.getName());
    order.setAdress(loginMember.getUserAddress());
    order.setPhoneNumber(loginMember.getPhonenumber());
    order.setPayment("CARD");

    OrderService orderService = new OrderServiceImpl();
    orderService.writeOrder(order);
    session.removeAttribute("cartList");
    response.sendRedirect("/order/order-result.jsp");
%>
