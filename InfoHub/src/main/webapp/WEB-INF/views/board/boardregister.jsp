<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글쓰기</title>
<script>
	
</script>
</head>
<body>
	<center>
		<h1>글쓰기</h1>
		<form method="post"
			action="${pageContext.request.contextPath}/board/register"
			name="write_frm">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="100"><input type="text" id="name" name="regi_id"
						size="10" maxlength="20" /></td>

					<td><%@ include file="selectcategory.jsp"%>
					</td>
				</tr>
				<tr>
					<td width="80">글제목</td>
					<td colspan="3" width="460"><input type="text" id="title"
						name="title" size="58" maxlength="80" /></td>
				</tr>
				<tr>
					<td colspan="4"><textarea cols="70" rows="10" id="content"
							name="content" maxlength="3000"></textarea></td>
				</tr>
				<tr height="50">
					<td colspan="4" align="center">
						<!-- 글쓰기 완료: submit으로 변경 -->
						 <input type="submit" value="글쓰기" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						 <!-- 다시작성: reset 그대로 사용 -->
						<input type="reset" value="다시작성" />

						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						 <!-- 글목록: 목록 페이지로 이동 -->
						<input type="button" value="글목록"
						onclick="location.href='${pageContext.request.contextPath}board/list'" />
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>