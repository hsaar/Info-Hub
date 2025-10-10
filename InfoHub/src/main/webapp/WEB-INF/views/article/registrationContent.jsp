<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Random"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.infohub.project.login.LoginService"%>
<%@page import="org.springframework.web.context.request.RequestContextHolder"%>
<%@page import="org.springframework.web.context.request.ServletRequestAttributes"%>
<%@page import="com.infohub.project.article.ArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
		String userId = (String) session.getAttribute("userId");
		int loginNo = ((Integer) session.getAttribute("loginNo")).intValue();

%>
	

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
   <title>registrationContent</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
	
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }

    .benefit-card {
        border-radius: 1.2rem;
        background: #ffffffcc; /* 살짝 투명한 흰색 */
        border: 3px solid #a8e0ff;
        transition: all 0.4s ease;
        position: relative;
        overflow: hidden;
    }
    .benefit-card:hover {
        transform: translateY(-10px) scale(1.02);
        box-shadow: 0 15px 30px rgba(0,0,0,0.25);
        border-color: #0077ff;
    }
    .benefit-card::before {
        content: "";
        position: absolute;
        top: -50%;
        left: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle, rgba(255,255,255,0.15), transparent 70%);
        transform: rotate(30deg);
        opacity: 0;
        transition: opacity 0.4s;
    }
    .benefit-card:hover::before {
        opacity: 1;
    }

    .card-title {
        font-size: 1.6rem;
        font-weight: bold;
        text-shadow: 1px 1px 3px rgba(0,0,0,0.15);
    }

    .card-text {
        color: #444;
        font-size: 1rem;
        line-height: 1.6;
    }

    .benefit-card ul li {
        margin-bottom: 12px;
        font-size: 1rem;
        color: #222;
    }

    .btn-gradient {
        background: linear-gradient(135deg, var(--primary-blue) 0%, var(--secondary-blue) 50%, var(--accent-blue) 100%);
        border: none;
        color: #fff !important;
        padding: 8px 18px;
        border-radius: 25px;
        transition: 0.3s;
        text-decoration: none;
        box-shadow: #78d4ff;
        position: relative;   /* ✅ 클릭 문제 방지 */
    	z-index: 10;          /* ✅ 위로 올리기 */
    }
    
    .btn-gradient:hover {
        opacity: 0.95;
        transform: scale(1.08);
        box-shadow: #78d4ff;
    }
    
    .btn-common {
    display: inline-block;
    font-size: 0.8rem;        /* 글자 크기 통일 */
    padding: 8px 18px;      /* 버튼 높이와 너비 통일 */
    border-radius: 25px;    /* 둥근 모서리 */
    border: none;
    cursor: pointer;
    transition: all 0.3s ease;
    text-align: center;
    position: relative;   /* 클릭 가능하도록 */
    z-index: 10;          /* 다른 요소 위로 */
    background-color: #eee; /* 테스트용 배경 */
}

.btn-common::before {
    pointer-events: none; /* 버튼 위 장식 요소 클릭 막지 않음 */
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	
	scrapsCheck();
	
	
	$("#scrapBtn").click(function(heart){
		
		var registrationNo =$("#registrationNo").val();
		var loginNo = ${loginNo};
   		
   		url ="scrap";
   		var paramData ={
        		"registrationNo" : registrationNo,
        		"loginNo" : loginNo
        };
   		
   		console.log(paramData);
   		
		$.ajax({
			url: url,
			data: paramData,
			type: "post",
			dataType: "json",
			success: function(scrap){
				if(scrap==0){
					alert("스크랩완료");
					  var btn = '★';
						  $("#scrapBtn").html(btn);
				}else if(scrap==1){
					alert("스크랩취소");
					 var btn = '☆';
						  $("#scrapBtn").html(btn);
				}
				location.reload();
			},
			error : function(){
                alert("스크랩 에러");
            }     
		
		})//ajax
	});//scrapbtn
	
	function scrapsCheck(){
		var registrationNo =$("#registrationNo").val();
		var loginNo = ${loginNo};
   		
   		url ="scrapsCheck";
   		var paramData ={
   				"registrationNo" : registrationNo,
        		"loginNo" : loginNo
        };
   		
   		console.log(paramData);
   		
   	  	$.ajax({
        	url : url,         // 주소 -> controller 매핑주소
          	data : paramData,    // 요청데이터
          	dataType : "json",  // 데이터타입
          	type : "post",      // 전송방식
            success : function(result){
            	console.log(result.length);
            	
            	
                 if(result.length < 1){
                	 var btn = '☆';
                	$("#scrapBtn").html(btn);
                 }
                 else if(result.length = 1){
                    $(result).each(function(){
                    	var btn = '★';
                 		$("#scrapBtn").html(btn);
                    });  // each End
                 }
             },
             error : function(data){
                alert("스크랩 체크 에러" + data);
             }     
       });
   	}; //scrapsCheck()
	
});

function clip(){

	   var textarea = document.createElement("textarea");
	    document.body.appendChild(textarea);

	    // 현재 페이지 URL 가져오기
	    var url = window.document.location.href;

	    // registrationContent → noRegistrationContent 로 변경
	    url = url.replace("registrationContent", "noRegistrationContent");

	    // 복사
	    textarea.value = url;
	    textarea.select();
	    document.execCommand("copy");
	    document.body.removeChild(textarea);

	    alert("URL이 복사되었습니다.");
	}

</script>

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
  		 혜택 상세조회
	</h1>
	
	<div class="container">
	<div class="row justify-content-center">
	
	<c:forEach var="registration" items="${registrationContent}">
	<p>
    <input type="hidden" name="registrationNo" id="registrationNo" value="${registration.registrationNo}">
    <button class="btn-common copy-url-btn" onclick="clip(); return false;">URL</button>
    <button type="button" class="btn-common btn-success" id="scrapBtn">☆</button>
	</p>   
		<div class="col-md-5 mb-4">
           <div class="card benefit-card shadow-lg h-100">
              <div class="card-body p-4">
                 <h3 class="card-title mb-3">
                     🌟 ${registration.title}
                 </h3>
		<br>
		<p class="card-text mb-3" style="text-align: center;">${registration.content}</p>
		<br>
        <br>
        <hr>
		<ul class="list-unstyled mb-4">
                                <li>📅 <strong>신청기간 :</strong> ${registration.startDate} ~ ${registration.endDate}</li>
                                <li>🏢 <strong>접수기관 :</strong> ${registration.trachea}</li>
                                <li>📞 <strong>전화문의 :</strong> ${registration.call}</li>
                                <li>
                                    🔗 <strong>신청링크 :</strong> 
                                    <a href="https://${registration.link}" 
                                       class="btn btn-gradient btn-sm ms-2" 
                                       target="_blank" title="새창열림">
                                        바로가기
                                    </a>
                                </li>
                                <li>💡 <strong>지원형태 :</strong> ${registration.type}</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</main>
	
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

    	   // 인기 검색어 링크 클릭 이벤트
    	    	$('.keyword-link').on("click", function(event) {
    	    	event.preventDefault(); // 기본 링크 이동(href="#") 방지

    	    	// 1. 클릭된 키워드 텍스트를 가져옴
    	    	var keyword = $(this).data('keyword').trim(); // data-keyword 속성 사용 권장
    	    	var searchType = 'tc'; // 키워드 검색은 제목+내용(tc)으로 고정
    	    	var encodedKeyword = encodeURIComponent(keyword);

    	    	// 2. 키워드 로깅을 위한 AJAX 요청 (검색 카운트 증가)
    	    	$.ajax({
    	    	url: "logKeyword", // ArticleControl.java의 @PostMapping("logKeyword") 매핑
    	    	type: "POST",
    	    	data: { keyword: keyword },
    	    	success: function(response) {
    	    	// 3. 로깅 성공/실패와 관계없이 검색 결과 페이지로 이동 (페이지는 1로 초기화)
    	    	var redirectUrl = "registrationlistAll"
    	    	  + "?page=1&perPageNum=10" // perPageNum을 10으로 고정하거나, 직접 값을 넣습니다.
    	    	  + "&searchType=" + searchType
    	    	  + "&keyword=" + encodedKeyword;
    	    	  self.location = redirectUrl;
    	    	  },
    	    	  error: function(xhr, status, error) {
    	    	  console.error("키워드 로깅 실패. 검색은 진행합니다.", error);
    	    	  // 로깅 실패 시에도 검색 페이지로 이동
    	    	 var redirectUrl = "registrationlistAll"
    	    	  + "?page=1&perPageNum=10" // perPageNum을 10으로 고정하거나, 직접 값을 넣습니다.
    	    	  + "&searchType=" + searchType
    	    	  + "&keyword=" + encodedKeyword;
    	    	 self.location = redirectUrl;
    	    	  }
    	    	});
    	   	  });
    	    });
</script>  
</body>
</html>
