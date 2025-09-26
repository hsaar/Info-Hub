<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>혜택바로가기</title>
</head>
<body>
<h1>
전체 목록
</h1>

<h2>혜택</h2>
	<table border="1" cellpadding="5" cellspacing="0">
	    <thead>
	        <tr>
	            <th>타이틀</th>
	            <th>내용</th>
	            <th>신청기간</th>
	            <th>접수기관</th>
	            <th>전화문의</th>
	            <th>지원형태</th>
	            <th>신청방법</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach var="item" items="${registrationlistAll}">
	            <tr>
	                <td>${item.title}</td>
	                <td>${item.content}</td>
	                <td>${item.period}</td>
	                <td>${item.trachea}</td>
	                <td>${item.call}</td>
	                <td>${item.type}</td>
	                <td>
	                    <a href="${item.link}" target="_blank" title="새창열림">
	                        타사이트 이동
	                    </a>
	                </td>
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>
</body>
</html>

