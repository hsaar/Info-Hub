<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>

   <title>목록</title>
</head>
<body>

         <h1 class="display-3">
  		 listAll !  
		</h1>

<div class="container">
<h2>목록</h2>
</div>
<div class="container">
<div style="padding-top: 50px">
	<table class="table table-hover">
  
      <tr>
         <th>categoriesId</th>
         <th>name</th>
      </tr>
      <c:forEach var="articlecategories" items="${listAll}"> <!-- JSTL의 반복문 -->
         <tr>
            <td>${articlecategories.categoriesNo}</td>
            <td>${articlecategories.name}</td>
         </tr>
      </c:forEach>
   </table>
   </div>
   </div>
</body>
</html>
