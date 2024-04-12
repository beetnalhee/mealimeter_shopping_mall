<%@ page import="com.ezen.mall.domain.member.dto.Member" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<%--%>
<%--// 로그인 사용자만이 사용할 수 있도록.--%>
<%--  Member loginMember = (Member)session.getAttribute("loginMember");--%>
<%--  if(loginMember == null){--%>
<%--   application.getRequestDispatcher("/member/login.jsp").forward(request, response);--%>
<%--  }--%>
<%--%>--%>

<%
  int boardId = 100;
  if(request.getParameter("boardId") != null) {
    boardId = Integer.parseInt(request.getParameter("boardId"));
  }
%>

<c:if test="${empty loginMember}">
  <c:set var="message" value="게시판 글쓰기는 로그인 후 가능합니다." scope="request" />
  <c:set var="referer" value="/board/register.jsp" scope="request" />
  <jsp:forward page="/member/login.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>mealimeter:밀리소식</title>
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
      <!-- aside 시작 -->
      <!-- aside 종료 -->

      <section id="section">
        <div class="contents">
          <h1 class="board-text">게시글 쓰기</h1>
          <form id="board-write-form" action="/board/register-action.jsp" method="post">
          <input type="hidden" name="boardId" value="<%=boardId%>">
              <div class="board-write-group board-write-list">
                <label class="board-write-label">작성자</label>
                <input class="board-write-text" type="text" name="userId" value="${loginMember.id}">
              </div>
            <div class="board-write-group board-write-list">
              <label class="board-write-label">제목</label>
              <input class="board-write-text" type="text" name="subject" >
            </div>
            <div class="board-write-group">
              <label class="board-write-label2">내용</label>
              <textarea class="board-write-textarea" rows="10" name="content"></textarea>
            </div>
            <button id="board-write-register" type="submit" >등 록</button>
          </form>
        </div>
      </section>
    </div>
  </main>
  <!-- 메인 종료 -->

  <!-- footer 시작 -->
  <jsp:include page="/module/footer.jsp" />
  <!-- footer 종료 -->
</div>
</body>
</html>
