<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>검색</title>
</head>
<body>
	<h2>listPage</h2>
	
	
<form role="form" action="searchlistAll" method="post">
	<input type = 'hidden' name='article_id' value="${seachlistAllDTO.article_id}">
	<input type = 'hidden' name = 'page' value="${cri.page }">
	<input type = 'hidden' name = 'perPageNum' value = "${cri.perPageNum }">
	<input type = 'hidden' name = 'searchType' value = "${cri.searchType }">
	<input type = 'hidden' name = "keyword" value = "${cri.keyword }">
</form>

<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".btn-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/views/list");
			formObj.submit();
		});
	});
</script>
</body>
</html>