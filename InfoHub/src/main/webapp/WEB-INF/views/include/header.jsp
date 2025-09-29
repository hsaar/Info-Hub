<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<header class="topbar">
  <nav class="nav">
    <a class="logo" href="index">
      <img src="<c:url value='/resources/image/5.png'/>" alt="Nurim 로고">
    </a>
    <ul class="menu">
      <li><a href="articleListAll">정책기사</a></li>
      <li><a href="registrationlistAll">혜택</a></li>
      <li><a href="timeline">타임라인</a></li>
      <li><a href="boardlistmain">게시판</a></li>
      <li><a href="mypage_main">마이페이지</a></li>
       <c:if test="${empty userId}">
               <li style="padding-top: 7px; color: white">[비회원]</li>
               <li class="nav-item"><a class="nav-link"
                  href="<c:url value="login"/>">로그인 </a></li>
            </c:if>
            <c:if test="${not empty userId}">
               <li style="padding-top: 7px; color: white">[${userId}]님 어서오세요</li>
               <li class="nav-item"><a class="nav-link"
                  href="<c:url value="logout"/>">로그아웃 </a></li>
               <li class="nav-item"><a class="nav-link"
                  href="<c:url value="myinfo?name=${userId}"/>">회원 수정</a></li>
            </c:if>
         
    </ul>
  </nav>
</header>