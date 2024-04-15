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


        <c:choose>
            <c:when test="${empty loginMember}">
            <fieldset>
                <div class="review-register">
                    <form action="/member/login.jsp" method="post" >
                            <%--        <div class="review-user-id" name="userId">작성자 : ${loginMember.id} </div>--%>
                        <label class="review-label" for="userId">작성자:</label>
                        <input type="text" class="review-user-id"  name="userId" disabled  id="userId" readonly style="color: red" value="리뷰 작성은 로그인 후 가능합니다."></input>
                        <br>
                        <div class="review-option">
                            <label class="review-label" for="productId-none">리뷰할 상품 선택:</label>
                            <select class="review-register-title" disabled name="subject" id="productId-none">
                                <option class="">-- 리뷰할 상품을 선택해주세요. --</option>
                                <c:forEach var="product" varStatus="i" items="${products}">
                                    <option value="${product.prodId}">${product.prodName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <br>
                        <div class="review-register-wrap">
                            <textarea name="content" rows="5" cols="120" disabled placeholder="리뷰 작성"></textarea>
                            <input type="submit" class="review-register-btn" style="background-color: yellowgreen; border: 0px" value="로그인">
                        </div>
                    </form>
                    <input disabled type="file">
                </div>
            </fieldset>
      </fieldset>
            </c:when>
            <c:otherwise>
                <fieldset>
                    <div class="review-register">
                        <form action="/review/review-action.jsp" method="post" >
                                <%--        <div class="review-user-id" name="userId">작성자 : ${loginMember.id} </div>--%>
                            <label class="review-label" for="userId">작성자:</label>
                            <input type="text" class="review-user-id" name="userId"  id="userId" readonly value="${loginMember.id}"></input>
                            <br>
                            <div class="review-option">
                                <label class="review-label" for="productId">리뷰할 상품 선택:</label>
                                <select class="review-register-title" name="subject" id="productId">
                                    <option class="">-- 리뷰할 상품을 선택해주세요. --</option>
                                    <c:forEach var="product" varStatus="i" items="${products}">
                                        <option value="${product.prodId}">${product.prodName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <br>
                            <div class="review-register-wrap">
                                <textarea name="content" rows="5" cols="120" placeholder="리뷰 작성"></textarea>
                                <input type="submit" class="review-register-btn" value="등록">
                            </div>
                        </form>
                        <input type="file">
                    </div>
                </fieldset>
            </c:otherwise>
        </c:choose>

      <div class="review">
        <h2>리뷰 <%= list.size() %>건</h2>
        <div class="review-list">
        <c:forEach var="review" items="${list}">
        
        
          <div class="review-wrap">
          <ul>
            <il><strong>${review.subject}</strong></il>
              <li> ${review.regdate} ㅣ ${review.userId} </li>
            <div class="review-content">
              <div class="review-img" style="background-image: url(/img/prod108.jpg); background-size: cover;"></div>
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