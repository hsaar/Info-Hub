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
   <title>1-articleListAll</title>
   <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>

.text-center {
    text-align: left; /* 가운데 -> 왼쪽 정렬 */
    margin-top: 0; /* 테이블과 페이지네이션 사이 간격 줄임 */
    padding-left: 30px; /* 페이지 시작 위치 조금 띄우기 */
    margin-left: 60px;
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
</script>
</head>
<body>

  <!-- 상단바 -->
<jsp:include page="../include/header.jsp"/>

<!-- 네비게이션 -->
  	<div class="news-header">
    <nav class="news-nav">
      <a href="articleListAll">종합</a>
      <a href="articleListAll1" class="active">일자리취업</a>
      <a href="articleListAll2">주거/복지</a>
      <a href="articleListAll3">교육</a>
      <a href="articleListAll4">문화/여가</a>
      <a href="articleListAll5">건강/의료</a>
      <a href="articleListAll6">금융/경제</a>
    </nav>
	</div>
	
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
  		 일자리취업 최신기사 조회
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
  
      <c:forEach var="article" items="${articleListAll1}"> <!-- JSTL의 반복문 -->
         
         <tr><td><br>
      <c:choose>
         <c:when test="${empty userId}">
            <a href="noArticleContent?articleId=${article.articleId}" style="text-decoration:none; color:inherit; display:block;">
               <div class="news-item">
                  <div class="news-meta">
                     <div class="news-summary">
                        <h1>${article.title}</h1>
                        <p>${article.content}</p>
                        ${article.name} | ${article.source}<br>
                        ${article.published}<br>
                        ♥${article.hearts}
                     </div>
                  </div>
                  <img src="resources/image/${article.image }" 
                       alt="${article.image }" 
                       style="width: 250px; height: 180px; border-radius: 8px;">
               </div>
            </a>
         </c:when>
         
         <c:otherwise>
            <a href="articleContent?articleId=${article.articleId}" style="text-decoration:none; color:inherit; display:block;">
               <div class="news-item">
                  <div class="news-meta">
                     <div class="news-summary">
                        <h1>${article.title}</h1>
                        <p>${article.content}</p>
                        ${article.name} | ${article.source}<br>
                        ${article.published}<br>
                        ♥${article.hearts}
                     </div>
                  </div>
                  <img src="resources/image/${article.image }" 
                       alt="${article.image }" 
                       style="width: 250px; height: 180px; border-radius: 8px;">
               </div>
            </a>
         </c:otherwise>
      </c:choose>
   </td>
</tr>
   </c:forEach>
   </table>
   
     <div class="text-center">
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
							href="articleListAll1${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></li>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx?'class =active':'' }"/>>
								<a href="articleListAll1?page=${idx }">${idx }</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
							<li><a
								href="articleListAll1${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
						</c:if>


						<!-- 처음 목록 버튼 추가 -->
						<li id = "page-fitst">
						<a href="articleListAll1" class="btn btn-warning">처음목록</a></li>
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
      <h2>정책 기사 키워드 Top 7</h2>
      
      <ol class="rank-list"> <c:forEach var="keywordDTO" items="${topKeywords}" varStatus="status">
        <li>
        <span class="rank-number">${status.index + 1}</span>
        <a href="#" class="keyword-link" data-keyword="${keywordDTO.skeyword}"> ${keywordDTO.skeyword}</a>
        </li>
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
    
    // 검색 버튼 로직과 키워드 링크 로직을 분리하여 이벤트 중첩을 방지
    $(document).ready(
        function() {
            
            // 1. 일반 검색 버튼 클릭 이벤트 (기존 로직)
            $('#searchBtn').on("click", function(event) {
                
                // 1. 기본 페이지 이동 동작을 막습니다. (가장 중요!)
                event.preventDefault();

                var searchType = $("select option:selected").val();
                var keyword = $('#keyword').val();
                var encodedKeyword = encodeURIComponent(keyword);
                
                // 검색 조건/키워드 유효성 검사
                if (!searchType || searchType == "") {
                    alert("검색 조건을 선택하세요!");
                    $("#searchType").focus();
                    return;
                } else if (!keyword) {
                    alert("검색어를 입력하세요!");
                    $('#keyword').focus();
                    return;
                }

                // 최종 이동할 URL 구성
                var redirectUrl = "articleListAll"
                    + '${pageMaker.makeQuery(1)}' // 페이지 정보 포함
                    + "&searchType=" + searchType
                    + "&keyword=" + encodedKeyword;

                // 2. 키워드 로깅을 위한 AJAX 요청
                $.ajax({
                    url: "logKeyword", 
                    type: "POST",
                    data: { keyword: keyword },
                    success: function(response) {
                        self.location = redirectUrl; // 성공 시 이동
                    },
                    error: function(xhr, status, error) {
                        self.location = redirectUrl; // 실패 시에도 이동
                    }
                });
            });

            $('#newBtn').on("click", function(evt) {
                self.location = "articleListAll";
            });
            
            // 2. 인기 검색어 링크 클릭 이벤트
            $('.keyword-link').on("click", function(event) {
                event.preventDefault(); // 기본 링크 이동(href="#") 방지

                // 1. 클릭된 키워드 텍스트를 가져옵니다.
                var keyword = $(this).text().trim(); 
                var searchType = 'tc'; // 키워드 검색은 제목+내용(tc)으로 고정
                var encodedKeyword = encodeURIComponent(keyword);

                // 2. 키워드 로깅을 위한 AJAX 요청 (검색 카운트 증가)
                $.ajax({
                    url: "logKeyword", 
                    type: "POST",
                    data: { keyword: keyword },
                    success: function(response) {
                        // 3. 로깅 성공/실패와 관계없이 검색 결과 페이지로 이동 (페이지는 1로 초기화)
                        var redirectUrl = "articleListAll"
                            + "?page=1&perPageNum=${pageMaker.cri.perPageNum}"
                            + "&searchType=" + searchType
                            + "&keyword=" + encodedKeyword;
                        self.location = redirectUrl;
                    },
                    error: function(xhr, status, error) {
                        // 로깅 실패 시에도 검색 페이지로 이동
                        var redirectUrl = "articleListAll"
                            + "?page=1&perPageNum=${pageMaker.cri.perPageNum}"
                            + "&searchType=" + searchType
                            + "&keyword=" + encodedKeyword;
                        self.location = redirectUrl;
                    }
                });
            });
            
            // 페이지/검색 관련 함수 호출
            setPerPageNumSelect();
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

	});

	function setPerPageNumSelect() {
		var perPageNum = '${pageMaker.cri.perPageNum}';
		var $perPageSel = $('#perPageSel');
		var thisPage = '${pageMaker.cri.page}';

		$perPageSel.val(perPageNum).prop("selected", true);
		$perPageSel.on('change', function() {
			window.location.href = "articleListAll?page=" + thisPage
					+ "&perPageNum=" + $perPageSel.val();
		})
	}
	
	// 검색 (이 함수 내부의 searchBtn 클릭 이벤트는 위에서 처리되므로 제거해야 합니다.)
	function setSearchTypeSelect() {
		var searchType = $('#searchType');
		var keyword = $('#keyword');
		var searchTypeSel = searchType.val(
				'${pageMaker.cri.searchType}').prop("selected", true);
		
		// ❌ 여기 있던 $('#searchBtn').on('click', ...) 로직은 이미 위에서 처리했으므로 제거합니다.
		
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