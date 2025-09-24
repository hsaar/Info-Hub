<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>키워드 검색</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
</head>
<body>





<!-- 메인 컨테이너 -->
<main class="main-container">
  <!-- 키워드 섹션 -->
  <section class="keyword-section">
    <h2 class="keyword-title">한 눈에 보는 정책 소식</h2>
    <div class="keyword-cloud">
      <button class="keyword-item size-1">키워드</button>
      <button class="keyword-item size-3">키워드</button>
      <button class="keyword-item size-2">키워드</button>
      <button class="keyword-item size-5">키워드</button>
      <button class="keyword-item size-1">키워드</button>
      <button class="keyword-item size-4">키워드</button>
      <button class="keyword-item size-2">키워드</button>
      <button class="keyword-item size-5">키워드</button>
      <button class="keyword-item size-1">키워드</button>
      <button class="keyword-item size-2">키워드</button>
      <button class="keyword-item size-3">키워드</button>
      <button class="keyword-item size-4">키워드</button>
      <button class="keyword-item size-1">키워드</button>
      <button class="keyword-item size-2">키워드</button>
    </div>
    <p class="help-text">today 키워드 선정하여 가장 최신 소식 혹은 이슈 소식을 키워드로 노출</p>
  </section>

  <!-- 사이드바 -->
  <aside>
    <!-- 오늘의 키워드 -->
    <div class="sidebar-panel">
      <div class="panel-header">
        <h3 class="panel-title">오늘의 키워드</h3>
        <button class="expand-btn">+</button>
      </div>
      <ul class="keyword-list">
        <li class="keyword-list-item">................................</li>
        <li class="keyword-list-item">................................</li>
        <li class="keyword-list-item">................................</li>
      </ul>
      <p class="help-text">오늘의 키워드 상단 목록<br>+ 버튼 클릭 시 오늘의 키워드 페이지로 이동</p>
    </div>

    <!-- 게시판 -->
    <div class="sidebar-panel">
      <div class="panel-header">
        <h3 class="panel-title">게시판</h3>
        <button class="expand-btn">+</button>
      </div>
      <div class="board-list">
        <div class="board-item">
          <span>────────</span>
          <span class="board-divider"></span>
          <span>────────</span>
        </div>
        <div class="board-item">
          <span>────────</span>
          <span class="board-divider"></span>
          <span>────────</span>
        </div>
        <div class="board-item">
          <span>────────</span>
          <span class="board-divider"></span>
          <span>────────</span>
        </div>
        <div class="board-item">
          <span>────────</span>
          <span class="board-divider"></span>
          <span>────────</span>
        </div>
        <div class="board-item">
          <span>────────</span>
          <span class="board-divider"></span>
          <span>────────</span>
        </div>
      </div>
      <p class="help-text">게시판 출력막전<br>+ 버튼 클릭 시 게시판 페이지로 이동</p>
    </div>
  </aside>
</main>

<!-- Top 버튼 -->
<button class="top-button" id="topButton" aria-label="맨 위로 이동">
  <svg viewBox="0 0 24 24">
    <path d="M12 4l-8 8h6v8h4v-8h6z"/>
  </svg>
</button>

<script>
  // Top 버튼 기능
  const topButton = document.getElementById('topButton');
  
  window.addEventListener('scroll', function() {
    if (window.scrollY > 300) {
      topButton.classList.add('show');
    } else {
      topButton.classList.remove('show');
    }
  });
  
  topButton.addEventListener('click', function() {
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  });

  // 탭 전환 기능
  const tabs = document.querySelectorAll('.tab');
  const keywordTitle = document.querySelector('.keyword-title');
  
  tabs.forEach(tab => {
    tab.addEventListener('click', function() {
      // 모든 탭에서 active 클래스 제거
      tabs.forEach(t => t.classList.remove('active'));
      // 클릭한 탭에 active 클래스 추가
      this.classList.add('active');
      
      // 제목 변경
      if (this.textContent === '정책') {
        keywordTitle.textContent = '한 눈에 보는 정책 소식';
      } else if (this.textContent === '혜택') {
        keywordTitle.textContent = '한 눈에 보는 혜택 소식';
      }
    });
  });
</script>

</body>
</html>