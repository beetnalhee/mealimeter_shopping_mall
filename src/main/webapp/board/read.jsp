<%@ page import="com.ezen.mall.domain.member.dto.Member" %>
<%@ page import="com.ezen.mall.domain.board.service.BoardService" %>
<%@ page import="com.ezen.mall.domain.board.dto.Article" %>
<%@ page import="com.ezen.mall.domain.board.service.BoardServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.mall.domain.board.dao.ArticleDao" %>
<%@ page import="com.ezen.mall.domain.board.dao.JdbcArticleDao" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<jsp:useBean id="member" class="com.ezen.mall.domain.member.dto.Member" scope="session" />
<%
  BoardService boardService = new BoardServiceImpl();
  Article article = boardService.printArticle(Integer.parseInt(request.getParameter("articleId")));
  request.setAttribute("article", article);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>밀리소식 : ${article.subject}</title>
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
          <h1 class="title-text">${article.subject}</h1>
          <form id="board-write-form" action="/board/register-action.jsp" method="post">
            <div class="board-write-group board-write-list">
              <label class="board-write-label">작성자</label>
              <input class="board-write-text" type="text" name="writer" value="${article.userId}">
            </div>
            <div class="board-write-group board-write-list">
            <label class="board-write-label">등록일시</label>
            <input class="board-write-text" type="text" name="regdate" value="${article.regdate}">
          </div>
            <div class="board-write-group">
              <label class="board-write-label2">내용</label>
              <textarea class="board-write-textarea" rows="10" name="content">${article.content}</textarea>
            </div>
          </form>
          <div id="article-btn-list">
          <a href="/board/comment.jsp?boardId=${article.boardId}&articleId=${article.articleId}&title=${article.subject}" class="article-btn">댓글쓰기</a>
          <a href="list.jsp" class="article-btn">목록</a>
          <a href="#" class="article-btn">수정</a>
        </div>
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
