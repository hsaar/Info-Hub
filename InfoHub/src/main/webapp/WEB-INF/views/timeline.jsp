<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>타임라인</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
</head>
<body>

<!-- 상단바 -->
<%@ include file="include/header.jsp"%>

<!-- 헤더 섹션 -->
<div class="timeline-header">
  <div class="container">
    <h1 class="timeline-title">혜택 타임라인</h1>
  </div>
</div>

<!-- 탭 -->
<div class="tabs">
  <button class="tab active">나의 혜택</button>
  <button class="tab">이슈 혜택</button>
</div>

<!-- 타임라인 컨테이너 -->
<div class="timeline-container">
  <div class="container">
    
   
    <!-- 간트 차트 타임라인 -->
    <div class="gantt-container">
      
      <!-- 헤더 (월 표시) -->
      <div class="gantt-header-row">
        <div class="gantt-label-header"></div>
        <div class="gantt-months">
          <span>1월</span>
          <span>2월</span>
          <span>3월</span>
          <span>4월</span>
          <span>5월</span>
          <span>6월</span>
          <span>7월</span>
          <span>8월</span>
          <span>9월</span>
          <span>10월</span>
          <span>11월</span>
          <span>12월</span>
        </div>
      </div>

      <!-- 정책 행들 -->
      <div class="gantt-item">
        <span class="gantt-label">국민내일배움카드</span>
        <div class="gantt-track">
          <div class="gantt-block" style="grid-column: 2 / 4; background: #4A90E2;">01.05 ~ 02.28</div>
        </div>
      </div>

      <div class="gantt-item">
        <span class="gantt-label">청년도약계좌</span>
        <div class="gantt-track">
          <div class="gantt-block" style="grid-column: 5 / 7; background: #5B9BD5;">05.01 ~ 06.30</div>
        </div>
      </div>

      <div class="gantt-item">
        <span class="gantt-label">문화누리카드</span>
        <div class="gantt-track">
          <div class="gantt-block" style="grid-column: 9 / 11; background: #F5A563;">09.15 ~ 10.31</div>
        </div>
      </div>

      <div class="gantt-item">
        <span class="gantt-label">근로·자녀장려금</span>
        <div class="gantt-track">
          <div class="gantt-block" style="grid-column: 3 / 5; background: #ED8E3D;">03.10 ~ 04.20</div>
        </div>
      </div>

      <div class="gantt-item">
        <span class="gantt-label">국민취업지원제도</span>
        <div class="gantt-track">
          <div class="gantt-block" style="grid-column: 5 / 7; background: #2E5B8F;">05.01 ~ 06.30</div>
        </div>
      </div>

      <div class="gantt-item">
        <span class="gantt-label">장기안심 주택공급</span>
        <div class="gantt-track">
          <div class="gantt-block" style="grid-column: 7 / 9; background: #5B9BD5;">07.01 ~ 08.31</div>
        </div>
      </div>

      <div class="gantt-item">
        <span class="gantt-label">국가장학금</span>
        <div class="gantt-track">
          <div class="gantt-block" style="grid-column: 9 / 10; background: #2E5B8F;">09.01 ~ 09.30</div>
        </div>
      </div>

    </div>
 <!-- 월별 네비게이션 -->
    <div class="month-nav-inline">
      <button class="month-tab" data-month="1">1월</button>
      <button class="month-tab" data-month="2">2월</button>
      <button class="month-tab" data-month="3">3월</button>
      <button class="month-tab" data-month="4">4월</button>
      <button class="month-tab" data-month="5">5월</button>
      <button class="month-tab" data-month="6">6월</button>
      <button class="month-tab" data-month="7">7월</button>
      <button class="month-tab" data-month="8">8월</button>
      <button class="month-tab" data-month="9">9월</button>
      <button class="month-tab" data-month="10">10월</button>
      <button class="month-tab" data-month="11">11월</button>
      <button class="month-tab" data-month="12">12월</button>
    </div>

    <!-- 상세 정보 영역 -->
    <div class="timeline-detail" id="timelineDetail">
      <h3>선택된 혜택</h3>
      <p>월을 클릭하면 해당 월의 정책 정보가 표시됩니다.</p>
      <a href="#" class="detail-link">타임라인 상세보기 ></a>
    </div>

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

  // 탭 전환
  const tabs = document.querySelectorAll('.tab');
  tabs.forEach(tab => {
    tab.addEventListener('click', function() {
      tabs.forEach(t => t.classList.remove('active'));
      this.classList.add('active');
    });
  });

  // 월 선택
  const monthTabs = document.querySelectorAll('.month-tab');
  
  monthTabs.forEach(tab => {
    tab.addEventListener('click', function() {
      const month = this.getAttribute('data-month');
      
      // 월 탭 active 변경
      monthTabs.forEach(t => t.classList.remove('active'));
      this.classList.add('active');
      
      // 상세 정보 업데이트
      const detailArea = document.getElementById('timelineDetail');
      detailArea.innerHTML = `
        <h3>${month}월 혜택</h3>
        <p>${month}월에 해당하는 혜택 정보입니다.</p>
        <a href="#" class="detail-link">타임라인 상세보기 ></a>
      `;
    });
  });
</script>

</body>
</html>