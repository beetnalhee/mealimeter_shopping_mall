<%@ page import="com.ezen.mall.domain.board.service.BoardService" %>
<%@ page import="com.ezen.mall.domain.board.service.BoardServiceImpl" %>
<%@ page import="com.ezen.mall.domain.board.dto.Article" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="comment" class="com.ezen.mall.domain.board.dto.Article" scope="request" />
<jsp:setProperty name="comment" property="*" />


<%
    BoardService boardService = new BoardServiceImpl();
    Article article = boardService.printArticle(Integer.parseInt(request.getParameter("articleId")));
    request.setAttribute("article", article);

    int boardId = Integer.parseInt(request.getParameter("boardId"));
    String passwd = "9999";

    comment.setBoardId(boardId);
    comment.setPasswd(passwd);
    comment.setGroupNo(article.getGroupNo());
    comment.setLevelNo(article.getLevelNo());

    boardService = new BoardServiceImpl();
    boardService.writeComment(comment);
    response.sendRedirect("list.jsp?boardId=" + boardId);
%>