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
  <script>
    let count=0;

    function updateTotal() {
      let priceTag = parseInt("${product.price}");
      if(count < 1) {
        count = 1
        document.querySelector(".prod-total-quantity").innerText =  count; // 수량 업데이트
        document.querySelector(".prod-total-price").innerText = (priceTag * count) + "원"; // 합계 계산 및 업데이트

      }else {
        document.querySelector(".prod-total-quantity").innerText = count ; // 수량 업데이트
        document.querySelector(".prod-total-price").innerText = (priceTag * count) + "원"; // 합계 계산 및 업데이트
      }
    }


    function plus(){
      count=count+1;
      document.querySelector(".quantity").innerText=count;
      updateTotal();
      // document.querySelector(".test1").innerText = priceTag * count;
    }

    function minus(){
      if(count > 1){
        count=count-1;
        document.querySelector(".quantity").innerText=count;
        updateTotal();
      } else {
        count = 1;
        document.querySelector(".quantity").innerText=count;
        updateTotal();
      }
    }

    function addCart() {
      let quantity = document.querySelector(".quantity").innerText;
      location.href='/product/prod-detail-action.jsp?prodId=${product.prodId}&quantity='+quantity;
    }

    window.onload = updateTotal;
  </script>
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
              <img src="${product.prodImg}">
            </div>
            <div class="prod-detail-info">
              <ul>
                <li class="prod-explain">${product.brief}</li>
                <li class="prod-name">${product.prodName}</li>
                <li class="prod-info">${product.prodServings} ㅣ 조리시간 ${product.prodCookingTime}</li>
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
                    <div class="prod-btn-quantity">
                      <button type="button" title="수량 빼기" class="btn-down" onclick="minus()">-</button>
                      <span class="quantity">1</span>
                      <button type="button" title="수량 더하기" class="btn-up" onclick="plus()">+</button>
                    </div>
                    <div class="test1">${product.price}</div>
                  </div>
                </li>
                <li class="prod-detail-total">
                  <div>수량 <span class="prod-total-quantity">1</span>개</div>
                  <div class="prod-total-price">${product.price}원</div>
                </li>
                <li class="prod-btn-wrap">
                  <button type="button" onclick="addCart()" >장바구니 담기</button>
                  <button type="button" onclick="location.href='/order/order.jsp'">주문하기</button>
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