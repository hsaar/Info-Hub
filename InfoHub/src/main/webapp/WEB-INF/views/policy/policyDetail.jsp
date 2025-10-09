<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>정책 상세정보</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/policy.css' />">
</head>
<body>

<!-- 상단바 include -->
<%@ include file="../include/header.jsp" %> 

<!-- 브레드크럼 네비게이션 -->
<nav class="breadcrumb-nav">
  <div class="container">
    <a href="<c:url value='/' />">홈</a>
    <span>›</span>
    <a href="<c:url value='/map' />">지역별 정책 찾기</a>
    <span>›</span>
    <span>서울특별시</span>
    <span>›</span>
    <span class="current">청년 주거 지원 사업</span>
  </div>
</nav>

<!-- 메인 컨테이너 -->
<div class="detail-container">
  <!-- 왼쪽: 상세 정보 -->
  <main class="detail-main">
    <!-- 상단 정보 -->
    <div class="detail-header">
      <div class="header-top">
        <span class="category-badge">주거</span>
        <div class="action-buttons">
          <button class="action-btn scrap-btn" id="scrapBtn">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"/>
            </svg>
            <span>스크랩</span>
          </button>
          <button class="action-btn share-btn" id="shareBtn">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="18" cy="5" r="3"/>
              <circle cx="6" cy="12" r="3"/>
              <circle cx="18" cy="19" r="3"/>
              <line x1="8.59" y1="13.51" x2="15.42" y2="17.49"/>
              <line x1="15.41" y1="6.51" x2="8.59" y2="10.49"/>
            </svg>
            <span>공유</span>
          </button>
          <button class="action-btn alarm-btn" id="alarmBtn">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/>
              <path d="M13.73 21a2 2 0 0 1-3.46 0"/>
            </svg>
            <span>알림 설정</span>
          </button>
        </div>
      </div>
      
      <h1 class="detail-title">청년 주거 지원 사업</h1>
      
      <div class="detail-meta">
        <div class="meta-item">
          <span class="meta-label">신청기간</span>
          <span class="meta-value highlight">2025.03.01 ~ 2025.12.31</span>
        </div>
        <div class="meta-item">
          <span class="meta-label">지원대상</span>
          <span class="meta-value">만 19세 ~ 34세 청년</span>
        </div>
        <div class="meta-item">
          <span class="meta-label">지원기관</span>
          <span class="meta-value">서울특별시</span>
        </div>
      </div>
    </div>

    <!-- 탭 메뉴 -->
    <div class="detail-tabs">
      <button class="tab-btn active" data-tab="overview">정책 개요</button>
      <button class="tab-btn" data-tab="eligibility">신청 자격</button>
      <button class="tab-btn" data-tab="benefits">지원 내용</button>
    </div>

    <!-- 탭 컨텐츠 -->
    <div class="tab-content active" id="overview">
      <section class="content-section">
        <h2 class="section-title">정책 개요</h2>
        <div class="section-body">
          <p>서울시에 거주하는 청년들의 주거 안정을 위해 월세 및 보증금을 지원하는 사업입니다. 
          청년들의 주거비 부담을 덜어주고 안정적인 주거 환경을 조성하여 자립 기반을 마련하는 것을 목표로 합니다.</p>
          
          <div class="info-box">
            <div class="info-icon">💡</div>
            <div class="info-content">
              <strong>핵심 포인트</strong>
              <ul>
                <li>월 최대 30만원 지원 (최대 12개월)</li>
                <li>보증금 대출 이자 지원 가능</li>
                <li>소득 및 재산 기준 충족 시 신청 가능</li>
              </ul>
            </div>
          </div>
        </div>
      </section>
    </div>

    <div class="tab-content" id="eligibility">
      <section class="content-section">
        <h2 class="section-title">신청 자격</h2>
        <div class="section-body">
          <div class="requirement-list">
            <div class="requirement-item">
              <div class="requirement-number">1</div>
              <div class="requirement-content">
                <h3>연령 요건</h3>
                <p>만 19세 이상 34세 이하 청년 (병역 이행 기간 최대 6년 인정)</p>
              </div>
            </div>
            
            <div class="requirement-item">
              <div class="requirement-number">2</div>
              <div class="requirement-content">
                <h3>거주 요건</h3>
                <p>서울시 내 임차 거주 중이며, 임대차 계약서상 명의자</p>
              </div>
            </div>
           
          </div>
        </div>
      </section>
    </div>

    <div class="tab-content" id="benefits">
      <section class="content-section">
        <h2 class="section-title">지원 내용</h2>
        <div class="section-body">
          <div class="benefit-cards">
            <div class="benefit-card">
              <div class="benefit-icon">🏠</div>
              <h3>월세 지원</h3>
              <div class="benefit-amount">최대 30만원/월</div>
              <p>실제 월세의 50% 이내, 최대 12개월 지원</p>
            </div>
            
            <div class="benefit-card">
              <div class="benefit-icon">💰</div>
              <h3>보증금 대출</h3>
              <div class="benefit-amount">최대 5,000만원</div>
              <p>저금리 대출 연계 및 이자 지원</p>
            </div>
            
            <div class="benefit-card">
              <div class="benefit-icon">📋</div>
              <h3>계약 갱신 지원</h3>
              <div class="benefit-amount">추가 6개월</div>
              <p>계약 갱신 시 최대 6개월 연장 가능</p>
            </div>
          </div>
          
          <div class="warning-box">
            <div class="warning-icon">⚠️</div>
            <div class="warning-content">
              <strong>유의사항</strong>
              <ul>
                <li>중복 지원 불가: 타 주거 지원 사업과 동시 수혜 불가</li>
                <li>허위 신청 시 지원금 환수 및 향후 5년간 신청 제한</li>
                <li>지원 기간 중 타 지역으로 전출 시 지원 중단</li>
              </ul>
            </div>
          </div>
        </div>
      </section>
    </div>

    <div class="tab-content" id="application">
      <section class="content-section">
        <h2 class="section-title">신청 방법</h2>
        <div class="section-body">
          <div class="process-steps">
            <div class="process-step">
              <div class="step-number">STEP 1</div>
              <div class="step-content">
                <h3>온라인 신청</h3>
                <p>서울시 청년포털 접속 후 회원가입 및 로그인</p>
                <a href="#" class="step-link">신청하기 →</a>
              </div>
            </div>
            
            <div class="process-arrow">↓</div>
            
            <div class="process-step">
              <div class="step-number">STEP 2</div>
              <div class="step-content">
                <h3>서류 제출</h3>
                <p>필요 서류 온라인 업로드 또는 방문 제출</p>
              </div>
            </div>
            
            <div class="process-arrow">↓</div>
            
            <div class="process-step">
              <div class="step-number">STEP 3</div>
              <div class="step-content">
                <h3>심사 및 선정</h3>
                <p>소득·재산 조사 및 자격 심사 (약 2주 소요)</p>
              </div>
            </div>
            
            <div class="process-arrow">↓</div>
            
            <div class="process-step">
              <div class="step-number">STEP 4</div>
              <div class="step-content">
                <h3>지원금 지급</h3>
                <p>선정 통보 후 익월부터 계좌 입금</p>
              </div>
            </div>
          </div>
          
          <div class="contact-info">
            <h3>문의처</h3>
            <div class="contact-items">
              <div class="contact-item">
                <span class="contact-label">전화</span>
                <span class="contact-value">02-1234-5678</span>
              </div>
              <div class="contact-item">
                <span class="contact-label">이메일</span>
                <span class="contact-value">youth@seoul.go.kr</span>
              </div>
              <div class="contact-item">
                <span class="contact-label">운영시간</span>
                <span class="contact-value">평일 09:00 ~ 18:00</span>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>

    
    <!-- 하단 액션 버튼 -->
    <div class="detail-actions">
      <button class="btn-back" onclick="history.back()">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M19 12H5M12 19l-7-7 7-7"/>
        </svg>
        목록으로
      </button>
      <button class="btn-apply">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M9 11l3 3L22 4"/>
          <path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/>
        </svg>
        온라인 신청하기
      </button>
    </div>
  </main>



<!-- Top 버튼 -->
<button class="top-button" id="topButton" aria-label="맨 위로 이동">
  <svg viewBox="0 0 24 24">
    <path d="M12 4l-8 8h6v8h4v-8h6z"/>
  </svg>
</button>

<script>
// 탭 전환
document.querySelectorAll('.tab-btn').forEach(btn => {
  btn.addEventListener('click', function() {
    // 모든 탭 버튼과 컨텐츠에서 active 제거
    document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
    document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
    
    // 클릭한 탭과 해당 컨텐츠에 active 추가
    this.classList.add('active');
    const tabId = this.getAttribute('data-tab');
    document.getElementById(tabId).classList.add('active');
    
    // 부드럽게 스크롤
    document.querySelector('.detail-tabs').scrollIntoView({ behavior: 'smooth', block: 'nearest' });
  });
});

// 스크랩 버튼
document.getElementById('scrapBtn').addEventListener('click', function() {
  this.classList.toggle('active');
  const isActive = this.classList.contains('active');
  
  if (isActive) {
    this.querySelector('span').textContent = '스크랩됨';
    alert('스크랩에 추가되었습니다.');
  } else {
    this.querySelector('span').textContent = '스크랩';
    alert('스크랩에서 제거되었습니다.');
  }
});

// 공유 버튼
document.getElementById('shareBtn').addEventListener('click', function() {
  if (navigator.share) {
    navigator.share({
      title: '청년 주거 지원 사업',
      text: '서울시 청년 주거 지원 사업을 확인해보세요!',
      url: window.location.href
    });
  } else {
    alert('URL이 클립보드에 복사되었습니다.');
    navigator.clipboard.writeText(window.location.href);
  }
});

// 알림 설정 버튼
document.getElementById('alarmBtn').addEventListener('click', function() {
  this.classList.toggle('active');
  const isActive = this.classList.contains('active');
  
  if (isActive) {
    this.querySelector('span').textContent = '알림 설정됨';
    alert('신청 기간 알림이 설정되었습니다.');
  } else {
    this.querySelector('span').textContent = '알림 설정';
    alert('알림 설정이 해제되었습니다.');
  }
});

// Top 버튼
const topButton = document.getElementById('topButton');
window.addEventListener('scroll', function() {
  if (window.scrollY > 300) {
    topButton.classList.add('show');
  } else {
    topButton.classList.remove('show');
  }
});

topButton.addEventListener('click', function() {
  window.scrollTo({ top: 0, behavior: 'smooth' });
});


</script>

</body>
</html>