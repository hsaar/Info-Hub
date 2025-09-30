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

</script>

</head>
<body>

<!-- 상단바 -->
<jsp:include page="../include/header.jsp"/>

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
  		 혜택 상세조회
	</h1>
	
	<div class="container">
	<div style="padding-top: 1px">
	
	<c:forEach var="registration" items="${registrationContent}">
		<h3>${registration.title}</h3>
		
		<input type="hidden" name="registrationNo" id="registrationNo" value="${registration.registrationNo}">
        <p><button type="button" class="btn btn-success" id="scrapBtn">☆</button></p>
            
		${registration.content}<br>
		${registration.startDate} ~ ${registration.endDate}<br>
		${registration.trachea}<br>
		call : ${registration.call}<br>
		link : <a href="https://${registration.link}" class="btn-text" target="_blank" title="새창열림">${registration.link}</a><br>
		${registration.type}
		
		
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
      <h2>키워드</h2>
      <c:forEach var="article" items="${keywordArticle}">
      
       <c:if test="${empty userId}">
            <a href="noArticleContent?articleId=${article.articleId}" style="font-size: 25; font-weight: bold;"> ${article.keyword}</a>
          </c:if>
          
          <c:if test="${not empty userId}">
          <a href="articleContent?articleId=${article.articleId}"> ${article.keyword}</a>
          </c:if>
       
      </c:forEach>
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
  </script>  
</body>
</html>