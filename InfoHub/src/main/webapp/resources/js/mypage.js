// 마이페이지 JavaScript

// DOM 로드 완료 후 실행
document.addEventListener('DOMContentLoaded', function() {
  
  // Top 버튼 기능
  initTopButton();
  
  // 사이드바 메뉴 기능
  initSidebarMenu();
  
  // 탭 전환 기능
  initTabSwitcher();
  
});

/**
 * Top 버튼 초기화
 */
function initTopButton() {
  const topButton = document.getElementById('topButton');
  
  if (!topButton) return;
  
  // 스크롤 이벤트로 버튼 표시/숨기기
  window.addEventListener('scroll', function() {
    topButton.classList.toggle('show', window.scrollY > 300);
  });
  
  // 클릭 시 맨 위로 스크롤
  topButton.addEventListener('click', function() {
    window.scrollTo({ 
      top: 0, 
      behavior: 'smooth' 
    });
  });
}

/**
 * 사이드바 메뉴 초기화
 */
function initSidebarMenu() {
  const menuItems = document.querySelectorAll('.menu-item');
  const contentBoxes = document.querySelectorAll('.content-box');
  
  if (!menuItems.length || !contentBoxes.length) return;
  
  menuItems.forEach(item => {
    item.addEventListener('click', function(e) {
      e.preventDefault();
      
      // 메뉴 active 상태 변경
      menuItems.forEach(m => m.classList.remove('active'));
      this.classList.add('active');
      
      // 콘텐츠 박스 전환
      const pageId = this.getAttribute('data-page');
      
      if (pageId) {
        switchContent(pageId, contentBoxes);
      }
    });
  });
}

/**
 * 콘텐츠 전환 함수
 * @param {string} pageId - 표시할 페이지 ID
 * @param {NodeList} contentBoxes - 콘텐츠 박스 목록
 */
function switchContent(pageId, contentBoxes) {
  // 모든 콘텐츠 숨기기
  contentBoxes.forEach(box => {
    box.style.display = 'none';
  });
  
  // 선택된 콘텐츠 표시
  const targetContent = document.getElementById(pageId + '-content');
  if (targetContent) {
    targetContent.style.display = 'block';
    
    // 페이지 전환 시 맨 위로 스크롤
    window.scrollTo({ 
      top: 0, 
      behavior: 'smooth' 
    });
  }
}

/**
 * 탭 전환 기능 초기화 (게시판 내부)
 */
function initTabSwitcher() {
  const tabs = document.querySelectorAll('.mypage-tab');
  
  if (!tabs.length) return;
  
  tabs.forEach(tab => {
    tab.addEventListener('click', function() {
      // 모든 탭에서 active 클래스 제거
      tabs.forEach(t => t.classList.remove('active'));
      
      // 클릭된 탭에 active 클래스 추가
      this.classList.add('active');
      
      // 탭에 따른 콘텐츠 처리 (필요시 확장)
      handleTabChange(this);
    });
  });
}

/**
 * 탭 변경 처리
 * @param {Element} selectedTab - 선택된 탭 요소
 */
function handleTabChange(selectedTab) {
  const tabText = selectedTab.textContent.trim();
  
  // 탭별 처리 로직 (필요시 확장)
  switch(tabText) {
    case '게시물':
      console.log('게시물 탭 선택됨');
      break;
    case '댓글':
      console.log('댓글 탭 선택됨');
      break;
    case '좋아요':
      console.log('좋아요 탭 선택됨');
      break;
    default:
      console.log('기타 탭 선택됨:', tabText);
  }
}

/**
 * 유틸리티: 디바운스 함수
 * @param {Function} func - 실행할 함수
 * @param {number} delay - 지연 시간 (ms)
 */
function debounce(func, delay) {
  let timeoutId;
  return function (...args) {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => func.apply(this, args), delay);
  };
}

/**
 * 유틸리티: 요소 표시/숨기기
 * @param {Element} element - 대상 요소
 * @param {boolean} show - 표시 여부
 */
function toggleElement(element, show) {
  if (!element) return;
  
  element.style.display = show ? 'block' : 'none';
}