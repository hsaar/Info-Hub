<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 스크랩한 정책 콘텐츠 -->
<h2 class="content-title">스크랩한 혜택</h2>
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
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

<script>
  // 정렬 버튼 처리
  document.addEventListener('DOMContentLoaded', function() {
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
  });
</script>