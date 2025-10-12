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
   <title>articleContent</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
	
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>

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


<!-- 댓글 관련 자바스크립트 -->
<script type="text/javascript">
		
	$(document).ready(function(){
		
		articleHearts();
		heartsCheck();
		commentList();
		
		
  	  	$("#commentInsertBtn").click(function(){
	        var article_articleId =$("#article_articleId").val();
	        var comment = $("#comment").val();
	        var login_loginNo = ${loginNo};
	     
	        
	        var url = "comment/insert";
	        var paramData ={
	        		"article_articleId" : article_articleId,
	        		"comment" : comment,
	        		"login_loginNo" : login_loginNo
	        		
	        };
	        
	        console.log(paramData);
	        
	        $.ajax({
	        	url: url,
	            type: "post",
	            data: paramData,
	            dataType : "json",
	            success: function(data){
	               if(data==1){
	                   commentList(); // 댓글 작성 후 댓글 목록 함수 호출
	                   $('#comment').val('');
	               } // if end
	            },// success end
	       		error: function(){
	       			alert("100자 미만으로 작성해주세요.");
	       		}
	        }); // ajax() end
	   	}); // commentInsert() end
	   	
	   	
	   	function commentList(){
	   		var article_articleId =$("#article_articleId").val();
	   		
	   		
	   		url ="comment/listAll";
	   		var paramData ={
	        		"article_articleId" : article_articleId,
	        };
	   		
	   		console.log(paramData);
	   		
	   	  	$.ajax({
	        	url : url,         // 주소 -> controller 매핑주소
	          	data : paramData,    // 요청데이터
	          	//dataType : "json",  // 데이터타입
	          	type : "post",      // 전송방식
	            success : function(result){
	            	console.log(result.length);
	                
	                var htmls = "";
	                
	                 if(result.length < 1){
	                    htmls = htmls + "<h3>등록된 댓글이 없습니다.</h3>";
	                 }
	                 else{
	                    $(result).each(function(){
	                      // htmls = htmls + '<div id="commentList' +this.comment_id + '">';
	                                        //<div id="reno12"> <div id="reno13">
	                       htmls += '<hr style="width: 600px; float: left;">';
	                       htmls += '<br>';
	                       htmls += '<span class="d-block">';
	                       htmls += '<strong class="text-gray-dark">' + ' ID: ' + this.userId + '</strong>';
	                       htmls += '</span><br>';
	                       htmls += '<br>';
	                       htmls += this.comment;
	                       htmls += '<br>';
	                       htmls += '<br>';
	                       htmls += ' 작성일 : ' + this.createdDate + ' | 수정일 : ' + this.lastModified;
	                       htmls += '<br>';
	                       //htmls += '</div>';   
	                    });  // each End
	                 }
	                 $("#commentList").html(htmls);
	             },
	             error : function(data){
	                alert("에러" + data);
	             }     
	       });
	   	}//commentList()
	
		   	
			$("#heartBtn").click(function(heart){
				
				var article_articleId =$("#article_articleId").val();
				var login_loginNo = ${loginNo};
		   		
		   		url ="heart";
		   		var paramData ={
		        		"article_articleId" : article_articleId,
		        		"login_loginNo" : login_loginNo
		        };
		   		
		   		console.log(paramData);
		   		
				$.ajax({
					url: url,
					data: paramData,
					type: "post",
					dataType: "json",
					success: function(heart){
						if(heart==0){
							alert("좋아요완료");
							  var btn = '🎔';
								  $("#heartBtn").html(btn);
						}else if(heart==1){
							alert("좋아요취소");
							 var btn = '♡';
								  $("#heartBtn").html(btn);
						}
						location.reload();
					},
					error : function(){
		                alert("좋아요 에러");
		             }     
				
				})//ajax
			});//heartbtn
			
			
			function heartsCheck(){
		   		var article_articleId =$("#article_articleId").val();
		   		var login_loginNo = ${loginNo};
		   		
		   		url ="heartsCheck";
		   		var paramData ={
		        		"article_articleId" : article_articleId,
		        		"login_loginNo" : login_loginNo
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
		                	 var btn = '♡';
		                	$("#heartBtn").html(btn);
		                 }
		                 else if(result.length = 1){
		                    $(result).each(function(){
		                    	var btn = '🎔';
		                 		$("#heartBtn").html(btn);
		                    });  // each End
		                 }
		             },
		             error : function(data){
		                alert("좋아요 에러" + data);
		             }     
		       });
		   	}; //heartsCheck()
		   	
		   	function articleHearts(){
		   		var article_articleId = $("#article_articleId").val();
		   		
		   		url ="articleHearts";
		   		var paramData ={
		        		"article_articleId" : article_articleId
		        };
		   		
		   		console.log(paramData);
		   		
		   	  	$.ajax({
		        	url : url,         // 주소 -> controller 매핑주소
		          	data : paramData,    // 요청데이터
		          	dataType : "json",  // 데이터타입
		          	type : "post",      // 전송방식
		            success : function(result){
		            	console.log(result);
		            	
		            	var htmls ="";
		            	
		            	
		                htmls += '♥' + result
		                
		                 $("#heartsCount").html(htmls);
		             },
		             error : function(data){
		                alert("좋아요카운트 에러" + data);
		             }     
		       });
		   	}; //articleHearts()
		   	
		   	$(function() {
		   		$("#comment").keypress(function(e){
		   			//검색어 입력 후 엔터키 입력하면 조회버튼 클릭
		   			if(e.keyCode && e.keyCode == 13){
		   				$("#commentInsertBtn").trigger("click");
		   				return false;
		   			}
		   			//엔터키 막기
		   			if(e.keyCode && e.keyCode == 13){
		   				  e.preventDefault();	
		   			}
		   		});
		   	});

		});
	
	function clip(){

	      var textarea = document.createElement("textarea");
	       document.body.appendChild(textarea);

	       // 현재 URL에서 articleContent를 noArticleContent로 변경
	       var url = window.document.location.href.replace("articleContent", "noArticleContent");

	       textarea.value = url;
	       textarea.select();
	       document.execCommand("copy");
	       document.body.removeChild(textarea);
	       alert("URL이 복사되었습니다.");
	   }
	
	
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
	
<!-- 네비게이션 -->
  	<div class="news-header">
    <nav class="news-nav">
      <a href="articleListAll">종합</a>
      <a href="articleListAll1">일자리취업</a>
      <a href="articleListAll2">주거/복지</a>
      <a href="articleListAll3">교육</a>
      <a href="articleListAll4">문화/여가</a>
      <a href="articleListAll5">건강/의료</a>
      <a href="articleListAll6">금융/경제</a>
    </nav>
	</div>

       <!-- 메인 컨테이너 -->
	<div class="news-container">
    <!-- 메인 콘텐츠 -->
    <main class="news-main">
    <h1 class="news-title">
  		 기사 상세조회
	</h1>

	<div class="container">
	<div style="padding-top: 1px">
	
      <c:forEach var="article" items="${articleContent}"> <!-- JSTL의 반복문 -->
    
      	<div style="display:flex; justify-content:space-between; align-items:flex-start;">
         	
      		
      		<div style="flex:1; margin-right:15px;">
			
            <div style="font-size: 12;"> ${article.name}</div>
            <h1 style="font-size: 35; font-weight: bold;">${article.title}</h1>
            <p style="font-size: 12;"> 
            <c:if test="${not empty article.link}">
                        <a href="${article.link}" target="_blank">기사원문보기</a> |
                        </c:if> | ${article.source} | ${article.published}</p>
            views: ${article.views}
            <div id="heartsCount"></div>
             
            <p><button class="btn-common copy-url-btn" onclick="clip(); return false;">URL</button>
            <button type="button" class="btn-common btn-success" id="heartBtn">♡</button></p>
            <div style="flex:0 0 450px;">
            <img src="resources/image/${article.image }" alt="${article.image }" style=" width: 650px; height: 450px;">
            </div>
      		<br>
      		<br>
            <p>${article.content}</p>
            <br>
      		<br>
      		<p></p>
      		<br>
      		
            </div>
        </div>
   
   <!-- 댓글 -->
	<div class="container">
    <label for="content">댓글</label>
   
    <form name="commentInsertForm" id="commentInsertForm">
    <div>
        <input type="hidden" name="article_articleId" id="article_articleId" value="${article.articleId}">
        
        <input type="text" onkeyup="enterkey();" name="comment" id="comment" placeholder="내용을 입력하세요">
        
        <button type="button" id="commentInsertBtn">등록</button>
    </div>
    </form>
	</div>
	<div class="container">
    <div id="commentList"></div><br>
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
    	var redirectUrl = "articleListAll"
    	  + "?page=1&perPageNum=10" // perPageNum을 10으로 고정하거나, 직접 값을 넣습니다.
    	  + "&searchType=" + searchType
    	  + "&keyword=" + encodedKeyword;
    	  self.location = redirectUrl;
    	  },
    	  error: function(xhr, status, error) {
    	  console.error("키워드 로깅 실패. 검색은 진행합니다.", error);
    	  // 로깅 실패 시에도 검색 페이지로 이동
    	  var redirectUrl = "articleListAll"
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
