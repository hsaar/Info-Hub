<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String userId = request.getParameter("userId");
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
    <!-- Font Awesome 아이콘 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<header class="topbar">
  <nav class="nav">
    <a class="logo" href="index">
      <img src="<c:url value='/resources/image/5.png'/>" alt="Nurim 로고">
    </a>
    <ul class="menu">
      <li><a href="articleListAll">기사</a></li>
      <li><a href="policy">지역별 정책 </a></li>
      <li><a href="registrationlistAll">혜택</a></li>
      <li><a href="timeline">타임라인</a></li>
      <li><a href="boardlistmain">게시판</a></li>
    </ul>
    
    <div class="right">
      <c:if test="${empty userId}">
        <span>[비회원]</span>
        <a href="<c:url value='login'/>" title="로그인">
          <i class="fas fa-sign-in-alt"></i>
        </a>
      </c:if>
      <c:if test="${not empty userId}">
        <span>[${userId}]님 어서오세요</span>
        
       
       
        <a href="<c:url value='logout'/>" title="로그아웃">
          <i class="fas fa-sign-out-alt"></i>
        </a>
        <a href="<c:url value='mypage_main'/>" title="마이페이지">
          <i class="fas fa-user-circle"></i>
        </a>
      </c:if>
    </div>
  </nav>
</header>


</body>
</html>