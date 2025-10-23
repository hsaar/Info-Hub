<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<style>
a {
  text-decoration: none;
}
</style>
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
      <!-- 분야 필터 -->
      <div class="category-filter">
      	<c:set var="userKeywords" value="${keyword0},${keyword1},${keyword2},${keyword3},${keyword4}" />
      	<c:set var="defaultKeywords" value="취업지원,문화바우처,의료비지원,심리상담,생활안정" />
      	<c:set var="count" value="0" />
      	
		<c:set var="allUserKeywords" value="${fn:split(userKeywords, ',')}" />
		<c:forEach var="kw" items="${allUserKeywords}">
		  <c:if test="${not empty kw and count lt 5}">
		    <button class="filter-btn primary">${kw}</button>
		    <c:set var="count" value="${count + 1}" />
		  </c:if>
		</c:forEach>
        
        <c:forEach var="base" items="${fn:split(defaultKeywords, ',')}">
		  <c:if test="${!fn:contains(userKeywords, base) and count lt 5}">
		    <button class="filter-btn">${base}</button>
		    <c:set var="count" value="${count + 1}" />
		  </c:if>
		</c:forEach>
        
        <button class="add-filter-btn">+</button>
      </div>
    </div>

    <!-- 기사 그리드 -->
    <div class="news-grid">
	  <c:set var="count" value="0"/>

		<!-- ===================== USER KEYWORD 0 ===================== -->
		<c:if test="${not empty keyword0 and count lt 5}">
		  <div class="news-category-card">
		    <h2 class="category-title">${keyword0}</h2>
		    <div class="news-list">
		      <c:forEach var="item" items="${list0}">
		      	<a href = "${item.link}" target="_blank">
		        <div class="news-item">
		          <div class="news-content">
		            <p class="news-text">${item.title}</p>
		            <span class="news-source">${item.source}</span>
		          </div>
		          <div class="news-thumbnail">
		            <img src="resources/image/${item.image}" alt="${item.image}" />
		          </div>
		        </div>
		        </a>
		      </c:forEach>
		    </div>
		  </div>
		  <c:set var="count" value="${count + 1}" />
		</c:if>
		
		<!-- ===================== USER KEYWORD 1 ===================== -->
		<c:if test="${not empty keyword1 and keyword1 ne keyword0 and count lt 5}">
		  <div class="news-category-card">
		    <h2 class="category-title">${keyword1}</h2>
		    <div class="news-list">
		      <c:forEach var="item" items="${list1}">
		      	<a href = "${item.link}" target="_blank">
		        <div class="news-item">
		          <div class="news-content">
		            <p class="news-text">${item.title}</p>
		            <span class="news-source">${item.source}</span>
		          </div>
		          <div class="news-thumbnail">
		            <img src="resources/image/${item.image}" alt="${item.image}" />
		          </div>
		        </div>
		        </a>
		      </c:forEach>
		    </div>
		  </div>
		  <c:set var="count" value="${count + 1}" />
		</c:if>
		
		<!-- ===================== USER KEYWORD 2 ===================== -->
		<c:if test="${not empty keyword2 and keyword2 ne keyword0 and keyword2 ne keyword1 and count lt 5}">
		  <div class="news-category-card">
		    <h2 class="category-title">${keyword2}</h2>
		    <div class="news-list">
		      <c:forEach var="item" items="${list2}">
		      	<a href = "${item.link}" target="_blank">
		        <div class="news-item">
		          <div class="news-content">
		            <p class="news-text">${item.title}</p>
		            <span class="news-source">${item.source}</span>
		          </div>
		          <div class="news-thumbnail">
		            <img src="resources/image/${item.image}" alt="${item.image}" />
		          </div>
		        </div>
		        </a>
		      </c:forEach>
		    </div>
		  </div>
		  <c:set var="count" value="${count + 1}" />
		</c:if>
		
		<!-- ===================== USER KEYWORD 3 ===================== -->
		<c:if test="${not empty keyword3 and keyword3 ne keyword0 and keyword3 ne keyword1 and keyword3 ne keyword2 and count lt 5}">
		  <div class="news-category-card">
		    <h2 class="category-title">${keyword3}</h2>
		    <div class="news-list">
		      <c:forEach var="item" items="${list3}">
		      	<a href = "${item.link}" target="_blank">
		        <div class="news-item">
		          <div class="news-content">
		            <p class="news-text">${item.title}</p>
		            <span class="news-source">${item.source}</span>
		          </div>
		          <div class="news-thumbnail">
		            <img src="resources/image/${item.image}" alt="${item.image}" />
		          </div>
		        </div>
		        </a>
		      </c:forEach>
		    </div>
		  </div>
		  <c:set var="count" value="${count + 1}" />
		</c:if>
		
		<!-- ===================== USER KEYWORD 4 ===================== -->
		<c:if test="${not empty keyword4 and keyword4 ne keyword0 and keyword4 ne keyword1 and keyword4 ne keyword2 and keyword4 ne keyword3 and count lt 5}">
		  <div class="news-category-card">
		    <h2 class="category-title">${keyword4}</h2>
		    <div class="news-list">
		      <c:forEach var="item" items="${list4}">
		      	<a href = "${item.link}" target="_blank">
		        <div class="news-item">
		          <div class="news-content">
		            <p class="news-text">${item.title}</p>
		            <span class="news-source">${item.source}</span>
		          </div>
		          <div class="news-thumbnail">
		            <img src="resources/image/${item.image}" alt="${item.image}" />
		          </div>
		        </div>
		        </a>
		      </c:forEach>
		    </div>
		  </div>
		  <c:set var="count" value="${count + 1}" />
		</c:if>
		
		<!-- ===================== DEFAULT KEYWORD 1: 취업지원 ===================== -->
		<c:if test="${count lt 5 and (keyword0 ne '취업지원' and keyword1 ne '취업지원' and keyword2 ne '취업지원' and keyword3 ne '취업지원' and keyword4 ne '취업지원')}">
		  <div class="news-category-card">
		    <h2 class="category-title">취업지원</h2>
		    <div class="news-list">
		      <c:forEach var="item" items="${list5}">
		      	<a href = "${item.link}" target="_blank">
		        <div class="news-item">
		          <div class="news-content">
		            <p class="news-text">${item.title}</p>
		            <span class="news-source">${item.source}</span>
		          </div>
		          <div class="news-thumbnail">
		            <img src="resources/image/${item.image}" alt="${item.image}" />
		          </div>
		        </div>
		        </a>
		      </c:forEach>
		    </div>
		  </div>
		  <c:set var="count" value="${count + 1}" />
		</c:if>
		
		<!-- ===================== DEFAULT KEYWORD 2: 문화바우처 ===================== -->
		<c:if test="${count lt 5 and (keyword0 ne '문화바우처' and keyword1 ne '문화바우처' and keyword2 ne '문화바우처' and keyword3 ne '문화바우처' and keyword4 ne '문화바우처')}">
		  <div class="news-category-card">
		    <h2 class="category-title">문화바우처</h2>
		    <div class="news-list">
		      <c:forEach var="item" items="${list6}">
		      	<a href = "${item.link}" target="_blank">
		        <div class="news-item">
		          <div class="news-content">
		            <p class="news-text">${item.title}</p>
		            <span class="news-source">${item.source}</span>
		          </div>
		          <div class="news-thumbnail">
		            <img src="resources/image/${item.image}" alt="${item.image}" />
		          </div>
		        </div>
		        </a>
		      </c:forEach>
		    </div>
		  </div>
		  <c:set var="count" value="${count + 1}" />
		</c:if>
		
		<!-- ===================== DEFAULT KEYWORD 3: 의료비지원 ===================== -->
		<c:if test="${count lt 5 and (keyword0 ne '의료비지원' and keyword1 ne '의료비지원' and keyword2 ne '의료비지원' and keyword3 ne '의료비지원' and keyword4 ne '의료비지원')}">
		  <div class="news-category-card">
		    <h2 class="category-title">의료비지원</h2>
		    <div class="news-list">
		      <c:forEach var="item" items="${list7}">
		      	<a href = "${item.link}" target="_blank">
		        <div class="news-item">
		          <div class="news-content">
		            <p class="news-text">${item.title}</p>
		            <span class="news-source">${item.source}</span>
		          </div>
		          <div class="news-thumbnail">
		            <img src="resources/image/${item.image}" alt="${item.image}" />
		          </div>
		        </div>
		        </a>
		      </c:forEach>
		    </div>
		  </div>
		  <c:set var="count" value="${count + 1}" />
		</c:if>
		
		<!-- ===================== DEFAULT KEYWORD 4: 심리상담 ===================== -->
		<c:if test="${count lt 5 and (keyword0 ne '심리상담' and keyword1 ne '심리상담' and keyword2 ne '심리상담' and keyword3 ne '심리상담' and keyword4 ne '심리상담')}">
		  <div class="news-category-card">
		    <h2 class="category-title">심리상담</h2>
		    <div class="news-list">
		      <c:forEach var="item" items="${list8}">
		      	<a href = "${item.link}" target="_blank">
		        <div class="news-item">
		          <div class="news-content">
		            <p class="news-text">${item.title}</p>
		            <span class="news-source">${item.source}</span>
		          </div>
		          <div class="news-thumbnail">
		            <img src="resources/image/${item.image}" alt="${item.image}" />
		          </div>
		        </div>
		        </a>
		      </c:forEach>
		    </div>
		  </div>
		  <c:set var="count" value="${count + 1}" />
		</c:if>
		
		<!-- ===================== DEFAULT KEYWORD 5: 생활안정 ===================== -->
		<c:if test="${count lt 5 and (keyword0 ne '생활안정' and keyword1 ne '생활안정' and keyword2 ne '생활안정' and keyword3 ne '생활안정' and keyword4 ne '생활안정')}">
		  <div class="news-category-card">
		    <h2 class="category-title">생활안정</h2>
		    <div class="news-list">
		      <c:forEach var="item" items="${list9}">
		      	<a href = "${item.link}" target="_blank">
		        <div class="news-item">
		          <div class="news-content">
		            <p class="news-text">${item.title}</p>
		            <span class="news-source">${item.source}</span>
		          </div>
		          <div class="news-thumbnail">
		            <img src="resources/image/${item.image}" alt="${item.image}" />
		          </div>
		        </div>
		        </a>
		      </c:forEach>
		    </div>
		  </div>
		  <c:set var="count" value="${count + 1}" />
		</c:if>

    </div>
  </div>
</div>

<!-- 키워드 선택 모달 -->
<div id="profileKeywordModal" class="modal">
  <div class="modal-content keyword-modal">
    <div class="modal-header">
      <i class="fas fa-tags modal-icon primary"></i>
      <h3 class="modal-title">관심 키워드 선택</h3>
      <p class="modal-subtitle">관심있는 분야를 선택해주세요 (최대 5개)</p>
    </div>
    <div class="modal-body">
      <div class="keyword-categories">
        <!-- 일자리/취업 -->
        <div class="keyword-category">
          <h4 class="category-title">
            <i class="fas fa-briefcase"></i> 일자리/취업
          </h4>
          <div class="keyword-tags">
            <button class="keyword-tag" data-keyword="청년일자리">청년일자리</button>
            <button class="keyword-tag" data-keyword="취업지원">취업지원</button>
            <button class="keyword-tag" data-keyword="직업훈련">직업훈련</button>
            <button class="keyword-tag" data-keyword="창업지원">창업지원</button>
          </div>
        </div>

        <!-- 주거/복지 -->
        <div class="keyword-category">
          <h4 class="category-title">
            <i class="fas fa-home"></i> 주거/복지
          </h4>
          <div class="keyword-tags">
            <button class="keyword-tag" data-keyword="주거지원">주거지원</button>
            <button class="keyword-tag" data-keyword="생활안정">생활안정</button>
            <button class="keyword-tag" data-keyword="복지혜택">복지혜택</button>
            <button class="keyword-tag" data-keyword="임대주택">임대주택</button>
          </div>
        </div>

        <!-- 교육 -->
        <div class="keyword-category">
          <h4 class="category-title">
            <i class="fas fa-graduation-cap"></i> 교육
          </h4>
          <div class="keyword-tags">
            <button class="keyword-tag" data-keyword="학자금지원">학자금지원</button>
            <button class="keyword-tag" data-keyword="교육비지원">교육비지원</button>
            <button class="keyword-tag" data-keyword="평생교육">평생교육</button>
            <button class="keyword-tag" data-keyword="온라인교육">온라인교육</button>
          </div>
        </div>

        <!-- 문화/여가 -->
        <div class="keyword-category">
          <h4 class="category-title">
            <i class="fas fa-palette"></i> 문화/여가
          </h4>
          <div class="keyword-tags">
            <button class="keyword-tag" data-keyword="문화바우처">문화바우처</button>
            <button class="keyword-tag" data-keyword="여행지원">여행지원</button>
            <button class="keyword-tag" data-keyword="스포츠">스포츠</button>
            <button class="keyword-tag" data-keyword="공연할인">공연할인</button>
          </div>
        </div>

        <!-- 건강/의료 -->
        <div class="keyword-category">
          <h4 class="category-title">
            <i class="fas fa-heartbeat"></i> 건강/의료
          </h4>
          <div class="keyword-tags">
            <button class="keyword-tag" data-keyword="건강검진">건강검진</button>
            <button class="keyword-tag" data-keyword="의료비지원">의료비지원</button>
            <button class="keyword-tag" data-keyword="심리상담">심리상담</button>
            <button class="keyword-tag" data-keyword="건강관리">건강관리</button>
          </div>
        </div>

        <!-- 금융/경제 -->
        <div class="keyword-category">
          <h4 class="category-title">
            <i class="fas fa-won-sign"></i> 금융/경제
          </h4>
          <div class="keyword-tags">
            <button class="keyword-tag" data-keyword="대출지원">대출지원</button>
            <button class="keyword-tag" data-keyword="금융교육">금융교육</button>
            <button class="keyword-tag" data-keyword="세금감면">세금감면</button>
            <button class="keyword-tag" data-keyword="재정지원">재정지원</button>
          </div>
        </div>
      </div>
      
	<form id="profileKeywordForm" action="${pageContext.request.contextPath}/updateKeywords" method="post">
	  <input type="hidden" id="profileSelectedKeywords" name="profileSelectedKeywords" value="">
	  <input type="hidden" id="profileKeywordsInput" name="profileKeywordsInput" value="">
	</form>
	 
      <div class="selected-keywords-display">
        <strong>선택된 키워드:</strong>
        <span id="profileSelectedKeywordsDisplay">없음</span>
      </div>
    </div>
    <div class="modal-footer">
      <button class="modal-btn primary" onclick="confirmProfileKeywords()">확인</button>
      <button class="modal-btn secondary" onclick="closeProfileKeywordModal()">취소</button>
    </div>
    
  </div>
</div>

<!-- Top 버튼 -->
<button class="top-button" id="topButton" aria-label="맨 위로 이동">
  <svg viewBox="0 0 24 24">
    <path d="M12 4l-8 8h6v8h4v-8h6z"/>
  </svg>
</button>
 <jsp:include page="../include/footer.jsp"/>

<script>
  // Top 버튼
  const topButton = document.getElementById('topButton');
  window.addEventListener('scroll', function() {
    topButton.classList.toggle('show', window.scrollY > 300);
  });
  topButton.addEventListener('click', function() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
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
  
  // ===== 키워드 선택 기능 =====
  let profileSelectedKeywordsArray = [];
  const PROFILE_MAX_KEYWORDS = 5;

  function openProfileKeywordModal() {
    document.getElementById('profileKeywordModal').style.display = 'flex';
    document.body.style.overflow = 'hidden';
    
    const currentKeywords = document.getElementById('profileSelectedKeywords').value;
    if (currentKeywords) {
      profileSelectedKeywordsArray = currentKeywords.split(',').filter(k => k.trim());
      updateProfileKeywordDisplay();
      highlightProfileSelectedKeywords();
    }
  }

  function closeProfileKeywordModal() {
    document.getElementById('profileKeywordModal').style.display = 'none';
    document.body.style.overflow = 'auto';
  }

  function confirmProfileKeywords() {
    if (profileSelectedKeywordsArray.length === 0) {
      alert('최소 1개의 키워드를 선택해주세요.');
      return; 
    }
    
    const keywordsString = profileSelectedKeywordsArray.join(', ');
    document.getElementById('profileKeywordsInput').value = keywordsString;
    document.getElementById('profileSelectedKeywords').value = profileSelectedKeywordsArray.join(',');
    
    // 서버로 폼 제출
    document.getElementById('profileKeywordForm').submit();
  }

  function updateProfileKeywordDisplay() {
    const display = document.getElementById('profileSelectedKeywordsDisplay');
    if (profileSelectedKeywordsArray.length === 0) {
      display.textContent = '없음';
      display.style.color = '#9ca3af';
    } else {
      display.textContent = profileSelectedKeywordsArray.join(', ');
      display.style.color = '#1f2937';
    }
  }

  function highlightProfileSelectedKeywords() {
    document.querySelectorAll('#profileKeywordModal .keyword-tag').forEach(tag => {
      const keyword = tag.getAttribute('data-keyword');
      if (profileSelectedKeywordsArray.includes(keyword)) {
        tag.classList.add('selected');
      } else {
        tag.classList.remove('selected');
      }
    });
  }
  
  addFilterBtn.addEventListener('click', function() {
	  openProfileKeywordModal();
  });
  
  document.querySelectorAll('#profileKeywordModal .keyword-tag').forEach(tag => {
	  tag.addEventListener('click', function() {
	      const keyword = this.getAttribute('data-keyword');
	      
	      if (this.classList.contains('selected')) {
	        const index = profileSelectedKeywordsArray.indexOf(keyword);
	        if (index > -1) {
	          profileSelectedKeywordsArray.splice(index, 1);
	        }
	        this.classList.remove('selected');
	      } else {
	        if (profileSelectedKeywordsArray.length >= PROFILE_MAX_KEYWORDS) {
	          alert(`최대 5개까지만 선택할 수 있습니다.`);
	          return;
	        }
	        profileSelectedKeywordsArray.push(keyword);
	        this.classList.add('selected');
	      }
	      
	      updateProfileKeywordDisplay();
	    });
  });
</script>

</body>
</html>