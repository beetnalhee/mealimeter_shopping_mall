<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.ezen.mall.domain.member.dto.Member" %>
<%@ page import="com.ezen.mall.domain.member.service.MemberService" %>


<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="com.ezen.mall.domain.member.service.MemberService" %>
<%@ page import="com.ezen.mall.domain.member.dto.Member" %>

<jsp:useBean id="member" class="com.ezen.mall.domain.member.dto.Member" scope="session" />
<jsp:setProperty name="member" property="*" />
<jsp:setProperty name="member" property="picture" value="default.jpg"/>

<%
    MemberService memberService = new MemberService();
    Member registerMember = memberService.registerMember(member);

    session.setAttribute("member", registerMember);
%>

 <c:redirect url="/member/result.jsp" />

