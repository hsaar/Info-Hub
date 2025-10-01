<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 비밀번호 확인 섹션 -->
<div id="password-verify-section">
  <div class="verify-box">
    <div class="verify-icon">
      <i class="fas fa-lock"></i>
    </div>
    
    <h2 class="verify-title">비밀번호 확인</h2>
    <p class="verify-subtitle">
      프로필 정보를 수정하기 위해<br>
      현재 비밀번호를 입력해주세요
    </p>
    
    <form class="verify-form" id="verifyForm" onsubmit="return verifyPasswordForProfile(event)">
      <div class="form-group">
        <label class="form-label" for="password">비밀번호</label>
        <div class="password-input-wrapper">
          <input 
            type="password" 
            id="password" 
            class="form-input" 
            placeholder="비밀번호를 입력하세요"
            autocomplete="current-password"
            required>
          <button type="button" class="toggle-password" onclick="togglePasswordVisibility()">
            <i class="fas fa-eye" id="toggleIcon"></i>
          </button>
        </div>
        <div class="error-message" id="errorMessage">
          <i class="fas fa-exclamation-circle"></i>
          <span>비밀번호가 일치하지 않습니다. 다시 시도해주세요.</span>
        </div>
      </div>
      
      <div class="button-group">
        <button type="submit" class="btn btn-primary">
          <i class="fas fa-check"></i> 확인
        </button>
      </div>
    </form>
  </div>
</div>

<!-- 프로필 정보 콘텐츠 (초기에는 숨김) -->
<div id="my-box-section" style="display: none;">
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

    <!-- 비밀번호 변경 섹션 -->
    <div class="form-section">
      <label class="form-label">현재 비밀번호</label>
      <input type="password" id="currentPassword" class="form-input" placeholder="현재 비밀번호를 입력하세요">
    </div>

    <div class="form-section">
      <label class="form-label">새 비밀번호</label>
      <input type="password" id="newPassword" class="form-input" placeholder="새 비밀번호를 입력하세요">
      <small style="color: #6b7280; font-size: 13px; margin-top: 4px;">8자 이상, 영문/숫자/특수문자 포함</small>
    </div>

    <div class="form-section">
      <label class="form-label">새 비밀번호 확인</label>
      <input type="password" id="confirmPassword" class="form-input" placeholder="새 비밀번호를 다시 입력하세요">
      <span id="passwordMatch" style="font-size: 13px; margin-top: 4px; display: none;"></span>
    </div>

    <!-- 관심 키워드 섹션 -->
    <div class="form-section">
      <label class="form-label">관심 키워드</label>
      <input type="text" 
             id="profileKeywordsInput"
             class="form-input" 
             placeholder="관심 키워드 선택 (클릭)" 
             readonly
             onclick="openProfileKeywordModal()"
             value="청년일자리, 주거지원"
             style="cursor: pointer;">
      <input type="hidden" id="profileSelectedKeywords" value="청년일자리,주거지원">
      <small style="color: #6b7280; font-size: 13px; margin-top: 4px;">최대 5개까지 선택 가능</small>
    </div>

    <!-- 버튼 그룹 -->
    <div class="form-actions">
      <button type="submit" class="btn-primary">저장하기</button>
      <button type="button" class="btn-secondary">취소</button>
    </div>
    <!-- 회원 탈퇴 섹션 -->
  <div id="withdrawal-section" style="margin-top: 48px; padding-top: 32px; border-top: 1px solid #e5e7eb; text-align: right;">
    <button type="button" 
            onclick="openWithdrawalModal()" 
            style="padding: 8px 16px; 
                   font-size: 13px; 
                   font-weight: 500; 
                   color: #dc2626; 
                   background: transparent; 
                   border: 1px solid #fca5a5; 
                   border-radius: 6px; 
                   cursor: pointer; 
                   transition: all 0.2s;
                   font-family: inherit;"
            onmouseover="this.style.background='#fef2f2'; this.style.borderColor='#dc2626';"
            onmouseout="this.style.background='transparent'; this.style.borderColor='#fca5a5';">
      회원 탈퇴
    </button>
  </div>
  </form>
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

<script>
  // ===== 비밀번호 확인 기능 =====
  const CORRECT_PASSWORD = "1234"; // 테스트용

  function togglePasswordVisibility() {
    const passwordInput = document.getElementById('password');
    const toggleIcon = document.getElementById('toggleIcon');
    
    if (passwordInput.type === 'password') {
      passwordInput.type = 'text';
      toggleIcon.classList.remove('fa-eye');
      toggleIcon.classList.add('fa-eye-slash');
    } else {
      passwordInput.type = 'password';
      toggleIcon.classList.remove('fa-eye-slash');
      toggleIcon.classList.add('fa-eye');
    }
  }

  function verifyPasswordForProfile(event) {
    event.preventDefault();
    
    const passwordInput = document.getElementById('password');
    const errorMessage = document.getElementById('errorMessage');
    const inputValue = passwordInput.value;
    
    if (inputValue === CORRECT_PASSWORD) {
      // 인증 성공
      document.getElementById('password-verify-section').style.display = 'none';
      document.getElementById('my-box-section').style.display = 'block';
    } else {
      // 인증 실패
      passwordInput.classList.add('error');
      errorMessage.classList.add('show');
      passwordInput.value = '';
      passwordInput.focus();
      
      setTimeout(() => {
        passwordInput.classList.remove('error');
        errorMessage.classList.remove('show');
      }, 2000);
    }
    
    return false;
  }

  // ===== 프로필 정보 수정 기능 =====
  const newPasswordInput = document.getElementById('newPassword');
  const confirmPasswordInput = document.getElementById('confirmPassword');
  const passwordMatchSpan = document.getElementById('passwordMatch');

  // 비밀번호 일치 확인
  if (confirmPasswordInput) {
    confirmPasswordInput.addEventListener('input', function() {
      const newPassword = newPasswordInput.value;
      const confirmPassword = this.value;
      
      if (confirmPassword === '') {
        passwordMatchSpan.style.display = 'none';
        this.style.borderColor = '';
        return;
      }
      
      passwordMatchSpan.style.display = 'block';
      
      if (newPassword === confirmPassword) {
        passwordMatchSpan.textContent = '✓ 비밀번호가 일치합니다';
        passwordMatchSpan.style.color = '#10b981';
        this.style.borderColor = '#10b981';
      } else {
        passwordMatchSpan.textContent = '✗ 비밀번호가 일치하지 않습니다';
        passwordMatchSpan.style.color = '#ef4444';
        this.style.borderColor = '#ef4444';
      }
    });
  }

  // 새 비밀번호 강도 체크
  if (newPasswordInput) {
    newPasswordInput.addEventListener('input', function() {
      const password = this.value;
      if (password) {
        const hasMinLength = password.length >= 8;
        const hasLetter = /[a-zA-Z]/.test(password);
        const hasNumber = /\d/.test(password);
        const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);
        
        if (!hasMinLength || !hasLetter || !hasNumber || !hasSpecial) {
          this.style.borderColor = '#f59e0b';
        } else {
          this.style.borderColor = '#10b981';
        }
      } else {
        this.style.borderColor = '';
      }
    });
  }

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
    
    closeProfileKeywordModal();
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

  // 프로필 키워드 태그 클릭 이벤트
  document.addEventListener('DOMContentLoaded', function() {
    const profileKeywordTags = document.querySelectorAll('#profileKeywordModal .keyword-tag');
    
    profileKeywordTags.forEach(tag => {
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
            alert(`최대 ${PROFILE_MAX_KEYWORDS}개까지만 선택할 수 있습니다.`);
            return;
          }
          profileSelectedKeywordsArray.push(keyword);
          this.classList.add('selected');
        }
        
        updateProfileKeywordDisplay();
      });
    });

    // 프로필 폼 제출 처리
    const profileForm = document.querySelector('.profile-form');
    if (profileForm) {
      profileForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const currentPassword = document.getElementById('currentPassword').value;
        const newPassword = newPasswordInput.value;
        const confirmPassword = confirmPasswordInput.value;
        
        if (currentPassword || newPassword || confirmPassword) {
          if (!currentPassword) {
            alert('현재 비밀번호를 입력해주세요.');
            return;
          }
          
          if (!newPassword) {
            alert('새 비밀번호를 입력해주세요.');
            return;
          }
          
          if (newPassword !== confirmPassword) {
            alert('새 비밀번호가 일치하지 않습니다.');
            return;
          }
          
          const hasMinLength = newPassword.length >= 8;
          const hasLetter = /[a-zA-Z]/.test(newPassword);
          const hasNumber = /\d/.test(newPassword);
          const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(newPassword);
          
          if (!hasMinLength || !hasLetter || !hasNumber || !hasSpecial) {
            alert('비밀번호는 8자 이상이며, 영문/숫자/특수문자를 포함해야 합니다.');
            return;
          }
        }
        
        if (profileSelectedKeywordsArray.length === 0) {
          alert('최소 1개의 관심 키워드를 선택해주세요.');
          return;
        }
        
        alert('프로필이 저장되었습니다.');
        
        if (currentPassword || newPassword) {
          document.getElementById('currentPassword').value = '';
          newPasswordInput.value = '';
          confirmPasswordInput.value = '';
          passwordMatchSpan.style.display = 'none';
        }
      });
    }
  });

  // 모달 외부 클릭시 닫기
  window.addEventListener('click', function(event) {
    const modal = document.getElementById('profileKeywordModal');
    if (event.target === modal) {
      closeProfileKeywordModal();
    }
  });
</script>