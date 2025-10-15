<%@page import="org.springframework.web.context.request.RequestContextHolder"%>
<%@page import="org.springframework.web.context.request.ServletRequestAttributes"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String userId = (String) session.getAttribute("userId");
%>
<html>
<head>
<meta charset="UTF-8">
	<title>로그인페이지입니다</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/login.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<h2>회원정보 수정</h2>
<div class="container" id="container">
  <div>
    <h3>${name}님의 회원정보 수정</h3>
    <form action="myinfo" method="post">
      <h1>Update Account</h1>
      <span>change your account info</span>
      <%=userId %>
      <input type = "hidden" value="<%=userId %>" name = "userId"/>
      <input type="password" placeholder="Password" name = "password" required/>
      <input type="email" placeholder="Email" name = "email" required/>
      <input type="text" placeholder="Nickname" name = "name" required/>
      <input type="text" placeholder="phone" name = "phone" required/>
     
      <button>수정</button>
    </form>
  </div>
</div>
 <jsp:include page="../include/footer.jsp"/>
</body>
</html>
