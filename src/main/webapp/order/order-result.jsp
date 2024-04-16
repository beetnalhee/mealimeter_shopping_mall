<%@ page import="com.ezen.mall.domain.member.dto.Member" %>
<%@ page import="com.ezen.mall.domain.cart.CartList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ezen.mall.domain.order.service.OrderService" %>
<%@ page import="com.ezen.mall.domain.order.service.OrderServiceImpl" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% Member loginMember = (Member) pageContext.findAttribute("loginMember"); %>

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
    <div class="order-result">
      <h1 class="title-text">주문완료</h1>
      <div class="order-result-wrap">
        <p class="order-result-text"><span class="orderer-name">${loginMember.getName()}</span>님 주문해주셔서 감사합니다.</p>
        <button class="home-btn" type="button" onclick="location.href='/'">홈으로</button>
      </div>

    </div>
  <!-- 메인 종료 -->

  <!-- footer 시작 -->
  <jsp:include page="/module/footer.jsp" />
  <!-- footer 종료 -->
</div>
</body>


</html>