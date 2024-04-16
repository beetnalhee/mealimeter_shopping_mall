<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="navi">
  <div class="nav-wrap">
    <div class="nav-logo">
      <a href="/"><img src="/img/logo.png"></a>
    </div>
    <div class="nav-list">
      <ul>
        <li class="nav-list-text">
          <a href="/product/product-all.jsp">전체상품</a>
        </li>
        <li class="nav-list-text">
          <a href="/product/new-product.jsp">신메뉴</a>
        </li>
        <li class="nav-list-text">
          <a style="color: red" href="/product/hotdeal-product.jsp">핫딜</a>
        </li>
        <li class="nav-list-text">
          <a href="/review/review-register.jsp">리뷰</a>
        </li>
        <li class="nav-list-text">
          <a href="/board/list.jsp?boardId=100">밀리소식</a>
        </li>
      </ul>
    </div>
    <div class="nav-cart">
      <a href="/cart/cart.jsp"><img src="/img/cart-img.png"></a>
    </div>
  </div>

  <c:choose>
    <c:when test="${pageContext.request.requestURI.equals('/') || pageContext.request.requestURI.equals('/index.jsp')}">
      <div class="nav-banner-main">
        <a href=""><div class="nav-banner-main"><video src="/video/banner-main.mp4" loop autoplay muted ></video></div></a>
      </div>
    </c:when>

    <c:when test="${pageContext.request.requestURI.equals('/member/login.jsp')}">
      <div class="nav-banner">
        <a href=""><div class="nav-banner"><img src="/img/login-banner.png" ></img></div></a>
      </div>
    </c:when>

    <c:when test="${pageContext.request.requestURI.equals('/member/register.jsp')}">
      <div class="nav-banner">
        <a href=""><div class="nav-banner"><img src="/img/join-banner.png" ></img></div></a>
      </div>
    </c:when>

    <c:when test="${pageContext.request.requestURI.equals('/member/result.jsp')}">
      <div class="nav-banner">
        <a href=""><div class="nav-banner"><img src="/img/join-banner.png" ></img></div></a>
      </div>
    </c:when>

    <c:when test="${pageContext.request.requestURI.equals('/cart/cart.jsp')}">
      <div class="nav-banner">
        <a href=""><div class="nav-banner"><img src="/img/cart-banner.png" ></img></div></a>
      </div>
    </c:when>

    <c:otherwise>
      <div class="nav-banner">
        <a href=""><div class="nav-banner"><img src="/img/nav-img.png"> </div></a>

      </div>
    </c:otherwise>
  </c:choose>
</div>