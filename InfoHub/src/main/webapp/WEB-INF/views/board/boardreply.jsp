<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- AJAX 요청이 아닐 때만 댓글 섹션 헤더와 작성 폼 표시 -->
<c:if test="${empty param.ajax}">
<!-- 댓글 섹션 -->
<div class="comment-section">
	<!-- 댓글 헤더 -->
	<div class="comment-header">
		<h3 class="comment-title">댓글 <span id="commentCount">(${not empty comments ? comments.size() : 0})</span></h3>
	</div>

	<!-- 댓글 작성 폼 (메인 댓글용) -->
	<div class="comment-form">
		<form id="commentForm">
			<input type="hidden" name="parentCommentId" value="">
			<textarea name="comment" class="comment-textarea" rows="4" placeholder="댓글을 입력하세요..." required></textarea>
			<button type="submit" class="comment-submit">
				<svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor" style="margin-right: 6px;">
					<path d="M2.01 21L23 12 2.01 3 2 10l15 2-15 2z"/>
				</svg>
				댓글 작성
			</button>
		</form>
	</div>

	<!-- 댓글 목록 영역 -->
	<div id="commentArea">
</c:if>

<!-- 댓글 목록 (항상 표시) -->
<c:choose>
	<c:when test="${not empty comments}">
		<ul class="comment-list">
			<c:forEach var="comment" items="${comments}">
				<li class="comment-item" data-comment-id="${comment.commentId}">
					<div class="comment-author-info">
						<div style="display: flex; align-items: center; gap: 8px;">
							<svg width="20" height="20" viewBox="0 0 24 24" fill="#9ca3af">
								<path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
							</svg>
							<span class="comment-author">${comment.loginUser}</span>
						</div>
						<div style="display: flex; align-items: center; gap: 8px;">
							<span class="comment-date">${comment.createdDate}</span>
							<c:if test="${comment.edited}">
								<span class="edited-badge">(수정됨)</span>
							</c:if>
						</div>
					</div>
					
					<textarea id="comment-text-${comment.commentId}" 
							  class="comment-text" 
							  readonly>${comment.comment}</textarea>
					
					<div class="comment-actions">
						<!-- 답글 버튼 -->
						<button class="btn-comment reply btn-reply" data-comment-id="${comment.commentId}">
							<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
								<path d="M10 9V5l-7 7 7 7v-4.1c5 0 8.5 1.6 11 5.1-1-5-4-10-11-11z"/>
							</svg>
							답글
						</button>
						
						<!-- 본인 댓글일 때만 수정/삭제 버튼 표시 -->
						<c:if test="${not empty loginNo and loginNo eq comment.loginNo}">
							<button class="btn-comment edit btn-update" data-comment-id="${comment.commentId}">
								<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
									<path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/>
								</svg>
								수정
							</button>
							<button class="btn-comment delete btn-delete" data-comment-id="${comment.commentId}">
								<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
									<path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/>
								</svg>
								삭제
							</button>
						</c:if>
					</div>
					
					<!-- 대댓글 목록 (있는 경우) -->
					<c:if test="${not empty comment.replies}">
						<ul class="reply-list">
							<c:forEach var="reply" items="${comment.replies}">
								<li class="reply-item">
									<div class="comment-author-info">
										<div style="display: flex; align-items: center; gap: 8px;">
											<svg width="16" height="16" viewBox="0 0 24 24" fill="#9ca3af">
												<path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
											</svg>
											<span class="comment-author">${reply.loginUser}</span>
										</div>
										<div style="display: flex; align-items: center; gap: 8px;">
											<span class="comment-date">${reply.createdDate}</span>
											<c:if test="${reply.edited}">
												<span class="edited-badge">(수정됨)</span>
											</c:if>
										</div>
									</div>
									
									<textarea id="comment-text-${reply.commentId}" 
											  class="comment-text" 
											  readonly>${reply.comment}</textarea>
									
									<c:if test="${not empty loginNo and loginNo eq reply.loginNo}">
										<div class="comment-actions">
											<button class="btn-comment edit btn-update" data-comment-id="${reply.commentId}">
												<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
													<path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/>
												</svg>
												수정
											</button>
											<button class="btn-comment delete btn-delete" data-comment-id="${reply.commentId}">
												<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
													<path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/>
												</svg>
												삭제
											</button>
										</div>
									</c:if>
								</li>
							</c:forEach>
						</ul>
					</c:if>
				</li>
			</c:forEach>
		</ul>
	</c:when>
	
	<c:otherwise>
		<!-- 댓글 없음 상태 -->
		<div class="comment-empty">
			<svg viewBox="0 0 24 24" fill="currentColor">
				<path d="M20 2H4c-1.1 0-2 .9-2 2v18l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 14H6l-2 2V4h16v12z"/>
			</svg>
			<p>첫 번째 댓글을 작성해보세요!</p>
		</div>
	</c:otherwise>
</c:choose>

<!-- AJAX 요청이 아닐 때만 닫는 태그와 스크립트 포함 -->
<c:if test="${empty param.ajax}">
	</div>
</div>

<script>
// 답글 버튼 클릭 이벤트
document.addEventListener('click', function(e) {
	// 답글 버튼 클릭
	if (e.target.closest('.btn-reply')) {
		const commentId = e.target.closest('.btn-reply').dataset.commentId;
		const replyForm = document.getElementById('reply-form-' + commentId);
		
		// 모든 답글 폼 숨기기
		document.querySelectorAll('.reply-form-container').forEach(form => {
			form.style.display = 'none';
		});
		
		// 클릭한 댓글의 답글 폼만 표시
		replyForm.style.display = 'block';
		replyForm.querySelector('textarea').focus();
	}
	
	// 취소 버튼 클릭
	if (e.target.classList.contains('btn-cancel')) {
		const replyForm = e.target.closest('.reply-form-container');
		replyForm.style.display = 'none';
		replyForm.querySelector('textarea').value = '';
	}
});

// 답글 제출 이벤트 (필요시 AJAX로 처리)
document.addEventListener('submit', function(e) {
	if (e.target.classList.contains('reply-form')) {
		e.preventDefault();
		const parentId = e.target.dataset.parentId;
		const comment = e.target.querySelector('textarea').value;
		
		// 여기에 AJAX 코드 추가
		console.log('답글 작성:', { parentId, comment });
		
		// 성공 후 폼 초기화 및 숨기기
		// e.target.querySelector('textarea').value = '';
		// e.target.closest('.reply-form-container').style.display = 'none';
	}
});
</script>

<style>
/* 댓글 작성 버튼 아이콘 정렬 */
.comment-submit {
	display: inline-flex;
	align-items: center;
	justify-content: center;
}

/* 댓글 버튼 아이콘 정렬 */
.btn-comment {
	display: inline-flex;
	align-items: center;
	gap: 4px;
}

.btn-comment svg {
	opacity: 0.7;
}

.btn-comment:hover svg {
	opacity: 1;
}

/* 답글 버튼 스타일 */
.btn-reply {
	background: transparent;
	border: 1px solid #d1d5db;
	color: #6b7280;
}

.btn-reply:hover {
	background: #f3f4f6;
	border-color: var(--accent);
	color: var(--accent);
}

/* 수정됨 배지 */
.edited-badge {
	font-size: 12px;
	color: #9ca3af;
	font-style: italic;
}

/* 답글 작성 폼 */
.reply-form-container {
	margin-top: 16px;
	padding: 16px;
	background: #f9fafb;
	border-radius: 12px;
	border: 1px solid #e5e7eb;
}

.reply-form textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #d1d5db;
	border-radius: 8px;
	font-family: inherit;
	resize: vertical;
	margin-bottom: 12px;
}

.reply-form textarea:focus {
	outline: none;
	border-color: var(--accent);
}

.btn-cancel {
	padding: 8px 16px;
	background: #fff;
	border: 1px solid #d1d5db;
	border-radius: 6px;
	color: #6b7280;
	cursor: pointer;
	font-family: inherit;
}

.btn-cancel:hover {
	background: #f3f4f6;
}

.btn-submit-reply {
	padding: 8px 16px;
	background: var(--accent);
	border: none;
	border-radius: 6px;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
	display: inline-flex;
	align-items: center;
	font-family: inherit;
}

.btn-submit-reply:hover {
	background: #0a3fa0;
}

/* 대댓글 리스트 */
.reply-list {
	margin-top: 16px;
	padding-left: 40px;
	list-style: none;
}

.reply-item {
	background: #f9fafb;
	border-radius: 12px;
	padding: 16px;
	margin-bottom: 8px;
	border-left: 3px solid #e5e7eb;
}

.reply-item .comment-author-info {
	margin-bottom: 12px;
}

.reply-item .comment-text {
	background: #fff;
}

/* 댓글 없음 상태 */
.comment-empty {
	text-align: center;
	padding: 60px 20px;
	color: #9ca3af;
}

.comment-empty svg {
	width: 48px;
	height: 48px;
	fill: #d1d5db;
	margin-bottom: 16px;
}

.comment-empty p {
	margin: 8px 0 0 0;
	font-size: 15px;
	color: #6b7280;
}
</style>
</c:if>
