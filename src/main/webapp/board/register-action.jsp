<%@ page import="com.ezen.mall.domain.board.service.BoardService" %>
<%@ page import="com.ezen.mall.domain.board.service.BoardServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");

%>

<jsp:useBean id="article" class="com.ezen.mall.domain.board.dto.Article" scope="request" />
<jsp:setProperty name="article" property="*" />

<%
    int boardId = Integer.parseInt(request.getParameter("boardId"));
    String passwd = "9999";

    article.setBoardId(boardId);
    article.setPasswd(passwd);

    BoardService boardService = new BoardServiceImpl();
    boardService.writeArticle(article);
    response.sendRedirect("list.jsp?boardId=" + boardId);
%>