<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
	<title>커뮤니티</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<a href="${pageContext.request.contextPath}/boardlistmain">
    <h5 class="box-title">커뮤니티 메인</h5>
</a>
<P>  The time on the server is ${serverTime}. </P>
<p> 게시판 메인 페이지 게시글은 여기 올라옴</p>
<div>
<!-- 실시간 인기글 (일단 스킵) -->
<a href="${pageContext.request.contextPath}/board/popular">
    <h5 class="box-title">실시간 인기글</h5>
</a>
<!-- 카테고리별 게시판 -->
<a href="${pageContext.request.contextPath}/board/listcategory?category=1">
    <h5 class="box-title">10대 게시판</h5>
</a>

<a href="${pageContext.request.contextPath}/board/listcategory?category=2">
    <h5 class="box-title">20대 게시판</h5>
</a>

<a href="${pageContext.request.contextPath}/board/listcategory?category=3">
    <h5 class="box-title">30대 게시판</h5>
</a>

<a href="${pageContext.request.contextPath}/board/listcategory?category=4">
    <h5 class="box-title">40대 게시판</h5>
</a>

<a href="${pageContext.request.contextPath}/board/listcategory?category=5">
    <h5 class="box-title">50대 게시판</h5>
</a>
<a href="${pageContext.request.contextPath}/board/register">
		<h5 class="box-title">글쓰기</h5>
</div>
</body>
</html>
