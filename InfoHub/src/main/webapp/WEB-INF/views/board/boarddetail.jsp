<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.title}</title>
<script>
/**
 * 사용자에게 삭제 여부를 확인받고, 확인 시 해당 게시글을 삭제하는 URL로 이동
 * @param {number} boardno - 삭제할 게시글의 번호
 */
function confirmDelete(boardno) {
    // confirm() 함수는 사용자에게 메시지를 띄우고 확인(true) 또는 취소(false)를 반환합니다.
    const isConfirmed = confirm("정말 이 게시글을 삭제하시겠습니까?");

    if (isConfirmed) {
        const contextPath = "${pageContext.request.contextPath}";
        
        // **URL에 categoryId를 추가하여 Controller로 전달**
        window.location.href = contextPath + 
            "/board/delete?boardno=" + boardno + "&categoryId=" + categoryId;
    } else {
        // 사용자가 '취소'를 누른 경우, 아무 작업도 하지 않고 현재 페이지에 머무름
        console.log("게시글 삭제가 취소되었습니다.");
    }
}
</script>
</head>
<body>
<table border="1">
    <tr>
        <th>번호</th>
        <td>${board.boardno}</td>
    </tr>
    <tr>
        <th>제목</th>
        <td>${board.title}</td>
    </tr>
    <tr>
        <th>작성자</th>
        <td>${board.regiId}</td>
    </tr>
    <tr>
        <th>작성일</th>
        <td>${board.regiDate}</td>
    </tr>
    <tr>
        <th>조회수</th>
        <td>${board.readcnt}</td>
    </tr>
    <tr>
        <th>내용</th>
        <td><pre>${board.content}</pre></td>
    </tr>
</table>

<!-- 버튼 영역 -->
<div style="margin-top:20px;">
    <!-- 목록으로 버튼 -->
    <a href="${pageContext.request.contextPath}/board/listcategory?category=${board.categoryId}">
        <button type="button">목록으로</button>
    </a>

    <!-- 메인으로 버튼 -->
    <a href="${pageContext.request.contextPath}/boardlistmain">
        <button type="button">메인으로</button>
    </a>
 
        
        <!-- 나중에 로그인 c:if 안에다가 집어넣을거 -->
        <a href="${pageContext.request.contextPath}/board/update?boardno=${board.boardno}">
            <button type="button">수정</button>
        </a>
        <a>
            <button type="button" onclick="confirmDelete(${board.boardno},  ${board.categoryId})">삭제</button>
        </a>
    <!-- 로그인 상태 + 본인 글일 때만 수정/삭제 노출 -->  
    <c:if test="${not empty loginUser and loginUser.loginNo == board.login_loginNo}">
    </c:if>

</div>
</body>
</html>