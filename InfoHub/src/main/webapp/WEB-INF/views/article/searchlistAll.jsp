<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>검색</title>
</head>
<body>
	<h2>결과</h2>

	<tr>
		<form class="clearfix" name="head-search" method="post" action="searchlistAll">

			<label>기사검색</label>
			<div class='box-body'>
				<select name="searchType">
					<option value="n"
						<c:out value="${cri.searchType == null? 'selected':''}"/>>
						---</option>
					<option value="title"
						<c:out value = "${cri.searchType eq 't'?'selected':'' }"/>>
						Title</option>
					<option value="content"
						<c:out value = "${cri.searchType eq 'c'?'selected':'' }"/>>
						Content</option>
					<option value="title_content"
						<c:out value="${searchType eq 'tc'?'selected':'' }"/>>
						Title or content</option>	
				</select>
			
			<input type="text" name="search" id="search"
				onkeydown="if(event.keyCode==13){if(this.form.search.value != ''){this.form.submit();}else{alert('검색어를 입력해주세요');return false;}}"
				placeholder="검색어를 입력해주세요" title="기사검색">
			<button type="button" title="기사검색"
				onclick="if(this.form.search.value != ''){this.form.submit();}else{alert('검색어를 입력해주세요');this.form.search.focus();return false;}">
				<i class="icon-search-thin"></i><span class="show-for-sr">검색</span>
			</button>
			</div>
		</form>



	
         
		
		<c:forEach var="searchlistAll" items="${searchlistAll }">
			<p>---------------------------------------------------------------------------------------</p>
			<br>
			<th>타이틀 :
			<td>${searchlistAll.title}</td></th><br>
			<th>[카테고리: ${searchlistAll.article_categories_categories_id}]
			<th>등록시간 : <td>${searchlistAll.published}</td></th><br>
			<th>사진 : <td>${searchlistAll.image}</td></th><br>
			<th>내용 : <td>${searchlistAll.content}</td></th><br>
			<th>[언론사 : ${searchlistAll.source} ] [좋아요 : ${searchlistAll.hearts}]<br></th>
			<th>[태그 :${searchlistAll.tags}]</th><br>
		</c:forEach>
	</tr>
</body>
</html>