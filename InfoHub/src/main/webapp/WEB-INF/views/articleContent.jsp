<%@page import="com.infohub.project.article.ArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>

<title>articleContent</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<!-- 댓글 관련 자바스크립트 -->
<script type="text/javascript">
	
		
	$(document).ready(function(){	
		commentList();
		
		
		
  	  	$("#commentInsertBtn").click(function(){
	        var article_article_id =$("#article_article_id").val();
	        var comment = $("#comment").val();
	        
	        var url = "comment/insert";
	        var paramData ={
	        		"article_article_id" : article_article_id,
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
	   		var article_article_id =$("#article_article_id").val();
	   		
	   		url ="comment/listAll";
	   		var paramData ={
	        		"article_article_id" : article_article_id
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
	                       htmls = htmls + '<div class="commentList" id="commentList' +this.comment_id + '">';
	                                        //<div id="reno12"> <div id="reno13">
	                       htmls += '<span class="d-block">';
	                       htmls += '<strong class="text-gray-dark">' + ' 회원ID : ' +this.login_login_id + '</strong>';
	                       htmls += '</span><br>';
	                       htmls += '<br>';
	                       htmls += this.comment;
	                       htmls += '<br>';
	                       htmls += '<br>';
	                       htmls += ' 작성일 : ' + this.created_date + ' | 수정일 : ' + this.last_modified;
	                       htmls += '<br>';
	                       htmls += ' 좋아요 수 ' + this.hearts;
	                       htmls += '<br>';
	                       htmls += '-----------------------------------------------';
	                       htmls += '</div>';   
	                    });  // each End
	                 }
	                 $("#commentList").html(htmls);
	             },
	             error : function(data){
	                alert("에러" + data);
	             }     
	             
	       });
	       
	   	}//commentList()
	});	
    
    
</script>  


</head>
<body>

        <h1 class="display-3">
  		 기사 상세조회
		</h1>

<div class="container">
<div style="padding-top: 1px">
	
      <c:forEach var="article" items="${articleContent}"> <!-- JSTL의 반복문 -->
    
      	<div style="display:flex; justify-content:space-between; align-items:flex-start;">
         	
      		
      		<div style="flex:1; margin-right:15px;">
			
            <div style="font-size: 12;"> ${article.name}</div>
            <div style="font-size: 35; font-weight: bold;">${article.title}</div>
            <p style="font-size: 12;"> 
            ${article.source} | ${article.published}<br>
            ${article.views}(조회수) | ${article.hearts}(좋아요수)</p> <br><br>
            <div style="flex:0 0 450px;">
            <img src="resources/img/${article.image }" alt="${article.image }" style="width:500px; height:350px;">
      		</div>
      		<br>
      		<br>
            ${article.content}(기사내용)<br><br>
            </div>
        </div>
   
   <!-- 댓글 -->
	<div class="container">
    <label for="content">댓글</label>
    <form name="commentInsertForm" id="commentInsertForm">
    <div>
        <input type="hidden" name="article_article_id" id="article_article_id" value="${article.article_id}">
        <input type="text" name="comment" id="comment" placeholder="내용을 입력하세요">
        <button type="button" id="commentInsertBtn">등록</button>
    </div>
    </form>
</div>
<hr>
<div class="container">
    <div class="commentList" id="commentList">
    </div>
</div>


</c:forEach>
 	
</div>
</div>
   
</body>
</html>
