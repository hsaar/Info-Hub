<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%
	String userId = request.getParameter("userId");
	String name = request.getParameter("name");
%>
<header class="topbar">
	<nav class="nav">
		<a class="logo" href="<c:url value='/'/>">INFO HUB</a>
		<ul class="menu">
			<li><a href="article_home">기사</a></li>
			<li><a href="timeline">타임라인</a></li>
			<li><a href="registrationlistAll">정책 및 혜택 바로가기</a></li>
			<li><a href="my_benifit">내 혜택 모아보기</a></li>
			<li><a href="customized_article">맞춤형 기사 추천</a></li>
			<li><a href="board_main">게시판</a></li>
			
				<c:if test="${empty userId}">
					<li style="padding-top: 7px; color: white">[비회원]</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="login"/>">로그인 </a></li>
				</c:if>
				<c:if test="${not empty userId}">
					<li style="padding-top: 7px; color: white">[${userId}]님 어서오세요</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="logout"/>">로그아웃 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="myinfo?name=${userId}"/>">회원 수정</a></li>
				</c:if>
			
		</ul>
	</nav>
</header>
