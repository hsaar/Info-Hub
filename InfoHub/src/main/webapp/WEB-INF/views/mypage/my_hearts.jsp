<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>좋아요 누른 기사 - 마이페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/my_hearts.css' />">
</head>
<body>

<!-- 상단바 -->
<%@ include file="../include/header.jsp"%>

<!-- 마이페이지 컨테이너 -->
<div class="mypage-container">
  <div class="container">
    
    <!-- 좌측 사이드바 -->
    <aside class="mypage-sidebar">
      <h3 class="sidebar-title">프로필 정보</h3>
      
      <nav class="sidebar-menu">
        <a href="<c:url value='/mypage/mypage_main' />" class="menu-item">
          <span class="menu-text">나의 정보</span>
        </a>
        <a href="#" class="menu-item">
          <span class="menu-text">스크랩 혜택</span>
        </a>
        <a href="<c:url value='/mypage/my_hearts' />" class="menu-item active">
          <span class="menu-text">좋아요 누른 기사</span>
        </a>
        <a href="#" class="menu-item">
          <span class="menu-text">타임라인</span>
        </a>
        <a href="<c:url value='/mypage/my_board' />" class="menu-item">
          <span class="menu-text">게시판</span>
        </a>
      </nav>
    </aside>

    <!-- 메인 콘텐츠 영역 -->
    <main class="mypage-content">
      <h2 class="content-title">좋아요 누른 기사</h2>
      
      <!-- 필터 및 정렬 -->
      <div class="scrap-filter">
        <div class="filter-left">
          <span>전체 <strong>${totalCount}</strong>건</span>
        </div>
        <div class="sort-buttons">
          <button class="sort-btn active" data-sort="latest">최신순</button>
          <button class="sort-btn" data-sort="oldest">오래된순</button>
          <button class="sort-btn" data-sort="category">카테고리별</button>
        </div>
      </div>

      <!-- 좋아요 누른 기사 목록 -->
      <div class="hearts-list">
        <c:choose>
          <c:when test="${empty heartsList}">
            <div class="empty-message">
              <p>좋아요 누른 기사가 없습니다.</p>
            </div>
          </c:when>
          <c:otherwise>
            <c:forEach var="article" items="${heartsList}">
              <div class="hearts-card" data-article-id="${article.articleId}">
                <div class="hearts-header">
                  <span class="hearts-badge">${article.category}</span>
                  <span class="hearts-date">${article.likeDate}</span>
                </div>
                
                <div class="hearts-content">
                  <h3 class="hearts-title">
                    <a href="<c:url value='/article/${article.articleId}' />">
                      ${article.title}
                    </a>
                  </h3>
                  
                  <c:if test="${not empty article.thumbnail}">
                    <div class="hearts-thumbnail">
                      <img src="${article.thumbnail}" alt="${article.title}">
                    </div>
                  </c:if>
                  
                  <p class="hearts-summary">${article.summary}</p>
                  
                  <div class="hearts-meta">
                    <span class="hearts-author">${article.author}</span>
                    <span class="hearts-divider">|</span>
                    <span class="hearts-publish-date">${article.publishDate}</span>
                  </div>
                </div>
                
                <div class="hearts-footer">
                  <button class="hearts-btn unlike" onclick="unlikeArticle(${article.articleId})">
                    <svg viewBox="0 0 24 24" width="16" height="16">
                      <path fill="currentColor" d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
                    </svg>
                    좋아요 취소
                  </button>
                  <a href="<c:url value='/article/${article.articleId}' />" class="hearts-btn view">
                    기사 보기
                  </a>
                </div>
              </div>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </div>

      <!-- 페이지네이션 -->
      <c:if test="${not empty heartsList and totalPages > 1}">
        <div class="pagination-nav">
          <c:if test="${currentPage > 1}">
            <a href="?page=${currentPage - 1}" class="page-arrow">‹</a>
          </c:if>
          
          <c:forEach begin="1" end="${totalPages}" var="i">
            <a href="?page=${i}" class="page-number ${i == currentPage ? 'active' : ''}">${i}</a>
          </c:forEach>
          
          <c:if test="${currentPage < totalPages}">
            <a href="?page=${currentPage + 1}" class="page-arrow">›</a>
          </c:if>
        </div>
      </c:if>

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

  // 정렬 버튼
  const sortBtns = document.querySelectorAll('.sort-btn');
  sortBtns.forEach(btn => {
    btn.addEventListener('click', function() {
      sortBtns.forEach(b => b.classList.remove('active'));
      this.classList.add('active');
      
      const sortType = this.getAttribute('data-sort');
      // 정렬 로직 실행
      window.location.href = '?sort=' + sortType;
    });
  });

  // 좋아요 취소 함수
  function unlikeArticle(articleId) {
    if (!confirm('이 기사의 좋아요를 취소하시겠습니까?')) {
      return;
    }

    fetch('<c:url value="/api/article/unlike" />', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        articleId: articleId
      })
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      if (data.success) {
        // 성공 메시지
        alert('좋아요가 취소되었습니다.');
        
        // 해당 카드 제거
        const card = document.querySelector(`[data-article-id="${articleId}"]`);
        if (card) {
          card.style.transition = 'all 0.3s ease';
          card.style.opacity = '0';
          card.style.transform = 'translateX(-20px)';
          
          setTimeout(() => {
            card.remove();
            
            // 목록이 비었는지 확인
            const heartsList = document.querySelector('.hearts-list');
            if (heartsList.children.length === 0) {
              heartsList.innerHTML = '<div class="empty-message"><p>좋아요 누른 기사가 없습니다.</p></div>';
            }
          }, 300);
        }
        
        // 카운트 업데이트
        updateCount();
      } else {
        alert(data.message || '좋아요 취소에 실패했습니다.');
      }
    })
    .catch(error => {
      console.error('Error:', error);
      // 오류 발생 시 error.jsp로 이동
      window.location.href = '<c:url value="/error" />?msg=' + encodeURIComponent('좋아요 취소 중 오류가 발생했습니다.');
    });
  }

  // 카운트 업데이트 함수
  function updateCount() {
    const cards = document.querySelectorAll('.hearts-card');
    const countElement = document.querySelector('.filter-left strong');
    if (countElement) {
      countElement.textContent = cards.length;
    }
  }
</script>
</body>
</html>