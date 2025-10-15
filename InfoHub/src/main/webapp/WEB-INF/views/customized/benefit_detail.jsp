<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내혜택 상세보기 - 고용노동부 고객상담센터</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<%@ include file="../include/header.jsp"%>
</head>
<body>

-

<!-- 브레드크럼 -->
<nav class="breadcrumb-nav">
  <div class="container">
    <a href="<c:url value='/' />">홈</a> &gt; 
    <a href="<c:url value='/benefit' />">내혜택</a> &gt; 
    <span>상세보기</span>
  </div>
</nav>

<!-- 페이지 헤더 -->
<header class="page-header">
  <div class="container">
    <h1 class="page-main-title">고용노동부 고객상담센터</h1>
    <div class="social-share">
      <button class="share-btn" title="페이스북 공유">f</button>
      <button class="share-btn" title="트위터 공유">t</button>
      <button class="share-btn" title="링크 복사">#</button>
    </div>
  </div>
</header>

<!-- 메인 컨텐츠 -->
<main class="container" style="padding: 40px 20px;">
  
  <!-- 혜택 상세 정보 카드 -->
  <div class="card" style="margin-bottom: 40px;">
    <div class="card-header">
      <div style="background: linear-gradient(135deg, #e0f2fe 0%, #f0f9ff 100%); padding: 24px; text-align: center; border-radius: 20px 20px 0 0;">
        <span class="policy-badge" style="background: #0b50d0; color: #fff; font-size: 14px; padding: 6px 16px;">혜택 정보</span>
      </div>
    </div>
    <div class="card-body" style="padding: 32px;">
      
      <!-- 기본 정보 섹션 -->
      <section style="margin-bottom: 32px;">
        <h2 style="font-size: 24px; font-weight: 700; color: var(--ink); margin-bottom: 20px; padding-bottom: 12px; border-bottom: 2px solid var(--mist-200);">
          📋 기본 정보
        </h2>
        
        <div style="display: grid; grid-template-columns: 120px 1fr; gap: 16px 24px; align-items: start;">
          <div style="font-weight: 600; color: var(--muted);">신청기간</div>
          <div style="color: var(--ink);">상시신청</div>
          
          <div style="font-weight: 600; color: var(--muted);">전화문의</div>
          <div style="color: var(--ink);">고용노동부 고객상담센터 (1350)</div>
          
          <div style="font-weight: 600; color: var(--muted);">신청방법</div>
          <div style="color: var(--ink);">가까운 고용센터를 방문하거나 고용24를 통해 신청</div>
          
          <div style="font-weight: 600; color: var(--muted);">접수기관</div>
          <div style="color: var(--ink);">고용노동부 각 지역 관할 고용센터 및 고객상담센터</div>
          
          <div style="font-weight: 600; color: var(--muted);">지원혜택</div>
          <div style="color: var(--ink);">서비스(일자리)</div>
        </div>
      </section>

      <!-- 제공근거 섹션 -->
      <section style="margin-bottom: 32px;">
        <h2 style="font-size: 24px; font-weight: 700; color: var(--ink); margin-bottom: 20px; padding-bottom: 12px; border-bottom: 2px solid var(--mist-200);">
          📄 제공근거
        </h2>
        
        <div style="background: #f9fafb; padding: 20px; border-radius: 12px; border-left: 4px solid var(--accent);">
          <ul style="margin: 0; padding-left: 20px; line-height: 1.8;">
            <li><strong>[법령]</strong> 국민 평생 직업능력 개발법(제12조)</li>
            <li><strong>[법령]</strong> 국민 평생 직업능력 개발법(제15조)</li>
          </ul>
        </div>
      </section>

      <!-- 상세 설명 섹션 -->
      <section style="margin-bottom: 32px;">
        <h2 style="font-size: 24px; font-weight: 700; color: var(--ink); margin-bottom: 20px; padding-bottom: 12px; border-bottom: 2px solid var(--mist-200);">
          📝 상세 설명
        </h2>
        
        <div style="background: #fff; padding: 24px; border-radius: 12px; border: 1px solid var(--mist-200); line-height: 1.8;">
          <p style="margin-bottom: 16px;">
            고용노동부에서 운영하는 고객상담센터를 통해 취업, 직업훈련, 고용보험 등 고용정책 전반에 대한 상담 서비스를 제공합니다.
          </p>
          <p style="margin-bottom: 16px;">
            전화(1350) 또는 온라인을 통해 언제든지 상담받으실 수 있으며, 전문 상담사가 귀하의 상황에 맞는 맞춤형 정보를 제공해드립니다.
          </p>
          <p style="margin: 0;">
            특히 구직자, 재직자, 사업주 등 다양한 대상별 맞춤 서비스를 통해 효과적인 고용지원을 받으실 수 있습니다.
          </p>
        </div>
      </section>

      <!-- 신청 방법 섹션 -->
      <section style="margin-bottom: 32px;">
        <h2 style="font-size: 24px; font-weight: 700; color: var(--ink); margin-bottom: 20px; padding-bottom: 12px; border-bottom: 2px solid var(--mist-200);">
          📞 신청 및 이용 방법
        </h2>
        
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px;">
          
          <!-- 전화 상담 -->
          <div style="background: linear-gradient(135deg, #e0f2fe 0%, #f0f9ff 100%); padding: 24px; border-radius: 12px; text-align: center;">
            <div style="width: 60px; height: 60px; background: var(--accent); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 16px; color: white; font-size: 24px;">
              📞
            </div>
            <h3 style="font-size: 18px; font-weight: 700; margin-bottom: 12px;">전화 상담</h3>
            <p style="color: var(--muted); margin-bottom: 16px; line-height: 1.6;">
              고용노동부 고객상담센터로<br>언제든지 문의하세요
            </p>
            <div style="background: var(--accent); color: white; padding: 12px 20px; border-radius: 8px; font-size: 20px; font-weight: 700;">
              1350
            </div>
          </div>

          <!-- 온라인 신청 -->
          <div style="background: linear-gradient(135deg, #ede9fe 0%, #f3f4f6 100%); padding: 24px; border-radius: 12px; text-align: center;">
            <div style="width: 60px; height: 60px; background: #7c3aed; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 16px; color: white; font-size: 24px;">
              💻
            </div>
            <h3 style="font-size: 18px; font-weight: 700; margin-bottom: 12px;">온라인 신청</h3>
            <p style="color: var(--muted); margin-bottom: 16px; line-height: 1.6;">
              고용24 웹사이트를 통해<br>온라인으로 신청하세요
            </p>
            <a href="#" style="background: #7c3aed; color: white; padding: 12px 20px; border-radius: 8px; text-decoration: none; font-weight: 600; display: inline-block;">
              고용24 바로가기
            </a>
          </div>

          <!-- 방문 상담 -->
          <div style="background: linear-gradient(135deg, #fef3c7 0%, #fef9e7 100%); padding: 24px; border-radius: 12px; text-align: center;">
            <div style="width: 60px; height: 60px; background: #f59e0b; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 16px; color: white; font-size: 24px;">
              🏢
            </div>
            <h3 style="font-size: 18px; font-weight: 700; margin-bottom: 12px;">방문 상담</h3>
            <p style="color: var(--muted); margin-bottom: 16px; line-height: 1.6;">
              가까운 고용센터를<br>직접 방문하여 상담받으세요
            </p>
            <a href="#" style="background: #f59e0b; color: white; padding: 12px 20px; border-radius: 8px; text-decoration: none; font-weight: 600; display: inline-block;">
              센터 찾기
            </a>
          </div>

        </div>
      </section>

      <!-- 액션 버튼 -->
      <section style="text-align: center; padding: 32px 0; border-top: 2px solid var(--mist-200);">
        <div style="display: flex; gap: 16px; justify-content: center; flex-wrap: wrap;">
          <a href="tel:1350" style="background: var(--accent); color: white; padding: 16px 32px; border-radius: 12px; text-decoration: none; font-weight: 700; font-size: 16px; display: inline-flex; align-items: center; gap: 8px; transition: all 0.3s;">
            📞 전화상담 (1350)
          </a>
          <a href="#" style="background: #7c3aed; color: white; padding: 16px 32px; border-radius: 12px; text-decoration: none; font-weight: 700; font-size: 16px; display: inline-flex; align-items: center; gap: 8px; transition: all 0.3s;">
            💻 온라인 신청
          </a>
          <a href="<c:url value='/benefit' />" style="background: white; color: var(--muted); border: 2px solid var(--mist-200); padding: 16px 32px; border-radius: 12px; text-decoration: none; font-weight: 700; font-size: 16px; display: inline-flex; align-items: center; gap: 8px; transition: all 0.3s;">
            📋 목록으로
          </a>
        </div>
      </section>

    </div>
  </div>

  <!-- 관련 혜택 섹션 -->
  <section>
    <h2 style="font-size: 24px; font-weight: 700; color: var(--ink); margin-bottom: 24px; text-align: center;">
      🔗 관련 혜택 정보
    </h2>
    
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px;">
      
      <!-- 관련 혜택 카드 1 -->
      <div class="card" style="transition: all 0.3s; cursor: pointer;">
        <div class="card-body" style="padding: 24px; text-align: center;">
          <div style="width: 50px; height: 50px; background: linear-gradient(135deg, var(--accent) 0%, #3b82f6 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 16px; color: white; font-size: 20px;">
            💼
          </div>
          <h3 style="font-size: 16px; font-weight: 700; margin-bottom: 12px;">취업성공패키지</h3>
          <p style="color: var(--muted); font-size: 14px; line-height: 1.6;">
            개인별 취업지원 서비스를 통해 성공적인 취업을 도와드립니다.
          </p>
        </div>
      </div>

      <!-- 관련 혜택 카드 2 -->
      <div class="card" style="transition: all 0.3s; cursor: pointer;">
        <div class="card-body" style="padding: 24px; text-align: center;">
          <div style="width: 50px; height: 50px; background: linear-gradient(135deg, #10b981 0%, #34d399 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 16px; color: white; font-size: 20px;">
            🎓
          </div>
          <h3 style="font-size: 16px; font-weight: 700; margin-bottom: 12px;">직업능력개발</h3>
          <p style="color: var(--muted); font-size: 14px; line-height: 1.6;">
            다양한 직업훈련 프로그램을 통해 역량을 강화하세요.
          </p>
        </div>
      </div>

      <!-- 관련 혜택 카드 3 -->
      <div class="card" style="transition: all 0.3s; cursor: pointer;">
        <div class="card-body" style="padding: 24px; text-align: center;">
          <div style="width: 50px; height: 50px; background: linear-gradient(135deg, #f59e0b 0%, #fbbf24 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 16px; color: white; font-size: 20px;">
            💰
          </div>
          <h3 style="font-size: 16px; font-weight: 700; margin-bottom: 12px;">고용보험급여</h3>
          <p style="color: var(--muted); font-size: 14px; line-height: 1.6;">
            실업급여 및 각종 고용보험 혜택에 대해 안내해드립니다.
          </p>
        </div>
      </div>

    </div>
  </section>
 <jsp:include page="../include/footer.jsp"/>
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

  // 액션 버튼 호버 효과
  document.querySelectorAll('a[style*="transition"]').forEach(button => {
    button.addEventListener('mouseenter', function() {
      this.style.transform = 'translateY(-2px)';
      this.style.boxShadow = '0 4px 12px rgba(0, 0, 0, 0.15)';
    });
    
    button.addEventListener('mouseleave', function() {
      this.style.transform = 'translateY(0)';
      this.style.boxShadow = 'none';
    });
  });

  // 관련 혜택 카드 호버 효과
  document.querySelectorAll('.card[style*="cursor: pointer"]').forEach(card => {
    card.addEventListener('mouseenter', function() {
      this.style.transform = 'translateY(-4px)';
      this.style.boxShadow = '0 8px 24px rgba(0, 0, 0, 0.12)';
    });
    
    card.addEventListener('mouseleave', function() {
      this.style.transform = 'translateY(0)';
      this.style.boxShadow = 'var(--shadow)';
    });
  });

  // 공유 버튼 기능
  document.querySelectorAll('.share-btn').forEach(btn => {
    btn.addEventListener('click', function() {
      const title = this.getAttribute('title');
      alert(title + ' 기능이 실행됩니다.');
    });
  });
</script>

</body>
</html>