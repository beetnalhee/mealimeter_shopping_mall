<%@ page import="com.ezen.mall.domain.board.service.BoardService" %>
<%@ page import="com.ezen.mall.domain.board.service.BoardServiceImpl" %>
<%@ page import="com.ezen.mall.domain.board.dto.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.mall.web.common.page.PageParams" %>
<%@ page import="com.ezen.mall.web.common.page.Pagination" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  int boardId = 10;
  if(request.getParameter("boardId") != null) {
    boardId = Integer.parseInt(request.getParameter("boardId"));
  }

  // 페이지 번호
  int requestPage = 1;
  if(request.getParameter("page") != null) {
    requestPage = Integer.parseInt(request.getParameter("page"));
  }

  // 페이지별 행 갯수
  int rowCount = 10;
  if(request.getParameter("count") != null) {
    rowCount = Integer.parseInt(request.getParameter("count"));
  }

  // 페이지별 페이지 번호 갯수
  int pageSize = 10;

  // 사용자 검색 유형
  String searchType = request.getParameter("type");

  // 사용자 검색 값
  String searchValue = request.getParameter("value");



  BoardService boardService = new BoardServiceImpl();
  List<Article> list = boardService.articleList(rowCount, requestPage, searchType, searchValue);
  request.setAttribute("list", list);

  int tableRowCount = boardService.getArticleCount(searchType, searchValue);
  PageParams pageParams = new PageParams(rowCount, pageSize, requestPage, tableRowCount);
    Pagination pagination = new Pagination(pageParams);
    request.setAttribute("pagination", pagination);
%>

<c:url var="register" value="register.jsp">
  <c:param name="boardId" value="${param.boardId}" />
</c:url>

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
      <section id="section">
        <div class="contents">
          <div>
            <h1 class="title-text">밀리소식</h1>
            <form>
              <div id="board-header">
                <input type="hidden" name="page" value="1">
                <div id="board-search-wrap">
                 <div>
                  <select id="board-select-type" name="type">
                    <option value="" selected>-- 검색유형 --</option>
                    <option value="t">제목</option>
                    <option value="c">내용</option>
                    <option value="w">작성자</option>
                    <option value="tc">제목 + 내용</option>
                    <option value="tcw">제목 + 내용 + 작성자</option>
                  </select>
                </div>
                <input id="board-search-bar" type="search" name="value">
                <div>
                  <button id="board-search-btn" type="submit">검색</button>
                </div>
                </div>
               <a id="board-write-btn" href="${register}">게시글 쓰기</a>
              </div>
            </form>

            <table id="board-table">
              <thead id="board-table-head">
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>등록일자</th>
              </tr>
              </thead>

              <tbody>
              <c:forEach var="article" items="${list}" varStatus="loop">
                  <tr>
                    <td>${pagination.params.rowCount - ((pagination.params.requestPage -1) * pagination.params.elementSize) - loop.index}</td>
                    <td id="board-title-list">
                        <c:forEach begin="1" end="${article.levelNo}">
                           <c:if test="${article.levelNo != 0}">
                               <img class="re-img" src="/img/level.gif">
                           </c:if>
                        </c:forEach>
                        <c:if test="${article.levelNo != 0}"><img src="/img/re.gif"></c:if>

                        <a href="read.jsp?boardId=${article.boardId}&articleId=${article.articleId}">${article.title}</a></td>
                    <td>${article.writer}</td>
                    <td>${article.hitcount}</td>
                    <td>${article.regdate}</td>
                  </tr>
              </c:forEach>
              </tbody>

            </table>


            <ul id="board-page-wrap">
                <c:if test="${pagination.showFirst}">
                    <li class="page-item"><a class="page-link" href="?page=1"><<</a></li>
                </c:if>
                <c:if test="${pagination.showPrevious}">
                    <li class="page-item"><a class="page-link" href="?page=${pagination.previousStartPage}&type=${param.type}&value=${param.value}"><</a></li>
                </c:if>

                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
                    <c:url var="list" value="list.jsp">
                        <c:param name="page" value="${i}" />
                        <c:param name="type" value="${param.type}" />
                        <c:param name="value" value="${param.value}" />
                    </c:url>
                    <li class="page-item"><a class="page-link <c:if test="${i == pagination.params.requestPage}">page-active</c:if>" href="${list}">${i}</a></li>
                </c:forEach>

                <c:if test="${pagination.showNext}">
                    <li class="page-item"><a class="page-link" href="?page=${pagination.nextStartPage}&type=${param.type}&value=${param.value}">></a></li>
                </c:if>
                <c:if test="${pagination.showLast}">
                    <li class="page-item"><a class="page-link" href="?page=${pagination.totalPages}&type=${param.type}&value=${param.value}">>></a></li>
                </c:if>
            </ul>
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
