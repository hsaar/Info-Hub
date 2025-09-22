<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<header class="topbar">
  <nav class="nav">
    <a class="logo" href="index">
      <img src="<c:url value='/resources/image/5.png'/>" alt="INFO HUB 로고">
    </a>
    <ul class="menu">
      <li><a href="article_home">전체기사</a></li>
      <li><a href="registrationlistAll">혜택 바로가기</a></li>
      <li><a href="timeline">타임라인</a></li>
      <li><a href="board_main">게시판</a></li>
      <li><a href="login">로그인</a></li>
    </ul>
  </nav>
</header>