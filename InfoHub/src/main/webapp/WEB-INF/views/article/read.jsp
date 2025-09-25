
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>

   <title>articleContent</title>
<script type="text/javascript">
   function addToScrap() {
      if (confirm("기사를 스크랩 하시겠습니까?")) {
         document.addScrap.submit();
      } else {
         document.addScrap.reset();
      }
   }
</script>
</head>
<body>

        <h1 class="display-3">
  		 기사 상세조회
		</h1>

<div class="container">
<div style="padding-top: 1px">
	
      <c:forEach var="slistPage" items="${slistPage}"> <!-- JSTL의 반복문 -->
    
      	<div style="display:flex; justify-content:space-between; align-items:flex-start;">
         	
      		
      		<div style="flex:1; margin-right:15px;">
			
            <div style="font-size: 12;"> ${slistPage.name}</div>
            <div style="font-size: 35; font-weight: bold;">${slistPage.title}</div>
            <p style="font-size: 12;"> 
            ${slistPage.source} | ${slistPage.published}<br>
            ${slistPage.views}(조회수) | ${slistPage.hearts}(좋아요수)</p> <br><br>
            <div style="flex:0 0 450px;">
            <img src="resources/img/${slistPage.image }" alt="${slistPage.image }" style="width:500px; height:350px;">
      		</div>
      		<br>
      		<br>
            ${slistPage.content}(기사내용)<br><br>
            </div>
        </div>
      </c:forEach>
           
    <div class="wrap_comment" id="commentBox">
    	<h3 class="sub_tit">댓글</h3>
        <div class="comment_numb"></div>
        <div class="write_comment">
          <div class="wrap_input">
             <div class="login_id"></div>
             <textarea id="cmt_cont" placeholder="로그인해주세요" title="댓글 작성란"></textarea>
             <button type="submit" class="btn_submit"><span>등록</span></button>
          </div>
       </div>
       <div class="list_comment"></div>
   </div>
 	
</div>
</div>
   

   
</body>
</html>
