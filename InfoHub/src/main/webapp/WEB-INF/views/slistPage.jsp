<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>누림 — 기사검색</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<style>
.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}
</style>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<!-- 상단바 -->
	<%@ include file="../views/include/header.jsp"%>

	<!-- 네비게이션 -->
	<div class="news-header">
	<nav class="news-nav">
      <a href="articleListAll">종합</a>
      <a href="articleListAll1">부동산</a>
      <a href="articleListAll2">주식</a>
      <a href="articleListAll3">적금</a>
      <a href="articleListAll4">복지</a>
      <a href="articleListAll5">창업</a>
      <a href="slistPage" class="active">기타</a>
    </nav>
	</div>

	<!-- 브레드크럼 -->
	<div class="breadcrumb">
		<div class="container">
			<a href="#">공지사항</a> <span>></span> <span>2025년 3/4분기 입회심사 결과</span>
		</div>
	</div>

	<!-- 메인 컨테이너 -->
		<!-- 메인 콘텐츠 -->
			<h1 class="news-title">검색기사 조회</h1>


				<table border="1" cellpadding="20" cellspacing="0">
					<tr>
						<th>Article ID</th>
						<th>Title</th>
						<th>Category</th>
						<th>Published</th>
						<th>Image</th>
						<th>Content</th>
						<th>Source</th>
						<th>Hearts</th>
						<th>Tags</th>
					</tr>

					<c:forEach var="article" items="${articleListAll}">
						<tr>
							<td>${article.article_id}</td>
							<td>${article.title}</td>
							<td>${article.article_categories_categories_id}</td>
							<td>${article.published}</td>
							<td>${article.image}</td>
							<td>${article.content}</td>
							<td>${article.source}</td>
							<td>${article.hearts}</td>
							<td>${article.tags}</td>
						</tr>
					</c:forEach>
				</table>

				
		<!-- 사이드바 -->
		<aside>
			<div class="sidebar-section">
				<h2>많이 본 기사</h2>
				<ol class="rank-list">
					<li><span class="rank-number">1</span> <a href="#">인더스트리뉴스,
							제7회 인터넷신문 대상 수상</a></li>
					<li><span class="rank-number">2</span> <a href="#">[오늘의
							언론동향] 2025년 9월 5일 금요일</a></li>
					<li><span class="rank-number">3</span> <a href="#">투데이신문,
							제8회 청년플러스포럼 'NEW Green Generation: ...'</a></li>
					<li><span class="rank-number">4</span> <a href="#">한국인터넷신문협회,
							언론 정부직 손배제 강령 추진에 강력 반대</a></li>
					<li><span class="rank-number">5</span> <a href="#">[신연수
							칼럼] 누가 누구를 개혁하는가?</a></li>
				</ol>
			</div>

			<div class="sidebar-section">
				<h2>포토·영상</h2>
				<div class="photo-grid">
					<div class="photo-item"></div>
					<div class="photo-item"></div>
				</div>
			</div>
		</aside>
		
		<!-- Top 버튼 -->
		<button class="top-button" id="topButton" aria-label="맨 위로 이동">
			<svg viewBox="0 0 24 24">
      			<path d="M12 4l-8 8h6v8h4v-8h6z" />
    		</svg>
	    </button>

		<footer class="container"
			style="text-align: center; padding: 40px 0; color: #6b7280;">
			© 2025 누림 — Mist Blue Theme </footer>

		<script>
			// Top 버튼 기능
			const topButton = document.getElementById('topButton');

			// 스크롤 시 버튼 표시/숨김
			window.addEventListener('scroll', function() {
				if (window.scrollY > 300) {
					topButton.classList.add('show');
				} else {
					topButton.classList.remove('show');
				}
			});

			// 버튼 클릭 시 맨 위로 스크롤
			topButton.addEventListener('click', function() {
				window.scrollTo({
					top : 0,
					behavior : 'smooth'
				});
			});
	        //검색버튼
			$(document).ready(
					function() {

						$('#searchBtn').on(
								"click",
								function(event) {

									self.location = "slistPage"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ encodeURIComponent($('#keyword')
													.val());
								});
						$('#newBtn').on("click", function(evt) {

							self.location = "slistPage";

						});

					});
			//페이지
			$(function() {
				//perPageNum select 박스 설정
				setPerPageNumSelect();
				//searchType select 박스 설정
				setSearchTypeSelect();

				var canPrev = '${pageMaker.prev}';
				if (canPrev !== 'true') {
					$('#page-prev').addClass('disabled');
				}

				var canNext = '${pageMaker.next}';
				if (canNext !== 'true') {
					$('#page-next').addClass('disabled');
				}

				var thisPage = '${pageMaker.cri.page}';

				$('#page' + thisPage).addClass('active');
			})

			function setPerPageNumSelect() {
				var perPageNum = '${pageMaker.cri.perPageNum}';
				var $perPageSel = $('#perPageSel');
				var thisPage = '${pageMaker.cri.page}';

				$perPageSel.val(perPageNum).prop("selected", true);
				$perPageSel.on('change', function() {
					window.location.href = "slistPage?page=" + thisPage
							+ "&perPageNum=" + $perPageSel.val();
				})
			}
			
			//검색
			function setSearchTypeSelect() {
				var searchType = $('#searchType');
				var keyword = $('#keyword');

				var searchTypeSel = searchType.val(
						'${pageMaker.cri.searchType}').prop("selected", true);
				//검색 버튼이 눌리면
				$('#searchBtn').on(
						'click',
						function() {

							var searchTypeVal = searchTypeSel.val();
							var keywordVal = keyword.val();
							//검색 조건 입력 안했으면 경고창 
							if (!searchTypeVal || searchTypeVal == "n") {
								alert("검색 조건을 선택하세요!");
								searchTypeSel.focus();
								return;
								//검색어 입력 안했으면 검색창
							} else if (!keywordVal) {
								alert("검색어를 입력하세요!");
								keyword.focus();
								return;
							}
							var url = "slistPage?page=1" 
									+ "&perPageNum="
									+ "${pageMaker.cri.perPageNum}"
									+ "&searchType=" + searchTypeVal
									+ "&keyword="
									+ encodeURIComponent(keywordVal);
							window.location.href = url;
						})
			}
		</script>
</body>
</html>