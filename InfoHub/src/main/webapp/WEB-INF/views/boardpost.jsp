<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글쓰기</title>
<script></script>
</head> 
<body>
<center>
		<h1>글쓰기</h1>
		<form method="post" action="${pageContext.request.contextPath}/board/register" name="write_frm">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="100">
						<input type="text" id="name" name="name" size="10" maxlength="20"/>
					</td>
					<td width="80">이메일</td>
					<td width="240">
						<input type="text" id="email" name="email" size="24" maxlength="50" />
					</td>
				</tr>
				<tr>
					<td width="80">글제목</td>
					<td colspan="3" width="460">
						<input type="text" id="title" name="title" size="58" maxlength="80" />
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea cols="70" rows="10" id="content" name="content" maxlength="3000"></textarea>
					</td>
				<tr>
				<tr>
					<td width="80">암&nbsp;&nbsp;호</td>
					<td width="200">
						<input type="password" id="pwd" name="pwd" size="12" maxlength="12" />
					</td>
				</tr>
				<tr height="50">
					<td colspan="4" align="center">
						<input type="button" value="글쓰기" onclick="check_ok()" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="글목록" onclick="location.href='list.jsp'" />
					</td>
				</tr>
			</table>		
		</form>
	</center>
</body>
</html>