<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>스크랩 확인</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
</head>
<body>

<!-- 상단바 -->
<%@ include file="../include/main_header.jsp"%>

<!-- 마이페이지 컨테이너 -->
<div class="mypage-container">
  <div class="container">
    
    <!-- 좌측 사이드바 -->
    <aside class="mypage-sidebar">
      <h3 class="sidebar-title">프로필 정보 간단하게</h3>
      
      <nav class="sidebar-menu">
        <a href="#" class="menu-item">
          <span class="menu-text">나의 정보</span>
        </a>
        <a href="#" class="menu-item active">
          <span class="menu-text">나의 정책</span>
        </a>
        <a href="#" class="menu-item">
          <span class="menu-text">타임라인</span>
        </a>
        <a href="#" class="menu-item">
          <span class="menu-text">게시판</span>
        </a>
        <a href="#" class="menu-item">
          <span class="menu-text">좋아요</span>
        </a>
        <a href="#" class="menu-item">
          <span class="menu-text">알림 관리</span>
        </a>
      </nav>

      <div class="sidebar-categories">
        <h4 class="category-title">카테고리</h4>
        <ul class="category-list">
          <li>나의 정보 - 개인 정보</li>
          <li>나의 정책 - 스크랩</li>
          <li>타임라인 - 스크랩한 정책 타임라인</li>
          <li>게시판 - 서울장 게시글, 좋아요 댓글 표시</li>
          <li>좋아요 - 좋아요 누른 게시글</li>
          <li>알림 관리 - 알림 설정한 정책 목록</li>
        </ul>
      </div>
    </aside>

    <!-- 메인 콘텐츠 영역 -->
    <main class="mypage-content">
      
      <h2 class="content-title">스크랩한 정책</h2>

      <!-- 필터 -->
      <div class="scrap-filter">
        <select class="filter-select">
          <option>전체 (15)</option>
          <option>일자리</option>
          <option>주거</option>
          <option>교육</option>
          <option>복지</option>
        </select>
        <div class="sort-buttons">
          <button class="sort-btn active">최신순</button>
          <button class="sort-btn">가나다순</button>
          <button class="sort-btn">마감임박순</button>
        </div>
      </div>

      <!-- 스크랩 리스트 -->
      <div class="scrap-list">
        
        <!-- 스크랩 카드 1 -->
        <article class="scrap-card">
          <div class="scrap-header">
            <span class="scrap-badge">일자리</span>
            <button class="scrap-delete-btn">✕</button>
          </div>
          <h3 class="scrap-title">국민내일배움카드</h3>
          <p class="scrap-description">
            직업훈련을 희망하는 국민에게 직업능력개발훈련 및 컨설팅을 지원
          </p>
          <div class="scrap-info">
            <span class="scrap-period">신청기간: 상시신청</span>
            <span class="scrap-date">스크랩: 2025.01.15</span>
          </div>
          <a href="#" class="scrap-link">자세히 보기 →</a>
        </article>

        <!-- 스크랩 카드 2 -->
        <article class="scrap-card">
          <div class="scrap-header">
            <span class="scrap-badge">주거</span>
            <button class="scrap-delete-btn">✕</button>
          </div>
          <h3 class="scrap-title">청년 주거비 지원</h3>
          <p class="scrap-description">
            청년들의 주거 안정을 위해 월세 및 보증금 지원
          </p>
          <div class="scrap-info">
            <span class="scrap-period">신청기간: 2025.01.01 ~ 2025.12.31</span>
            <span class="scrap-date">스크랩: 2025.01.14</span>
          </div>
          <a href="#" class="scrap-link">자세히 보기 →</a>
        </article>

        <!-- 스크랩 카드 3 -->
        <article class="scrap-card">
          <div class="scrap-header">
            <span class="scrap-badge">복지</span>
            <button class="scrap-delete-btn">✕</button>
          </div>
          <h3 class="scrap-title">근로·자녀장려금</h3>
          <p class="scrap-description">
            소득과 재산이 적은 근로소득자에게 근로장려금을, 자녀 양육 시 자녀장려금을 지급
          </p>
          <div class="scrap-info">
            <span class="scrap-period">신청기간: 2025.05.01 ~ 2025.05.31</span>
            <span class="scrap-date">스크랩: 2025.01.13</span>
          </div>
          <a href="#" class="scrap-link">자세히 보기 →</a>
        </article>

        <!-- 스크랩 카드 4 -->
        <article class="scrap-card">
          <div class="scrap-header">
            <span class="scrap-badge">교육</span>
            <button class="scrap-delete-btn">✕</button>
          </div>
          <h3 class="scrap-title">국가장학금</h3>
          <p class="scrap-description">
            대학생의 등록금 부담 완화를 위한 장학금 지원
          </p>
          <div class="scrap-info">
            <span class="scrap-period">신청기간: 2025.03.01 ~ 2025.03.31</span>
            <span class="scrap-date">스크랩: 2025.01.12</span>
          </div>
          <a href="#" class="scrap-link">자세히 보기 →</a>
        </article>

        <!-- 스크랩 카드 5 -->
        <article class="scrap-card">
          <div class="scrap-header">
            <span class="scrap-badge">일자리</span>
            <button class="scrap-delete-btn">✕</button>
          </div>
          <h3 class="scrap-title">국민취업지원제도</h3>
          <p class="scrap-description">
            취업지원서비스와 생계지원을 통해 취업 촉진
          </p>
          <div class="scrap-info">
            <span class="scrap-period">신청기간: 상시신청</span>
            <span class="scrap-date">스크랩: 2025.01.11</span>
          </div>
          <a href="#" class="scrap-link">자세히 보기 →</a>
        </article>

        <!-- 스크랩 카드 6 -->
        <article class="scrap-card">
          <div class="scrap-header">
            <span class="scrap-badge">주거</span>
            <button class="scrap-delete-btn">✕</button>
          </div>
          <h3 class="scrap-title">청년도약계좌</h3>
          <p class="scrap-description">
            청년들의 자산 형성을 위한 정부 지원 적금 상품
          </p>
          <div class="scrap-info">
            <span class="scrap-period">신청기간: 2025.01.01 ~ 2025.12.31</span>
            <span class="scrap-date">스크랩: 2025.01.10</span>
          </div>
          <a href="#" class="scrap-link">자세히 보기 →</a>
        </article>

      </div>

      <!-- 페이지네이션 -->
      <nav class="pagination-nav">
        <button class="page-arrow">«</button>
        <button class="page-number active">1</button>
        <button class="page-number">2</button>
        <button class="page-number">3</button>
        <button class="page-arrow">»</button>
      </nav>

    </main>

  </div>
</div>

<!-- Top 버튼 -->
<button class="top-button" id="topButton" aria-label="맨 위로 이동">
  <svg viewBox="0 0 24 24">
    <path d="M12 4l-8 8h6v8h4v-8h6z"/>
  </svg>
</button>

<script>
  // Top 버튼
  const topButton = document.getElementById('topButton');
  window.addEventListener('scroll', function() {
    topButton.classList.toggle('show', window.scrollY > 300);
  });
  topButton.addEventListener('click', function() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });

  // 사이드바 메뉴
  const menuItems = document.querySelectorAll('.menu-item');
  menuItems.forEach(item => {
    item.addEventListener('click', function(e) {
      e.preventDefault();
      menuItems.forEach(m => m.classList.remove('active'));
      this.classList.add('active');
    });
  });

  // 정렬 버튼
  const sortBtns = document.querySelectorAll('.sort-btn');
  sortBtns.forEach(btn => {
    btn.addEventListener('click', function() {
      sortBtns.forEach(b => b.classList.remove('active'));
      this.classList.add('active');
    });
  });

  // 스크랩 삭제
  const deleteButtons = document.querySelectorAll('.scrap-delete-btn');
  deleteButtons.forEach(button => {
    button.addEventListener('click', function() {
      if (confirm('스크랩을 삭제하시겠습니까?')) {
        this.closest('.scrap-card').remove();
      }
    });
  });
</script>

</body>
</html>
