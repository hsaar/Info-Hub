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
<style type="text/css">
.board-item {
  cursor: pointer;
  transition: transform 0.2s, box-shadow 0.2s;
}
.board-item:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}
</style>
</head>
<body>

<!-- 마이페이지 컨테이너 -->
<div class="my-board-container">

 	<div class="board-filter">
 	  <div class="board-filter-left">
        <select id="boardFilter" class="board-filter-select">
          <option value="all">전체</option>
    	  <option value="1">창업지원</option>
    	  <option value="2">직업훈련</option>
    	  <option value="3">취업지원</option>
    	  <option value="4">청년일자리</option>
    	  <option value="5">추가지원</option>
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
    const boardFilter = document.getElementById('boardFilter'); 
    const MAX_CONTENT_LENGTH = 50;

    let allBoards = [];
    let currentSort = 'latest';
    let currentPage = 1;
    const pageSize = 6;

    const pageNav = document.querySelector('.board-pagination-nav');
    const prevBtn = document.getElementById('boardPrevPage');
    const nextBtn = document.getElementById('boardNextPage');
    const pageInfo = document.getElementById('boardPageInfo');

 	// 페이지네이션 스타일
 	pageNav.style.position = 'relative';
 	pageNav.style.width = '200px';
 	pageNav.style.height = '40px';
 	pageNav.style.margin = '20px auto';

 	pageInfo.style.position = 'absolute';
 	pageInfo.style.left = '50%';
 	pageInfo.style.transform = 'translateX(-50%)';
 	pageInfo.style.minWidth = '100px';
 	pageInfo.style.textAlign = 'center';
 	pageInfo.style.fontWeight = 'normal';
 	pageInfo.style.lineHeight = '35px';

 	[prevBtn, nextBtn].forEach(btn => {
     	btn.style.width = '40px';
     	btn.style.height = '40px';
     	btn.style.borderRadius = '6px';
     	btn.style.cursor = 'pointer';
     	btn.style.display = 'inline-flex';
     	btn.style.justifyContent = 'center';
     	btn.style.alignItems = 'center';
 	});

 	prevBtn.style.position = 'absolute';
 	prevBtn.style.left = '0';
 	nextBtn.style.position = 'absolute';
 	nextBtn.style.right = '0';

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

    function renderBoards(boards) {
        boardsList.innerHTML = '';
        if (!boards || boards.length === 0) {
            boardsList.innerHTML = '<p>게시글이 없습니다.</p>';
            pageNav.style.display = 'none';
            return;
        }

        const selectedCategory = boardFilter.value;
        let filtered = boards.filter(b => selectedCategory === 'all' || String(b.categoryId) === selectedCategory);

        if (currentSort === 'latest') filtered.sort((a,b) => new Date(b.regiDate) - new Date(a.regiDate));
        else if (currentSort === 'oldest') filtered.sort((a,b) => new Date(a.regiDate) - new Date(b.regiDate));
        else if (currentSort === 'hearts') filtered.sort((a,b) => (b.hearts || 0) - (a.hearts || 0));

        const totalPages = Math.ceil(filtered.length / pageSize) || 1;
        if (currentPage > totalPages) currentPage = totalPages;

        const startIdx = (currentPage - 1) * pageSize;
        const endIdx = currentPage * pageSize;
        const pageBoards = filtered.slice(startIdx, endIdx);

        pageBoards.forEach(b => {
            let contentPreview = b.content || '';
            if (contentPreview.length > MAX_CONTENT_LENGTH) contentPreview = contentPreview.slice(0, MAX_CONTENT_LENGTH) + '...';

            const card = document.createElement('div');
            card.classList.add('board-item');
            card.innerHTML =
                '<h3 class="board-post-title">' + (b.title || "(제목 없음)") + '</h3>' +
                '<p class="board-content">' + contentPreview + '</p>' +
                '<div class="board-date">' + b.regiDate + '</div>' +
                '<div class="board-footer">' +
                '    <span class="board-hearts">❤️ ' + (b.hearts || 0) + '</span>' +
                '    <button class="board-btn board-delete-btn" data-boardno="' + b.boardNo + '">삭제</button>' +
                '</div>';
                
             // 카드 클릭 이벤트
             card.addEventListener('click', (e) => {
                 // 삭제 버튼 클릭 시는 이동 막기
                 if (e.target.classList.contains('board-delete-btn')) return;
                 window.location.href = '<c:url value="/detail"/>' + '?boardno=' + b.boardNo;
             });
             
            boardsList.appendChild(card);
        });

        // 페이지네이션 표시
        pageInfo.textContent = currentPage + " / " + totalPages;
        prevBtn.style.display = currentPage > 1 ? 'inline-block' : 'none';
        nextBtn.style.display = currentPage < totalPages ? 'inline-block' : 'none';
        pageNav.style.display = totalPages > 1 ? 'flex' : 'none';
    }

    // 삭제
    boardsList.addEventListener('click', async (e) => {
        if (!e.target.classList.contains('board-delete-btn')) return;
        const boardNo = e.target.getAttribute('data-boardno');
        if (!boardNo) return;
        if (!confirm("정말 삭제하시겠습니까?")) return;

        try {
            await fetch('<c:url value="/myboard/delete"/>', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'boardNo=' + encodeURIComponent(boardNo)
            });

            allBoards = await fetchBoards();
            renderBoards(allBoards);

        } catch (err) {
            console.error("삭제 실패:", err);
            alert("삭제 중 오류가 발생했습니다.");
        }
    });

    // 드롭다운 필터
    boardFilter.addEventListener('change', () => {
        currentPage = 1; // 필터 변경시 1페이지로 초기화
        renderBoards(allBoards);
    });

    // 정렬 버튼
    const sortBtns = document.querySelectorAll('.board-sort-option');
    sortBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            sortBtns.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            const text = btn.textContent.trim();
            if (text.includes('최신')) currentSort = 'latest';
            else if (text.includes('오래된')) currentSort = 'oldest';
            else if (text.includes('좋아요')) currentSort = 'hearts';

            let sortedBoards = [...allBoards];
            if (currentSort === 'latest') sortedBoards.sort((a,b) => new Date(b.regiDate) - new Date(a.regiDate));
            else if (currentSort === 'oldest') sortedBoards.sort((a,b) => new Date(a.regiDate) - new Date(b.regiDate));
            else if (currentSort === 'hearts') sortedBoards.sort((a,b) => (b.hearts || 0) - (a.hearts || 0));

            currentPage = 1; // 정렬 후 1페이지
            renderBoards(sortedBoards);
        });
    });

    // 페이지네이션 버튼
    prevBtn.addEventListener('click', () => { if(currentPage > 1){ currentPage--; renderBoards(allBoards); }});
    nextBtn.addEventListener('click', () => { 
        const totalPages = Math.ceil(allBoards.filter(b => boardFilter.value === 'all' || String(b.categoryId) === boardFilter.value).length / pageSize) || 1;
        if(currentPage < totalPages){ currentPage++; renderBoards(allBoards); }
    });

    // 초기 실행
    allBoards = await fetchBoards();
    renderBoards(allBoards);
});
</script>
 
</body>
</html>