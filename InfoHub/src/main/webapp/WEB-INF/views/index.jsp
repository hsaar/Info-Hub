<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

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
<a href = "registrationlistAll">registration test </a> : ${listAll }<br>
<a href = "searchlistAll">search test </a> <br>
<a href = "searchCount">search test </a> : ${searchCount }<br>
</body>
</html>
