<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.ezen.mall.domain.member.dto.Member" %>
<%@ page import="com.ezen.mall.domain.member.service.MemberService" %>
<%@ page import="com.ezen.mall.web.common.EzenUtil" %>



<%
String id = request.getParameter("loginId");
String passwd = request.getParameter("loginPw");
String saveId = request.getParameter("saveId");
String referer = request.getParameter("referer");
if(referer == null || referer.equals("")){
  referer = "/";
}

MemberService memberService = new MemberService();
Member loginMember = memberService.login(id, passwd);


if(loginMember != null) {
  if(saveId != null){
    Cookie saveIdCookie = new Cookie("saveId", EzenUtil.encryption(id));
    saveIdCookie.setMaxAge(60*60*24*7);
    saveIdCookie.setPath("/");
    response.addCookie(saveIdCookie);
  } else{
    Cookie saveIdCookie = new Cookie("saveId", EzenUtil.encryption(id));
    saveIdCookie.setMaxAge(0);
    saveIdCookie.setPath("/");
    response.addCookie(saveIdCookie);
  }

  session.setAttribute("loginMember", loginMember);
  response.sendRedirect(referer);
} else {
%>
  <script>
    alert("아이디와 비밀번호를 확인해주세요.");
    location.href='/member/login.jsp'
  </script>
<%
}
%>
