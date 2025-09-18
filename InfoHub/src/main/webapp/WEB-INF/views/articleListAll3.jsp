<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>

   <title>3-articleListAll</title>
</head>
<body>

        <h1 class="display-3">
  		 적금 최신기사 조회
		</h1>

<div class="container">
<div style="padding-top: 1px">
	<table class="table table-hover" width="1000">
  
      <tr>
         <th> ---------------------------------------------------------------------------- </th>
         
      </tr>
      <c:forEach var="article" items="${articleListAll3}"> <!-- JSTL의 반복문 -->
         <tr>
         
            <td><br>
         	<div style="display:flex; justify-content:space-between; align-items:flex-start;">
         	
      		
      		<div style="flex:1; margin-right:15px;">
			
            <p style="font-size: 20; font-weight: bold;">${article.title}(기사제목)</p>
            ${article.content}(기사내용)
            <p style="font-size: 12;"> 
           
            ${article.name}(카테고리) | ${article.source}(source) | ${article.published}(작성일)<br>
            ${article.views}(조회수) | ${article.hearts}(좋아요수) </p>
            </div>
            
            <div style="flex:0 0 450px;">
            <img src="${article.image }" alt="${article.image }" style="width:250px; height:180px; border-radius:8px;">
      		</div>
           
          	</div>
          	</td>
            
         </tr>
      </c:forEach>
   </table>
   </div>
   </div>
</body>
</html>
