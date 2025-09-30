<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<form>
		<div class="form-group1">
			<table>
				<c:forEach var="comment" items="${comments}">
					<tr>
						<td>작성자 : ${comment.loginUser} 작성일자 : ${comment.createdDate}
						</td>
					</tr>
					<tr>
						<td><textarea name="rememo" rows="5" cols="40"
								readonly="readonly" class="form-control1">${comment.comment}</textarea>
						</td>
						<td><c:if test="${comment.loginNo eq sessionScope.loginNo}">
								<button type="button" class="btn btn-default"
									onclick="location.href='/comment/update?commentId=${comment.commentId}&boardNo=${comment.boardNo}'">
									댓글수정</button>
							</c:if></td>
					</tr>
					<!-- 대댓글 -->
					<c:forEach var="reply" items="${comment.replies}">
						<tr style="margin-left: 30px; background-color: #f9f9f9;">
							<td>작성자: ${reply.loginUser} | 작성일자: ${reply.createdDate}</td>
						</tr>
						<tr style="margin-left: 30px; backgrounds-color: #f9f9f9;">
							<td><textarea name="rememo" rows="4" cols="35" readonly
									class="form-control1">
                    ${reply.comment}
                </textarea></td>
							<td><c:if test="${reply.loginNo eq sessionScope.loginNo}">
									<button type="button" class="btn btn-default"
										onclick="location.href='/comment/update?commentId=${reply.commentId}&boardNo=${reply.boardNo}'">
										대댓글수정</button>
								</c:if></td>
						</tr>
					</c:forEach>
				</c:forEach>
			</table>
		</div>
		<script>
			$(function() {
				//댓글수정 버튼을 눌렀을 때 처리 : 수정해보기
				$(".btn-default").click(function() {
					location.href = "replyupdate?brdno?reno=" + $
					{
						boardreply.boardNo
					}
					+$
					{
						boardreply.reno
					}
				});
			})
		</script>

	</form>
					<!-- 댓글 작성 폼 -->

<div colspan="2">
    <form action="${pageContext.request.contextPath}/comment/add" method="post">
    <!-- input name을 CommentBoardVO의 필드 이름인 "boardNo"와 일치시킵니다. -->
    <input type="hidden" name="boardNo" value="${board.boardno}" />
    <input type="hidden" name="loginNo" value="1" />
    <textarea name="comment" rows="4" cols="50" placeholder="댓글을 입력하세요" required></textarea>
    <button type="submit">댓글쓰기</button>
</form>
    </div>

    <!-- 로그인 구현되면 이걸로 교체 value="${sessionScope.loginNo}" -->

</body>
</html>
<script>
$("#commentForm").submit(function(e) {
    e.preventDefault(); // 기존 form submit 막기

    $.post("${pageContext.request.contextPath}/comment/add",
        $(this).serialize(),
        function() {
            // 댓글 영역 새로고침
            $("#commentArea").load("${pageContext.request.contextPath}/comment/comments?boardNo=" + $("#boardNo").val());
            $("#commentText").val(""); // 입력란 초기화
        }
    );
});
</script>