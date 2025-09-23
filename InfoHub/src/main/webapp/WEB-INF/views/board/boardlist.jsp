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

<P>  The time on the server is ${serverTime}. </P>
<p> 게시판 메인 페이지 게시글은 여기 올라옴</p>
<div>
<a href="${pageContext.request.contextPath}/boardregister">
		<h5 class="box-title">새글쓰기</h5>
	</a>

</div>
</body>
</html>
