<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
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
        <a href="#" class="menu-item" data-page="my-info">
          <span class="menu-text">나의 정보</span>
        </a>
        <a href="#" class="menu-item" data-page="my-policy">
          <span class="menu-text">나의 정책</span>
        </a>
        <a href="#" class="menu-item" data-page="timeline">
          <span class="menu-text">타임라인</span>
        </a>
        <a href="#" class="menu-item" data-page="board">
          <span class="menu-text">게시판</span>
        </a>
        <a href="#" class="menu-item" data-page="likes">
          <span class="menu-text">스크랩</span>
        </a>
     
      </nav>

      <div class="sidebar-categories">
        <h4 class="category-title">카테고리</h4>
        <ul class="category-list">
          <li>나의 정보 - 개인 정보</li>
          <li>나의 정책 - 스크랩</li>
          <li>타임라인 - 스크랩한 정책 타임라인</li>
          <li>게시판 - 작성한 게시글, 댓글 표시</li>
          <li>좋아요 - 좋아요 누른 게시글</li>
          <li>알림 관리 - 알림 설정한 정책 목록</li>
        </ul>
      </div>
    </aside>

    <!-- 메인 콘텐츠 영역 -->
    <main class="mypage-content">
      
      <!-- 나의 정보 페이지 -->
      <div id="my-info-content" class="content-box" style="display: none;">
        <h2 class="content-title">프로필 정보</h2>
        
        <form class="profile-form">
          <div class="form-section">
            <label class="form-label">프로필 사진</label>
            <div class="profile-image-upload">
              <div class="profile-image-preview">
                <img src="https://via.placeholder.com/120" alt="프로필 이미지">
              </div>
              <div class="upload-buttons">
                <button type="button" class="btn-upload">사진 업로드</button>
                <button type="button" class="btn-delete">삭제</button>
              </div>
            </div>
          </div>

          <div class="form-section">
            <label class="form-label">이름</label>
            <input type="text" class="form-input" value="홍길동" placeholder="이름을 입력하세요">
          </div>

          <div class="form-section">
            <label class="form-label">이메일</label>
            <input type="email" class="form-input" value="hong@example.com" placeholder="이메일을 입력하세요">
          </div>

          <div class="form-section">
            <label class="form-label">전화번호</label>
            <input type="tel" class="form-input" value="010-1234-5678" placeholder="전화번호를 입력하세요">
          </div>

          <div class="form-section">
            <label class="form-label">생년월일</label>
            <input type="date" class="form-input" value="1990-01-01">
          </div>

          <div class="form-actions">
            <button type="submit" class="btn-primary">저장하기</button>
            <button type="button" class="btn-secondary">취소</button>
          </div>
        </form>
      </div>

      <!-- 나의 정책 페이지 -->
      <div id="my-policy-content" class="content-box" style="display: none;">
        <h2 class="content-title">스크랩한 정책</h2>
        <p>스크랩한 정책 목록이 표시됩니다.</p>
      </div>

      <!-- 타임라인 페이지 -->
      <div id="timeline-content" class="content-box" style="display: none;">
        <h2 class="content-title">타임라인</h2>
        <p>타임라인이 표시됩니다.</p>
      </div>

      <!-- 게시판 페이지 -->
      <div id="board-content" class="content-box" style="display: none;">
        <h2 class="content-title">게시판</h2>
        
        <div class="mypage-tabs">
          <button class="mypage-tab">게시물</button>
          <button class="mypage-tab active">댓글</button>
          <button class="mypage-tab">좋아요</button>
        </div>

        <div class="mypage-list">
          <div class="list-item">내가 작성한 댓글 1</div>
          <div class="list-item">내가 작성한 댓글 2</div>
          <div class="list-item">내가 작성한 댓글 3</div>
        </div>
      </div>

      <!-- 좋아요 페이지 -->
      <div id="likes-content" class="content-box" style="display: none;">
        <h2 class="content-title">좋아요 목록</h2>
        <p>좋아요 누른 게시글이 표시됩니다.</p>
      </div>

      <!-- 알림 관리 페이지 -->
      <div id="alarm-content" class="content-box" style="display: none;">
        <h2 class="content-title">알림 관리</h2>
        <p>알림 설정한 정책 목록이 표시됩니다.</p>
      </div>

      <!-- 기본 안내 메시지 -->
      <div id="default-content" class="content-box">
        <div class="welcome-message">
          <h2>마이페이지에 오신 것을 환영합니다</h2>
          <p>비밀번호를 입력해 주세요.</p>
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

  // 사이드바 메뉴 클릭 시 콘텐츠 전환
  const menuItems = document.querySelectorAll('.menu-item');
  const contentBoxes = document.querySelectorAll('.content-box');

  menuItems.forEach(item => {
    item.addEventListener('click', function(e) {
      e.preventDefault();
      
      // 메뉴 active 상태 변경
      menuItems.forEach(m => m.classList.remove('active'));
      this.classList.add('active');
      
      // 콘텐츠 박스 전환
      const pageId = this.getAttribute('data-page');
      contentBoxes.forEach(box => {
        box.style.display = 'none';
      });
      
      const targetContent = document.getElementById(pageId + '-content');
      if (targetContent) {
        targetContent.style.display = 'block';
      }
    });
  });

  // 탭 전환 (게시판 내부)
  const tabs = document.querySelectorAll('.mypage-tab');
  tabs.forEach(tab => {
    tab.addEventListener('click', function() {
      tabs.forEach(t => t.classList.remove('active'));
      this.classList.add('active');
    });
  });
</script>

</body>
</html>