<%@ page import="com.ezen.mall.domain.product.service.ProductService" %>
<%@ page import="com.ezen.mall.domain.product.dto.Product" %>
<%@ page import="com.ezen.mall.domain.product.service.ProductServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  ProductService productService = new ProductServiceImpl();
  List<Product> list = productService.productList();
  request.setAttribute("list", list);
%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>mealimeter에 오신 걸 환영합니다.</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fowqnts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=IBM+Plex+Sans+KR&family=Nanum+Gothic&display=swap"
    rel="stylesheet">
  <link rel="stylesheet" href="/css/index.css">
</head>

<body>
<!-- 헤더 시작 -->
  <jsp:include page="/module/header.jsp"></jsp:include>
<!-- 헤더 종료 -->

<div id="wrapper">
  <!-- 메인 시작 -->
  <main>
    <!-- Nav 시작 -->
    <jsp:include page="/module/nav.jsp"></jsp:include>
    <!-- Nav 종료 -->

    <!-- 메인 시작 -->
    <div id="container">
      <section id="section">
        <div class="index-wrap">
          <div class="product-wrap">
            <div class="ai-suggestion-wrap">
              <ul>
                <li class="suggestion-text">
                  <div class="ai-banner-div">
                  <span class="ai-banner-span"> AI 메뉴 추천 </span>
                  </div>
                  <div class="ai-first-spring">봄내음 물씬나는</div>
                    <div class="ai-first-recommendation">이런 메뉴 어떠세요?</div>
                    <div class="ai-first-favor">로그인하시면 고객님의 취향에 딱 맞는 메뉴를 추천드립니다</div>
                </li>
                <li class="suggestion-img-wrap"><img class="suggestion-img" src="/img/jjuggumi.png"></li>
                <li class="suggestion-product">
                  <a href="/product/prod-detail.jsp?prodId=102">
                  <div class="ai-product-name">[냉동]쫄깃탱글 불쭈꾸미볶음</div>
                  <div class="ai-product-price">10,500원</div>
                  </a>
                </li>
              </ul>
            </div>
            <div class="sec-title">
              <H1>실시간 베스트</H1>
            </div>
          <div class="product-list">
              <ul>
                <c:forEach var="product" items="${list}" >
                  <li class="product">
                    <div class="product-info">
                      <div class="product-img" style="background-image: url(${product.prodImg}); background-size: cover; " ></div>
                      <div class="product-text-wrap">
                        <a href="/product/prod-detail.jsp?prodId=${product.prodId}">
                          <div class="product-name">
                            <span>${product.prodName}</span>
                          </div>
                          <div class="product-price-wrap">
                            <ul>
                              <li class="product-price">${product.price}</li>
                              <li class="product-won">원</li>
                              <li class="product-servings"> / ${product.prodServings}</li>
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
        </div>
      </section>
    </div>
  </main>
  <!-- 메인 종료 -->

  <!-- footer 시작 -->
  <jsp:include page="/module/footer.jsp"></jsp:include>
  <!-- footer 종료 -->
</div>
</body>

</html>