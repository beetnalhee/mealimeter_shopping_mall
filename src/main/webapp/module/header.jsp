<%@ page import="com.ezen.mall.domain.member.dto.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Member loginMember = (Member) pageContext.findAttribute("loginMember"); %>

<header>
    <div id="head-line">
        <div class="header-wrap">
        <ul class="login-list">
                <c:choose>
                    <c:when test="${empty loginMember}">
                            <li ><a class="login-text" href="/member/register.jsp">회원가입</a></li>
                            <li ><a class="login-text" href="/member/login.jsp">로그인</a></li>
                    </c:when>
                    <c:otherwise>
                            <li class="login-welcome"><a class="login-name" href="/member/mypage.jsp?userId=${loginMember.getId()}">${loginMember.getName()}</a>님 환영합니다.</li>
                            <li><a class="logout" href="/member/logout-action.jsp">로그아웃</a></li>
                    </c:otherwise>
                </c:choose>
        </ul>
        </div>
    </div>
</header>
