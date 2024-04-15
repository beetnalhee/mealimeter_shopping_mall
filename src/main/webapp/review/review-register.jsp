<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.ezen.mall.web.common.EzenUtil" %>
<%@ page import="com.ezen.mall.domain.product.service.ProductService" %>
<%@ page import="com.ezen.mall.domain.product.service.ProductServiceImpl" %>
<%@ page import="com.ezen.mall.domain.product.dto.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.mall.domain.review.dao.ReviewDao" %>
<%@ page import="com.ezen.mall.domain.review.dao.JdbcReviewDao" %>
<%@ page import="com.ezen.mall.domain.review.dto.Review" %>
<%@ page import="com.ezen.mall.domain.review.service.ReviewService" %>
<%@ page import="com.ezen.mall.domain.review.service.ReviewServiceImpl" %>

<!DOCTYPE html>
<html lang="ko">

<%
  ProductService productService = new ProductServiceImpl();
  List<Product> products = productService.productList();
  request.setAttribute("products", products);

  ReviewService reviewService = new ReviewServiceImpl();
  List<Review> list = reviewService.reviewList();
  request.setAttribute("list", list);

 String userId =(String)request.getSession().getAttribute("userId");
 String prodName = (String)request.getSession().getAttribute("prodName");

%>

<c:url var="review" value="/review/review-register.jsp">
  <c:param name="boardId" value="${param.boardId}" />
</c:url>

<c:if test="${empty loginMember}">
  <c:set var="message" value="리뷰작성은 로그인 후 가능합니다." scope="request" />
  <c:set var="referer" value="/review/review-register.jsp" scope="request" />
  <jsp:forward page="/member/login.jsp" />
</c:if>


<%--  String userId =(String)request.getSession().getAttribute("userId");--%>
<%--  if (userId == null) {--%>
<%--    response.sendRedirect("/login.jsp");--%>
<%--  }--%>


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
      <fieldset>
      <div class="review-register">
        <form action="/review/review-action.jsp" method="post" >
<%--        <div class="review-user-id" name="userId">작성자 : ${loginMember.id} </div>--%>
    <label class="review-label" for="userId">작성자:</label>
    <input type="text" class="review-user-id" name="userId" readonly value="${loginMember.id}"></input>
    <br>
    <div class="review-option">
    <label class="review-label" for="productId">리뷰할 상품 선택:</label>
    <select class="review-register-title" name="productId">
          <option class="">-- 리뷰할 상품을 선택해주세요. --</option>
          <c:forEach var="product" items="${products}">
            <option value="${product.prodId}">${product.prodName}</option>
          </c:forEach>
        </select>
    </div>
    <br>
    <label class="review-label" for="subject">제목:</label>
          <input class="review-subject" type="text" name="subject" placeholder="제목">
        <div class="review-register-wrap">
          <textarea name="content" rows="5" cols="120" placeholder="리뷰 작성"></textarea>
          <input type="submit" class="review-register-btn" value="등록">

<%--          <a href="${register}" class="review-register-btn">등록</a>--%>
          <%--          <a class="review-register-btn" href="" >등록</a>--%>
        </div>
        </form>
          <input type="file">
      </div>
      </fieldset>

      <div class="review">
        <h2>리뷰 <%= list.size() %>건</h2>
        <div class="review-list">
        <c:forEach var="review" items="${list}">
        
        
          <div class="review-wrap">
          <ul>
            <il><strong>${review.subject}</strong></il>
            <li> ${review.regdate} ㅣ ${review.userId} ㅣ <%=prodName%> </li>
            <div class="review-content">
              <div class="review-img" style="background-image: url(/img/prod104.jpg); background-size: cover;"></div>
              <div class="review-text">
                ${review.content}
              </div>
            </div>
          </ul>
          </div>
            <hr class="divider">
        </c:forEach>



        </div>
      </div>
    </div>
  <!-- 메인 종료 -->

  <!-- footer 시작 -->
  <jsp:include page="/module/footer.jsp" />
  <!-- footer 종료 -->
</div>

<%--<script type="text/javascript">--%>
<%--  function checkLogin() {--%>
<%--    if("${empty loginMember}") {--%>
<%--      alert("리뷰 작성을 위해서는 먼저 로그인이 필요합니다.");--%>

<%--      return false; // 로그인 페이지로 이동하지 않음--%>
<%--    } else {--%>
<%--      return true; // 리뷰 등록 페이지로 이동--%>
<%--    }--%>
<%--  }--%>
<%--</script>--%>


</body>

</html>