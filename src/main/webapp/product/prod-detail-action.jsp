<%@ page import="com.ezen.mall.domain.product.service.ProductService" %>
<%@ page import="com.ezen.mall.domain.product.dto.Product" %>
<%@ page import="com.ezen.mall.domain.product.service.ProductServiceImpl" %>
<%@ page import="com.ezen.mall.domain.cart.CartService" %>
<%@ page import="com.ezen.mall.domain.cart.CartList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%
    int prodId = Integer.parseInt(request.getParameter("prodId"));

    ProductService productService = new ProductServiceImpl();
    Product product = productService.searchProduct(prodId);
    request.setAttribute("product", product);
    int quantity = Integer.parseInt(request.getParameter("quantity"));

    CartList addCart = new CartList(product, quantity);
    CartService cartService = null;

    List<CartList> cartList = (List<CartList>) session.getAttribute("cartList");
    if (cartList == null) {
        cartService = new CartService();
        cartService.addCart(addCart);
        List<CartList> list = cartService.ListAll();
        session.setAttribute("cartList", list);
    } else {
        cartList.add(addCart);
        session.setAttribute("cartList", cartList);
    }
%>
<script>
    alert("제품이 장바구니에 추가되었습니다.");
    location.href = "/product/prod-detail.jsp?prodId=<%= prodId %>";
</script>

