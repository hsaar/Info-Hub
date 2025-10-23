<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Random"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.infohub.project.login.LoginService"%>
<%@page
	import="org.springframework.web.context.request.RequestContextHolder"%>
<%@page
	import="org.springframework.web.context.request.ServletRequestAttributes"%>
<%@page import="com.infohub.project.article.ArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>noArticleContent</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/articleContent.css' />">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/wordcloud@1.1.2/src/wordcloud2.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
.action-btn {
    display: inline-flex;       /* 텍스트+아이콘 가로 정렬 */
    align-items: center;
    justify-content: center;
    padding: 8px 18px;          /* URL 버튼과 동일하게 */
    font-size: 0.8rem;
    border-radius: 25px;
    border: none;
    cursor: pointer;
    background-color: #eee;     /* 테스트용, 필요시 바꾸기 */
    transition: all 0.3s ease;
}
.action-btn svg {
    vertical-align: middle;
}

.btn-common {
   display: inline-block;
   font-size: 0.8rem;        /* 글자 크기 통일 */
   padding: 8px 18px;      /* 버튼 높이와 너비 통일 */
   border-radius: 25px;    /* 둥근 모서리 */
   border: none;
   cursor: pointer;
   transition: all 0.3s ease;
   text-align: center;
   position: relative;   /* 클릭 가능하도록 */
   z-index: 10;          /* 다른 요소 위로 */
   background-color: #eee; /* 테스트용 배경 */
}

.btn-common::before {
    pointer-events: none; /* 버튼 위 장식 요소 클릭 막지 않음 */
}

#keywordWordCloud {
  display: block;
  width: 100%;
  height: 230px;
  
}

/* 댓글 영역 전체 */
.comment-section {
    background-color: #fefefe;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    margin-top: 30px;
}

/* 댓글 제목 */
.comment-section h3 {
    font-size: 20px;
    margin-bottom: 20px;
    font-weight: bold;
    border-bottom: 2px solid #eee;
    padding-bottom: 8px;
}

/* 댓글 입력창과 버튼 한 줄 */
.comment-input-group {
    display: flex;
    gap: 10px;
    margin-bottom: 25px;
}

/* 입력창 */
.comment-input-group input[type="text"] {
    flex: 1;
    padding: 12px 15px;
    border: 1px solid #ccc;
    border-radius: 10px;
    font-size: 14px;
    transition: all 0.3s;
}

.comment-input-group input[type="text"]:focus {
    outline: none;
    border-color: #4A90E2;
    box-shadow: 0 0 6px rgba(74,144,226,0.3);
}

/* 아이콘 + userId + 날짜를 한 줄로 정렬 */
.comment-item-header {
    display: flex;           /* 가로 정렬 */
    align-items: center;     /* 수직 가운데 정렬 */
    margin-bottom: 5px;      /* 댓글 내용과 간격 */
}

/* userId 스타일 */
.comment-userId {
    font-weight: bold;
    margin-right: 10px;     /* 아이콘과 간격 */
}

/* 날짜 스타일 */
.comment-date {
    font-size: 12px;
    color: #888;
    border-bottom: none !important;
}


/* 등록 버튼 */
.comment-input-group button {
    padding: 12px 25px;
    background-color: #007BFF;
    color: #fff;
    font-weight: bold;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    transition: all 0.3s;
}

.comment-input-group button:hover {
    background-color: #357ABD;
}

/* 댓글 목록 */
#commentList .comment-item {
    background-color: #f9f9f9;
    padding: 15px 20px;
    border-radius: 10px;
    margin-bottom: 15px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    transition: all 0.2s;
}

#commentList .comment-item:hover {
    background-color: #f0f8ff;
}

/* 작성자 및 날짜 */
.comment-item strong {
    font-weight: bold;
    color: #333;
    margin-right: 10px;
}

.comment-item .comment-date {
    font-size: 12px;
    color: #888;
}

.comment-item {
    display: flex;
    flex-direction: column;
    background-color: #f9f9f9;
    padding: 15px 20px;
    border-radius: 10px;
    margin-bottom: 15px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    transition: all 0.2s;
}

.comment-item:hover {
    background-color: #f0f8ff;
}

/* 프로필 아이콘 */
.comment-profile {
    width: 32px;
    height: 32px;
    border-radius: 50%; /* 원형 */
    margin-right: 10px;
    vertical-align: middle;
}

.comment-profile-icon {
    display: inline-flex !important; /* 👈 flex로 중앙 정렬 강제 */
    justify-content: center !important;
    align-items: center !important;
    width: 32px !important;
    height: 32px !important;
    background-color: #4A90E2 !important;
    color: #fff !important;
    border-radius: 50% !important;
    margin-right: 10px !important;
    font-size: 16px !important;
    line-height: 1 !important; /* 👈 아이콘 위로 뜨는 원인 제거 */
    vertical-align: middle !important; /* inline 요소 기준 정렬 보정 */
}


/* 작성자, 날짜 flex 정렬 */
.comment-userId,
.comment-date {
    display: inline-block;
    vertical-align: middle;
}

.comment-userId {
    font-weight: bold;
    margin-right: 8px;
}

.comment-date {
    font-size: 12px;
    color: #888;
}


/* 댓글 내용 */
.comment-item p {
    margin: 8px 0 0 0;
    line-height: 1.5;
    color: #000 !important;
}

#commentInsertBtn i {
    margin-left: 6px; /* 글씨와 간격 */
    font-size: 16px;   /* 아이콘 크기 */
    vertical-align: middle; /* 글씨와 수직 정렬 */
}

.comment-section h3 i {
	margin-left: 15px; /* 앞쪽 여백 */
    color: #007BFF; /* 원하는 아이콘 색상 */
    font-size: 25px; /* 아이콘 크기 */
    vertical-align: middle; /* 글씨와 수직 정렬 */
}

.comment-count {
    display: inline-flex;           /* inline-block → inline-flex */
    justify-content: center;        /* 수평 가운데 */
    align-items: center;            /* 수직 가운데 */
    background-color: #007BFF;
    color: #fff;
    font-size: 14px;
    font-weight: bold;
    width: 22px;
    height: 22px;
    border-radius: 50%;
    text-align: center;
    margin-left: 5px;
    line-height: normal;            /* flex 사용 시 제거 */
}

.heart-icon {
  font-size: 24px; /* 크기 조절 */
  color: #ff4b5c; /* 색상 */
  
  vertical-align: middle;
}

.no-comment {
    border-bottom: none;
}

.comment-section h3.no-comment {
    border-bottom: none !important;
}

</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // 시계를 갱신하는 함수
    function updateClock() {
        const now = new Date();
        const options = {
            year: 'numeric',
            month: 'long',
            day: 'numeric',
            weekday: 'long',
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit',
            hour12: false
        };
        document.getElementById('realTimeClock').innerText = now.toLocaleString('ko-KR', options);
    }

    updateClock(); // 초기 실행
    setInterval(updateClock, 1000); // 1초마다 갱신
});
</script>

<!-- 댓글 관련 자바스크립트 -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						articleHearts();
						commentList();

						function commentList() {
							var article_articleId = $("#article_articleId")
									.val();

							url = "comment/listAll";
							var paramData = {
								"article_articleId" : article_articleId,
							};

							console.log(paramData);

							$
									.ajax({
										url : url, // 주소 -> controller 매핑주소
										data : paramData, // 요청데이터
										//dataType : "json",  // 데이터타입
										type : "post", // 전송방식
										success : function(result) {
											console.log(result.length);

											var htmls = "";

											if (result.length < 1) {
												htmls = htmls + '<h3 class="no-comment">등록된 댓글이 없습니다.</h3>';
											} else {
												$(result).each(function() {
													// htmls = htmls + '<div id="commentList' +this.comment_id + '">';
													//<div id="reno12"> <div id="reno13">
													htmls += '<div class="comment-item">';
									                htmls += '<div class="comment-item-header">';
									                htmls += ' <i class="fa-regular fa-user comment-profile-icon"></i>';
													htmls += '<strong>' + this.userId + '</strong>';
													htmls += '</div>';
													htmls += '<p>' + this.comment + '</p>';
													htmls += '<br>';
													htmls += '<span class="comment-date">작성일: ' + this.createdDate  + '</span>';
													htmls += '</div>';
													//htmls += '</div>';   
												}); // each End
											}
											$("#commentList").html(htmls);
											
											// 댓글 수 표시
							                 $("#commentCount").text(result.length);
										},
										error : function(data) {
											alert("에러" + data);
										}
									});
						}//commentList()

						function articleHearts() {
							var article_articleId = $("#article_articleId")
									.val();

							url = "articleHearts";
							var paramData = {
								"article_articleId" : article_articleId
							};

							console.log(paramData);

							$.ajax({
								url : url, // 주소 -> controller 매핑주소
								data : paramData, // 요청데이터
								dataType : "json", // 데이터타입
								type : "post", // 전송방식
								success : function(result) {
									console.log(result);

									var htmls = "";

									htmls += '♥ ' + result

									$("#heartsCount").html(htmls);
								},
								error : function(data) {
									alert("좋아요카운트 에러" + data);
								}
							});
						}
						; //articleHearts()
					});

	function clip() {

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
	}
	
	function downloadPDF() {
		  // ✅ 전체 영역 선택 (header 포함)
		  const element = document.getElementById('pdfArea');

		  // ✅ 고정된 요소도 캡처되도록 옵션 추가
		  html2canvas(element, {
		    scale: 2,
		    useCORS: true,
		    scrollY: 0,       // 스크롤 위치 무시
		    windowWidth: document.body.scrollWidth,
		    windowHeight: document.body.scrollHeight
		  }).then(canvas => {
		    const imgData = canvas.toDataURL('image/png');
		    const pdf = new jspdf.jsPDF('p', 'mm', 'a4');
		    const pageWidth = pdf.internal.pageSize.getWidth();
		    const pageHeight = pdf.internal.pageSize.getHeight();
		    const imgHeight = (canvas.height * pageWidth) / canvas.width;

		    let heightLeft = imgHeight;
		    let position = 0;

		    pdf.addImage(imgData, 'PNG', 0, position, pageWidth, imgHeight);
		    heightLeft -= pageHeight;

		    while (heightLeft > 0) {
		      position = heightLeft - imgHeight;
		      pdf.addPage();
		      pdf.addImage(imgData, 'PNG', 0, position, pageWidth, imgHeight);
		      heightLeft -= pageHeight;
		    }

		    pdf.save('article.pdf');
		  });
		}
	
	Kakao.init('50d17a154d919b83d81f7ff6cd356141');
	console.log(Kakao.isInitialized()); // true면 정상 초기화됨
	
	function shareKakao() {

		const shareUrl = window.location.href;

		  // 기사 제목, 요약 등 표시할 내용 (원하시는 대로 변경 가능)
		  const title = document.querySelector(".article-title")?.innerText || "기사 보기";
		  const description = "이 기사를 카카오톡에서 확인해보세요!";

		  Kakao.Link.sendDefault({
		    objectType: 'feed',
		    content: {
		      title: title,
		      description: description,
		      imageUrl: 'https://your-site.com/resources/img/logo.png', // 대표 이미지
		      link: {
		        mobileWebUrl: shareUrl,
		        webUrl: shareUrl
		      }
		    },
		    buttons: [
		      {
		        title: '기사 보러가기',
		        link: {
		          mobileWebUrl: shareUrl,
		          webUrl: shareUrl
		        }
		      }
		    ]
		  });
		}
	
</script>

</head>
<body>
	<div id="pdfArea">
	<!-- 상단바 -->
	<jsp:include page="../include/header.jsp" />

	<!-- 브레드크럼 -->
	<div class="breadcrumb">
    <div class="container">
      <span>현재시간 ></span>
      <span id="realTimeClock"></span>
    </div>
	</div>
	
	<!-- 네비게이션 -->
  	<div class="news-header">
    <nav class="news-nav">
      <a href="articleListAll">종합</a>
      <a href="articleListAll1">일자리취업</a>
      <a href="articleListAll2">주거/복지</a>
      <a href="articleListAll3">교육</a>
      <a href="articleListAll4">문화/여가</a>
      <a href="articleListAll5">건강/의료</a>
      <a href="articleListAll6">금융/경제</a>
    </nav>
	</div>

	<!-- 메인 컨테이너 -->
	<div class="news-container">
	<!-- 메인 콘텐츠 -->
	<main class="news-main">
		<h1 class="news-title">기사 상세조회</h1>

	<div class="container">
		
      <c:forEach var="article" items="${noArticleContent}">
    
      	<article class="article-main">
      		<!-- 카테고리 배지 -->
      		<span class="article-badge">${article.name}</span>
      		
      		<!-- 기사 제목 -->
            <h1 class="article-title">${article.title}</h1>
            
            <!-- 기사 메타 정보 -->
            <div class="article-meta">
            	<c:if test="${not empty article.link}">
                	<a href="${article.link}" target="_blank" class="article-meta-link">
                		<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                			<path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6M15 3h6v6M10 14L21 3"/>
                		</svg>
                		기사원문보기
                	</a>
                	<span class="meta-divider">|</span>
                </c:if>
                <span class="article-meta-item">
                	<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                		<path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"/>
                	</svg>
                	${article.source}
                </span>
                <span class="meta-divider">|</span>
                <span class="article-meta-item">
                	<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                		<rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
                		<line x1="16" y1="2" x2="16" y2="6"/>
                		<line x1="8" y1="2" x2="8" y2="6"/>
                		<line x1="3" y1="10" x2="21" y2="10"/>
                	</svg>
                	${article.published}
                </span>
                <span class="meta-divider">|</span>
                <span class="article-meta-item">
                	<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                		<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                		<circle cx="12" cy="12" r="3"/>
                	</svg>
                	${article.views}
                </span>
                <span class="meta-divider">|</span><span id="heartsCount"></span>
            </div>
            
            <!-- 액션 버튼 -->
            <div class="article-actions">
            	<button class="action-btn" onclick="shareKakao(); return false;">
				    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 48 48" fill="none" style="margin-right: 6px;">
				        <!-- 노란색 카카오톡 말풍선 -->
				        <circle cx="24" cy="24" r="24" fill="#FFEB00"/>
				        <!-- 검정색 카톡 로고 느낌 -->
				        <path d="M15 18h18v12H15z" fill="#3C1E1E"/>
				    </svg>
				    카카오톡<br>공유
				</button>
            	<button class="action-btn" onclick="clip(); return false;">
            		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            			<path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"/>
            			<path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"/>
            		</svg>
            		URL 복사
            	</button>
            	
            	<button class="action-btn" onclick="downloadPDF()">
	            	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
				    <path fill="#007BFF" d="M12 2C11.4477 2 11 2.44772 11 3V13.5858L7.70711 10.2929C7.31658 9.90237 6.68342 9.90237 6.29289 10.2929C5.90237 10.6834 5.90237 11.3166 6.29289 11.7071L11.2929 16.7071C11.6834 17.0976 12.3166 17.0976 12.7071 16.7071L17.7071 11.7071C18.0976 11.3166 18.0976 10.6834 17.7071 10.2929C17.3166 9.90237 16.6834 9.90237 16.2929 10.2929L13 13.5858V3C13 2.44772 12.5523 2 12 2ZM5 18C4.44772 18 4 18.4477 4 19C4 19.5523 4.44772 20 5 20H19C19.5523 20 20 19.5523 20 19C20 18.4477 19.5523 18 19 18H5Z"/>
					</svg>
	            	 PDF 다운
            	</button>
            </div>
            
            <!-- 기사 이미지 -->
            <img src="resources/image/${article.image}" alt="${article.title}" class="article-image">
            
            <!-- 기사 본문 -->
            <div class="article-content">
            	<p>${article.content}</p>
            </div>
            
      	</article>

		<!-- 댓글 -->
		<div class="comment-section">
		<h3><i class="fa-regular fa-comment" style="margin-right: 8px;"></i> 댓글
		<span id="commentCount" class="comment-count">0</span></h3>
						    
		<!-- 댓글 입력창 -->
		<div class="comment-input-group">
		<input type="hidden" name="article_articleId" id="article_articleId" value="${article.articleId}">
		</div>
		
		<div id="commentList"></div><br>
		</div>
						
	</c:forEach>

	</div>
	</main>
	<aside>
			<div class="sidebar-section">
				<h2>많이 본 기사</h2>
				<ol class="rank-list">
					<c:forEach var="article" items="${viewsArticle}" varStatus="status">
						<li><span class="rank-number">${status.index + 1}</span> <c:if
								test="${empty userId}">
								<a href="noArticleContent?articleId=${article.articleId}"
									style="font-size: 25; font-weight: bold;">${article.title}</a>
							</c:if> <c:if test="${not empty userId}">
								<a href="articleContent?articleId=${article.articleId}">${article.title}</a>
							</c:if></li>
					</c:forEach>
				</ol>
			</div>

			<div class="sidebar-section">
      <h2>정책 기사 키워드 Top 7</h2>
      
       <!-- 워드클라우드가 표시될 영역 -->
  	<canvas id="keywordWordCloud" width="450" height="400"></canvas>
	</div>

	<div class="sidebar-section">

	 <h2>포토·영상</h2>
	<div class="photo-grid">
	  <c:forEach var="article" items="${randomArticles}">
	  
	   <c:if test="${empty userId}">
	   <a href="noArticleContent?articleId=${article.articleId}">
	        <img src="<c:url value='/resources/image/' />${article.image}" 
	     alt="${article.image}" 
	     style="width: 270px; height: 190px;">
	    </a>
	   </c:if>
	  
	  <c:if test="${not empty userId}">
	    <a href="articleContent?articleId=${article.articleId}">
	        <img src="<c:url value='/resources/image/' />${article.image}" 
	     alt="${article.image}" 
	     style="width: 270px; height: 190px;">
	    </a>
	   </c:if>
	</c:forEach>
	</div>
	</div>
		</aside>
	</div>

	<!-- Top 버튼 -->
	<button class="top-button" id="topButton" aria-label="맨 위로 이동">
		<svg viewBox="0 0 24 24">
      <path d="M12 4l-8 8h6v8h4v-8h6z" />
    </svg>
	</button>

	<jsp:include page="../include/footer.jsp"/>
	</div>
	
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

		 $(document).ready(
			      function() {

			        // 인기 검색어 링크 클릭 이벤트
			        $('.keyword-link').on("click", function(event) {
			            event.preventDefault(); // 기본 링크 이동(href="#") 방지

			            // 1. 클릭된 키워드 텍스트를 가져옴
			            var keyword = $(this).data('keyword').trim(); // data-keyword 속성 사용 권장
			            var searchType = 'tc'; // 키워드 검색은 제목+내용(tc)으로 고정
			            var encodedKeyword = encodeURIComponent(keyword);

			            // 2. 키워드 로깅을 위한 AJAX 요청 (검색 카운트 증가)
			            $.ajax({
			                url: "logKeyword", // ArticleControl.java의 @PostMapping("logKeyword") 매핑
			                type: "POST",
			                data: { keyword: keyword },
			                success: function(response) {
			                    // 3. 로깅 성공/실패와 관계없이 검색 결과 페이지로 이동 (페이지는 1로 초기화)
			                    var redirectUrl = "articleListAll"
			                        + "?page=1&perPageNum=10" // perPageNum을 10으로 고정하거나, 직접 값을 넣습니다.
			                        + "&searchType=" + searchType
			                        + "&keyword=" + encodedKeyword;
			                    self.location = redirectUrl;
			                },
			                error: function(xhr, status, error) {
			                    console.error("키워드 로깅 실패. 검색은 진행합니다.", error);
			                    // 로깅 실패 시에도 검색 페이지로 이동
			                    var redirectUrl = "articleListAll"
			                        + "?page=1&perPageNum=10" // perPageNum을 10으로 고정하거나, 직접 값을 넣습니다.
			                        + "&searchType=" + searchType
			                        + "&keyword=" + encodedKeyword;
			                    self.location = redirectUrl;
			                }
			            });
			        });
			      }
			    );
</script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // topKeywords에서 단어와 count 가져오기
    const list = [
        <c:forEach var="keywordDTO" items="${topKeywords}" varStatus="status">
            ["${keywordDTO.skeyword}", ${keywordDTO.count}]<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    if (list.length === 0) return;

    WordCloud(document.getElementById('keywordWordCloud'), {
        list: list,
        gridSize: 18,
        weightFactor: function(count) {
            // 글자 크기 비율 설정
            const min = 30, max = 65;
            const counts = list.map(item => item[1]);
            const maxCount = Math.max(...counts);
            const minCount = Math.min(...counts);
            return min + (count - minCount) / (maxCount - minCount) * (max - min);
        },
        fontFamily: 'Gowun Dodum, sans-serif',
        color: () => {
            const colors = ['#2563eb','#dc2626','#16a34a','#9333ea','#f59e0b','#0ea5e9','#ef4444'];
            return colors[Math.floor(Math.random() * colors.length)];
        },
        rotateRatio: 1, // 회전 없이 단어만 표시
        backgroundColor: '#fff',

        // 클릭 이벤트
        click: function(item) {
            const keyword = item[0]; // 클릭한 단어만 가져오기
            const searchType = 'tc'; // 제목+내용 검색
            const encodedKeyword = encodeURIComponent(keyword);

            // 검색 로그 저장 후 검색 페이지 이동
            $.ajax({
                url: "logKeyword",
                type: "POST",
                data: { keyword: keyword },
                complete: function() {
                    window.location.href = "articleListAll?page=1&perPageNum=10&searchType=" + searchType + "&keyword=" + encodedKeyword;
                }
            });
        }
    });
});
</script>
 
</body>
</html>
