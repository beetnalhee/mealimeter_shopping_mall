<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.ezen.mall.web.common.EzenUtil" %>
<%@ page import="com.ezen.mall.domain.cart.CartList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  session.getAttribute("cartList");
%>

<c:set var="totalProdPrice" value="0" />
<c:forEach var="cartItem" items="${cartList}">
  <c:set var="subtotal" value="${cartItem.quantity * cartItem.product.price}" />
  <c:set var="totalProdPrice" value="${totalProdPrice + subtotal}" />
</c:forEach>



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

              <div class="check-box">
                <label for="select-all" class="chk_box">
                <input class="cart-check-all" id="select-all" checked type="checkbox" />
                  <span class="on"></span>
                  전체선택 (<span>0</span>/${cartList.size()})

                </label>
              </div>
              <div class="cart-select-btn">
                <a href="/cart/cart-remove.jsp" class="btn-del-all">전체삭제</a>
                <a href="#" class="btn-del-wish">선택삭제</a>
              </div>
            </div>
            <div class="cart-list">
              <ul>
                <c:choose>
                  <c:when test="${empty cartList}">
                    <p style="padding: 30px 0 ">장바구니가 비었습니다.</p>
                  </c:when>
                <c:otherwise>
                <c:forEach var="cartItem" items="${cartList}" varStatus="status">
                  <li class="cart-list-prod">
                    <div class="check-box">
                      <label for="order-no${status.index}" class="chk_box">
                        <input type="checkbox" id="order-no${status.index}" checked />
                        <span class="on"></span>
                      </label>

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
                        <button type="button" title="수량 빼기" class="btn-down" onclick="minus(${status.index}, ${cartItem.product.price})">-</button>
                        <span class="cart-quantity${status.index}" id="quantity">${cartItem.quantity}</span>
                        <button type="button" title="수량 더하기" class="btn-up" onclick="plus(${status.index}, ${cartItem.product.price})">+</button>
                      </div>
                    </div>
                    <div id="price-sum"><span class="price-sum${status.index}">${cartItem.quantity * cartItem.product.price}</span>원</div>
                    <div class="prod-del">
                      <button type="button" onclick="removeProduct(${status.index})">X</button>
                    </div>
                  </li>
                </c:forEach>
                </c:otherwise>
                </c:choose>

              </ul>
            </div>
            <div class="total-payment">
              <ul>
                <li>
                  <div>총 상품금액</div>
                  <div class="total-prod-price">${totalProdPrice}원</div>
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
                  <div class="total-price">${totalProdPrice}원</div>
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

<script>
  function updateTotal() {
    let totalProdPrice = 0;
    let priceElements = document.querySelectorAll("[class^='price-sum']");
    priceElements.forEach(priceElement => {
      totalProdPrice += parseInt(priceElement.innerText);
    });
    document.querySelector(".total-prod-price").innerText = totalProdPrice.toLocaleString() + "원"; // 총 상품 금액을 표시할 때 세 자리마다 쉼표를 추가합니다.
    document.querySelector(".total-price").innerText = totalProdPrice.toLocaleString() + "원";
  }

  function plus(index, price) {
    let countElement = document.querySelector(".cart-quantity" + index);
    let count = parseInt(countElement.textContent);
    count++;
    countElement.textContent = count;
    let priceElement = document.querySelector(".price-sum" + index);
    priceElement.textContent = comma(count * price);
    updateTotal();
  }

  function minus(index, price) {
    let countElement = document.querySelector(".cart-quantity" + index);
    let count = parseInt(countElement.textContent);
    if (count > 1) {
      count--;
      countElement.textContent = count;
      let priceElement = document.querySelector(".price-sum" + index);
      priceElement.textContent = comma(count * price);
      updateTotal();
    }
  }

  function removeProduct(index) {
    let productElement = document.querySelector(".cart-list-prod:nth-child(" + (index + 1) + ")");
    productElement.parentNode.removeChild(productElement);
    location.href='cart-remove.jsp?index='+index;
    updateTotal();
  }

  function comma(x) {
    return new Intl.NumberFormat('ko-KR').format(x);
  }


  window.onload = updateTotal;
</script>

</html>