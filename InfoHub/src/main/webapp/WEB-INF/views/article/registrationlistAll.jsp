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
<script src="https://cdn.jsdelivr.net/npm/wordcloud@1.1.2/src/wordcloud2.js"></script>


	<title>혜택바로가기</title>
	
<style>
.pagination-nav {
  display: flex;
  justify-content: center; /* 전체 페이지네이션을 중앙 정렬 */
  align-items: center;
  gap: 8px; /* 버튼 사이 간격 */
  margin-top: 40px;
  padding: 20px 0;
}

.page-number,
.page-arrow {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 40px;
  height: 40px;
  padding: 0 12px;
  background: #fff;
  border: 2px solid var(--mist-200);
  border-radius: 10px; /* 둥근 모서리 */
  color: #6b7280;
  font-size: 15px;
  font-weight: 600;
  text-decoration: none;
  cursor: pointer;
  transition: all 0.3s ease;
  font-family: 'Gowun Dodum', sans-serif;
}

.page-number:hover,
.page-arrow:hover {
  background: linear-gradient(135deg, #e0f2fe 0%, #f0f9ff 100%);
  border-color: var(--accent);
  color: var(--accent);
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(11, 80, 208, 0.15);
}

/* 활성화된 페이지 (파란색 배경) */
.page-number.active {
  background: linear-gradient(135deg, var(--accent) 0%, #3b82f6 100%);
  border-color: var(--accent);
  color: #fff;
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(11, 80, 208, 0.3);
}

.page-number.active:hover {
  background: linear-gradient(135deg, #0a3fa0 0%, #2563eb 100%);
  box-shadow: 0 8px 20px rgba(11, 80, 208, 0.4);
}

.page-arrow {
  font-size: 18px;
}

.page-arrow:disabled {
  opacity: 0.4;
  cursor: not-allowed;
  pointer-events: none;
}

#keywordWordCloud {
  display: block;
  width: 100%;
  height: 230px;
}

/* 검색 바 전체 */
.search-bar {
    width: 650px;            
    align-items: center;      
    gap: 8px;                 
    margin-bottom: 20px;
}

/* select 스타일 */
.search-bar select {
    width: 150px;
    padding: 10px 8px;
    border-radius: 10px;
    border: none;
    background-color: #ffffff; /* 배경 흰색 */
    font-size: 16px;
    cursor: pointer;
}

/* input 스타일 */
.search-bar input {
    flex: 1;                 
    padding: 10px 12px;
    border-radius: 20px;
    border: 1px solid #2563eb;
    font-size: 16px;
}

/* 버튼 스타일 */
#searchBtn {
    width: 50px;              /* 너비 줄임 */
    height: 45px;             
    background-color: #2563eb; 
    color: white;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    display: flex;           
    align-items: center;
    justify-content: center;
    font-size: 16px;
    transition: background 0.3s;
}

#searchBtn:hover {
    background-color: #1e40af; 
}

/* 버튼 안 svg */
#searchBtn svg {
    width: 20px;
    height: 20px;
    fill: white;
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
		
		<section class="search-section">
			<div class='container'>
				<div class='search-bar'>
					<select id="searchType" name="searchType">
						<option value="">검색조건</option>
	
						<option value="t" <c:if test="${cri.searchType eq 't'}">selected</c:if>>Title</option>
						<option value="c" <c:if test="${cri.searchType eq 'c'}">selected</c:if>>Content</option>
						<option value="tc" <c:if test="${cri.searchType eq 'tc'}">selected</c:if>>Title or Content</option>
					</select>
					
					<input class="search-input-large" type="text" id="keyword"
						name="keyword" value="${pageMaker.cri.keyword}"
						placeholder="검색어를 입력하세요" />
						
					<button id="searchBtn"><svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
          			<path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" />
          			</svg>
          			</button>
				</div>
			</div>
		</section>

	<div class="policy-list-container">
  	<div class="policy-grid">
  
    <c:forEach var="registrationlistAll" items="${registrationlistAll}">
      
      <div class="policy-card" data-registrationno="${registrationlistAll.registrationNo}">
        
        <h3>${registrationlistAll.title}</h3>
        
        <p class="policy-description">${registrationlistAll.content}</p>
        <div class="policy-details">
          <p><strong>신청기간</strong> <br>
          ${registrationlistAll.startDate} - ${registrationlistAll.endDate}</p>
          <p><strong>접수기관:</strong> ${registrationlistAll.trachea}</p>
          <p><strong>전화문의:</strong> ${registrationlistAll.regCall}</p>
          <p><strong>지원형태:</strong> ${registrationlistAll.regType}</p>
          <p><strong>신청방법:</strong> 
            <a href="${registrationlistAll.link}" class="btn-text" target="_blank" title="새창열림">타사이트 이동</a>
          </p>
        </div>
      </div>
		</c:forEach>
	</div>
	</div>
	
	<!-- 페이지네이션 -->
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
    <c:if test="${pageMaker.totalCount > 0}">
        <nav class="pagination-nav">
        

         <a href="registrationlistAll" class="page-number" style="min-width: 80px; font-weight: 700; background: var(--mist-100); border-color: var(--mist-300);"> 처음목록 </a>
            
            <c:if test="${pageMaker.prev}">
                <a href="registrationlistAll${pageMaker.makeSearch(pageMaker.startPage-1)}"  class="page-arrow" aria-label="Previous">&lt;</a>
            </c:if>

            <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                <a href="registrationlistAll?page=${idx }" class="page-number ${pageMaker.cri.page == idx ? 'active' : ''}">${idx }</a>
            </c:forEach>

            <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                <a href="registrationlistAll${pageMaker.makeSearch(pageMaker.endPage +1) }" class="page-arrow" aria-label="Next">&gt;</a>
            </c:if>
            </nav>
    </c:if>
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
      
       <!-- 워드클라우드가 표시될 영역 -->
  	<canvas id="keywordWordCloud" width="450" height="400"></canvas>
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
   
  <jsp:include page="../include/footer.jsp"/>
  
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
                var redirectUrl = "registrationlistAll"
                    + '${pageMaker.makeQuery(1)}' // 페이지 정보 포함
                    + "&searchType=" + searchType
                    + "&keyword=" + encodedKeyword;

                // 2. 키워드 로깅을 위한 AJAX 요청
                $.ajax({
                    url: "logRegKeyword", 
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
                self.location = "registrationlistAll";
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
                        var redirectUrl = "registrationlistAll"
                            + "?page=1&perPageNum=${pageMaker.cri.perPageNum}"
                            + "&searchType=" + searchType
                            + "&keyword=" + encodedKeyword;
                        self.location = redirectUrl;
                    },
                    error: function(xhr, status, error) {
                        // 로깅 실패 시에도 검색 페이지로 이동
                        var redirectUrl = "registrationlistAll"
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
			window.location.href = "registrationlistAll?page=" + thisPage
					+ "&perPageNum=" + $perPageSel.val();
		})
	}
	
	function setSearchTypeSelect() {
		var searchType = $('#searchType');
		var keyword = $('#keyword');
		var searchTypeSel = searchType.val(
				'${pageMaker.cri.searchType}').prop("selected", true);
		
		
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

<script>
document.addEventListener('DOMContentLoaded', function() {
    const list = [
       <c:forEach var="RegKeywordDTO" items="${topKeywords}" varStatus="status">
            ["${RegKeywordDTO.regkeyword}", ${RegKeywordDTO.regcount}]<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    if (list.length === 0) return;

    WordCloud(document.getElementById('keywordWordCloud'), {
        list: list,
        gridSize: 18,
        weightFactor: function(count) {
            const min = 30, max = 65;
            const counts = list.map(item => item[1]);
            const maxCount = Math.max(...counts);
            const minCount = Math.min(...counts);
            return min + (count - minCount) / (maxCount - minCount) * (max - min);
        },
        fontFamily: 'Gowun Dodum, sans-serif',
        color: () => {
            const colors = ['#2563eb','#dc2626','#16a34a','#9333ea','#f59e0b','#0ea5e9','#ef4444'];
            return colors[Math.floor(Math.random() * colors.length)];
        },
        rotateRatio: 1, 
        backgroundColor: '#fff',

        click: function(item) {
            const keyword = item[0]; 
            const searchType = 'tc'; 
            const encodedKeyword = encodeURIComponent(keyword);

            $.ajax({
                url: "logRegKeyword",
                type: "POST",
                data: { keyword: keyword },
                complete: function() {
                    window.location.href = "registrationlistAll?page=1&perPageNum=10&searchType=" + searchType + "&keyword=" + encodedKeyword;
                }
            });
        }
    });
});
</script>
</body>
</html>