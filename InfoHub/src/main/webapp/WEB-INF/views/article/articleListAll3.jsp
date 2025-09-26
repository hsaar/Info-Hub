<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
   <title>3-articleListAll</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">

</head>
<body>

<!-- 상단바 -->
<%@ include file="../include/main_header.jsp"%>

<!-- 네비게이션 -->
  	<div class="news-header">
    <nav class="news-nav">
      <a href="articleListAll">종합</a>
      <a href="articleListAll1">부동산</a>
      <a href="articleListAll2">주식</a>
      <a href="articleListAll3" class="active">적금</a>
      <a href="articleListAll4">복지</a>
      <a href="articleListAll5">창업</a>
      <a href="#">기타</a>
    </nav>
	</div>
	
	<!-- 브레드크럼 -->
	<div class="breadcrumb">
    <div class="container">
      <a href="#">공지사항</a>
      <span>></span>
      <span>2025년 3/4분기 입회심사 결과</span>
    </div>
	</div>

       <!-- 메인 컨테이너 -->
	<div class="news-container">
    <!-- 메인 콘텐츠 -->
    <main class="news-main">
      <h1 class="news-title">
  		 적금 최신기사 조회
		</h1>

	<table class="news-item">
  
      <tr>
         <th>  </th>
         
      </tr>
      <c:forEach var="article" items="${articleListAll3}"> <!-- JSTL의 반복문 -->
         <tr>
         
            <td><br>
         	<div class="news-item">
      		
      		
			
            <h3><a href="articleContent?articleId=${article.articleId}">${article.title}</a></h3>
            <p class="news-summary">${article.content}(기사내용)</p>
      		<div class="news-meta">
            ${article.name} | ${article.source}<br>
            ${article.published}<br>
            ♥${article.hearts}
            </div>
            
            <div class="news-thumb">
            <img src="resources/image/${article.image }" alt="${article.image }" style=" width: 250px; height: 180px;">
      		</div>
           
          	</div>
          	</td>
            
         </tr>
      </c:forEach>
   </table>
   
   <!-- 페이지네이션 -->
      <nav class="pagination">
        <a href="#" class="page-btn">이전</a>
        <a href="#" class="page-btn active">1</a>
        <a href="#" class="page-btn">2</a>
        <a href="#" class="page-btn">3</a>
        <a href="#" class="page-btn">다음</a>
      </nav>
    

    </main> 
    <!-- 사이드바 -->
    <aside>
      <div class="sidebar-section">
        <h2>많이 본 기사</h2>
        <ol class="rank-list">
          <li>
            <span class="rank-number">1</span>
            <a href="#">인더스트리뉴스, 제7회 인터넷신문 대상 수상</a>
          </li>
          <li>
            <span class="rank-number">2</span>
            <a href="#">[오늘의 언론동향] 2025년 9월 5일 금요일</a>
          </li>
          <li>
            <span class="rank-number">3</span>
            <a href="#">투데이신문, 제8회 청년플러스포럼 'NEW Green Generation: ...'</a>
          </li>
          <li>
            <span class="rank-number">4</span>
            <a href="#">한국인터넷신문협회, 언론 정부직 손배제 강령 추진에 강력 반대</a>
          </li>
          <li>
            <span class="rank-number">5</span>
            <a href="#">[신연수 칼럼] 누가 누구를 개혁하는가?</a>
          </li>
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
   </div>
 


  <!-- Top 버튼 -->
  <button class="top-button" id="topButton" aria-label="맨 위로 이동">
    <svg viewBox="0 0 24 24">
      <path d="M12 4l-8 8h6v8h4v-8h6z"/>
    </svg>
  </button>
   
  <footer class="container" style="text-align: center; padding: 40px 0; color: #6b7280;">
    © 2025 누림 — Mist Blue Theme
  </footer>
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
        top: 0,
        behavior: 'smooth'
      });
    });
  </script>  
</body>
</html>
