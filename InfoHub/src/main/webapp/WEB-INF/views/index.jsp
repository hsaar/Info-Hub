<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
	<title>첫 화면 페이지입니다</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<button type="button" onclick="location.href='articleListAll1'">부동산</button>
<button type="button" onclick="location.href='articleListAll2'">주식</button>
<button type="button" onclick="location.href='articleListAll3'">적금</button>
<button type="button" onclick="location.href='articleListAll4'">복지</button>
<button type="button" onclick="location.href='articleListAll5'">창업</button>
<br><br>
<a href="articleListAll">최신기사 조회</a> <br>
</body>
</html>
