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
  List<Product> list = productService.newProdList();
  request.setAttribute("list", list);
%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>mealimeter:신제품</title>
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
    <div id="container">
      <section id="section">
        <div class="index-wrap">
          <div class="product-list">
            <ul>
              <c:forEach var="cartItem" items="${list}" >
              <li class="product">
                <div class="product-info">
                  <div class="product-img" style="background-image: url(${cartItem.prodImg}); background-size: cover; " ></div>
                  <div class="product-text-wrap">
                    <a href="/product/prod-detail.jsp?prodId=${cartItem.prodId}">
                      <div class="product-name">
                        <span>${cartItem.prodName}</span>
                      </div>
                      <div class="product-price-wrap">
                        <ul>
                          <li class="product-price">${cartItem.price}</li>
                          <li class="product-won">원</li>
                          <li class="product-servings"> / ${cartItem.prodServings}</li>
                        </ul>
                      </div>
                    </a>
                  </div>
                </div>
              </li>
              </c:forEach>
            </ul>
          </div>
        </div>

      </section>
    </div>
  <!-- 메인 종료 -->

  <!-- footer 시작 -->
  <jsp:include page="/module/footer.jsp" />
  <!-- footer 종료 -->
</div>
</body>

</html>