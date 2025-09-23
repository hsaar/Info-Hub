<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>검색</title>
</head>
<body>
	<h2>기사검색</h2>

<div class ="text-cente">
	<ul class = "pagination">	
		<form id="jobForm">
			<input type='hidden' name="page" value=${pageMaker.cri.perPageNum }></input>
			<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum }></input>
		</form>
	</ul>
</div>
		<form class="clearfix" name="head-search" method="post" action="searchlistAll">

			<label>기사검색</label>
			<div class='box-body'>
				<select id = "searchType" name="searchType" >
					<option value="">검색조건</option>
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
				
				 	<script>
						$(document).ready(
						function(){
							
							$('#searchBtn').on(
								"click",
								function(event){
									
									self.location = "slistPage"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+"&keyword=" + encodeURIComponent($('#keywordInput').val());		
								});
							$('#newBtn').on("click",function(evt){
								
								self.location = "slistPage";
								
							});
						
						});
		 			</script>
			
				<input type="text" name="keyword" id="keyword"
					onkeydown="if(event.keyCode==13){if(this.form.keyword.value != ''){this.form.submit();}else{alert('검색어를 입력해주세요');return false;}}"
					placeholder="검색어를 입력해주세요" title="기사검색">
				<button type="button" title="기사검색"
					onclick="if(this.form.keyword.value != ''){this.form.submit();}else{alert('검색어를 입력해주세요');this.form.keyword.focus();return false;}">
					<i class="icon-search-thin"></i><span class="show-for-sr">검색</span>
				</button>
			</div>
			<div class="col-md-1 text-right">
				<select class="form-control" id="perPageSel">
			  		<option value="10">10</option>
			  		<option value="15">15</option>
			  		<option value="20">20</option>
				</select>
			</div>
			
		</form>

		<script>
		 $(document).ready(
			function(){
				
				$('#searchBtn').on(
				   "click",
				function(event){
					
					self.location = "list"
					+ "$searchType="
					+  $("select option:selected").val()
					+"&keyword =" + encodeURIComponenet($('#keywordInput').val());	
				});
				
				$('#newBtn').on("click",function(evt){
					self.location = "register";
				});
			});
		</script>

	
         
		
		<c:forEach var="searchlistAll" items="${searchlistAll }">
			<p>---------------------------------------------------------------------------------------</p>
			<br>
			<th>타이틀 :<td>${searchlistAll.title}</td></th><br>
			<th>[카테고리:<td> <a href ='/views/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&article_id=${searchlistAll.article_id}'>
		 		${searchlistAll.title }	</a></td></tr><br>
			<th>등록시간 : <td>${searchlistAll.published}</td></th><br>
			<th>사진 : <td>${searchlistAll.image}</td></th><br>
			<th>내용 : <td>${searchlistAll.content}</td></th><br>
			<th>[언론사 :<td> ${searchlistAll.source}] </td>[좋아요 : <td>${searchlistAll.hearts}]</td></th><br>
			<th>[태그 :<td>${searchlistAll.tags}]</td></th><br>
		</c:forEach>
		
	 	<c:if test="${pageMaker.prev }">
			<li> <a href="listPage${pageMaker.makeQuery(pageMaker.startPage -1) }">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin ="${pageMaker.startPage }" end = "${pageMaker.endPage }" var="idx">
			<li <c:out value="${pageMaker.cri.page == idx?'class=active':'' }"/>>
		 		<a href="listPage?page=${idx }">${idx }</a> 
			</li>
		</c:forEach>
	
		<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
			 <li><a href = "listPage${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
		</c:if>
</body>
</html>