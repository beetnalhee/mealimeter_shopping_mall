<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.ezen.mall.web.common.EzenUtil" %>
<%@ page import="com.ezen.mall.domain.cart.CartList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  session.getAttribute("cartList");

  List<CartList> cartList = (List<CartList>) session.getAttribute("cartList");
  if (cartList == null) {
    cartList = new ArrayList<>();
    session.setAttribute("cartList", cartList);
  }

  // 모든 상품 가격 합산
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
  <title>mealimeter: 장바구니</title>
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
        <div class="cart">
          <h1 class="title-text">장바구니</h1>
          <div class="cart-wrap">
            <div class="cart-controller">
              <div class="check-box" id="select-all">
                <input class="cart-check-all" type="checkbox">
                <label for="select-all">
                  전체선택 (<span>2</span>/2)
                </label>
              </div>
              <div class="cart-select-btn">
                <a href="#" class="btn-del-all">전체삭제</a>
                <a href="#" class="btn-del-wish">선택삭제</a>
              </div>
            </div>
            <div class="cart-list">
              <ul>

                <c:forEach var="cartItem" items="${cartList}" varStatus="i">

                  <script>
                    let count= parseInt(${cartItem.quantity});

                    function updateTotal() {
                      let priceTag = parseInt("${cartItem.product.price}");

                      document.querySelector(".price-sum").innerText = (priceTag * count) + "원";
                    }


                    function plus(){
                      count=count+1;
                      document.querySelector(".cart-quantity").innerText=count;
                      updateTotal();
                    }

                    function minus(){
                      if(count > 1){
                        count=count-1;
                        document.querySelector(".cart-quantity").innerText=count;
                        updateTotal();
                      } else {
                        count = 1;
                        document.querySelector(".cart-quantity").innerText=count;
                        updateTotal();
                      }
                    }

                    window.onload = updateTotal;
                  </script>

                <li class="cart-list-prod">
                  <div class="check-box">
                    <input type="checkbox" id="order-no1">
                    <label for="order-no1"></label>
                  </div>
                  <div class="cart-img-wrap">
                    <img src="${cartItem.product.prodImg}">
                  </div>
                  <div class="cart-prod-wrap">
                    <div class="cart-prod-name">
                      <a href="" >${cartItem.product.prodName}</a>
                    </div>
                    <div class="cart-prod-price">
                      <ul>
                        <li>${cartItem.product.price}</li>
                        <li>원</li>
                      </ul>
                    </div>
                  </div>
                  <div class="cart-prod-count">
                    <div class="prod-btn-quantity">
                      <button type="button" title="수량 빼기" class="btn-down" onclick="minus()">-</button>
                      <span class="cart-quantity">${cartItem.quantity}</span>
                      <button type="button" title="수량 더하기" class="btn-up" onclick="plus()">+</button>
                    </div>
                  </div>
                  <div class="price-sum">${cartItem.product.price}원</div>
                  <div class="prod-del">
                    <button type="button">X</button>
                  </div>
                </li>
                </c:forEach>
              </ul>
            </div>
            <div class="total-payment">
              <ul>
                <li>
                  <div>총 상품금액</div>
                  <div class="total-prod-price"><%=totalPrice%>원</div>
                </li>
                <li>
                  <div class="plus"> + </div>
                </li>
                <li>
                  <div>배송비</div>
                  <div class="total-delivery-price">무료배송</div>
                </li>
                <li>
                  <div class="equal"> = </div>
                </li>
                <li>
                  <div>총 결제금액</div>
                  <div class="total-price"><%=totalPrice%>원</div>
                </li>
              </ul>
            </div>
            <div class="cart-btn-wrap">
              <button type="button" class="cart-back">돌아가기</button>
              <button type="button" class="cart-order" onclick="location.href='/order/order.jsp'">주문하기</button>
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