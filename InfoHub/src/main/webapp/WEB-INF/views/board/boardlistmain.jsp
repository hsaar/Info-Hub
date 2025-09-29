<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 - 정책 소통 플랫폼</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/board.css' />">
</head>
<body>

<header class="header">
		<%@ include file="../include/header.jsp"%>
	</header>
<!-- 페이지 헤더 -->
<div class="page-header">
  <div class="container">
    <h1 class="page-main-title">게시판</h1>
    <div class="social-share">
      <button class="share-btn" onclick="shareKakao()" title="카카오톡 공유">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
          <path d="M12 3c5.799 0 10.5 3.664 10.5 8.185 0 4.52-4.701 8.184-10.5 8.184a13.5 13.5 0 0 1-1.727-.11l-4.408 2.883c-.501.265-.678.236-.472-.413l.892-3.678c-2.88-1.46-4.785-3.99-4.785-6.866C1.5 6.665 6.201 3 12 3z"/>
        </svg>
      </button>
      <button class="share-btn" onclick="shareFacebook()" title="페이스북 공유">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
          <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
        </svg>
      </button>
    </div>
  </div>
</div>

<!-- 검색 섹션 -->
<section class="search-section">
  <div class="container">
    <form action="<c:url value='/board/search' />" method="get" class="search-box-large">
      <input type="text" name="keyword" class="search-input-large" 
             placeholder="게시글을 검색해보세요" 
             value="${param.keyword}">
      <button type="submit" class="search-btn-large">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
          <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
        </svg>
      </button>
    </form>
    <button class="advanced-search-btn" onclick="toggleAdvancedSearch()">고급 검색</button>
  </div>
</section>

<!-- 필터 섹션 -->
<div class="filter-section">
  <div class="container">
    <div class="filter-group">
      <form action="<c:url value='/board' />" method="get" style="display: flex; gap: 12px;">
        <select name="category" class="filter-select" onchange="this.form.submit()">
          <option value="">전체 카테고리</option>
          <option value="policy" ${param.category == 'policy' ? 'selected' : ''}>정책 토론</option>
          <option value="benefit" ${param.category == 'benefit' ? 'selected' : ''}>혜택 정보</option>
          <option value="qna" ${param.category == 'qna' ? 'selected' : ''}>질문/답변</option>
          <option value="free" ${param.category == 'free' ? 'selected' : ''}>자유게시판</option>
        </select>
        <input type="hidden" name="sort" value="${param.sort}">
      </form>
    </div>
    <div class="view-options">
      <a href="<c:url value='/board?sort=latest&category=${param.category}' />" 
         class="sort-option-btn ${empty param.sort or param.sort == 'latest' ? 'active' : ''}">최신순</a>
      <a href="<c:url value='/board?sort=popular&category=${param.category}' />" 
         class="sort-option-btn ${param.sort == 'popular' ? 'active' : ''}">인기순</a>
      <a href="<c:url value='/board?sort=comments&category=${param.category}' />" 
         class="sort-option-btn ${param.sort == 'comments' ? 'active' : ''}">댓글순</a>
    </div>
  </div>
</div>

<!-- 게시글 목록 -->
<div class="board-container">
  <div class="container">
    <c:choose>
      <c:when test="${not empty boardList}">
        <div class="board-list">
          <!-- 게시판 헤더 -->
          <div class="board-header">
            <div>번호</div>
            <div>제목</div>
            <div class="board-author">작성자</div>
            <div class="board-date">작성일</div>
            <div>조회</div>
          </div>
          
          <!-- 게시글 목록 -->
          <c:forEach var="board" items="${boardList}" varStatus="status">
            <div class="board-item ${board.isNotice ? 'notice-item' : ''}">
              <div class="board-number">
                <c:choose>
                  <c:when test="${board.isNotice}">공지</c:when>
                  <c:otherwise>${board.boardNo}</c:otherwise>
                </c:choose>
              </div>
              <div class="board-title">
                <c:if test="${board.isNotice}">
                  <span class="notice-badge">공지</span>
                </c:if>
                <c:if test="${not empty board.category and not board.isNotice}">
                  <span class="category-badge">${board.categoryName}</span>
                </c:if>
                <a href="<c:url value='/board/view/${board.boardNo}' />">
                  <c:choose>
                    <c:when test="${not empty param.keyword}">
                      ${board.title.replaceAll(param.keyword, '<span class="search-highlight">' + param.keyword + '</span>')}
                    </c:when>
                    <c:otherwise>
                      ${board.title}
                    </c:otherwise>
                  </c:choose>
                  <c:if test="${board.commentCount > 0}">
                    <span class="comment-count">[${board.commentCount}]</span>
                  </c:if>
                  <c:if test="${board.isNew}">
                    <span class="new-badge"></span>
                  </c:if>
                  <c:if test="${board.isHot}">
                    <span class="hot-badge">HOT</span>
                  </c:if>
                </a>
              </div>
              <div class="board-author">${board.authorName}</div>
              <div class="board-date">${board.createDate}</div>
              <div class="board-views">${board.viewCount}</div>
            </div>
          </c:forEach>
        </div>
        
        <!-- 페이지네이션 -->
        <c:if test="${totalPages > 1}">
          <nav class="pagination-nav">
            <c:if test="${currentPage > 1}">
              <a href="<c:url value='/board?page=${currentPage - 1}&category=${param.category}&sort=${param.sort}&keyword=${param.keyword}' />" 
                 class="page-arrow">‹</a>
            </c:if>
            
            <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
              <a href="<c:url value='/board?page=${pageNum}&category=${param.category}&sort=${param.sort}&keyword=${param.keyword}' />" 
                 class="page-number ${currentPage == pageNum ? 'active' : ''}">${pageNum}</a>
            </c:forEach>
            
            <c:if test="${currentPage < totalPages}">
              <a href="<c:url value='/board?page=${currentPage + 1}&category=${param.category}&sort=${param.sort}&keyword=${param.keyword}' />" 
                 class="page-arrow">›</a>
            </c:if>
          </nav>
        </c:if>
      </c:when>
      <c:otherwise>
        <!-- 빈 상태 -->
        <div class="empty-state">
          <h3>
            <c:choose>
              <c:when test="${not empty param.keyword}">
                "${param.keyword}"에 대한 검색 결과가 없습니다
              </c:when>
              <c:when test="${not empty param.category}">
                해당 카테고리에 게시글이 없습니다
              </c:when>
              <c:otherwise>
                게시글이 없습니다
              </c:otherwise>
            </c:choose>
          </h3>
          <p>
            <c:choose>
              <c:when test="${not empty param.keyword}">
                다른 검색어를 시도해보세요.
              </c:when>
              <c:otherwise>
                첫 번째 게시글을 작성해보세요!
              </c:otherwise>
            </c:choose>
          </p>
        </div>
      </c:otherwise>
    </c:choose>
  </div>
</div>

<!-- 글쓰기 버튼 -->
<c:if test="${not empty sessionScope.user}">
  <a href="<c:url value='/board/write' />" class="write-btn" title="글쓰기">
    <svg width="28" height="28" viewBox="0 0 24 24" fill="currentColor">
      <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/>
    </svg>
  </a>
</c:if>

<!-- Top 버튼 -->
<button class="top-button" id="topButton" aria-label="맨 위로 이동">
  <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
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

// 검색 기능 개선
const searchInput = document.querySelector('.search-input-large');
if (searchInput) {
  searchInput.addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
      e.preventDefault();
      this.closest('form').submit();
    }
  });
}

// 고급 검색 토글
function toggleAdvancedSearch() {
  // 고급 검색 모달이나 패널을 여는 기능
  alert('고급 검색 기능을 구현해주세요.');
}

// 소셜 공유 기능
function shareKakao() {
  const url = window.location.href;
  const title = document.title;
  
  if (typeof Kakao !== 'undefined') {
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: title,
        description: '정책 소통 플랫폼 게시판',
        imageUrl: window.location.origin + '/resources/images/logo.png',
        link: {
          mobileWebUrl: url,
          webUrl: url,
        },
      },
    });
  } else {
    alert('카카오톡 공유를 위해 카카오 SDK를 로드해주세요.');
  }
}

function shareFacebook() {
  const url = encodeURIComponent(window.location.href);
  const shareUrl = `https://www.facebook.com/sharer/sharer.php?u=${url}`;
  window.open(shareUrl, '_blank', 'width=600,height=400');
}

// 게시글 목록 새로고침 (AJAX)
function refreshBoardList() {
  const currentUrl = new URL(window.location);
  fetch(currentUrl.toString(), {
    headers: {
      'X-Requested-With': 'XMLHttpRequest'
    }
  })
  .then(response => response.text())
  .then(html => {
    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');
    const newBoardList = doc.querySelector('.board-list');
    const currentBoardList = document.querySelector('.board-list');
    
    if (newBoardList && currentBoardList) {
      currentBoardList.innerHTML = newBoardList.innerHTML;
    }
  })
  .catch(error => {
    console.error('게시글 목록 새로고침 실패:', error);
  });
}

// 키보드 네비게이션
document.addEventListener('keydown', function(e) {
  if (e.ctrlKey && e.key === '/') {
    e.preventDefault();
    if (searchInput) {
      searchInput.focus();
    }
  }
});

// 무한 스크롤 (옵션)
let isLoading = false;
let currentPage = parseInt('${currentPage}') || 1;
const totalPages = parseInt('${totalPages}') || 1;

window.addEventListener('scroll', function() {
  if (isLoading || currentPage >= totalPages) return;
  
  const scrollTop = window.pageYOffset;
  const windowHeight = window.innerHeight;
  const documentHeight = document.documentElement.scrollHeight;
  
  if (scrollTop + windowHeight >= documentHeight - 1000) {
    loadMorePosts();
  }
});

function loadMorePosts() {
  if (isLoading) return;
  
  isLoading = true;
  const nextPage = currentPage + 1;
  
  const url = new URL(window.location);
  url.searchParams.set('page', nextPage);
  
  fetch(url.toString(), {
    headers: {
      'X-Requested-With': 'XMLHttpRequest'
    }
  })
  .then(response => response.text())
  .then(html => {
    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');
    const newItems = doc.querySelectorAll('.board-item');
    const boardList = document.querySelector('.board-list');
    
    newItems.forEach(item => {
      boardList.appendChild(item);
    });
    
    currentPage = nextPage;
    isLoading = false;
  })
  .catch(error => {
    console.error('더 많은 게시글 로드 실패:', error);
    isLoading = false;
  });
}

// 페이지 로드 시 실행
document.addEventListener('DOMContentLoaded', function() {
  // 검색어 하이라이트 기능이 서버에서 처리되지 않은 경우 클라이언트에서 처리
  const keyword = '${param.keyword}';
  if (keyword && keyword.trim()) {
    const boardTitles = document.querySelectorAll('.board-title a');
    boardTitles.forEach(title => {
      const originalText = title.textContent;
      const highlightedText = originalText.replace(
        new RegExp(keyword, 'gi'), 
        '<span class="search-highlight">$&</span>'
      );
      if (originalText !== highlightedText) {
        title.innerHTML = highlightedText;
      }
    });
  }
});
</script>

</body>
</html>