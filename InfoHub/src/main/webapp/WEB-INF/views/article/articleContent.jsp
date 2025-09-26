<%@page import="com.infohub.project.scraps.ScrapsServiceImpl"%>
<%@page import="com.infohub.project.scraps.ScrapsDAOImpl"%>
<%@page import="org.springframework.web.context.request.RequestContextHolder"%>
<%@page import="org.springframework.web.context.request.ServletRequestAttributes"%>
<%@page import="com.infohub.project.article.ArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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


<!-- 댓글 관련 자바스크립트 -->
<script type="text/javascript">
		
	$(document).ready(function(){
		
		articleHearts();
		heartsCheck();
		commentList();
		
		
  	  	$("#commentInsertBtn").click(function(){
	        var article_articleId =$("#article_articleId").val();
	        var comment = $("#comment").val();
	        
	        var url = "comment/insert";
	        var paramData ={
	        		"article_articleId" : article_articleId,
	        		"comment" : comment
	        		
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
	       			alert("댓글 등록 실패");
	       		}
	        }); // ajax() end
	   	}); // commentInsert() end
	   	
	   	
	   	function commentList(){
	   		var article_articleId =$("#article_articleId").val();
	   		
	   		url ="comment/listAll";
	   		var paramData ={
	        		"article_articleId" : article_articleId
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
	                       htmls += '<strong class="text-gray-dark">' + ' 회원ID : ' +this.login_loginNo + '</strong>';
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
		   		
		   		url ="heart";
		   		var paramData ={
		        		"article_articleId" : article_articleId
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
							  var btn = '🎔'
								  $("#heartBtn").html(btn);
						}else if(heart==1){
							alert("좋아요취소");
							 var btn = '♡'
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
		   		
		   		url ="heartsCheck";
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
		            	console.log(result.length);
		            	
		            	
		                 if(result.length < 1){
		                	 var btn = '♡'
		                	$("#heartBtn").html(btn);
		                 }
		                 else if(result.length = 1){
		                    $(result).each(function(){
		                    	var btn = '🎔'
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
		});
	
	
	
</script>  

</head>
<body>

<!-- 상단바 -->
<%@ include file="../include/main_header.jsp"%>

<!-- 네비게이션 -->
  	<div class="news-header">
    <nav class="news-nav">
      <a href="articleListAll">종합</a>
      <a href="articleListAll1">부동산</a>
      <a href="articleListAll2">주식</a>
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
            ${article.source} | ${article.published}</p>
            views: ${article.views}
            <div id="heartsCount"></div>
            <p><button type="button" class="btn btn-success" id="heartBtn">♡</button></p>
            <div style="flex:0 0 450px;">
            <img src="resources/image/${article.image }" alt="${article.image }" style=" width: 650px; height: 450px;">
            </div>
      		<br>
      		<br>
            <p>${article.content}(기사내용)</p>
            <br>
      		<br>
            </div>
        </div>
   
   <!-- 댓글 -->
	<div class="container">
    <label for="content">댓글</label>
    <form name="commentInsertForm" id="commentInsertForm">
    <div>
        <input type="hidden" name="article_articleId" id="article_articleId" value="${article.articleId}">
        <input type="text" name="comment" id="comment" placeholder="내용을 입력하세요">
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
          <li>
            <span class="rank-number">1</span>
            <a href="#">인더스트리뉴스, 제7회 인터넷신문 대상 수상</a>
          </li>
          <li>
            <span class="rank-number">2</span>
            <a href="#">[오늘의 언론동향] 2025년 9월 5일 금요일</a>
          </li>
          <li>
            <span class="rank-number">3</span>
            <a href="#">투데이신문, 제8회 청년플러스포럼 'NEW Green Generation: ...'</a>
          </li>
          <li>
            <span class="rank-number">4</span>
            <a href="#">한국인터넷신문협회, 언론 정부직 손배제 강령 추진에 강력 반대</a>
          </li>
          <li>
            <span class="rank-number">5</span>
            <a href="#">[신연수 칼럼] 누가 누구를 개혁하는가?</a>
          </li>
        </ol>
      </div>

      <div class="sidebar-section">
        <h2>포토·영상</h2>
        <div class="photo-grid">
          <div class="photo-item"></div>
          <div class="photo-item"></div>
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
  </script>  
</body>
</html>
