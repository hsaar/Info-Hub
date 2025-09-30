<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html lang="ko">

<head>
<title>정책 &amp; 혜택 – Mist Blue Theme</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"
	charset="UTF-8">
<%@ include file="include/plugin.jsp"%>
<%
	String userId = request.getParameter("userId");
	String name = request.getParameter("name");
%>
<!-- 타이틀용 세리프 + 본문 산세리프 -->
<link href="/resources/css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">

</head>

<body>
	<header class="header">
<!-- 상단바 -->
<jsp:include page="./include/header.jsp"/>
	</header>

	<!-- 메인 히어로(양분) -->
	<main class="hero">
		<div class="container layout">
			<!-- ⬇⬇ 왼쪽 컬럼 래퍼 추가 -->
			<section class="left-col">

				<!-- ⬇⬇ 인트로 카드 추가 -->
				<article class="card intro-card">
					<div class="card-body">
						<h1 class="page-title">나에게 맞는 지원, 지금 찾기</h1>
						<p class="eyebrow">
							프로필 기반 맞춤 추천으로 필요한 <strong>정책·혜택</strong>만 쏙쏙.
						</p>
					</div>
				</article>

				<section class="split">
					<!-- 좌: 정책 -->
					<article class="col benefit" aria-labelledby="benefit-title">
						<div class="inner">
							<span class="eyebrow">Articles</span>
							<h2 id="article" class="title">정책기사</h2>
							<p class="desc">장학금·주거·교통·문화·건강 혜택을 프로필 기반으로 추천합니다.</p>
							<a class="panel-link" href="articleListAll" aria-label="전체기사 페이지로 이동"
								title="전체기사 페이지로 이동"></a>
						</div>
					</article>

					<!-- 우: 혜택(워터릴) -->
					<article class="col policy">
						<div class="inner">
							<span class="eyebrow">Benefits</span>
							<h2 class="title">혜택</h2>
							<p class="desc">분야/지역/대상 필터와 마감일 알림으로, 필요한 정책만 빠르게 모아보세요.</p>
							<a class="panel-link" href="policy" aria-label="정책 페이지로 이동"
								title="정책 페이지로 이동"></a>
						</div>
					</article>
					
				</section>

			</section> <!-- ⬅ left-col 닫기 태그 추가 -->

			<aside class="sidebar">
				<article class="card login-panel" aria-labelledby="login-title">
					<div class="card-body">
						<h3 id="login-title" class="title"
							style="font-size: 24px; text-align: center;">
							<strong>로그인하고</strong> 여러 서비스를 <br>편리하게 이용하세요.
						</h3>

						<ul class="quick-links">
						
						<c:if test="${empty userId}">
							<li><a href="login" class="dot-link"> 
								<span class="icon" style="mask: url('resources/image/clock.svg')"></span>
								<span>내 혜택 모음[로그인필요]</span>
							</a></li>
						</c:if>
						
						<c:if test="${not empty userId}">
							<li><a href="myBenifit" class="dot-link"> 
								<span class="icon" style="mask: url('resources/image/clock.svg')"></span>
								<span>내 혜택 모음</span>
							</a></li>
						</c:if>
					
							<li><a href="customized_article" class="dot-link"> 
								<span class="icon" style="mask: url('resources/image/post.svg')"></span>
								<span>맞춤형 기사 추천</span>
							</a></li>
							<li><a href="mypage_main" class="dot-link"> 
								<span class="icon" style="mask: url('resources/image/mypage.svg')"></span>
								<span>마이페이지</span>
							</a></li>
							<li><a href="timeline" class="dot-link"> 
								<span class="icon" style="mask: url('resources/image/alarm.svg')"></span>
								<span>타임라인</span>
							</a></li>
							
							
							 
						</ul>

						<c:if test="${empty userId}">
						<a class="login-btn" href="login">로그인</a>
						</c:if>
						
						<c:if test="${not empty userId}">
						<a class="logout-btn"  href="<c:url value="logout"/>">로그아웃</a>
						</c:if>
					</div>
				</article>
			</aside>
		</div>

	</main>

	<footer class="footer">
		<%@ include file="include/footer.jsp"%>
	</footer>
	
	<!-- Code injected by live-server -->
	<script>
		// <![CDATA[  <-- For SVG support
		if ('WebSocket' in window) {
			(function() {
				function refreshCSS() {
					var sheets = [].slice.call(document
							.getElementsByTagName("link"));
					var head = document.getElementsByTagName("head")[0];
					for (var i = 0; i < sheets.length; ++i) {
						var elem = sheets[i];
						var parent = elem.parentElement || head;
						parent.removeChild(elem);
						var rel = elem.rel;
						if (elem.href && typeof rel != "string"
								|| rel.length == 0
								|| rel.toLowerCase() == "stylesheet") {
							var url = elem.href.replace(
									/(&|\?)_cacheOverride=\d+/, '');
							elem.href = url
									+ (url.indexOf('?') >= 0 ? '&' : '?')
									+ '_cacheOverride='
									+ (new Date().valueOf());
						}
						parent.appendChild(elem);
					}
				}
				var protocol = window.location.protocol === 'http:' ? 'ws://'
						: 'wss://';
				var address = window.location.origin + '/ws';
				var socket = new WebSocket(address);
				socket.onmessage = function(msg) {
					if (msg.data == 'reload')
						window.location.reload();
					else if (msg.data == 'refreshcss')
						refreshCSS();
				};
				if (sessionStorage
						&& !sessionStorage
								.getItem('IsThisFirstTime_Log_From_LiveServer')) {
					console.log('Live reload enabled.');
					sessionStorage.setItem(
							'IsThisFirstTime_Log_From_LiveServer', true);
				}
			})();
		} else {
			console
					.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
		}
		// ]]>
	</script>

</body>
</html>