<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>게시판</title>
</head>
<body>
	</h1>
	<a href="${pageContext.request.contextPath}/boardlistmain">
		<h5 class="box-title">커뮤니티 메인</h5>
	</a>
	<h2>
		<c:choose>
			<c:when test="${popular}">실시간 인기글</c:when>
			<c:when test="${category == 1}">10대 게시판</c:when>
			<c:when test="${category == 2}">20대 게시판</c:when>
			<c:when test="${category == 3}">30대 게시판</c:when>
			<c:when test="${category == 4}">40대 게시판</c:when>
			<c:when test="${category == 5}">50대 게시판</c:when>
			<c:otherwise>통합 게시판</c:otherwise>
		</c:choose>
	</h2>

	<table border="1" width="100%">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>

		<c:forEach var="board" items="${list}">
			<tr>
				<td>${board.boardno}</td>
				<td><c:choose>
						<c:when test="${empty board.title}">
							<a
								href="${pageContext.request.contextPath}/board/detail?boardno=${board.boardno}">
								제목 없음 </a>
						</c:when>
						<c:otherwise>
							<a
								href="${pageContext.request.contextPath}/board/detail?boardno=${board.boardno}">
								${board.title} </a>
						</c:otherwise>
					</c:choose></td>
				<td>${board.regiId}</td>
				<td>${board.regiDate}</td>
				<td>${board.readcnt}</td>
			
			</tr>
		</c:forEach>

		<c:if test="${empty list}">
			<tr>
				<td colspan="5" align="center">등록된 글이 없습니다.</td>
			</tr>
		</c:if>
	</table>

	<!-- 글쓰기 버튼 -->
	<div style="margin-top: 20px;">
		<input type="button" value="글쓰기"
			onclick="location.href='${pageContext.request.contextPath}/board/register?category=${category}'" />
	</div>

</body>
</html>