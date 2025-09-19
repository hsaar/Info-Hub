<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
	<title>검색</title>
</head>
<body>
<h1>
	검색결과  
</h1>
	<tr>
	
	
	
		<c:forEach var="article_search" items="${article_search }">
			<!-- JSTL의 반복문 -->
			<p>----------------------------------------------------------------------------------------</p>
			<br>
			<th>타이틀 :
			<td>${article_search.title}</td>
			</th>
			<br>
			<th>[카테고리: ${article_search.article_categories_categories_id}]
			<th>등록시간 :
			<td>${article_search.published}</td>
			</th>
			<br>
			<th>사진 :
			<td>${article_search.image}</td>
			</th>
			<br>
			<th>내용 :
			<td>${article_search.content}</td>
			</th>
			<br>
			<th>[언론사 : ${article_search.source} ] [좋아요 :
				${article_search.hearts}]<br>
			</th>
			<th>[태그 :${article_search.tags}]</th>
			<br>

		</c:forEach>
	</tr>
</body>
</html>
