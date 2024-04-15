<%@ page import="com.ezen.mall.domain.cart.CartService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.mall.domain.cart.CartList" %>
<%@ page import="com.ezen.mall.domain.product.dto.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    session = request.getSession();
    int index = Integer.parseInt(request.getParameter("index"));

    List<CartList> list = (List<CartList>) session.getAttribute("cartList");

    if (list != null && index >= 0 && index < list.size()) {
        list.remove(index);
        session.setAttribute("cartList", list);
    }
    response.sendRedirect("/cart/cart.jsp");
%>