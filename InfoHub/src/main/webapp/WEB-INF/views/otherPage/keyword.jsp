<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

<!-- 헤더 영역 (필요시 추가) -->
<header class="search-header">
  <div class="container">
    <div class="search-bar">
      <div class="search-input-wrapper">
        <input type="text" class="search-input" placeholder="검색어를 입력하세요">
        <span class="search-icon">🔍</span>
      </div>
    </div>
  </div>
</header>

<!-- 탭 영역 -->
<div class="tabs-container">
  <div class="container">
    <div class="tabs">
      <button class="tab active">정책</button>
      <button class="tab">혜택</button>
    </div>
  </div>
</div>

<!-- 메인 컨테이너 -->
<main class="main-container">
  <div class="container">
    <div class="keyword-layout">
      <!-- 왼쪽: 키워드 클라우드/게시판 슬라이드 -->
      <section class="keyword-section">
        <div class="slide-header">
          <h2 class="keyword-title">한 눈에 보는 정책 소식</h2>
          <div class="slide-controls">
            <button class="slide-btn active" data-slide="0">키워드</button>
            <button class="slide-btn" data-slide="1">게시판</button>
          </div>
        </div>
        
        <div class="slide-container">
          <!-- 슬라이드 1: 키워드 클라우드 (이미지와 동일) -->
          <div class="slide-content active" data-slide="0">
            <div class="keyword-cloud">
              <button class="keyword-item size-3">대출</button>
              <button class="keyword-item size-4">청년통장</button>
              <button class="keyword-item size-2">예금통장</button>
              <button class="keyword-item size-5">민생회복</button>
              <button class="keyword-item size-2">위안지</button>
              <button class="keyword-item size-3">복지</button>
              <button class="keyword-item size-1">대출</button>
              <button class="keyword-item size-2">행복주택</button>
              <button class="keyword-item size-5">주택자금</button>
              <button class="keyword-item size-4">생생페이백</button>
              <button class="keyword-item size-2">복지</button>
              <button class="keyword-item size-3">청년</button>
              <button class="keyword-item size-1">지원</button>
            </div>
            <p class="help-text">today 키워드 선정하여 가장 최신 소식 혹은 이슈 소식을 키워드로 노출</p>
          </div>
          
          <!-- 슬라이드 2: 게시판 -->
          <div class="slide-content" data-slide="1">
            <div class="board-content">
              <div class="board-grid">
                <div class="board-item">
                  <div class="board-category">공지사항</div>
                  <div class="board-title">2025년 청년정책 신규 지원사업 안내</div>
                  <div class="board-date">2025.01.15</div>
                </div>
                <div class="board-item">
                  <div class="board-category">정책뉴스</div>
                  <div class="board-title">민생회복 지원금 신청 방법 및 일정</div>
                  <div class="board-date">2025.01.14</div>
                </div>
                <div class="board-item">
                  <div class="board-category">혜택정보</div>
                  <div class="board-title">주택자금 대출 금리 인하 혜택</div>
                  <div class="board-date">2025.01.13</div>
                </div>
                <div class="board-item">
                  <div class="board-category">공지사항</div>
                  <div class="board-title">생생페이백 카드 신규 가맹점 추가</div>
                  <div class="board-date">2025.01.12</div>
                </div>
                <div class="board-item">
                  <div class="board-category">정책뉴스</div>
                  <div class="board-title">청년 취업지원 프로그램 확대 운영</div>
                  <div class="board-date">2025.01.11</div>
                </div>
                <div class="board-item">
                  <div class="board-category">혜택정보</div>
                  <div class="board-title">행복주택 입주자 모집 공고</div>
                  <div class="board-date">2025.01.10</div>
                </div>
              </div>
            </div>
            <p class="help-text">최신 정책 소식과 공지사항을 확인하세요</p>
          </div>
        </div>
      </section>

      <!-- 오른쪽: 오늘의 키워드 패널 -->
      <aside class="keyword-sidebar">
        <div class="today-keywords-panel">
          <div class="panel-header">
            <h3 class="panel-title">오늘의 키워드</h3>
            <div class="panel-icon">
              <svg width="48" height="48" viewBox="0 0 48 48" fill="none">
                <circle cx="24" cy="16" r="3" fill="#fff"/>
                <circle cx="16" cy="28" r="3" fill="#fff"/>
                <circle cx="32" cy="28" r="3" fill="#fff"/>
                <path d="M20 18c-1 3-2 6-4 10M28 18c1 3 2 6 4 10M24 32c0-4-2-6-4-6M24 32c0-4 2-6 4-6" 
                      stroke="#fff" stroke-width="2" stroke-linecap="round"/>
                <rect x="20" y="34" width="8" height="4" rx="2" fill="#E74C3C"/>
              </svg>
            </div>
          </div>
          <div class="panel-content">
            <p class="panel-description">
              어울정책입니다. 어울정책입니다. 어울정책입니다. 어울정책입니다.<br>
              어울정책입니다. 어울정책입니다. 어울정책입니다. 어울정책입니다.<br>
              어울정책입니다. 어울정책입니다. 어울정책입니다. 어울정책입니다.<br>
              어울정책입니다. 어울정책입니다. 어울정책입니다. 어울정책입니다.<br>
              어울정책입니다. 어울정책입니다. 어울정책입니다. 어울정책입니다.<br>
              어울정책입니다. 어울정책입니다. 어울정책입니다.
            </p>
          </div>
        </div>

        <!-- 하단 네비게이션 버튼 -->
        <div class="nav-buttons">
          <button class="nav-btn active">니의 정책</button>
          <button class="nav-btn">이슈 정책</button>
        </div>
      </aside>
    </div>
  </div>
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
      tabs.forEach(t => t.classList.remove('active'));
      this.classList.add('active');
      
      if (this.textContent === '정책') {
        keywordTitle.textContent = '한 눈에 보는 정책 소식';
      } else if (this.textContent === '혜택') {
        keywordTitle.textContent = '한 눈에 보는 혜택 소식';
      }
    });
  });

  // 네비게이션 버튼 기능
  const navBtns = document.querySelectorAll('.nav-btn');
  
  navBtns.forEach(btn => {
    btn.addEventListener('click', function() {
      navBtns.forEach(b => b.classList.remove('active'));
      this.classList.add('active');
    });
  });

  // *** 슬라이드 전환 기능 - 이 부분이 중요합니다! ***
  const slideBtns = document.querySelectorAll('.slide-btn');
  const slideContents = document.querySelectorAll('.slide-content');
  
  slideBtns.forEach(btn => {
    btn.addEventListener('click', function() {
      const slideIndex = parseInt(this.dataset.slide);
      
      // 모든 버튼과 슬라이드에서 active 클래스 제거
      slideBtns.forEach(b => b.classList.remove('active'));
      slideContents.forEach(content => content.classList.remove('active'));
      
      // 클릭한 버튼과 해당 슬라이드에 active 클래스 추가
      this.classList.add('active');
      slideContents[slideIndex].classList.add('active');
    });
  });

  // 키워드 클릭 기능
  const keywordItems = document.querySelectorAll('.keyword-item');
  
  keywordItems.forEach(item => {
    item.addEventListener('click', function() {
      console.log('키워드 클릭:', this.textContent);
      // 여기에 키워드 검색 또는 필터링 로직 추가
    });
  });
</script>
 <jsp:include page="../include/footer.jsp"/>
</body>
</html>