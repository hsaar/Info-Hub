<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script>
function validateForm() {
    /// 1. 요소 가져오기
    const title = document.getElementById('title').value;
    const content = document.getElementById('content').value.trim();
    const mainCategory = document.getElementById('mainCategory').value;
    const subCategory = document.getElementById('subCategory').value;

    // 2. 유효성 검사 (content, mainCategory, subCategory 중 하나라도 비어있는지 확인)
    if (title === "") {
        alert("제목을 작성해주세요.");
        // 해당 필드에 포커스 이동 (선택적)
        document.getElementById('title').focus(); 
        return false; // 제출 방지
    }
    
    if (content === "") {
        alert("내용을 작성해주세요.");
        // 해당 필드에 포커스 이동 (선택적)
        document.getElementById('content').focus(); 
        return false; // 제출 방지
    }

    // mainCategory가 빈 문자열이거나 (선택 옵션의 value="") null인 경우
    if (mainCategory === "" || mainCategory === null) {
        alert("카테고리를 선택해주세요.");
        document.getElementById('mainCategory').focus();
        return false; // 제출 방지
    }

    // subCategory가 빈 문자열이거나 null인 경우
    if (subCategory === "" || subCategory === null) {
        alert("카테고리를 선택해주세요.");
        document.getElementById('subCategory').focus();
        return false; // 제출 방지
    }

    // 3. 모든 검사를 통과한 경우
    return true; // 폼 제출 허용
}
</script>
</head>
<body>
</h1>
<a href="${pageContext.request.contextPath}/boardlistmain">
    <h5 class="box-title">커뮤니티 메인</h5>
	<center>
		<h1>게시글 수정하기</h1>
		<form method="post"
			action="${pageContext.request.contextPath}/board/update" onsubmit="return validateForm()"
			name="write_frm">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="100"><input type="text" id="name" name="regiId"
						size="10" maxlength="20" /></td>

					<td><%@ include file="selectcategory.jsp"%>
					</td>
				</tr>
				<tr>
					<td width="80">글제목</td>
					<td colspan="3" width="460"><input type="text" id="title"
						name="title" size="58" maxlength="80" value="${board.title}"/></td>
				</tr>
				<tr>
					<td colspan="4"><textarea cols="70" rows="10" id="content"
							name="content" maxlength="3000">${board.content}</textarea></td>
				</tr>
				<tr height="50">
					<td colspan="4" align="center">
						<!-- 글쓰기 완료: submit으로 변경 -->
						 <input type="submit" value="수정하기" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						
						 <!-- 글목록: 목록 페이지로 이동 -->
						<input type="button" value="이전으로"
						onclick="location.href='${pageContext.request.contextPath}/board/listcategory?category=${categoryId}'" />
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>