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
    <div id="login-wrap">
      <form id="login-form" action="/member/login-action.jsp" name="loginForm" method="post">
        <input type="hidden" name="referer" value="${referer}">
        <fieldset id="login-fieldset">
          <div id="login-div">
            <h1 class="title-text" >로그인</h1>
            <P>${message}</P>
            <input class="login-input" name="loginId" id="user-id" type="text" placeholder="아이디" required autofocus value= "${EzenUtil.decryption(cookie.saveId.value)}">
            <input class="login-input" name="loginPw" id="user-password" type="password" placeholder="비밀번호" required>
            <div id="login-function">
              <label id="login-label"><input type="checkbox" name="saveId" id="logCheckbox" ${not empty cookie.saveId.value ? "checked" : ""} > 아이디 저장</label>
              <a href="#">아이디/비밀번호 찾기</a>
            </div>
            <button class="login-input" id="login-btn" type="submit">로그인 하기</button>
          </div>
        </fieldset>
      </form>
    </div>
  </main>
  <!-- 메인 종료 -->

  <!-- footer 시작 -->
  <jsp:include page="/module/footer.jsp" />
  <!-- footer 종료 -->
</div>
</body>

</html>