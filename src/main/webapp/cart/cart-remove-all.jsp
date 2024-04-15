<%@ page import="com.ezen.mall.domain.cart.CartService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.mall.domain.cart.CartList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    session = request.getSession();

    // 세션에서 cartList 속성을 삭제합니다
    session.removeAttribute("cartList");
%>
<script>
    alert("장바구니가 모두 삭제되었습니다.");
    location.href='/cart/cart.jsp';
</script>