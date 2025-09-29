<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
	String userId = request.getParameter("userId");
	String name = request.getParameter("name");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
   <title>2-articleListAll</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
	}
</style>
</head>
<body>

  <!-- 상단바 -->
<jsp:include page="../include/header.jsp"/>

<!-- 네비게이션 -->
  	<div class="news-header">
    <nav class="news-nav">
      <a href="articleListAll">종합</a>
      <a href="articleListAll1">부동산</a>
      <a href="articleListAll2" class="active">주식</a>
      <a href="articleListAll3">적금</a>
      <a href="articleListAll4">복지</a>
      <a href="articleListAll5">창업</a>
      <a href="#">기타</a>
    </nav>
	</div>
	
	<!-- 브레드크럼 -->
	<div class="breadcrumb">
    <div class="container">
      <a href="#">공지사항</a>
      <span>></span>
      <span>2025년 3/4분기 입회심사 결과</span>
    </div>
	</div>

       <!-- 메인 컨테이너 -->
  <div class="news-container">
    <!-- 메인 콘텐츠 -->
    <main class="news-main">
      <h1 class="news-title">
  		 주식 최신기사 조회
		</h1>

		<div class='search-header'>
		<div class='search-bar'>
					<select id="searchType" class="tab" name="searchType">
						<option value="">검색조건</option>

						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':'' }"/>>
							Title</option>

						<option value="c"
							<c:out value= "${cri.searchType eq 'c'?'selected':'' }"/>>
							Content</option>

						<option value="tc"
							<c:out value ="${cri.searchType eq 'tc'?'selected':'' }"/>>
							Title or Content</option>
					</select> <input class="search-input" type="text" id="keyword"
						name="keyword" value="${pageMaker.cri.keyword}"
						placeholder="검색어를 입력하세요" />
					<button id="searchBtn" class="tab">Search</button>
	</div>
	</div>

	<table class="news-item">
  
      <tr>
         <th>  </th>
         
      </tr>
      <c:forEach var="article" items="${articleListAll2}"> <!-- JSTL의 반복문 -->
         <tr>
         
            <td><br>
         	<div class="news-item">
			
      		<div class="news-meta">
      		<div class="news-summary">
      		
			<c:if test="${empty userId}">
            <h1><a href="noArticleContent?articleId=${article.articleId}">${article.title}</a></h1>
            </c:if>
            
            <c:if test="${not empty userId}">
            <h1><a href="articleContent?articleId=${article.articleId}">${article.title}</a></h1>
             </c:if>
            
            <p>${article.content}(기사내용)</p>
            ${article.name} | ${article.source}<br>
            ${article.published}<br>
            ♥${article.hearts}
            </div>
            </div>
            
            <img src="resources/image/${article.image }" alt="${article.image }" style=" width: 250px; height: 180px; border-radius: 8px;">
           
          	</div>
          	</td>
            
         </tr>
      </c:forEach>
   </table>
   
    <!-- 페이지네이션 -->
       <div class="text-cente">
					<ul class="search_info">
						<form id="jobForm">
							<input type='hidden' name="page"
								value=${pageMaker.cri.perPageNum }></input> <input type='hidden'
								name="perPageNum" value=${pageMaker.cri.perPageNum }></input>
						</form>
					</ul>
				</div>


				<div class="text-center">
					<ul class="pageInfo">
						<li id="page-prev"><a
							href="articleListAll2${pageMaker.makeSearch(pageMaker.startPage-1)}" style="text-decoration: none; color: inherit;">&laquo;</a></li>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx?'class =active':'' }"/>>
								<a href="articleListAll2?page=${idx }" style="text-decoration: none; color: inherit;">${idx }</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
							<li><a
								href="articleListAll2${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
						</c:if>

						<c:if test="${pageMaker.prev }">
							<li><a
								href="articleListAll2${pageMaker.makeSearch(pageMaker.startPage -1) }">&laquo;</a></li>
						</c:if>

						<li id="page-next"><a
							href="articleListAll2${pageMaker.makeSearch(pageMaker.startPage-1)}" style="text-decoration: none; color: inherit;">&raquo;</a></li>
						<!-- 처음 목록 버튼 추가 -->
						<li id = "page-fitst">
						<a href="articleListAll2" class="btn btn-warning" style="text-decoration: none; color: inherit;">처음목록</a></li>
					</ul>
				</div>
    
    </main> 
    <!-- 사이드바 -->
    <aside>
      <div class="sidebar-section">
        <h2>많이 본 기사</h2>
        <ol class="rank-list">
        <c:forEach var="article" items="${viewsArticle}" varStatus="status">
        <li>
        <span class="rank-number">${status.index + 1}</span>
          <c:if test="${empty userId}">
            <a href="noArticleContent?articleId=${article.articleId}" style="font-size: 25; font-weight: bold;">${article.title}</a>
          </c:if>
          
          <c:if test="${not empty userId}">
          <a href="articleContent?articleId=${article.articleId}">${article.title}</a>
          </c:if>
          </li>
          </c:forEach>
        </ol>
      </div>

      <div class="sidebar-section">
      <%
      Random random = new Random();
      
      Set<Integer> set = new HashSet<>();
     
      while(set.size()<2){
    	  Double d = Math.random()*50+1;
    	  set.add(d.intValue());
    	}
     
      List<Integer> list = new ArrayList<>(set);
      
      int number1 = list.get(0);
      int number2 = list.get(1);
      %>
      
        <h2>포토·영상</h2>
        <div class="photo-grid">
          <div>
          <c:if test="${empty userId}">
            <a href="noArticleContent?articleId=<%=number1+1%>"><img src="resources/image/image_<%=number1%>.jpg" style=" width: 270px; height: 180px;"></a>
          </c:if>
          
          <c:if test="${not empty userId}">
          <a href="articleContent?articleId=<%=number1+1%>"><img src="resources/image/image_<%=number1%>.jpg" style=" width: 270px; height: 180px;"></a>
          </c:if>
      	  </div>
      	 
         <div>
          <c:if test="${empty userId}">
            <a href="noArticleContent?articleId=<%=number2+1%>"><img src="resources/image/image_<%=number2%>.jpg" style=" width: 270px; height: 180px;"></a>
          </c:if>
          
          <c:if test="${not empty userId}">
          <a href="articleContent?articleId=<%=number2+1%>"><img src="resources/image/image_<%=number2%>.jpg" style=" width: 270px; height: 180px;"></a>
          </c:if>
      	  </div>
        </div>
      </div>
    </aside>
   </div>
 


  <!-- Top 버튼 -->
  <button class="top-button" id="topButton" aria-label="맨 위로 이동">
    <svg viewBox="0 0 24 24">
      <path d="M12 4l-8 8h6v8h4v-8h6z"/>
    </svg>
  </button>
   
  <footer class="container" style="text-align: center; padding: 40px 0; color: #6b7280;">
    © 2025 누림 — Mist Blue Theme
  </footer>
<script>
    // Top 버튼 기능
    const topButton = document.getElementById('topButton');
    
    // 스크롤 시 버튼 표시/숨김
    window.addEventListener('scroll', function() {
      if (window.scrollY > 300) {
        topButton.classList.add('show');
      } else {
        topButton.classList.remove('show');
      }
    });
    
    // 버튼 클릭 시 맨 위로 스크롤
    topButton.addEventListener('click', function() {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    });
    
    $(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "articleListAll2"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keyword')
											.val());
						});
				$('#newBtn').on("click", function(evt) {

					self.location = "articleListAll2";

				});

			});
	//페이지
	$(function() {
		//perPageNum select 박스 설정
		setPerPageNumSelect();
		//searchType select 박스 설정
		setSearchTypeSelect();

		var canPrev = '${pageMaker.prev}';
		if (canPrev !== 'true') {
			$('#page-prev').addClass('disabled');
		}

		var canNext = '${pageMaker.next}';
		if (canNext !== 'true') {
			$('#page-next').addClass('disabled');
		}

		var thisPage = '${pageMaker.cri.page}';

		$('#page' + thisPage).addClass('active');
	})

	function setPerPageNumSelect() {
		var perPageNum = '${pageMaker.cri.perPageNum}';
		var $perPageSel = $('#perPageSel');
		var thisPage = '${pageMaker.cri.page}';

		$perPageSel.val(perPageNum).prop("selected", true);
		$perPageSel.on('change', function() {
			window.location.href = "articleListAll2?page=" + thisPage
					+ "&perPageNum=" + $perPageSel.val();
		})
	}
	
	//검색
	function setSearchTypeSelect() {
		var searchType = $('#searchType');
		var keyword = $('#keyword');

		var searchTypeSel = searchType.val(
				'${pageMaker.cri.searchType}').prop("selected", true);
		//검색 버튼이 눌리면
		$('#searchBtn').on(
				'click',
				function() {

					var searchTypeVal = searchTypeSel.val();
					var keywordVal = keyword.val();
					//검색 조건 입력 안했으면 경고창 
					if (!searchTypeVal || searchTypeVal == "n") {
						alert("검색 조건을 선택하세요!");
						searchTypeSel.focus();
						return;
						//검색어 입력 안했으면 검색창
					} else if (!keywordVal) {
						alert("검색어를 입력하세요!");
						keyword.focus();
						return;
					}
					var url = "articleListAll2?page=1" 
							+ "&perPageNum="
							+ "${pageMaker.cri.perPageNum}"
							+ "&searchType=" + searchTypeVal
							+ "&keyword="
							+ encodeURIComponent(keywordVal);
					window.location.href = url;
				})
	}
	
	$(function() {
   		$("#keyword").keypress(function(e){
   			//검색어 입력 후 엔터키 입력하면 조회버튼 클릭
   			if(e.keyCode && e.keyCode == 13){
   				$("#searchBtn").trigger("click");
   				return false;
   			}
   			//엔터키 막기
   			if(e.keyCode && e.keyCode == 13){
   				  e.preventDefault();	
   			}
   		});
   	});
</script> 
</body>
</html>
