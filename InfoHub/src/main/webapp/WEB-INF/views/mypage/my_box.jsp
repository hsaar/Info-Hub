<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로필 정보</title>
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
      <h3 class="sidebar-title">프로필 정보 간단하게</h3>
      
      <nav class="sidebar-menu">
        <a href="#" class="menu-item active">
          <span class="menu-text">나의 정보</span>
        </a>
        <a href="#" class="menu-item">
          <span class="menu-text">나의 정책</span>
        </a>
        <a href="#" class="menu-item">
          <span class="menu-text">타임라인</span>
        </a>
        <a href="#" class="menu-item">
          <span class="menu-text">게시판</span>
        </a>
        <a href="#" class="menu-item">
          <span class="menu-text">좋아요</span>
        </a>
        <a href="#" class="menu-item">
          <span class="menu-text">알림 관리</span>
        </a>
      </nav>

      <div class="sidebar-categories">
        <h4 class="category-title">카테고리</h4>
        <ul class="category-list">
          <li>나의 정보 - 개인 정보</li>
          <li>나의 정책 - 스크랩</li>
          <li>타임라인 - 스크랩한 정책 타임라인</li>
          <li>게시판 - 서울장 게시글, 좋아요 댓글 표시</li>
          <li>좋아요 - 좋아요 누른 게시글</li>
          <li>알림 관리 - 알림 설정한 정책 목록</li>
        </ul>
      </div>
    </aside>

    <!-- 메인 콘텐츠 영역 -->
    <main class="mypage-content">
      
      <h2 class="content-title">프로필 정보</h2>

      <!-- 프로필 정보 폼 -->
      <form class="profile-form">
        
       

        <!-- 기본 정보 -->
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
          <label class="form-label">나이</label>
          <input type="text" class="form-input" value="23세">
        </div>

       

        <div class="form-section">
          <label class="form-label">주소</label>
          <input type="text" class="form-input" value="서울특별시 강남구" placeholder="주소를 입력하세요">
        </div>

        <div class="form-section">
          <label class="form-label">관심 분야</label>
          <div class="checkbox-group">
            <label class="checkbox-label">
              <input type="checkbox" checked>
              <span>일자리</span>
            </label>
            <label class="checkbox-label">
              <input type="checkbox" checked>
              <span>주거</span>
            </label>
            <label class="checkbox-label">
              <input type="checkbox">
              <span>교육</span>
            </label>
            <label class="checkbox-label">
              <input type="checkbox">
              <span>문화</span>
            </label>
            <label class="checkbox-label">
              <input type="checkbox">
              <span>복지</span>
            </label>
          </div>
        </div>

        <!-- 버튼 그룹 -->
        <div class="form-actions">
          <button type="submit" class="btn-primary">저장하기</button>
          <button type="button" class="btn-secondary">취소</button>
        </div>

      </form>

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

  // 사이드바 메뉴
  const menuItems = document.querySelectorAll('.menu-item');
  menuItems.forEach(item => {
    item.addEventListener('click', function(e) {
      e.preventDefault();
      menuItems.forEach(m => m.classList.remove('active'));
      this.classList.add('active');
    });
  });

  

  // 폼 제출
  document.querySelector('.profile-form').addEventListener('submit', function(e) {
    e.preventDefault();
    alert('프로필이 저장되었습니다.');
  });
</script>

</body>
</html>