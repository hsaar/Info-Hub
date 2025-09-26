<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
	<div class="form-group1">
	<table>
	<c:forEach var="boardreply" items="${list}">
		<tr>
			<td>작성자 : ${boardreply.rewriter}    작성일자 : ${boardreply.redate} </td>
		</tr>
		<tr>
			<td><textarea name="rememo" rows="5" cols="40"
				readonly="readonly" class="form-control1">${boardreply.rememo}</textarea>
			</td>
			<td><button type="button" class="btn btn-default" >댓글수정</button></td>
		</tr>
	</c:forEach>
	</table>
	</div>
			<script>
	$(function(){
		//댓글수정 버튼을 눌렀을 때 처리 : 수정해보기
		$(".btn-default").click(function(){
			location.href="replyupdate?brdno?reno=" + ${boardreply.boardno} + ${boardreply.reno} 
		});
	})
	</script>

</form>	
  
</body>
</html>