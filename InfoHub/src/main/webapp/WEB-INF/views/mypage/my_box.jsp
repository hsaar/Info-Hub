<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 프로필 정보 콘텐츠 -->
<h2 class="content-title">프로필 정보</h2>

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
    <input type="text" class="form-input" value="23세" placeholder="나이를 입력하세요">
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

<script>
  // 프로필 폼 제출 처리
  document.addEventListener('DOMContentLoaded', function() {
    const profileForm = document.querySelector('.profile-form');
    if (profileForm) {
      profileForm.addEventListener('submit', function(e) {
        e.preventDefault();
        alert('프로필이 저장되었습니다.');
      });
    }
  });
</script>