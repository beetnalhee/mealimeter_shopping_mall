<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.ezen.mall.web.common.EzenUtil" %>
<%@ page import="com.ezen.mall.domain.product.service.ProductService" %>
<%@ page import="com.ezen.mall.domain.product.service.ProductServiceImpl" %>
<%@ page import="com.ezen.mall.domain.product.dto.Product" %>

<%
  ProductService productService = new ProductServiceImpl();
  Product product = productService.searchProduct(Integer.parseInt(request.getParameter("prodId")));
  request.setAttribute("product", product);
%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>mealimeter:제품 상세정보</title>
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
          <div class="prod-detail-wrap">
            <div class="prod-detail-img">
              <img src="/img/product5.jpg">
            </div>
            <div class="prod-detail-info">
              <ul>
                <li class="prod-explain">${product.brief}</li>
                <li class="prod-name">${product.prodName}</li>
                <li class="prod-info">3인분 ㅣ 조리시간 20분</li>
                <li class="prod-price">
                  <div>상품가격</div>
                  <div>${product.price}원</div>
                </li>
                <li class="prod-delivery">
                  <div>배송방법</div>
                  <div>택배배송</div>
                </li>
                <li class="prod-delivery-price">
                  <div>배송비</div>
                  <div>3,000원</div>
                </li>
                <li class="prod-option">
                  옵션선택
                  <div class="prod-option-count">
                    <div>
                      <a href="#" title="수량 빼기" class="btn-down">-</a>
                      <input type="text" class="quantity" value="1" readonly>
                      <a href="#" title="수량 더하기" class="btn-up" onclick="value ++">+</a>
                    </div>
                    <div>${product.price}</div>
                  </div>
                </li>
                <li class="prod-detail-total">
                  <div class="prod-total-quantity">수량 1개</div>
                  <div class="prod-total-price">${product.price}원</div>
                </li>
                <li class="prod-btn-wrap">
                  <button type="button">장바구니</button>
                  <button type="button">주문하기</button>
                </li>
              </ul>
            </div>
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