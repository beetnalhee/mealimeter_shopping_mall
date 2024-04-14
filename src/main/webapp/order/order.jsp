<%@ page import="com.ezen.mall.domain.member.dto.Member" %>
<%@ page import="com.ezen.mall.domain.cart.CartList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% Member loginMember = (Member) pageContext.findAttribute("loginMember"); %>

<%
  session.getAttribute("cartList");

  List<CartList> cartList = (List<CartList>) session.getAttribute("cartList");
  if (cartList == null) {
    cartList = new ArrayList<>();
    session.setAttribute("cartList", cartList);
  }

  int totalPrice = 0;
  for (CartList cartItem : cartList) {
    int price = Integer.parseInt(cartItem.getProduct().getPrice());
    int quantity = cartItem.getQuantity();
    totalPrice += price * quantity;
  }
%>

<!DOCTYPE html>
<html lang="ko">


<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>mealimeter:주문하기</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=IBM+Plex+Sans+KR&family=Nanum+Gothic&display=swap"
    rel="stylesheet">
  <link rel="stylesheet" href="/css/index.css">
</head>

<body>
<!-- 헤더 시작 -->
<jsp:include page="/module/header.jsp" />
<!-- 헤더 종료 -->

<div id="wrapper">
  <!-- 메인 시작 -->
  <main id="main">
    <!-- Nav 시작 -->
    <jsp:include page="/module/nav.jsp" />
    <!-- Nav 종료 -->

    <!-- 메인 시작 -->
    <div class="order-wrap">
      <h1 class="title-text">주문하기</h1>
        <div class="order-delivery-wrap">
          <h2 class="order-title">배송정보</h2>
          <div>
            <div>
              <label class="order-label" for="order-name">주문자명</label>
              <input type="text" id="order-name" placeholder="이름" value="${loginMember.getName()}">
            </div>
            <div>
              <label class="order-label" for="order-phonenumber">연락처</label>
              <input type="text" id="order-phonenumber" placeholder="연락처" value="${loginMember.getPhonenumber()}">
            </div>
          </div>
          <div>
            <label class="order-label" for="order-adress">배송지</label>
            <input type="text" id="order-adress" placeholder="주소" value="${loginMember.getUserAddress()}">
          </div>
        </div>
      <div class="order-payment">
        <h2 class="order-title">결제정보</h2>
        <div>
          <button class="order-payment-method">신용카드 결제</button>
          <select name="card-info">
            <option value="" label="카드를 선택하세요."></option>
            <option value="KB" label="KB국민카드"></option>
            <option value="WOORI" label="우리카드"></option>
            <option value="SAMSUNG" label="삼성카드"></option>
            <option value="HYUNDAI" label="현대카드"></option>
            <option value="SHINHAN" label="신한카드"></option>
            <option value="NH" label="농협카드"></option>
          </select>
        </div>
      </div>
      <div class="order-orderlist-wrap">
        <h2 class="order-title">주문정보</h2>
        <c:forEach var="cartItem" items="${cartList}">
        <div class="order-orderlist">
          <div>
            <img src="${cartItem.product.getProdImg()}">
          </div>
          <div class="order-order-info">
            <ul>
              <li><strong>${cartItem.product.getProdName()}</strong></li>
              <li>${cartItem.product.getPrice()}원 / ${cartItem.quantity}개</li>
            </ul>
          </div>
          <div class="order-prod-price">
              ${cartItem.product.getPrice() * cartItem.quantity}원
          </div>
        </div>
        </c:forEach>
        <div class="order-total-price-wrap">
          <div>총 결제금액</div>
          <div class="order-total-price"><%=totalPrice%>원</div>
        </div>
      </div>
      <a class="order-btn" href="" >결제하기</a>
    </div>
  <!-- 메인 종료 -->

  <!-- footer 시작 -->
  <jsp:include page="/module/footer.jsp" />
  <!-- footer 종료 -->
</div>
</body>

</html>