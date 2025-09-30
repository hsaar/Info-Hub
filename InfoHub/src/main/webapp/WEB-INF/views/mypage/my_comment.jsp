<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 댓글 확인</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
</head>
<body>

<!-- 상단바 -->
<%@ include file="../include/header.jsp"%>
<!-- 페이지 헤더 -->
<div class="page-header">
  <div class="container">
    <h1 class="page-main-title">내 댓글 확인</h1>
    <p class="page-subtitle">내가 작성한 댓글 목록입니다</p>
  </div>
</div>

<!-- 메인 컨테이너 -->
<div class="my-comments-container">
  <div class="container">
    
    <!-- 필터 및 정렬 -->
    <div class="comments-filter">
      <div class="filter-left">
        <select class="filter-select">
          <option>전체 댓글 (24)</option>
          <option>정책 댓글</option>
          <option>게시판 댓글</option>
        </select>
      </div>
      <div class="filter-right">
        <button class="sort-option active">최신순</button>
        <button class="sort-option">오래된순</button>
      </div>
    </div>

    <!-- 댓글 리스트 -->
    <div class="comments-list">
      
      <!-- 댓글 아이템 1 -->
      <article class="comment-item">
        <div class="comment-header">
          <div class="comment-post-info">
            <span class="comment-category">정책</span>
            <a href="#" class="comment-post-title">국민내일배움카드 신청 방법</a>
          </div>
          <span class="comment-date">2025.01.15</span>
        </div>
        <div class="comment-content">
          <p>정말 유용한 정보네요! 저도 신청해보려고 하는데 구비서류는 어떤 것들이 필요한가요?</p>
        </div>
        <div class="comment-footer">
          <button class="comment-btn edit">수정</button>
          <button class="comment-btn delete">삭제</button>
          <button class="comment-btn view">원글 보기</button>
        </div>
      </article>

      <!-- 댓글 아이템 2 -->
      <article class="comment-item">
        <div class="comment-header">
          <div class="comment-post-info">
            <span class="comment-category">게시판</span>
            <a href="#" class="comment-post-title">청년 주거 지원 정책 질문있습니다</a>
          </div>
          <span class="comment-date">2025.01.14</span>
        </div>
        <div class="comment-content">
          <p>저도 같은 궁금증이 있었는데 답변 감사합니다. 혹시 신청 기간은 언제까지인가요?</p>
        </div>
        <div class="comment-footer">
          <button class="comment-btn edit">수정</button>
          <button class="comment-btn delete">삭제</button>
          <button class="comment-btn view">원글 보기</button>
        </div>
      </article>

      <!-- 댓글 아이템 3 -->
      <article class="comment-item">
        <div class="comment-header">
          <div class="comment-post-info">
            <span class="comment-category">정책</span>
            <a href="#" class="comment-post-title">근로장려금 신청 가능 여부 확인</a>
          </div>
          <span class="comment-date">2025.01.13</span>
        </div>
        <div class="comment-content">
          <p>소득 기준이 궁금했는데 명확하게 설명해주셔서 감사합니다. 도움이 많이 되었어요!</p>
        </div>
        <div class="comment-footer">
          <button class="comment-btn edit">수정</button>
          <button class="comment-btn delete">삭제</button>
          <button class="comment-btn view">원글 보기</button>
        </div>
      </article>

      <!-- 댓글 아이템 4 -->
      <article class="comment-item">
        <div class="comment-header">
          <div class="comment-post-info">
            <span class="comment-category">게시판</span>
            <a href="#" class="comment-post-title">취업 준비생을 위한 정책 추천</a>
          </div>
          <span class="comment-date">2025.01.12</span>
        </div>
        <div class="comment-content">
          <p>좋은 정보 공유해주셔서 감사합니다. 국민취업지원제도도 알아보면 좋을 것 같아요!</p>
        </div>
        <div class="comment-footer">
          <button class="comment-btn edit">수정</button>
          <button class="comment-btn delete">삭제</button>
          <button class="comment-btn view">원글 보기</button>
        </div>
      </article>

      <!-- 댓글 아이템 5 -->
      <article class="comment-item">
        <div class="comment-header">
          <div class="comment-post-info">
            <span class="comment-category">정책</span>
            <a href="#" class="comment-post-title">청년도약계좌 가입 조건</a>
          </div>
          <span class="comment-date">2025.01.11</span>
        </div>
        <div class="comment-content">
          <p>나이 제한이 있다고 들었는데, 만 34세까지 가능한가요? 자세한 정보 부탁드립니다.</p>
        </div>
        <div class="comment-footer">
          <button class="comment-btn edit">수정</button>
          <button class="comment-btn delete">삭제</button>
          <button class="comment-btn view">원글 보기</button>
        </div>
      </article>

    </div>

    <!-- 페이지네이션 -->
    <nav class="pagination-nav">
      <button class="page-arrow">«</button>
      <button class="page-number active">1</button>
      <button class="page-number">2</button>
      <button class="page-number">3</button>
      <button class="page-number">4</button>
      <button class="page-number">5</button>
      <button class="page-arrow">»</button>
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
  // Top 버튼
  const topButton = document.getElementById('topButton');
  window.addEventListener('scroll', function() {
    topButton.classList.toggle('show', window.scrollY > 300);
  });
  topButton.addEventListener('click', function() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });

  // 정렬 버튼
  const sortOptions = document.querySelectorAll('.sort-option');
  sortOptions.forEach(option => {
    option.addEventListener('click', function() {
      sortOptions.forEach(opt => opt.classList.remove('active'));
      this.classList.add('active');
    });
  });

  // 댓글 삭제 버튼
  const deleteButtons = document.querySelectorAll('.comment-btn.delete');
  deleteButtons.forEach(button => {
    button.addEventListener('click', function() {
      if (confirm('댓글을 삭제하시겠습니까?')) {
        this.closest('.comment-item').remove();
      }
    });
  });
</script>

</body>
</html>