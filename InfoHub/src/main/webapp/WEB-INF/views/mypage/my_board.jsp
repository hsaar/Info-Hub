<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 - 마이페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
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
        <a href="#" class="menu-item">
          <span class="menu-text">스크랩 기사</span>
        </a>
        <a href="#" class="menu-item">
          <span class="menu-text">타임라인</span>
        </a>
        <a href="<c:url value='/mypage/my_board' />" class="menu-item active">
          <span class="menu-text">게시판</span>
        </a>
      </nav>
    </aside>

    <!-- 메인 콘텐츠 영역 -->
    <main class="mypage-content">
      <h2 class="content-title">게시판</h2>

      <div class="mypage-tabs">
        <button class="mypage-tab" data-tab="posts">게시물</button>
        <button class="mypage-tab active" data-tab="comments">댓글</button>
        <button class="mypage-tab" data-tab="likes">좋아요</button>
      </div>

      <!-- 게시물 탭 내용 -->
      <div class="tab-content" id="posts-tab" style="display: none;">
        <div class="mypage-list">
          <div class="list-item">내가 작성한 게시물 1</div>
          <div class="list-item">내가 작성한 게시물 2</div>
          <div class="list-item">내가 작성한 게시물 3</div>
        </div>
      </div>

      <!-- 댓글 탭 내용 -->
      <div class="tab-content" id="comments-tab" style="display: block;">
        <div class="mypage-list">
          <div class="list-item">내가 작성한 댓글 1</div>
          <div class="list-item">내가 작성한 댓글 2</div>
          <div class="list-item">내가 작성한 댓글 3</div>
        </div>
      </div>

      <!-- 좋아요 탭 내용 -->
      <div class="tab-content" id="likes-tab" style="display: none;">
        <div class="mypage-list">
          <div class="list-item">좋아요 누른 게시물 1</div>
          <div class="list-item">좋아요 누른 게시물 2</div>
          <div class="list-item">좋아요 누른 게시물 3</div>
        </div>
      </div>
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

  // 탭 전환 기능
  const boardTabs = document.querySelectorAll('.mypage-tab');
  const tabContents = document.querySelectorAll('.tab-content');
  
  boardTabs.forEach(tab => {
    tab.addEventListener('click', function() {
      // 모든 탭 비활성화
      boardTabs.forEach(t => t.classList.remove('active'));
      // 클릭한 탭 활성화
      this.classList.add('active');
      
      // 모든 탭 내용 숨기기
      tabContents.forEach(content => {
        content.style.display = 'none';
      });
      
      // 선택한 탭 내용 보이기
      const tabId = this.getAttribute('data-tab');
      const targetContent = document.getElementById(tabId + '-tab');
      if (targetContent) {
        targetContent.style.display = 'block';
      }
    });
  });
</script>

</body>
</html>