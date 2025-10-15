<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${board.title}</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/board.css' />">
</head>
<body>
	<div id="board-data" data-boardno="${board.boardno}">
		<header class="header">
			<%@ include file="../include/header.jsp"%>
		</header>

		<!-- 게시판 상세 컨테이너 -->
		<div class="detail-container">
			<!-- 브레드크럼 네비게이션 -->
			<div class="breadcrumb-detail">
				<a href="${pageContext.request.contextPath}/boardlistmain">커뮤니티</a>
				<svg viewBox="0 0 24 24"><path d="M9.29 6.71a.996.996 0 000 1.41L13.17 12l-3.88 3.88a.996.996 0 101.41 1.41l4.59-4.59a.996.996 0 000-1.41L10.7 6.7c-.38-.38-1.02-.38-1.41.01z"/></svg>
				<a href="${pageContext.request.contextPath}/listmain?category=${board.categoryId}">${board.categoryName}</a>
				<svg viewBox="0 0 24 24"><path d="M9.29 6.71a.996.996 0 000 1.41L13.17 12l-3.88 3.88a.996.996 0 101.41 1.41l4.59-4.59a.996.996 0 000-1.41L10.7 6.7c-.38-.38-1.02-.38-1.41.01z"/></svg>
				<span>게시글 상세</span>
			</div>

			<!-- 게시글 카드 -->
			<div class="board-detail-card">
				<!-- 게시글 헤더 -->
				<div class="detail-header">
					<span class="detail-category">${board.categoryName}</span>
					<h1 class="detail-title">${board.title}</h1>
					<div class="detail-meta">
						<div class="meta-item">
							<svg viewBox="0 0 24 24"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/></svg>
							<span>${board.regiId}</span>
						</div>
						<span class="meta-divider"></span>
						<div class="meta-item">
							<svg viewBox="0 0 24 24"><path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67z"/></svg>
							<span>${board.regiDate}</span>
						</div>
						<span class="meta-divider"></span>
						<div class="meta-item">
							<svg viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg>
							<span>${board.readcnt}</span>
						</div>
					</div>
				</div>

				<!-- 게시글 본문 -->
				<div class="detail-content">${board.content}</div>

				<!-- 게시글 푸터 (좋아요) -->
				<div class="detail-footer">
					<button id="heart-btn-${board.boardno}" class="heart-btn" onclick="toggleHeart(${board.boardno})">
						<svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
							<path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
						</svg>
						<span>좋아요</span>
						<span id="heart-count-${board.boardno}" class="heart-count">${board.heartCount}</span>
					</button>
				</div>

				<!-- 액션 버튼 영역 -->
				<div class="detail-actions">
					<div class="action-group">
						<a href="${pageContext.request.contextPath}/listmain?category=${board.categoryId}" class="btn-action btn-list">
							<svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
								<path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"/>
							</svg>
							목록으로
						</a>
						<a href="${pageContext.request.contextPath}/boardlistmain" class="btn-action btn-main">
							<svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
								<path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/>
							</svg>
							메인으로
						</a>
					</div>

					<!-- 본인 글일 때만 수정/삭제 버튼 -->
					<c:if test="${not empty loginNo and not empty board.loginLoginNo and loginNo eq board.loginLoginNo}">
						<div class="action-group">
							<a href="${pageContext.request.contextPath}/update?boardno=${board.boardno}" class="btn-action btn-edit">
								<svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
									<path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/>
								</svg>
								수정
							</a>
							<button type="button" class="btn-action btn-delete" onclick="confirmDeleteForm('${board.boardno}')">
								<svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
									<path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/>
								</svg>
								삭제
							</button>
							<form id="deleteForm-${board.boardno}" action="${pageContext.request.contextPath}/delete" method="post" style="display:none;">
								<input type="hidden" name="boardno" value="${board.boardno}">
								<input type="hidden" name="categoryId" value="${board.categoryId}">
							</form>
						</div>
					</c:if>
				</div>
			</div>

			<!-- 댓글 영역 -->
			<%@ include file="boardreply.jsp"%>
		</div>
	</div>

	<script>
var boardno = ${board.boardno};
var loginNo = '<c:out value="${loginNo}" default="null"/>';
	console.log("== 디버깅 정보 ==");
	console.log("JSP-EL: 게시글 작성자 No (board.loginLoginNo): ${board.loginLoginNo}");
	console.log("JSP-EL: 현재 로그인 사용자 No (loginNo): ${loginNo}");
	console.log("JS-Var: 현재 로그인 사용자 No (loginNo): " + (loginNo === "null" || loginNo === "" ? "비로그인 상태" : loginNo));
	console.log("==================");

console.log("loginNo =", loginNo);

const loginUser = "${sessionScope.loginUser}";


// ❤️ 좋아요 토글
function toggleHeart(boardno){
    if(!loginNo || loginNo === "null" || loginNo === ""){
        alert("로그인 후 이용 가능합니다.");
        location.href = "${pageContext.request.contextPath}/login";
        return;
    }

    $.ajax({
        url: '${pageContext.request.contextPath}/heart/toggle',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ loginNo: Number(loginNo), boardno: boardno }),
        success: function(count) {
            $('#heart-count-' + boardno).text(count);
            $('#heart-btn-' + boardno).toggleClass('active');
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

//댓글
$(document).ready(function(){
    var boardno = $("#board-data").data("boardno");

    // 댓글 목록 불러오기
    function loadComments() {
        $("#commentArea").load("${pageContext.request.contextPath}/comment/comments?boardno=" + boardno + "&ajax=true");
    }

    // 댓글 작성
    $(document).on("submit", "#commentForm", function(e){
        e.preventDefault();
        if(!loginNo || loginNo === "null" || loginNo === ""){
            alert("로그인 후 작성 가능합니다.");
            location.href = "${pageContext.request.contextPath}/login";
            return;
        }
        var comment = $(this).find("textarea[name='comment']").val();
        $.post("${pageContext.request.contextPath}/comment/add",
               { boardno: boardno, comment: comment, loginNo: loginNo},
               function(res){
                   if(res === "success"){
                       loadComments();
                       $("#commentForm")[0].reset();
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
        var newComment = $("#comment-text-" + commentId).val();
        $.post("${pageContext.request.contextPath}/comment/update",
               { commentId: commentId, boardno: boardno, comment: newComment },
               function(res){
                   if(res === "SUCCESS"){
                       loadComments();
                   }
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

    // 답글 버튼 클릭 → 숨겨둔 폼 표시
    $(document).on("click", ".btn-reply", function(){
        var commentId = $(this).data("comment-id");
        // 모든 답글 폼 숨기기
        $(".reply-form-container").hide();
        // 클릭한 댓글의 폼만 표시
        $("#reply-form-" + commentId).show().find("textarea").focus();
    });

    // 답글 취소 버튼
    $(document).on("click", ".btn-cancel", function(){
        var replyForm = $(this).closest(".reply-form-container");
        replyForm.hide();
        replyForm.find("textarea").val('');
    });

    // 답글 제출
    $(document).on("submit", ".reply-form", function(e){
        e.preventDefault();
        var parentId = $(this).data("parent-id");
        var reply = $(this).find("textarea").val();
        $.post("${pageContext.request.contextPath}/comment/add", 
               { boardno: boardno, parentId: parentId, comment: reply, loginNo: loginNo },
               function(res){
                   if(res === "success"){
                       loadComments(); // 대댓글 새로고침
                       // 대댓글 폼 숨기고 초기화
                       $("#reply-form-" + parentId).hide();
                       $("#reply-form-" + parentId + " textarea").val('');
                   }
               });
    });

    // 초기 댓글 로딩
    loadComments();
});


</script>
</body>
</html>
