<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.ezen.mall.web.common.EzenUtil" %>

<%
  String saveId = null;
  Cookie[] cookies = request.getCookies();
  if(cookies != null){
    for(Cookie cookie : cookies){
      if(cookie.getName().equals("saveId")){
        saveId = EzenUtil.decryption(cookie.getValue());
      }
    }
  }
%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>mealimeter:로그인</title>
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
    <div id="mypage-wrap">
      <h1 class="title-text">마이페이지</h1>
      <div class="mypage-content">
        <div class="mypage-aside-wrap">
          <div class="user-img-wrap">
            <div class="user-img" style="background-image: url(/img/profile.png); background-size: cover;"></div>
          </div>
          <div class="member-info-wrap">
            <ul>
              <li>[chan999]</li>
              <li id="mypage-name"><strong>김찬규</strong>님</li>
              <li id="mypage-grade">회원등급 : general</li>
            </ul>
          </div>
        </div>
        <div class="mypage-main-wrap">
          <h2>최근 주문내역</h2>
            <div class="mypage-order">
              <div id="mypage-order-head">
                2024-04-11 ㅣ 주문번호 : 20240411-01-00001
              </div>
              <div class="mypage-order-list">
                <div>
                  <img src="/img/prod104.jpg">
                </div>
                <div class="mypage-order-info">
                  <ul>
                    <li>[냉동] 쫄깃탱글 불쭈꾸미볶음</li>
                    <li>10,500원 / 2개</li>
                  </ul>
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>
  </main>
  <!-- 메인 종료 -->

  <!-- footer 시작 -->
  <jsp:include page="/module/footer.jsp" />
  <!-- footer 종료 -->
</div>
</body>

</html>