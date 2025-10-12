<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>${board.title}</title>
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/board.css' />">
</head>
<body>
	<div id="board-data" data-boardno="${board.boardno}">
		<header class="header">
			<%@ include file="../include/header.jsp"%>
		</header>

		<a href="${pageContext.request.contextPath}/boardlistmain"><h5>커뮤니티
				메인</h5></a>

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
				<td>${board.categoryName}</td>
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

		<!-- ❤️ 좋아요 버튼 -->
		<button id="heart-btn-${board.boardno}"
			onclick="toggleHeart(${board.boardno})">❤️ 좋아요</button>
		<span id="heart-count-${board.boardno}">${board.heartCount}</span>

		<div style="margin-top: 20px;">
			<a
				href="${pageContext.request.contextPath}/listmain?category=${board.categoryId}">
				<button type="button">이전으로</button>
			</a> <a href="${pageContext.request.contextPath}/boardlistmain">
				<button type="button">메인으로</button>
			</a>  
		 <!-- 1, 2. [핵심 수정] 본인 글일 때만 수정/삭제 버튼 노출: loginNo가 Model에 없으면 empty로 처리 -->
        <!-- JSTL에서 숫자 비교 시 == 대신 eq를 사용하고, 값이 넘어오지 않을 경우의 예외 처리를 강화합니다. -->
        <c:if test="${not empty loginNo and not empty board.loginLoginNo and loginNo eq board.loginLoginNo}">
            <a href="${pageContext.request.contextPath}/update?boardno=${board.boardno}">
                <button type="button">수정</button>
            </a>
            <form id="deleteForm-${board.boardno}" action="${pageContext.request.contextPath}/delete" method="post">
                <input type="hidden" name="boardno" value="${board.boardno}">
                <input type="hidden" name="categoryId" value="${board.categoryId}">
                <button type="button" onclick="confirmDeleteForm('${board.boardno}')">삭제</button>
            </form>
        </c:if>
		</div>

		<%@ include file="boardreply.jsp"%>
	</div>

	<script>
var boardno = ${board.boardno};
var loginNo = '<c:out value="${loginNo}" default="null"/>';
	console.log("== 디버깅 정보 ==");
	console.log("JSP-EL: 게시글 작성자 No (board.loginLoginNo): ${board.loginLoginNo}");
	console.log("JSP-EL: 현재 로그인 사용자 No (loginNo): ${loginNo}"); // JSTL 변수 확인
	console.log("JS-Var: 현재 로그인 사용자 No (loginNo): " + (loginNo === "null" || loginNo === "" ? "비로그인 상태" : loginNo));
	console.log("==================");

//loginNo 확인용
console.log("loginNo =", loginNo);

// ❤️ 좋아요 토글
function toggleHeart(boardno){
    if(!loginNo || loginNo === "null" || loginNo === ""){
        alert("로그인 후 이용 가능합니다.");
        location.href = "${pageContext.request.contextPath}/login";
        return;
    }


    // [수정] AJAX 설정 객체 내부의 잘못된 if(!loginNo) 구문을 제거했습니다.
    // AJAX 요청 시 loginNo를 Number 타입으로 변환 (서버에서 Integer로 받기 위함)
    $.ajax({
        url: '${pageContext.request.contextPath}/heart/toggle',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ loginNo: Number(loginNo), boardno: boardno }),
        success: function(count) {
            $('#heart-count-' + boardno).text(count);
        },
        error: function(err){
            console.error("좋아요 토글 실패:", err);
        }
    });
}

// 게시글 삭제
function confirmDeleteForm(boardno) {
    if(confirm("정말 이 게시글을 삭제하시겠습니까?")) {
        document.getElementById('deleteForm-' + boardno).submit();
    }
}

$(document).ready(function(){
    var boardno = $("#board-data").data("boardno");

    // 댓글 목록 불러오기
    function loadComments() {
        $("#commentArea").load("${pageContext.request.contextPath}/comment/comments?boardno=" + boardno);
    }

    // ✅ 댓글 작성
    $(document).on("submit", "#commentForm", function(e){
        e.preventDefault();

        if(!loginNo || loginNo === "null" || loginNo === ""){
            alert("로그인 후 작성 가능합니다.");
            location.href = "${pageContext.request.contextPath}/login";
            return;
        }

        var comment = $(this).find("textarea[name='comment']").val();
        $.ajax({
            url: "${pageContext.request.contextPath}/comment/add",
            type: "POST",
            data: { boardno: boardno, comment: comment, loginNo: loginNo },
            success: function(res){
                if(res === "success"){
                    loadComments();
                    $("#commentForm")[0].reset();
                } else if(res === "NOT_LOGGED_IN"){
                    alert("로그인 후 작성 가능합니다.");
                }
            },
            error: function(err){
                console.error(err);
            }
        });
    });

    // 댓글 수정
    $(document).on("click", ".btn-update", function(){
        var commentId = $(this).data("comment-id");
        $("#comment-text-" + commentId).prop("readonly", false).focus();
        $(this).removeClass("btn-update").addClass("btn-save").text("수정완료");
    });

    $(document).on("click", ".btn-save", function(){
        var commentId = $(this).data("comment-id");
        var newComment = $("#comment-text-"+commentId).val();

        $.post("${pageContext.request.contextPath}/comment/update",
           { commentId: commentId, boardno: boardno, comment: newComment },
           function(res){
               if(res === "SUCCESS"){
                   loadComments();
               }
           }).fail(function(err){
               console.error("update ajax 오류:", err);
           });

        $(this).removeClass("btn-save").addClass("btn-update").text("댓글수정");
        $("#comment-text-"+commentId).prop("readonly", true);
    });

    // 댓글 삭제
    $(document).on("click", ".btn-delete", function(){
        var commentId = $(this).data("comment-id");
        if(confirm("정말 삭제하시겠습니까?")){
            $.post("${pageContext.request.contextPath}/comment/delete",
                   {commentId:commentId, boardno:boardno},
                   function(){ loadComments(); });
        }
    });

    loadComments();
});
</script>
</body>
</html>