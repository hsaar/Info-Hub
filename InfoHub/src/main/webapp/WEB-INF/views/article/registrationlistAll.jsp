<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전체 혜택</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
</head>
<body>

<!-- 상단바 -->
<%@ include file="../include/header.jsp"%>

<!-- 브레드크럼 -->
<div class="breadcrumb-nav">
  <div class="container">
    <a href="<c:url value='/'/>">🏠 Home</a>
    <span>></span>
    
    <span>전체 혜택</span>
  </div>
</div>

<!-- 페이지 헤더 -->
<div class="page-header">
  <div class="container">
    <h1 class="page-main-title">전체 혜택</h1>
    <div class="social-share">
      <button class="share-btn" aria-label="페이스북 공유">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
          <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
        </svg>
      </button>
      <button class="share-btn" aria-label="트위터 공유">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
          <path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"/>
        </svg>
      </button>
      <button class="share-btn" aria-label="링크 복사">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"/>
          <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"/>
        </svg>
      </button>
      <button class="share-btn" aria-label="인쇄">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <polyline points="6 9 6 2 18 2 18 9"/>
          <path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"/>
          <rect x="6" y="14" width="12" height="8"/>
        </svg>
      </button>
    </div>
  </div>
</div>

<!-- 검색 섹션 -->
<div class="search-section">
  <div class="container">
    <div class="search-box-large">
      <input type="text" placeholder="찾는 분호조금 또는 검색어를 입력하세요" class="search-input-large">
      <button class="search-btn-large">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <circle cx="11" cy="11" r="8"/>
          <path d="m21 21-4.35-4.35"/>
        </svg>
      </button>
    </div>
    <button class="advanced-search-btn">조건 검색</button>
  </div>
</div>

<!-- 필터 및 정렬 -->
<div class="filter-section">
  <div class="container">
    <div class="filter-group">
      <select class="filter-select">
        <option>전체 (10,267)</option>
        <option>중앙정부</option>
        <option>지방정부</option>
      </select>
      <button class="sort-btn">조회</button>
    </div>
    
  </div>
</div>

<!-- 정책 카드 리스트 -->
<div class="policy-list-container">
  <div class="container">
    <div class="policy-grid">
      
      <!-- 카드 1 -->
      <article class="policy-card">
        <span class="policy-badge">중앙정부</span>
        <h3 class="policy-card-title">국민내일배움카드</h3>
        <p class="policy-description">
          직업훈련을 희망하는 국민에게 직업능력개발훈련 및 컨설팅을 지원
        </p>
        <ul class="policy-details">
          <li><strong>신청기간:</strong> 상시신청</li>
          <li><strong>청구기관:</strong> 고용노동부 지 역에 고용센터 설...</li>
          <li><strong>연령요건:</strong> 고용노동부 고령산업센터 / 1350</li>
          <li><strong>지원형태:</strong> 서비스(교육)</li>
          <li><strong>신청방법:</strong> 타시이트 이동 📄</li>
        </ul>
      </article>

      <!-- 카드 2 -->
      <article class="policy-card">
        <span class="policy-badge">공공기관</span>
        <h3 class="policy-card-title">근로·자녀장려금</h3>
        <p class="policy-description">
          소득과 재산이 적은 근로소득자에게 근로장려금을, 자녀 양육 자녀장려금을 지급
        </p>
        <ul class="policy-details">
          <li><strong>신청기간:</strong> ○ 정기신청 : 5.1~5.31.○ 반기...</li>
          <li><strong>청구기관:</strong> 관할 세무서</li>
          <li><strong>연령요건:</strong> 해당지역 지자체(해당서) / 관할 세무서</li>
          <li><strong>지원형태:</strong> 현금</li>
          <li><strong>신청방법:</strong> 타시이트 이동 📄</li>
        </ul>
      </article>

      <!-- 카드 3 -->
      <article class="policy-card">
        <span class="policy-badge">중앙정부</span>
        <h3 class="policy-card-title">내일미래 디딤돌 대출</h3>
        <p class="policy-description">
          오랜 2.5억 원 전도, 연 2.45% ~ 3.55%(스크라엔지에 대한 긴급 자금)
        </p>
        <ul class="policy-details">
          <li><strong>신청기간:</strong> 청소기관확인이</li>
          <li><strong>청구기관:</strong> 교도 교토청, 주택도시보증공사, 한국...</li>
          <li><strong>연령요건:</strong> 교도 교토청 / 1599~0001, 주택도시...</li>
          <li><strong>지원형태:</strong> 현금(융자)</li>
          <li><strong>신청방법:</strong> 타시이트 이동 📄</li>
        </ul>
      </article>

      <!-- 추가 카드들 (반복) -->
      <article class="policy-card">
        <span class="policy-badge">중앙정부</span>
        <h3 class="policy-card-title">국민취업지원제도</h3>
        <p class="policy-description">
          직업별당, 결정담, 특기 프로그램 연계 등 취업지원서비스 제공
        </p>
        <ul class="policy-details">
          <li><strong>신청기간:</strong> 상시신청</li>
          <li><strong>청구기관:</strong> 전국 고용센터</li>
          <li><strong>연령요건:</strong> 고용노동부 고령산업센터 / 1350</li>
          <li><strong>지원형태:</strong> 한국,기타(실습)</li>
          <li><strong>신청방법:</strong> 타시이트 이동 📄</li>
        </ul>
      </article>

      <article class="policy-card">
        <span class="policy-badge">공공기관</span>
        <h3 class="policy-card-title">청년도약계좌</h3>
        <p class="policy-description">
          "단일의 석금리+영적시가="이자스를 비과세" 혜택을 제공하는 중청기 저녀성형 석혜통통
        </p>
        <ul class="policy-details">
          <li><strong>신청기간:</strong> 매년 초 신년 등 배당실적을 서터드...</li>
          <li><strong>청구기관:</strong> 청년도약계좌 취급위협 벨융 등과...</li>
          <li><strong>연령요건:</strong> 13974서[교용동축 석혜] / 1397</li>
          <li><strong>지원형태:</strong> 한국</li>
          <li><strong>신청방법:</strong> 타시이트 이동 📄</li>
        </ul>
      </article>

      <article class="policy-card">
        <span class="policy-badge">중앙정부</span>
        <h3 class="policy-card-title">장기안심 주택공급</h3>
        <p class="policy-description">
          무주택에구성원 오머가 시세보다 저렴한 임들주공으로 공급
        </p>
        <ul class="policy-details">
          <li><strong>신청기간:</strong> 청소기관확인이</li>
          <li><strong>청구기관:</strong> 전국 주택관련공사</li>
          <li><strong>연령요건:</strong> 서울추특시산하사 /1600~5456</li>
          <li><strong>지원형태:</strong> 기타</li>
          <li><strong>신청방법:</strong> 타시이트 이동 📄</li>
        </ul>
      </article>

    </div>

    <!-- 페이지네이션 -->
    <nav class="pagination-nav">
      <button class="page-arrow" id="prevPage">«</button>
      <button class="page-number active" data-page="1">1</button>
      <button class="page-number" data-page="2">2</button>
      <button class="page-number" data-page="3">3</button>
      <button class="page-number" data-page="4">4</button>
      <button class="page-number" data-page="5">5</button>
      <span>...</span>
      <button class="page-number" data-page="857">857</button>
      <button class="page-arrow" id="nextPage">»</button>
    </nav>
  </div>
</div>

<!-- Top 버튼 -->
<button class="top-button" id="topButton" aria-label="맨 위로 이동">
  <svg viewBox="0 0 24 24">
    <path d="M12 4l-8 8h6v8h4v-8h6z"/>
  </svg>
</button>

<script>
  // 현재 페이지 번호
  let currentPage = 1;

  // Top 버튼
  const topButton = document.getElementById('topButton');
  window.addEventListener('scroll', function() {
    topButton.classList.toggle('show', window.scrollY > 300);
  });
  topButton.addEventListener('click', function() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });

  // 정렬 버튼 클릭
  const sortButtons = document.querySelectorAll('.sort-option-btn');
  sortButtons.forEach(button => {
    button.addEventListener('click', function() {
      // 모든 버튼에서 active 클래스 제거
      sortButtons.forEach(btn => btn.classList.remove('active'));
      // 클릭한 버튼에 active 클래스 추가
      this.classList.add('active');
      
      // 정렬 타입 가져오기
      const sortType = this.getAttribute('data-sort');
      console.log('정렬 방식:', sortType);
      
      // 여기에 실제 정렬 로직 추가
      // sortPolicies(sortType);
    });
  });

  // 페이지네이션 기능
  const pageButtons = document.querySelectorAll('.page-number');
  const prevButton = document.getElementById('prevPage');
  const nextButton = document.getElementById('nextPage');

  // 페이지 변경 함수
  function changePage(pageNum) {
    currentPage = pageNum;
    
    // 모든 페이지 버튼에서 active 제거
    pageButtons.forEach(btn => btn.classList.remove('active'));
    
    // 해당 페이지 버튼에 active 추가
    const targetButton = document.querySelector(`[data-page="${pageNum}"]`);
    if (targetButton) {
      targetButton.classList.add('active');
    }
    
    console.log('현재 페이지:', currentPage);
    
    // 맨 위로 스크롤
    window.scrollTo({ top: 0, behavior: 'smooth' });
    
    // 여기에 실제 데이터 로딩 로직 추가
    // loadPageData(pageNum);
  }

  // 페이지 번호 버튼 클릭
  pageButtons.forEach(button => {
    button.addEventListener('click', function() {
      const pageNum = parseInt(this.getAttribute('data-page'));
      changePage(pageNum);
    });
  });

  // 이전 페이지 버튼
  prevButton.addEventListener('click', function() {
    if (currentPage > 1) {
      changePage(currentPage - 1);
    }
  });

  // 다음 페이지 버튼
  nextButton.addEventListener('click', function() {
    if (currentPage < 857) {
      changePage(currentPage + 1);
    }
  });
</script>

</body>
</html>