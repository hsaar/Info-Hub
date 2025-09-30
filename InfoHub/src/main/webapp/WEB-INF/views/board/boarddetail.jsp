<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.title}</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
</h1>
<a href="${pageContext.request.contextPath}/boardlistmain">
    <h5 class="box-title">커뮤니티 메인</h5></a>
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
		<th>분류</th>
			<td>${board.subCategoryName}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre>${board.content}</pre></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.readcnt}</td>
		</tr>
	</table>
<!-- 게시글 좋아요 버튼 -->
<button id="heart-btn-${board.boardno}" onclick="toggleHeart(${board.boardno})">
    ❤️ 좋아요
</button>
<span id="heart-count-${board.boardno}">${board.heartCount}</span><!-- heartCount는 DB에서 조회 필요 -->
	<!-- 버튼 영역 -->
	<div style="margin-top: 20px;">
		<!-- 목록으로 버튼 -->
		<a href="${pageContext.request.contextPath}/board/listcategory?category=${board.categoryId}">
			<button type="button">목록으로</button>
		</a>

		<!-- 메인으로 버튼 -->
		<a href="${pageContext.request.contextPath}/boardlistmain">
			<button type="button">메인으로</button>
		</a>


		<!-- 나중에 로그인 c:if 안에다가 집어넣을거 -->
		<a
			href="${pageContext.request.contextPath}/board/update?boardno=${board.boardno}">
			<button type="button">수정</button>
		</a> <form id="deleteForm-${board.boardno}" action="${pageContext.request.contextPath}/board/delete" method="get">
    <input type="hidden" name="boardno" value="${board.boardno}" />
    <input type="hidden" name="categoryId" value="${board.categoryId}" />
    <button type="button" onclick="confirmDeleteForm('${board.boardno}')">삭제</button>
</form>
		<!-- 로그인 상태 + 본인 글일 때만 수정/삭제 노출 -->
		<c:if
			test="${not empty loginUser and loginUser.loginNo == board.login_loginNo}">
		</c:if>

	</div>
	<div>
	<%@ include file="boardreply.jsp"%>	
					</div>
					<%-- 댓글 목록 및 작성 영역 --%>
<div id="commentArea">
    <!-- Ajax로 불러온 boardreply 내용이 여기에 삽입됩니다. -->
</div>
</body>
</html>
<script>
$(document).ready(function() {
    window.toggleHeart = function(boardno) {
        console.log("toggleHeart 호출됨, boardno=", boardno);
        $.ajax({
            url: '${pageContext.request.contextPath}/heart/toggle',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                loginNo: 1,
                boardno: boardno
            }),
            success: function(count) {
                console.log("좋아요 수:", count);
                $('#heart-count-' + boardno).text(count);
            },
            error: function(err) {
                console.error(err);
            }
        });
    }
});

function confirmDeleteForm(boardno) {
    if (!confirm("정말 이 게시글을 삭제하시겠습니까?")) return;
    document.getElementById('deleteForm-' + boardno).submit();
}




<script>
$(document).ready(function() {
    loadComments();
});

// 댓글 목록을 불러오는 함수
function loadComments() {
    var boardNo = "${board.boardno}";
    $("#commentArea").load("${pageContext.request.contextPath}/comment/comments?boardNo=" + boardNo);
}

// 댓글 작성 폼 제출
$("#commentForm").submit(function(e) {
    e.preventDefault(); // 기존 form submit 막기

    $.post("${pageContext.request.contextPath}/comment/add",
        $(this).serialize(),
        function() {
            loadComments(); // 댓글 목록 새로고침
            $("#commentText").val(""); // 입력란 초기화
        }
    );
});

// 댓글 삭제 함수 (Ajax)
function deleteComment(commentId, boardNo) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        $.ajax({
            url: "${pageContext.request.contextPath}/comment/delete",
            type: "POST",
            data: { commentId: commentId },
            success: function() {
                loadComments(); // 댓글 목록 다시 불러오기
            },
            error: function(err) {
                console.error(err);
            }
        });
    }
}
</script>