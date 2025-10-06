<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

<!-- 마이페이지 컨테이너 -->
<div class="my-board-container">

 	<div class="board-filter">
 	  <div class="board-filter-left">
        <select id="boardFilter" class="board-filter-select">
          <option value="all">전체</option>
    	  <option value="1">후기</option>
    	  <option value="2">소식</option>
    	  <option value="3">일상/기타</option>
        </select>
      </div>
 	  <div class="board-filter-right">
        <button class="board-sort-option active">최신순</button>
        <button class="board-sort-option">오래된순</button>
        <button class="board-sort-option">좋아요순</button>
      </div>
    </div>

    <!-- 게시판 리스트 -->
    <div class="boards-list" id="boards-list">
      <!-- JS에서 동적 생성 -->
    </div>
    
    <!-- 페이지네이션 -->
	<nav class="board-pagination-nav" style="display:none;">
  		<button class="board-page-arrow" id="boardPrevPage">«</button>
  		<span id="boardPageInfo"></span>
  		<button class="board-page-arrow" id="boardNextPage">»</button>
	</nav>
	
</div>
<script>
document.addEventListener('DOMContentLoaded', async () => {
    const boardsList = document.getElementById('boards-list');
    const MAX_CONTENT_LENGTH = 50; // 글자 제한

    // 데이터 fetch
    async function fetchBoards() {
        try {
            const res = await fetch('<c:url value="/myboard/api?orderBy=regiDate"/>'); 
            const data = await res.json();
            return data || [];
        } catch (err) {
            console.error("게시글 불러오기 실패:", err);
            return [];
        }
    }

    // 카드 렌더링
    function renderBoards(boards) {
        boardsList.innerHTML = '';
        if (!boards || boards.length === 0) {
            boardsList.innerHTML = '<p>게시글이 없습니다.</p>';
            return;
        }

        boards.forEach(b => {
            // 글자수 제한
            let contentPreview = b.content || '';
            if (contentPreview.length > MAX_CONTENT_LENGTH) {
                contentPreview = contentPreview.slice(0, MAX_CONTENT_LENGTH) + '...';
            }

            const card = document.createElement('div');
            card.classList.add('board-item');

            // 댓글 렌더링 방식과 동일하게 innerHTML 구성
            card.innerHTML =
    			'<h3 class="board-post-title">' + (b.title || "(제목 없음)") + '</h3>' +
    			'<p class="board-content">' + (b.content || "(내용 없음)") + '</p>' +
    			'<div class="board-date">' + b.regiDate + '</div>' +
    			'<div class="board-footer">' +
    			'    <button class="board-btn board-delete-btn" data-boardno="' + b.boardNo + '">삭제</button>' +
    			'    <button class="board-btn board-update-btn" data-boardno="' + b.boardNo + '">수정</button>' +
    			'</div>';

            boardsList.appendChild(card);
        });
    }

    // 초기 실행
    const boards = await fetchBoards();
    renderBoards(boards);
});


</script>

</body>
</html>