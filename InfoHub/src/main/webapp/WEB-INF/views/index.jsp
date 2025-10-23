<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String userId = request.getParameter("userId");
	String name = request.getParameter("name");
%>
<html lang="ko">

<head>
<title>정책 &amp; 혜택 – Mist Blue Theme</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"
	charset="UTF-8">
<%@ include file="include/plugin.jsp"%>

<!-- 타이틀용 세리프 + 본문 산세리프 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script>
$(document).ready(function() {
    const contextPath = "${pageContext.request.contextPath}";

    // 버튼 클릭과 엔터(폼 제출) 모두 처리
    $("#siteIndexForm").on("submit", function(e) {
        e.preventDefault(); // 페이지 리로드 방지
        const keyword = $("#homeSearchKeyword").val().trim();
        if (!keyword) {
            alert("검색어를 입력해주세요.");
            return;
        }
        // siteIndex.jsp로 이동
        window.location.href = contextPath + "/siteIndex?keyword=" + encodeURIComponent(keyword);
    });

    // 기존 버튼 클릭 이벤트는 필요 없음, submit 이벤트 하나로 통합 가능
});
</script>

<style>

.search-bar {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 6px; /* 아이템 간 간격 */
    margin-top: 50px;
    margin-bottom: -50px;
}

.search-bar input {
    width: 650px;
    height: 60px;
    padding: 10px 16px;
    border: none;
    border-radius: 30px;
    font-size: 1rem;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    outline: none;
}

.search-bar input:focus {
    background-color: #ffffff;
    box-shadow: 0 0 6px rgba(135, 206, 250, 0.7);
}

.search-bar button {
    padding: 8px 16px;
    border: 1px solid #87CEFA;
    background-color: #87CEFA;
    height: 60px;
    width: 80px;
    color: #fff;
    font-weight: bold;
    border-radius: 30px;
    cursor: pointer;
}

.search-bar button:hover { background-color: #2563eb; }

.reset-btn {
    border: 1px solid #ccc;
    background-color: #fff;
    color: #333;
    font-weight: bold;
    border-radius: 20px;
    margin-left: 6px;
    cursor: pointer;
    transition: 0.2s;
}

.reset-btn:hover { background-color: #f0f0f0; }

</style>


</head>

<body>
	<header class="main-header">
		  <!-- 상단바 -->
<jsp:include page="./include/header.jsp"/>
	</header>

	<!-- 메인 히어로(양분) -->
				<div class="search-bar">
			    <form id="siteIndexForm">
			    <input type="text" id="homeSearchKeyword" placeholder="검색어를 입력하세요">
			    <button type="submit" id="siteIndexBtn">검색</button>
				</form>
				</div>
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
							<h2 id="article" class="title">최신 기사</h2>
							<p class="desc">장학금·주거·교통·문화·건강 혜택을 프로필 기반으로 추천합니다.</p>
							<a class="panel-link" href="articleListAll" aria-label="전체기사 페이지로 이동"
								title="전체기사 페이지로 이동"></a>
						</div>
					</article>

					<!-- 우: 혜택(워터릴) -->
					<article class="col policy">
						<div class="inner">
							<span class="eyebrow">Benefits</span>
							<h2 class="title">지역별 정책 찾기</h2>
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
							<c:if test="${empty name}">
							<strong>로그인하고</strong> 여러 서비스를 <br>편리하게 이용하세요.
							</c:if>
							
							<c:if test="${not empty name}">
							<strong>${name}</strong>님 어서오세요. <br>
							<div style="font-size: 20px;">모든 서비스를 이용할 수 있습니다.</div>
							</c:if>
							
						</h3>
						
						<ul class="quick-links">
						
							<!-- 세션 없을때 -->
							<c:if test="${empty userId}">
							<li><a href="boardlistmain" class="dot-link"> 
								<span class="icon" style="mask: url('resources/image/clock.svg')"></span>
								<span>게시판</span>
							</a></li>
					
							<li><a href="login" class="dot-link"> 
								<span class="icon" style="mask: url('resources/image/post.svg')"></span>
								<span>맞춤형 기사 추천</span>
							</a></li>
							<li><a href="login" class="dot-link"> 
								<span class="icon" style="mask: url('resources/image/mypage.svg')"></span>
								<span>마이페이지</span>
							</a></li>
							<li><a href="newsSearch" class="dot-link"> 
								<span class="icon" style="mask: url('resources/image/alarm.svg')"></span>
								<span>실시간 관심 뉴스 피드</span>
							</a></li>
							</c:if>
							
							<!-- 세션 있을때 -->
							<c:if test="${not empty userId}">
							<li><a href="boardlistmain" class="dot-link"> 
								<span class="icon" style="mask: url('resources/image/clock.svg')"></span>
								<span>게시판</span>
							</a></li>
					
							<li><a href="myArticle" class="dot-link">
								<span class="icon" style="mask: url('resources/image/post.svg')"></span>
								<span>맞춤형 기사 추천</span>
							</a></li>
							<li><a href="mypage_main" class="dot-link"> 
								<span class="icon" style="mask: url('resources/image/mypage.svg')"></span>
								<span>마이페이지</span>
							</a></li>
							<li><a href="newsSearch" class="dot-link"> 
								<span class="icon" style="mask: url('resources/image/alarm.svg')"></span>
								<span>실시간 관심 뉴스 피드</span>
							</a></li>
							</c:if>
							
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
	(function() {
        function refreshCSS() {
            var sheets = [].slice.call(document.getElementsByTagName("link"));
            var head = document.getElementsByTagName("head")[0];
            for (var i = 0; i < sheets.length; ++i) {
                var elem = sheets[i];
                var parent = elem.parentElement || head;
                parent.removeChild(elem);
                var rel = elem.rel;
                if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
                    var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                    elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
                }
                parent.appendChild(elem);
            }
        }

    })();
	</script>

</body>
</html>