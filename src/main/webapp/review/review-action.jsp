<%@ page import="com.ezen.mall.domain.board.service.BoardService" %>
<%@ page import="com.ezen.mall.domain.board.service.BoardServiceImpl" %>
<%@ page import="com.ezen.mall.domain.review.service.ReviewService" %>
<%@ page import="com.ezen.mall.domain.review.service.ReviewServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");

%>

<jsp:useBean id="review" class="com.ezen.mall.domain.review.dto.Review" scope="request" />
<jsp:setProperty name="review" property="*" />

<%
//    int boardId = Integer.parseInt(request.getParameter("boardId"));
//    String passwd = "9999";
//
//    article.setBoardId(boardId);
//    article.setPasswd(passwd);
//
//    BoardService boardService = new BoardServiceImpl();
//    boardService.writeArticle(article);
//    response.sendRedirect("list.jsp?boardId=" + boardId);

    ReviewService reviewService = new ReviewServiceImpl();
    reviewService.writeReview(review);
    response.sendRedirect("/review/review-register.jsp");

%>