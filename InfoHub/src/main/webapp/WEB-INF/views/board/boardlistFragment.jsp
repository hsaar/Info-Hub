<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="board-list-fragment-wrapper" data-has-more="${hasMore}"
	data-next-page="${nextPage}">
	<div class="board-list">
		<!-- 게시판 헤더 -->
		<div class="board-header">
			<div class="board-number">번호</div>
			<div class="board-title">제목</div>
			<div class="board-author">작성자</div>
			<div class="board-date">등록일</div>
			<div class="board-views">조회수</div>

		</div>

		<!-- 게시글 목록 -->
		<c:forEach var="board" items="${list}" varStatus="status">
			<div
				class="board-item ${board.isNotice ? 'notice-item' : ''} clickable"
				data-boardno="${board.boardno}">
				<div class="board-number">${board.isNotice ? '공지' : board.boardno}</div>
				<div class="board-title">
					<c:if test="${board.isNotice}">
						<span class="notice-badge">공지</span>
					</c:if>
					<c:if test="${not empty board.categoryId and not board.isNotice}">
						<span class="category-badge">${board.categoryName}</span>
					</c:if>
					<span class="board-title-text">${board.title}</span>
						<c:if test="${board.imagePath != null && board.imagePath ne ''}">
						<span class="image-badge"><i class="fa-solid fa-image"></i></span>
					</c:if>
					<c:if test="${board.commentCount > 0}">
						<span class="comment-count">[${board.commentCount}]</span>
					</c:if>
					<c:if test="${board.heartCount > 1}">
						<span class="hot-badge">HOT</span>
					</c:if>
				</div>

				<div class="board-author">${board.regiId}</div>
				<div class="board-date">${board.regiDate}</div>
				<div class="board-views">${board.readcnt}</div>
			</div>
		</c:forEach>
		<!-- 페이지네이션 -->
		<c:if test="${totalPages > 1}">
			<nav class="pagination-nav">
				<c:if test="${currentPage > 1}">
					<a
						href="<c:url value='/listmain?page=${currentPage - 1}&category=${param.categoryId}&sort=${param.sort}' />"
						class="page-arrow">‹</a>
				</c:if>

				<c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
					<a
						href="<c:url value='/listmain?page=${pageNum}&category=${param.categoryId}&sort=${param.sort}' />"
						class="page-number ${currentPage == pageNum ? 'active' : ''}">${pageNum}</a>
				</c:forEach>

				<c:if test="${currentPage < totalPages}">
					<a
						href="<c:url value='/board?page=${currentPage + 1}&category=${param.categoryId}&sort=${param.sort}' />"
						class="page-arrow">›</a>
				</c:if>
			</nav>
		</c:if>
	</div>
</div>
