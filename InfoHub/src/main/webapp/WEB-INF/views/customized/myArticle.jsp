<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>맞춤형 기사</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/customized_news.css' />">
</head>
<body>

<!-- 상단바 -->
<%@ include file="../include/header.jsp"%>

<!-- 메인 컨테이너 -->
<div class="customized-container">
  <div class="container">
    
    <!-- 헤더 섹션 -->
    <div class="customized-header">
      <h1 class="customized-title">맞춤형 기사</h1>
      <p class="customized-subtitle">회원님의 관심사에 맞춘 최신 뉴스를 확인하세요</p>
    </div>

    <!-- 필터 버튼 -->
    <div class="filter-section">
      <!-- 연령 필터 -->
      <div class="age-filter">
        <button class="filter-btn" data-age="10">10대</button>
        <button class="filter-btn active" data-age="20">20대</button>
        <button class="filter-btn" data-age="30">30대</button>
        <button class="filter-btn" data-age="30">40대</button>
        <button class="filter-btn" data-age="30">50대</button>
      </div>
      
      <!-- 분야 필터 -->
      <div class="category-filter">
        <button class="filter-btn primary" data-category="estate">부동산</button>
        <button class="filter-btn" data-category="stock">주식</button>
        <button class="filter-btn" data-category="health">복지</button>
        <button class="filter-btn" data-category="culture">창업</button>
        <button class="add-filter-btn">+</button>
      </div>
    </div>

    <!-- 기사 그리드 -->
    <div class="news-grid">
      
      <!-- 정치 카테고리 -->
      <div class="news-category-card">
        <h2 class="category-title">${name}</h2>
        <div class="news-list">
		  <c:forEach var = "list" items = "${list}">
          <a href = "https:/${list.link}"><div class="news-item">
            <div class="news-content">
              <p class="news-text">${list.title}</p>
              <span class="news-source">${list.source}</span>
            </div>
            <div class="news-thumbnail">
              <img src="resources/image/${list.image}" alt="${image}">
            </div>
          </div></a>
          </c:forEach>
        </div>
      </div>

      <!-- 경제 카테고리 -->
      <div class="news-category-card">
        <h2 class="category-title">경제</h2>
        <div class="news-list">
          <div class="news-item">
            <div class="news-content">
              <p class="news-text">"최장 10년에서 980만원" 재그명 여 헌실 사라, 감사가 불르다</p>
              <span class="news-source">한국경제</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>

          <div class="news-item">
            <div class="news-content">
              <p class="news-text">"10억 탕크딥연 통 건다던다"… 10월 10일 '탕시맛장전' 포쇄…</p>
              <span class="news-source">매일경제</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1559526324-4b87b5e36e44?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>

          <div class="news-item">
            <div class="news-content">
              <p class="news-text">[단독] 결버사업 벤치도 오싱이 재용수 "수록", 도판드 알드다</p>
              <span class="news-source">서울경제</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1450101499163-c8848c66ca85?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>

          <div class="news-item">
            <div class="news-content">
              <p class="news-text">"마국멸법 여 가고 연다"… 한국경 벌크빠다니다 LT로 텀시에 …</p>
              <span class="news-source">이데일리</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>
        </div>
      </div>

      <!-- 사회 카테고리 -->
      <div class="news-category-card">
        <h2 class="category-title">사회</h2>
        <div class="news-list">
          <div class="news-item">
            <div class="news-content">
              <p class="news-text">무슨은 '한국 거너는 여묻 든 펴 라크리안' 금행명대</p>
              <span class="news-source">동아일보</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1504711434969-e33886168f5c?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>

          <div class="news-item">
            <div class="news-content">
              <p class="news-text">"은보운 드큰 벌법 립"··· 해석든 나기면 아범법 '토비산' 경강…</p>
              <span class="news-source">SBS</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1585829365295-ab7cd400c167?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>

          <div class="news-item">
            <div class="news-content">
              <p class="news-text">박앙수 "볼 수으밥억 마련" 빼악 에· "연에마이 텔 결고" 두픔…</p>
              <span class="news-source">JTBC</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1593642532400-2682810df593?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>

          <div class="news-item">
            <div class="news-content">
              <p class="news-text">"오리스의 페르에 세 여러떤 날 려더 어새르은"··· 치난도 확르다</p>
              <span class="news-source">YTN</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>

          <div class="news-item">
            <div class="news-content">
              <p class="news-text">여술석 "넣 소비수을 밤으멜 드··· 설법핀 밸댜 "식샤 버쉬"</p>
              <span class="news-source">뉴스1</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1589829545856-d10d557cf95f?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>
        </div>
      </div>

      <!-- IT/과학 카테고리 -->
      <div class="news-category-card">
        <h2 class="category-title">IT/과학</h2>
        <div class="news-list">
          <div class="news-item">
            <div class="news-content">
              <p class="news-text">"굴석엥에픔드 이뢩방선다니" 곱 를 츄아에, 조 엥매…</p>
              <span class="news-source">전자신문</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1518770660439-4636190af475?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>

          <div class="news-item">
            <div class="news-content">
              <p class="news-text">집목, '메스트릭에 존뵨' 나쓰명 지달민수 밸국 정완시년수…</p>
              <span class="news-source">ZDNet Korea</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1531297484001-80022131f5a1?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>

          <div class="news-item">
            <div class="news-content">
              <p class="news-text">특균, '생복 고숑곱도 총현 밤영 막능' 코븐드 거거자 뷸 텐…</p>
              <span class="news-source">디지털타임스</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>

          <div class="news-item">
            <div class="news-content">
              <p class="news-text">[교스닐] '뎌색딥 혜밥 수드, 학 삼 여나'··· 오관 콯으며 목드…</p>
              <span class="news-source">IT조선</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>

          <div class="news-item">
            <div class="news-content">
              <p class="news-text">메술경 "드렁 벗명선법츠, 주두 풀급닙 판드혀 줄" 것</p>
              <span class="news-source">테크M</span>
            </div>
            <div class="news-thumbnail">
              <img src="https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=100&h=100&fit=crop" alt="뉴스 이미지">
            </div>
          </div>
        </div>
      </div>

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

  // 필터 버튼 클릭
  const filterBtns = document.querySelectorAll('.filter-btn');
  filterBtns.forEach(btn => {
    btn.addEventListener('click', function() {
      const parentFilter = this.closest('.age-filter, .category-filter');
      
      // 같은 그룹 내의 버튼들만 처리
      if (parentFilter) {
        const groupBtns = parentFilter.querySelectorAll('.filter-btn');
        
        // primary 클래스가 있는 버튼은 토글
        if (this.classList.contains('primary')) {
          this.classList.toggle('active');
        } else {
          // 같은 그룹 내에서 하나만 활성화
          groupBtns.forEach(b => {
            if (!b.classList.contains('primary')) {
              b.classList.remove('active');
            }
          });
          this.classList.add('active');
        }
      }
      
      // 선택된 필터 정보
      const ageFilter = document.querySelector('.age-filter .filter-btn.active')?.getAttribute('data-age');
      const categoryFilters = Array.from(document.querySelectorAll('.category-filter .filter-btn.active'))
        .map(btn => btn.getAttribute('data-category'));
      
      console.log('연령 필터:', ageFilter);
      console.log('분야 필터:', categoryFilters);
      // 여기에 필터링 로직 추가
    });
  });

  // 기사 아이템 클릭
  const newsItems = document.querySelectorAll('.news-item');
  newsItems.forEach(item => {
    item.addEventListener('click', function() {
      // 기사 상세 페이지로 이동
      // window.location.href = '/article/' + articleId;
      console.log('기사 클릭');
    });
  });

  // 필터 추가 버튼
  const addFilterBtn = document.querySelector('.add-filter-btn');
  addFilterBtn.addEventListener('click', function() {
    alert('새로운 관심사 추가 기능');
    // 모달 열기 등의 기능 추가
  });
</script>

</body>
</html>