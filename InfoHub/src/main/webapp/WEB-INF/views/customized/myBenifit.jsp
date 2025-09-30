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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 혜택모음</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

$(document).ready(function(){
	
	scrapsList();
	
	$(document).on("click",".deleteBtn", function(){
		
		var registrationNo = $(this).data("no");
		var loginNo = ${loginNo};
			
			url ="scrapsDelete";
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
			success: function(data){
				if(data==1){
					scrapsList();
				}
			},
			error : function(){
	            alert("스크랩삭제 에러");
	        }     
		});//ajax
	});//deletebtn

	function scrapsList(){
		
		var loginNo = ${loginNo};
		
		url ="scraps/myscraps";
		var paramData ={
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
            
            var htmls = "";
            
             if(result.length < 1){
                htmls = htmls + "<h3>등록된 스크랩이 없습니다.</h3>";
             }
             else{
                $(result).each(function(){
                  // htmls = htmls + '<div id="commentList' +this.comment_id + '">';
                                    //<div id="reno12"> <div id="reno13">
                   htmls += '<article class="scrap-card">';
                   htmls += '<h3 class="scrap-title">';
                   htmls += '<a href="registrationContent?registrationNo=';
                   htmls += this.registrationNo +'">';
                   htmls += this.title;
                   htmls += '</a></h3>';
                   htmls += '<p class="scrap-description">' + this.content + '</p>';
                   htmls += '<p><span class="scrap-period">신청기간: ';
                   htmls += this.startDate + ' ~ ' + this.endDate + '</span><br>';
                   htmls += '<span class="scrap-date">스크랩: ';
                   htmls += this.createdDate + '</span></p>';
                   htmls += '<div class="scrap-info">자세히보기 → <a href="https://';
                   htmls += this.link + '" class="scrap-link">';
                   htmls += this.link + '</a></div>';
                   htmls += '<button type="button" class="btn btn-success deleteBtn" data-no="' + this.registrationNo + '">DELETE</button>'
                   htmls += '</article>';
                   //htmls += '</div>';   
                });
             }
             $("#scrapsList").html(htmls);
         },
         error : function(data){
            alert("에러" + data);
         }     
  		});
	}//scrapsList()
	
});

</script>


</head>

<body>

  <!-- 상단바 -->
<jsp:include page="../include/header.jsp"/>

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
<!-- 스크랩한 정책 콘텐츠 -->
<h2 class="content-title">내 혜택모음</h2>


	<!-- 스크랩 리스트 -->
	<div class="scrap-list" id="scrapsList">
	</div>
</main>
    
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
  // 정렬 버튼 처리
//  document.addEventListener('DOMContentLoaded', function() {
//    const sortBtns = document.querySelectorAll('.sort-btn');
//    sortBtns.forEach(btn => {
//      btn.addEventListener('click', function() {
//       sortBtns.forEach(b => b.classList.remove('active'));
//        this.classList.add('active');
//      });
//    });

    // 스크랩 삭제
//    const deleteButtons = document.querySelectorAll('.scrap-delete-btn');
//    deleteButtons.forEach(button => {
//      button.addEventListener('click', function() {
//        if (confirm('스크랩을 삭제하시겠습니까?')) {
//          this.closest('.scrap-card').remove();
//        }
//      });
//    });
//  });
</script>
</body>
</html>