<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>혜택바로가기</title>
</head>
<body>
<h1>
전체 목록
</h1>

<h2>혜택</h2>

		<tr>
		<c:forEach var="registrationlistAll" items="${registrationlistAll }"> <!-- JSTL의 반복문 -->
			<p>----------------------------------------------------------------------------------------</p><br>
			<th>타이틀 : <td>${registrationlistAll.title}</td></th><br>
			<th>내용  : <td>${registrationlistAll.content}</td></th><br>
			<th>신청기간 : <td>${registrationlistAll.period}</td></th><br>
			<th>접수기관 : <td>${registrationlistAll.trachea}</td></th><br>
			<th>전화문의 : <td>${registrationlistAll.call}</td></th><br>
			<th>지원형태 : <td>${registrationlistAll.type}</td></th><br>
			<th>신청방법 : </th><a href="${registrationlistAll.link}" class="btn-text type-black diagonal" target="_blank" title="새창열림"><span>타사이트 이동</span></a>
		</c:forEach>
		</tr>
	</table>
</body>
</html>
