<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.ezen.mall.web.common.EzenUtil" %>
<%@ page import="com.ezen.mall.domain.member.dto.Member" %>
<%@ page import="com.ezen.mall.domain.order.service.OrderService" %>
<%@ page import="com.ezen.mall.domain.order.service.OrderServiceImpl" %>
<%@ page import="com.ezen.mall.domain.order.dto.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<% Member loginMember = (Member) pageContext.findAttribute("loginMember"); %>

<%
  OrderService orderService = new OrderServiceImpl();
  List<Map<String, Object>> list = orderService.searchOrder(loginMember.getId());
  request.setAttribute("list", list);
%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>mealimeter:마이페이지</title>
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
    <div id="mypage-wrap">
      <h1 class="title-text">마이페이지</h1>
      <div class="mypage-content">
        <div class="mypage-aside-wrap">
          <div class="user-img-wrap">
            <div class="user-img" style="background-image: url(/img/profile.png); background-size: cover;"></div>
          </div>
          <div class="member-info-wrap">
            <ul>
              <li>[${loginMember.getId()}]</li>
              <li id="mypage-name"><strong>${loginMember.getName()}</strong>님</li>
              <li id="mypage-grade">회원등급 : ${loginMember.getGradeRating()}</li>
            </ul>
          </div>
        </div>
        <div class="mypage-main-wrap">
          <h2>최근 주문내역</h2>
            <div class="mypage-order">
              <c:forEach var="order" items="${list}">
              <div id="mypage-order-head">
                ${order.orderDate} ㅣ 주문번호 : ${order.orderId}
              </div>
              <div class="mypage-order-list">
                <div>
                  <img src="${order.productImg}">
                </div>
                <div class="mypage-order-info">
                  <ul>
                    <li>${order.productName}</li>
                    <li>${order.price}원 / ${order.orderVolume}개</li>
                  </ul>
                </div>
              </div>
              </c:forEach>
            </div>
        </div>
      </div>
    </div>
  </main>
  <!-- 메인 종료 -->

  <!-- footer 시작 -->
  <jsp:include page="/module/footer.jsp" />
  <!-- footer 종료 -->
</div>
</body>

</html>