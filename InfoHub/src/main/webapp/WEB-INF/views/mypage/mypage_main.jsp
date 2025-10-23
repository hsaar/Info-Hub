<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
        <a href="#" class="menu-item" data-page="likes">
          <span class="menu-text">좋아요</span>
        </a>
        <a href="#" class="menu-item" data-page="myBenifit">
          <span class="menu-text">내 혜택 모아보기</span>
        </a>
        <a href="#" class="menu-item" data-page="timelineMyBenifit">
          <span class="menu-text">내 혜택 타임라인</span>
        </a>
        <a href="#" class="menu-item" data-page="board">
          <span class="menu-text">나의 활동</span>
        </a>
        <a href="#" class="menu-item" data-page="myBenifitPush">
          <span class="menu-text">나의 알림</span>
        </a>
        
        
      </nav>

    
    </aside>

    <!-- 메인 콘텐츠 영역 -->
    <main class="mypage-content">
      
      <!-- 나의 정보 페이지 (mypage_box.jsp 포함) -->
      <div id="my-info-content" class="content-box" style="display: none;">
        <%@ include file="my_box.jsp"%>
      </div>
      
       <!-- 내 혜택 모아보기 페이지 -->
      <div id="myBenifit-content" class="content-box" style="display: none;">
        <h2 class="content-title">내 혜택 모아보기</h2>
		<jsp:include page="../customized/myBenifit.jsp"/>
		</div>


      <!-- 타임라인 페이지 -->
      <div id="timelineMyBenifit-content" class="content-box" style="display: none;">
        <h2 class="content-title">내 혜택 타임라인</h2>
        <iframe 
		    id="timelineFrame" 
		    src= "${pageContext.request.contextPath}/timelineMyBenifit"
		    width="100%" 
		    height="800px" 
		    frameborder="0"
		    style="border:0; display:block;">
		</iframe>
      </div>

      <!-- 게시판 페이지 -->
      <div id="board-content" class="content-box" style="display: none;">
        <h2 class="content-title">나의 활동</h2>
        
        <div class="mypage-tabs">
          <button class="mypage-tab active" data-tab="post">게시물</button>
          <button class="mypage-tab" data-tab="comment">댓글</button>
        </div>

        <div id="comment-tab" style="display:none;">
 		  <%@ include file="my_comment.jsp" %>
		</div>

		<div id="board-tab" style="display:none;">
  		  <%@ include file="my_board.jsp" %>
       </div>
      </div>

      <!-- 좋아요 페이지 -->
      <div id="likes-content" class="content-box" style="display: none;">
         <%@ include file="my_hearts.jsp"%>
      </div>

      <!-- 알림 관리 페이지 -->
	  <div id="myBenifitPush-content" class="content-box" style="display: none;"> 
        <h2 class="content-title">나의 알림</h2>
        
        <iframe
		    id="alertFrame" 
		    src= "${pageContext.request.contextPath}/myBenifitPush"
		    width="100%" 
		    height="600px"  <%-- 적절한 높이로 설정 --%>
		    frameborder="0"
		    style="border:0; display:block;">
		</iframe>
      </div>
   
      <!-- 기본 안내 메시지 -->
      <div id="default-content" class="content-box">
        <div class="welcome-message">
          <h2>마이페이지에 오신 것을 <br>환영합니다</h2>
          <p>좌측 메뉴에서 원하는 항목을 선택해 주세요.</p>
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

<%-- JSP 상단에서 세션 로그인 번호 가져오기 --%>
<%
    Integer loginNo = (Integer) session.getAttribute("loginNo");
    if (loginNo == null) loginNo = 0; // 로그인 안된 경우 안전장치
%>

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
        
        if (pageId === 'timelineMyBenifit') {
            document.getElementById('timelineFrame').src = '${pageContext.request.contextPath}/timelineMyBenifit';
          }
        if (pageId === 'myBenifitPush') {
            document.getElementById('alertFrame').src = '${pageContext.request.contextPath}/myBenifitPush';
        }
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
  
  document.addEventListener('DOMContentLoaded', () => {
	    const tabs = document.querySelectorAll('.mypage-tab');
	    const commentTab = document.getElementById('comment-tab');
	    const postTab = document.getElementById('board-tab');

	    if (!commentTab || !postTab) return; // 안전장치

	    // 초기 상태
	    postTab.style.display = 'block';
	    commentTab.style.display = 'none';
	    tabs.forEach(t => t.classList.remove('active'));
	    tabs[0].classList.add('active');

	    // 댓글 데이터를 이미 fetch했는지 체크
	    let commentsLoaded = false;

	    // 탭 클릭 이벤트
	    tabs.forEach(tab => {
	        tab.addEventListener('click', function () {
	            tabs.forEach(t => t.classList.remove('active'));
	            this.classList.add('active');

	            if (this.dataset.tab === 'comment') {
	                commentTab.style.display = 'block';
	                postTab.style.display = 'none';

	                if (!commentsLoaded && typeof fetchBoardComments === 'function') {
	                    fetchBoardComments(<%= loginNo %>);
	                    commentsLoaded = true; // 한 번만 fetch
	                }

	            } else {
	                commentTab.style.display = 'none';
	                postTab.style.display = 'block';
	            }
	        });
	    });
	});
  
</script>
<script>
    menuItems.forEach(item => {
        item.addEventListener('click', function(e) {
            // ... 생략 ...
            if (pageId === 'myBenifitPush') {
                 // iframe을 강제로 다시 로드합니다.
                 document.getElementById('alertFrame').src = '${pageContext.request.contextPath}/myBenifitPush';
            }
        });
    });
</script>

 <jsp:include page="../include/footer.jsp"/>
</body>
</html>