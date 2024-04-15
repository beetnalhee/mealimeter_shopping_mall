<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.ezen.mall.web.common.EzenUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  <title>mealimeter:회원가입</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=IBM+Plex+Sans+KR&family=Nanum+Gothic&display=swap"
    rel="stylesheet">
  <link rel="stylesheet" href="/css/index.css">
  <c:url var="register_action" value="/member/register-action.jsp" />
  <script type="text/javascript" src="/js/validator.js">
    document.getElementById('register-form').addEventListener('submit', function(event) {
      // 아이디 유효성 검사
      const id = document.getElementById('register-id').value.trim();
      if (id.length < 4 || id.length > 16) {
        alert('아이디는 4자 이상, 16자 이하로 입력해주세요.');
        event.preventDefault();
        return;
      }

      // 비밀번호 유효성 검사
      const password = document.getElementById('register-pw').value.trim();
      const passwordConfirm = document.getElementById('register-pw-confirm').value.trim();
      if (password.length < 6 || password.length > 20) {
        alert('비밀번호는 6자 이상, 20자 이하로 입력해주세요.');
        event.preventDefault();
        return;
      }
      if (password !== passwordConfirm) {
        alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
        event.preventDefault();
        return;
      }

      // 이름 유효성 검사
      const name = document.getElementById('register-name').value.trim();
      if (name === '') {
        alert('이름을 입력해주세요.');
        event.preventDefault();
        return;
      }

      // 이메일 유효성 검사
      const email = document.getElementById('register-email').value.trim();
      if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
        alert('올바른 이메일 주소를 입력해주세요.');
        event.preventDefault();
        return;
      }

      // 연락처 유효성 검사
      const phoneNumber = document.getElementById('register-phonenumber').value.trim();
      if (!/^[0-9]{10,11}$/.test(phoneNumber)) {
        alert('올바른 연락처를 입력해주세요.');
        event.preventDefault();
        return;
      }

      // 우편번호 유효성 검사
      const zipCode = document.getElementById('register-zipcode').value.trim();
      if (!/^[0-9]{5}$/.test(zipCode)) {
        alert('올바른 우편번호를 입력해주세요.');
        event.preventDefault();
        return;
      }

      // 상세주소 유효성 검사
      const address = document.getElementById('register-address').value.trim();
      if (address === '') {
        alert('상세주소를 입력해주세요.');
        event.preventDefault();
        return;
      }
    });

  </script>

  </head>



<body>
<!-- 헤더 시작 -->
<jsp:include page="/module/header.jsp" />
<!-- 헤더 종료 -->

<div id="wrapper">
  <!-- 메인 시작 -->
  <main id="main" class="register-main">
    <!-- Nav 시작 -->
    <jsp:include page="/module/nav.jsp" />
    <!-- Nav 종료 -->

    <!-- 메인 시작 -->
    <div id="register-wrap">
          <h1 class="title-text">회원 가입</h1>
      <form id="register-form" name="register-form" method="post" action="${register_action}">
        <fieldset id="register-fieldset">
          <ul id="register-list">
            <li class="register-info">
              <label for="register-id">아이디</label>
              <input class="register-input" name="id" type="text" id="register-id" size="20" placeholder="아이디를 입력해주세요." minlength="2"
                     maxlength="10" autofocus required>
            </li>
            <li class="register-info">
              <label for="register-pw">비밀번호</label>
              <input class="register-input" name="passwd" type="password" id="register-pw" placeholder="비밀번호를 입력해주세요." required >
            </li>
            <li class="register-info">
              <label for="register-pw-confirm">비밀번호 확인</label>
              <input class="register-input" type="password" id="register-pw-confirm" placeholder="비밀번호를 한번 더 입력해주세요." required>
            </li>
            <li class="register-info">
              <label for="register-name">이름</label>
              <input class="register-input" name="name" type="text" id="register-name" size="20" autofocus required placeholder="이름">
            </li>
            <li class="register-info">
              <label for="register-email">이메일</label>
              <input class="register-input" name="email" type="email" id="register-email" placeholder="이메일" required>
            </li>

            <li class="register-info">
              <label for="register-phonenumber">연락처</label>
              <input class="register-input" name="phonenumber" type="tel" id="register-phonenumber" placeholder="연락처" required>
            </li>

            <li class="register-info">
              <label for="register-zipcode">우편번호</label>
              <input class="register-input" name="zipCode" type="number" id="register-zipcode" placeholder="우편번호" required >
            </li>

            <li class="register-info">
              <label for="register-address">상세주소</label>
              <input class="register-input" name="userAddress" type="text" id="register-address" placeholder="상세주소" required >
            </li>

            <li class="register-info">
              <label for="register-picture">사진</label>
              <input name="picture" type="file" id="register-picture">
            </li>
          </ul>
        </fieldset>
        <button id="register-btn" type="submit" onclick="">회원가입 하기</button>
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