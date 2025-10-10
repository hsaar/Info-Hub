<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 영역</title>
</head>
<body>
	<%-- 댓글/대댓글 목록 --%>
	<div id="commentArea">
		<div class="comment-list-area">
			<table style="width: 100%;">
				<c:forEach var="comment" items="${comments}">
					<tr style="border-top: 1px solid #ccc;">
						<td colspan="2"><strong>작성자:</strong> ${comment.loginUser}
							&nbsp;&nbsp; <c:choose>
								<c:when test="${empty comment.lastModified}">
									<span> | 등록일: ${comment.createdDate}</span>
								</c:when>
								<c:otherwise>
									<span> | 수정일: ${comment.lastModified}</span>
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<td style="width: 80%; padding: 5px;">
							<%-- id 추가 및 readonly 속성 부여 --%> <textarea
								id="comment-text-${comment.commentId}"
								data-comment-id="${comment.commentId}" rows="5" cols="40"
								readonly class="form-control1">${comment.comment}</textarea>
						</td>
						<td style="width: 20%; text-align: right;">
							<%-- [수정] 클래스를 btn-update로 변경 --%> <c:if
								test="${not empty sessionScope.loginNo and sessionScope.loginNo == comment.loginNo}">
								<button class="btn-update"
									data-comment-id="${comment.commentId}">댓글수정</button>
								<button class="btn-delete"
									data-comment-id="${comment.commentId}">댓글삭제</button>
							</c:if>
						</td>
					</tr>
					<!-- 대댓글 (수정 기능은 복잡해지므로 일단 기존대로 페이지 이동 방식 유지) -->
					<c:forEach var="reply" items="${comment.replies}">
						<tr style="margin-left: 30px; background-color: #f9f9f9;">
							<td colspan="2" style="padding-left: 30px;">↳ <strong>${reply.loginUser}</strong>
								(${reply.createdDate})
							</td>
						</tr>
						<tr style="backgrounds-color: #f9f9f9;">
							<td style="width: 80%; padding: 5px; padding-left: 30px;"><pre
									style="white-space: pre-wrap; margin: 0;">${reply.comment}</pre>
							</td>
							<td style="width: 20%; text-align: right;"><c:if
									test="${not empty sessionScope.loginNo and sessionScope.loginNo == comment.loginNo}">
									<button type="button" class="btn btn-default btn-small"
										onclick="redirectToCommentUpdate('${reply.commentId}', '${reply.boardno}')">
										대댓글수정</button>
								</c:if></td>
						</tr>
					</c:forEach>
				</c:forEach>
			</table>
		</div>

		<%-- 댓글 작성 폼 (boarddetail.jsp의 AJAX로 처리) --%>
		<div style="margin-bottom: 20px;">
			<form id="commentForm"
				action="${pageContext.request.contextPath}/comment/add"
				method="post">
				<%-- boardno, loginNo는 VO 필드명에 맞게 소문자 boardno 사용 --%>
				      <input type="hidden" name="boardno" value="${board.boardno}" />
				<input type="hidden" name="loginNo" value="${sessionScope.loginNo}" />
				       
				<textarea name="comment" rows="4" cols="50" placeholder="댓글을 입력하세요"
					required></textarea>
				       
				<button type="submit">댓글쓰기</button>
			</form>
			   
		</div>
	</div>
</body>
</html>
