<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
	String userId = (String) session.getAttribute("userId");
	String name = request.getParameter("name");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
   <title>registrationlistAll</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


	<title>혜택바로가기</title>
	
<style>
.text-center {
    text-align: left; /* 가운데 -> 왼쪽 정렬 */
    margin-top: 0; /* 테이블과 페이지네이션 사이 간격 줄임 */
    padding-left: 30px; /* 페이지 시작 위치 조금 띄우기 */
    margin-left: 250px;
}

.pageInfo {
	list-style: none;
	margin: 0;
    padding: 0;
    white-space: nowrap; /* 한 줄에 유지 */
    overflow: hidden;    /* 스크롤 없이 보여주기 */
}

.pageInfo li {
	display: inline-block; /* 한 줄로 나열 */
    margin: 0 5px;         /* 간격 최소화 */
    font-size: 16px;       /* 글자 크기 줄임 */
}
	
.pageInfo li a {
    text-decoration: none;
    color: black;
    padding: 5px 8px;      /* 버튼/숫자 폭 최소화 */
}

.pageInfo li.active a {
    color: blue;      /* 현재 페이지 번호 색 */
    font-weight: bold; /* 강조 */
}

.pageInfo li a.btn {
    font-size: 14px;
    padding: 4px 6px;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // 시계를 갱신하는 함수
    function updateClock() {
        const now = new Date();
        const options = {
            year: 'numeric',
            month: 'long',
            day: 'numeric',
            weekday: 'long',
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit',
            hour12: false
        };
        document.getElementById('realTimeClock').innerText = now.toLocaleString('ko-KR', options);
    }

    updateClock(); // 초기 실행
    setInterval(updateClock, 1000); // 1초마다 갱신
});

$(document).on("click", ".policy-card", function(e){
    // 내부의 a 태그(타사이트 이동 등) 클릭했을 때는 카드 이동 막기
    if($(e.target).is("a")) return;

    // registrationNo 값 가져오기
    var registrationNo = $(this).data("registrationno");

    // userId 여부에 따라 다른 링크로 이동
    var userId = "<%= userId %>";
    if(userId === "" || userId === "null") {
        window.location.href = "noRegistrationContent?registrationNo=" + registrationNo;
    } else {
        window.location.href = "registrationContent?registrationNo=" + registrationNo;
    }
});
</script>
	
</head>
<body>

  <!-- 상단바 -->
<jsp:include page="../include/header.jsp"/>
	
	<!-- 브레드크럼 -->
	<div class="breadcrumb">
    <div class="container">
      <span>현재시간 ></span>
      <span id="realTimeClock"></span>
    </div>
	</div>

       <!-- 메인 컨테이너 -->
  <div class="news-container">
  
<!-- 메인 콘텐츠 -->
    <main class="news-main">
      <h1 class="news-title">
  		 혜택 전체 목록
		</h1>
		
		<div class='search-header'>
				<div class='search-bar'>
					<select id="searchType" class="tab" name="searchType">
						<option value="">검색조건</option>

						<option value="t" <c:if test="${cri.searchType eq 't'}">selected</c:if>>Title</option>
<option value="c" <c:if test="${cri.searchType eq 'c'}">selected</c:if>>Content</option>
<option value="tc" <c:if test="${cri.searchType eq 'tc'}">selected</c:if>>Title or Content</option>

					</select> <input class="search-input" type="text" id="keyword"
						name="keyword" value="${pageMaker.cri.keyword}"
						placeholder="검색어를 입력하세요" />
					<button id="searchBtn" class="tab">Search</button>
				</div>
			</div>

	<div class="policy-list-container">
  	<div class="policy-grid">
  
    <c:forEach var="registrationlistAll" items="${registrationlistAll}">
      
      <div class="policy-card" data-registrationno="${registrationlistAll.registrationNo}">
        
        <h3>${registrationlistAll.title}</h3>
        
        <p class="policy-description">${registrationlistAll.content}</p>
        <div class="policy-details">
          <p><strong>신청기간</strong> <br>
          ${registrationlistAll.startDate} ~ ${registrationlistAll.endDate}</p>
          <p><strong>접수기관:</strong> ${registrationlistAll.trachea}</p>
          <p><strong>전화문의:</strong> ${registrationlistAll.call}</p>
          <p><strong>지원형태:</strong> ${registrationlistAll.type}</p>
          <p><strong>신청방법:</strong> 
            <a href="https://${registrationlistAll.link}" class="btn-text" target="_blank" title="새창열림">타사이트 이동</a>
          </p>
        </div>
      </div>
		</c:forEach>
	</div>
	</div>
	
	<!-- 페이지네이션 -->
<div class="text-center">
    <ul class="pageInfo">
        
        <li id="page-prev">
            <a href="registrationlistAll${pageMaker.makeSearch(pageMaker.startPage - 1)}" >&laquo;</a>
        </li>

        <c:forEach begin="${pageMaker.startPage }"
            end="${pageMaker.endPage }" var="idx">
            <li <c:out value="${pageMaker.cri.page == idx?'class =active':'' }"/>>
                <a href="registrationlistAll${pageMaker.makeSearch(idx)}" >${idx }</a>
            </li>
        </c:forEach>

        <li id="page-next">
            <a href="registrationlistAll${pageMaker.makeSearch(pageMaker.endPage + 1)}" >&raquo;</a>
        </li>
            
        <li id = "page-fitst">
        <a href="registrationlistAll${pageMaker.makeSearch(1)}" 
           class="btn btn-warning">처음목록</a></li>
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
		<h2>혜택 키워드 Top 7</h2>
		<ol class="rank-list">
		<c:forEach var="regkeywordDTO" items="${topKeywords}" varStatus="status">
			<li><span class="rank-number">${status.index + 1}</span>
			<a href="#" class="keyword-link"
			data-keyword="${regkeywordDTO.regkeyword}">
			${regkeywordDTO.regkeyword}</a></li>
		</c:forEach>
		</ol>
	  </div>

      <div class="sidebar-section">
      
       <h2>포토·영상</h2>
	<div class="photo-grid">
	  <c:forEach var="article" items="${randomArticles}">
	  
	   <c:if test="${empty userId}">
	   <a href="noArticleContent?articleId=${article.articleId}">
	        <img src="<c:url value='/resources/image/' />${article.image}" 
	     alt="${article.image}" 
	     style="width: 270px; height: 190px;">
	    </a>
	   </c:if>
	  
	  <c:if test="${not empty userId}">
	    <a href="articleContent?articleId=${article.articleId}">
	        <img src="<c:url value='/resources/image/' />${article.image}" 
	     alt="${article.image}" 
	     style="width: 270px; height: 190px;">
	    </a>
	   </c:if>
	</c:forEach>
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
    
    $(document).ready(function() {

        // 검색 버튼 클릭
        $('#searchBtn').click(function(e){
            e.preventDefault();

            var searchType = $('#searchType').val();
            var keyword = $('#keyword').val().trim();
            var perPageNum = '${pageMaker.cri.perPageNum}';

            if (!searchType) {
                alert("검색 조건을 선택하세요!");
                $("#searchType").focus();
                return;
            }
            if (!keyword) {
                alert("검색어를 입력하세요!");
                $("#keyword").focus();
                return;
            }

            var encodedKeyword = encodeURIComponent(keyword);
            var redirectUrl = "registrationlistAll?page=1"
                + "&perPageNum=" + perPageNum
                + "&searchType=" + searchType
                + "&keyword=" + encodedKeyword;

            $.ajax({
                url: "logRegKeyword",
                type: "POST",
                data: { keyword: keyword },
                success: function() { self.location = redirectUrl; },
                error: function() { self.location = redirectUrl; }
            });
        });

        // 엔터키 검색
        $('#keyword').keypress(function(e){
            if(e.which == 13){
                e.preventDefault();
                $('#searchBtn').click();
            }
        });

        // Top7 키워드 클릭
        $('.keyword-link').click(function(e){
            e.preventDefault();
            var keyword = $(this).data('keyword').trim();
            var searchType = 'tc';
            var perPageNum = '${pageMaker.cri.perPageNum}';
            var encodedKeyword = encodeURIComponent(keyword);

            var redirectUrl = "registrationlistAll?page=1"
                + "&perPageNum=" + perPageNum
                + "&searchType=" + searchType
                + "&keyword=" + encodedKeyword;

            $.ajax({
                url: "logRegKeyword",
                type: "POST",
                data: { keyword: keyword },
                success: function() { self.location = redirectUrl; },
                error: function() { self.location = redirectUrl; }
            });
        });

    });
</script>  
</body>
</html>