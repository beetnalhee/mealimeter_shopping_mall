<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<jsp:useBean id="member" class="com.ezen.mall.domain.member.dto.Member" scope="session" />

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>mealimeter:회원가입을 축하드립니다!</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=IBM+Plex+Sans+KR&family=Nanum+Gothic&display=swap"
    rel="stylesheet">
  <link rel="stylesheet" href="/css/index.css">
  <c:url var="register_action" value="/member/register-action.jsp" />
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
    <div id="result-wrap">
      <h1><span id="result-member-id">${member.id}</span>님의 가입을 축하합니다!</h1>
      <fieldset id="result-fieldset">
        <ul id="result-info">
          <li class="result-list"><span class="result-list-color">아이디</span> ${member.id}</li>
          <li class="result-list"><span class="result-list-color">이름</span> ${member.name}</li>
          <li class="result-list"><span class="result-list-color">이메일</span> ${member.email}</li>
          <li class="result-list"><span class="result-list-color">연락처</span> ${member.phonenumber}</li>
          <li class="result-list"><span class="result-list-color">우편번호</span> ${member.zip_code}</li>
          <li class="result-list"><span class="result-list-color">상세주소</span> ${member.user_address}</li>
          <li class="result-list"><span class="result-list-color">가입일자</span> ${member.regdate}</li>
        </ul>
      </fieldset>
      <a href="/" id="result-btn">홈으로</a>
    </div>
  </main>
  <!-- 메인 종료 -->

  <!-- footer 시작 -->
  <jsp:include page="/module/footer.jsp" />
  <!-- footer 종료 -->
</div>
</body>

</html>