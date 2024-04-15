<%@ page import="com.ezen.mall.domain.board.service.BoardService" %>
<%@ page import="com.ezen.mall.domain.board.service.BoardServiceImpl" %>
<%@ page import="com.ezen.mall.domain.review.service.ReviewService" %>
<%@ page import="com.ezen.mall.domain.review.service.ReviewServiceImpl" %>
<%@ page import="com.ezen.mall.domain.product.service.ProductService" %>
<%@ page import="com.ezen.mall.domain.product.service.ProductServiceImpl" %>
<%@ page import="com.ezen.mall.domain.product.dto.Product" %>
<%@ page import="com.ezen.mall.domain.member.dto.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    Member loginMember = (Member)session.getAttribute("loginMember");
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

    int prodId = Integer.parseInt(request.getParameter("subject"));
    ProductService productService = new ProductServiceImpl();
    Product product = productService.searchProduct(prodId);

    review.setAttachFile(product.getProdImg());
    review.setProductId(prodId);
    review.setSubject(product.getProdName());

    ReviewService reviewService = new ReviewServiceImpl();
    reviewService.writeReview(review);
    response.sendRedirect("/review/review-register.jsp");

%>