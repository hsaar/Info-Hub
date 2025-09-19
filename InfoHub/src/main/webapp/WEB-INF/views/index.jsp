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
<P> test count : ${test}</P>
<p><a href = "keyword">keyword</a></p>
<p><a href = "login">login</a></p>
<a href = "registrationlistAll">registration test </a> : ${listAll }<br>
<a href = "searchlistAll">search test </a> <br>
<a href = "searchCount">search test </a> : ${searchCount }<br>
<button type="button" onclick="location.href='articleListAll1'">부동산</button>
<button type="button" onclick="location.href='articleListAll2'">주식</button>
<button type="button" onclick="location.href='articleListAll3'">적금</button>
<button type="button" onclick="location.href='articleListAll4'">복지</button>
<button type="button" onclick="location.href='articleListAll5'">창업</button>
<br><br>
<a href="articleListAll">최신기사 조회</a> <br>
	<a href="boardmain">
		<h5 class="box-title">커뮤니티 페이지</h5>
	</a>


</body>
</html>
