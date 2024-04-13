<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.ezen.mall.web.common.EzenUtil" %>
<%@ page import="com.ezen.mall.domain.product.service.ProductService" %>
<%@ page import="com.ezen.mall.domain.product.service.ProductServiceImpl" %>
<%@ page import="com.ezen.mall.domain.product.dto.Product" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="ko">

<%
  ProductService productService = new ProductServiceImpl();
  List<Product> list = productService.productList();
  request.setAttribute("list", list);
%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>mealimeter:리뷰</title>
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
    <div class="container">
      <h1 class="title-text">밀리미터 생생리뷰</h1>
      <div class="review-register">
        <div class="review-user-id">작성자 : chan999</div>
        <select class="review-register-title">
          <option>-- 리뷰할 상품을 선택해주세요. --</option>
          <c:forEach var="cartItem" items="${list}">
            <option value="review-title">${cartItem.prodName}</option>
          </c:forEach>
        </select>
        <div class="review-register-wrap">
          <textarea rows="5" cols="120"></textarea>
          <a class="review-register-btn" href="" >등록</a>
        </div>
          <input type="file">
      </div>
      <div class="review">
        <h2>리뷰 333건</h2>
        <div class="review-list">



          <div class="review-wrap">
          <ul>
            <il><strong>[냉장] 회전 회오리이이이이이이이이 회천초밥</strong></il>
            <li>2024-04-12 ㅣ chan999</li>
            <div class="review-content">
              <div class="review-img" style="background-image: url(/img/prod104.jpg); background-size: cover;"></div>
              <div class="review-text">
                리뷰 테스트입니다. 아무 내용이 들어갈 수도 있습니다. <br>
                아무 내용이나 넣고 있습니다. 이 부분은 동적으로 바뀌게 될 것입니다.
              </div>
            </div>
          </ul>
          </div>



        </div>
      </div>
    </div>
  <!-- 메인 종료 -->

  <!-- footer 시작 -->
  <jsp:include page="/module/footer.jsp" />
  <!-- footer 종료 -->
</div>
</body>

</html>