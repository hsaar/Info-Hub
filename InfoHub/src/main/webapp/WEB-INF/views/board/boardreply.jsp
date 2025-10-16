<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- AJAX 요청이 아닐 때만 댓글 섹션 헤더와 작성 폼 표시 -->
<c:if test="${empty param.ajax}">
	<div class="comment-section">
		<!-- 댓글 헤더 -->
		<div class="comment-header">
			<h3 class="comment-title">
				댓글 <span id="commentCount">(${not empty comments ? comments.size() : 0})</span>
			</h3>
		</div>

		<!-- 댓글 작성 폼 (메인 댓글용) -->
		<div class="comment-form">
			<form id="commentForm">
				<input type="hidden" name="parentCommentId" value="">
				<textarea name="comment" class="comment-textarea" rows="4"
					placeholder="댓글을 입력하세요..." required></textarea>
				<button type="submit" class="comment-submit">
					<svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"
						style="margin-right: 6px;">
					<path d="M2.01 21L23 12 2.01 3 2 10l15 2-15 2z" />
				</svg>
					댓글 작성
				</button>
			</form>
		</div>

		<!-- 댓글 목록 영역 -->
		<div id="commentArea">
</c:if>

<!-- 댓글 목록 -->
<c:choose>
	<c:when test="${not empty comments}">
		<ul class="comment-list">
			<c:forEach var="comment" items="${comments}">
				<c:if
					test="${empty comment.parentCommentId or comment.parentCommentId == 0}">
					<li class="comment-item" data-comment-id="${comment.commentId}">

						<!-- 부모 댓글 --> <c:choose>
							<c:when test="${comment.isDeleted == 1}">
								<p class="deleted-comment"
									style="color: #9ca3af; font-style: italic; padding: 6px 0;">
									이 댓글은 작성자에 의해 삭제되었습니다.</p>
							</c:when>
							<c:otherwise>
								<div class="comment-author-info">
									<span class="comment-author">${comment.loginUser}</span>
									<div class="comment-date-wrapper">
										<span class="comment-date"> ${empty comment.lastModified ? comment.createdDate : comment.lastModified}
										</span>
										<c:if test="${not empty comment.lastModified}">
											<span class="edited-badge">(수정됨)</span>
										</c:if>
									</div>
								</div>
								<textarea id="comment-text-${comment.commentId}"
									class="comment-text" readonly>${comment.comment}</textarea>
								<div class="comment-actions">
									<button class="btn-comment reply btn-reply"
										data-comment-id="${comment.commentId}">답글</button>
									<c:if
										test="${not empty loginNo and loginNo eq comment.loginNo}">
										<button class="btn-comment edit btn-update"
											data-comment-id="${comment.commentId}">수정</button>
										<button class="btn-comment delete btn-delete"
											data-comment-id="${comment.commentId}">삭제</button>
									</c:if>
								</div>
							</c:otherwise>
						</c:choose> <!-- 답글 폼 -->
						<div class="reply-form-container"
							id="reply-form-${comment.commentId}"
							data-parent-id="${comment.commentId}"
							style="display: none; margin-left: 40px;">
							<form class="reply-form" data-parent-id="${comment.commentId}">
								<textarea name="reply" class="reply-textarea"
									placeholder="답글을 입력하세요..." required></textarea>
								<div style="margin-top: 5px;">
									<button type="submit" class="btn-submit-reply">등록</button>
									<button type="button" class="btn-cancel">취소</button>
								</div>
							</form>
						</div> <!-- 대댓글 --> <c:if test="${not empty comment.replies}">
							<ul class="reply-list">
								<c:forEach var="reply" items="${comment.replies}">
									<li class="reply-item"><c:choose>
											<c:when test="${reply.isDeleted == 1}">
												<p class="deleted-comment"
													style="color: #9ca3af; font-style: italic; padding: 4px 0;">
													이 댓글은 작성자에 의해 삭제되었습니다.</p>
											</c:when>
											<c:otherwise>
												<div class="comment-author-info">
													<span class="comment-author">${reply.loginUser}</span><div class="comment-date-wrapper">
										<span class="comment-date"> ${empty comment.lastModified ? comment.createdDate : comment.lastModified}
										</span>
										<c:if test="${not empty comment.lastModified}">
											<span class="edited-badge">(수정됨)</span>
										</c:if>
									</div>
												</div>
												<textarea id="comment-text-${reply.commentId}"
													class="comment-text" readonly>${reply.comment}</textarea>
												<c:if
													test="${not empty loginNo and loginNo eq reply.loginNo}">
													<div class="comment-actions">
														<button class="btn-comment edit btn-update"
															data-comment-id="${reply.commentId}">수정</button>
														<button class="btn-comment delete btn-delete"
															data-comment-id="${reply.commentId}">삭제</button>
													</div>
												</c:if>
											</c:otherwise>
										</c:choose></li>
								</c:forEach>
							</ul>
						</c:if>

					</li>
				</c:if>
			</c:forEach>
		</ul>
	</c:when>
	<c:otherwise>
		<div class="comment-empty">첫 번째 댓글을 작성해보세요!</div>
	</c:otherwise>
</c:choose>

<c:if test="${empty param.ajax}">
	</div>
	</div>

	<script>
	// 답글 버튼
	document.addEventListener('click', function(e) {
		if(e.target.closest('.btn-reply')) {
			const commentId = e.target.closest('.btn-reply').dataset.commentId;
			document.querySelectorAll('.reply-form-container').forEach(form => form.style.display='none');
			const replyForm = document.getElementById('reply-form-' + commentId);
			replyForm.style.display = 'block';
			replyForm.querySelector('textarea').focus();
		}
		if(e.target.classList.contains('btn-cancel')) {
			const replyForm = e.target.closest('.reply-form-container');
			replyForm.style.display = 'none';
			replyForm.querySelector('textarea').value = '';
		}
	});

	// 삭제된 댓글/대댓글 버튼 숨김 및 작성자 숨김
	document.addEventListener('DOMContentLoaded', function() {
		document.querySelectorAll('.comment-item, .reply-item').forEach(function(item) {
			const deleted = item.querySelector('.deleted-comment');
			if(deleted) {
				const actions = item.querySelector('.comment-actions');
				if(actions) actions.style.display = 'none';
				const author = item.querySelector('.comment-author');
				if(author) author.style.display = 'none';
			}
		});
	});
	</script>

	<style>
/* 댓글/답글 버튼 정렬, 수정됨 배지, 대댓글 스타일 유지 */
.comment-submit {
	display: inline-flex;
	align-items: center;
	justify-content: center;
}

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

.btn-reply {
	background: transparent;
	border: 1px solid #d1d5db;
	color: #6b7280;
}

.btn-reply:hover {
	background: #f3f4f6;
	border-color: var(- -accent);
	color: var(- -accent);
}

.comment-date-wrapper {
	display: flex;
	justify-content: flex-end; /* 오른쪽 정렬 */
	gap: 6px; /* 날짜와 수정됨 배지 사이 간격 */
	font-size: 12px;
	color: #9ca3af;
}

.edited-badge {
	font-size: 12px;
	color: #9ca3af;
	font-style: italic;
}

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
	border-color: var(- -accent);
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
	background: var(- -accent);
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

.comment-empty {
	text-align: center;
	padding: 60px 20px;
	color: #9ca3af;
}
</style>
</c:if>
