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
<style type="text/css">
.comment-type-label {
  display: inline-block;
  font-size: 13px;
  font-weight: 600;
  padding: 4px 10px;
  border-radius: 8px;
  margin-bottom: 8px;
  color: white;
}

.comment-type-label.article {
  background-color: #1976d2; /* 파랑 */
}

.comment-type-label.board {
  background-color: #2e7d32; /* 초록 */
}

.comment-item-header {
  margin-bottom: 5px;
}
</style>
</head>
<body>

<!-- comment.jsp 내부 -->
<div class="my-comments-container">
    
    <!-- 필터 및 정렬 -->
    <div class="comments-filter">
      <div class="filter-left">
        <select id="commentFilter" class="filter-select">
          <option value="all">전체 댓글</option>
          <option value="article">기사 댓글</option>
          <option value="board">게시판 댓글</option>
        </select>
      </div>
      <div class="filter-right">
        <button class="sort-option active">최신순</button>
        <button class="sort-option">오래된순</button>
      </div>
    </div>

    <!-- 댓글 리스트 -->
    <div class="comments-list" id="comments-list">
      <!-- JS에서 동적 생성 -->
    </div>

    <!-- 페이지네이션 -->
	<nav class="comment-pagination-nav" style="display:none;">
  		<button class="comment-page-arrow" id="commentPrevPage">«</button>
  		<span id="commentPageInfo"></span>
  		<button class="comment-page-arrow" id="commentNextPage">»</button>
	</nav>

</div>



<script>
document.addEventListener('DOMContentLoaded', () => {
	  const commentsList = document.getElementById('comments-list');
	  const filterSelect = document.getElementById('commentFilter');
	  const sortBtns = document.querySelectorAll('.sort-option');

	  const pageNav = document.querySelector('.comment-pagination-nav');
	  const prevBtn = document.getElementById('commentPrevPage');
	  const nextBtn = document.getElementById('commentNextPage');
	  const pageInfo = document.getElementById('commentPageInfo');
	  
	  const pageSize = 6;
	  let currentPage = 1;
	  
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


	  // --- boardComment ---
	  async function fetchBoardComments() {
	    try {
	      const res = await fetch('<c:url value="/board/comments/api"/>');
	      const data = await res.json();
	      return data || [];
	    } catch (err) {
	      console.error('게시판 댓글 불러오기 실패:', err);
	      return [];
	    }
	  }

	  // --- articleComment ---
	  async function fetchArticleComments() {
	    try {
	      const res = await fetch('<c:url value="/article/comments/api"/>');
	      const data = await res.json();
	      return data || [];
	    } catch (err) {
	      console.error('기사 댓글 불러오기 실패:', err);
	      return [];
	    }
	  }

	  let currentComments = [];

	  // 댓글 렌더링 + 페이지네이션
	  function renderComments(comments) {
	    commentsList.innerHTML = '';
	    if (!comments || comments.length === 0) {
	      commentsList.innerHTML = '<p>댓글이 없습니다.</p>';
	      pageNav.style.display = 'none';
	      return;
	    }

	    const totalPages = Math.ceil(comments.length / pageSize) || 1;
	    const startIdx = (currentPage - 1) * pageSize;
	    const endIdx = currentPage * pageSize;
	    const pageComments = comments.slice(startIdx, endIdx);
	    
	    pageComments.forEach(c => {
	      const contentText = (c.content || "(내용 없음)").toString();
	      const isArticle = c.type === 'article';
	      const commentTypeLabel =
	        '<span class="comment-type-label ' + (isArticle ? 'article' : 'board') + '">' +
	        (isArticle ? '기사' : '게시판') +
	        '</span>';
	      
	      const card = document.createElement('div');
	      card.classList.add('comment-item');

	      card.innerHTML =
	    	  '<div class="comment-item-header">' +
	    	  commentTypeLabel +
	    	  '</div>' +
	    	  '<div class="comment-content">' +
	    	  '  <p>' + contentText + '</p>' +
	    	  '</div>' +
	    	  '<div class="comment-date">' + c.createdAt + '</div>' +
	    	  '<div class="comment-footer">' +
	    	  '  <button class="comment-btn delete-btn" data-commentid="' + c.commentId + '">삭제</button>' +
	    	  '</div>';
	        
	     //상세페이지 이동 기능 추가
	        card.addEventListener('click', (e) => {
	          // 삭제 버튼 클릭은 예외 처리
	          if (e.target.classList.contains('delete-btn')) return;

	          if (c.type === 'board' && c.boardNo) {
	            window.location.href = '<c:url value="/detail"/>' + '?boardno=' + c.boardNo;
	          } else if (c.type === 'article' && c.articleId) {
	            window.location.href = "/project/articleContent?articleId=" + c.articleId;
	          } else {
	            alert("상세페이지로 이동할 수 없습니다");
	            console.log(c);
	          }
	        });

	      commentsList.appendChild(card);
	    });

	    pageInfo.textContent = currentPage + " / " + totalPages;
	    prevBtn.style.display = currentPage > 1 ? "inline-block" : "none";
	    nextBtn.style.display = currentPage < totalPages ? "inline-block" : "none";
	    pageNav.style.display = totalPages > 1 ? "flex" : "none";
	  }

	  // 페이지 버튼 이벤트
	  prevBtn.addEventListener('click', () => {
	    if (currentPage > 1) {
	      currentPage--;
	      renderComments(currentComments);
	    }
	  });
	  nextBtn.addEventListener('click', () => {
	    const totalPages = Math.ceil(currentComments.length / pageSize) || 1;
	    if (currentPage < totalPages) {
	      currentPage++;
	      renderComments(currentComments);
	    }
	  });

	  // 정렬 함수
	  function sortComments(comments, type) {
	    if (type === 'latest') {
	      return comments.sort((a,b) => new Date(b.createdAt) - new Date(a.createdAt));
	    } else if (type === 'oldest') {
	      return comments.sort((a,b) => new Date(a.createdAt) - new Date(b.createdAt));
	    }
	    return comments;
	  }

	  // 정렬 버튼 이벤트
	  sortBtns.forEach(btn => {
	    btn.addEventListener('click', function() {
	      sortBtns.forEach(b => b.classList.remove('active'));
	      this.classList.add('active');

	      const sortType = this.textContent.includes('최신') ? 'latest' : 'oldest';
	      renderComments(sortComments(currentComments, sortType));
	    });
	  });

	  // 드롭다운 필터 이벤트
	  filterSelect.addEventListener('change', async () => {
	    currentPage = 1; // 페이지 초기화
	    let comments = [];
	    
	    if (filterSelect.value === 'board') {
	        comments = await fetchBoardComments();
	        comments = comments.map(c => ({ ...c, type: 'board' }));
	    } else if (filterSelect.value === 'article') {
	        comments = await fetchArticleComments();
	        comments = comments.map(c => ({ ...c, type: 'article' }));
	    } else if (filterSelect.value === 'all') {
	        const [boardComments, articleComments] = await Promise.all([
	            fetchBoardComments(),
	            fetchArticleComments()
	        ]);
	        comments = [
	            ...boardComments.map(c => ({ ...c, type: 'board' })),
	            ...articleComments.map(c => ({ ...c, type: 'article' }))
	        ];
	    }

	    currentComments = comments;

	    const sortedComments = sortComments(currentComments, 'latest');

	    sortBtns.forEach(b => b.classList.remove('active'));
	    sortBtns[0].classList.add('active'); 

	    renderComments(sortedComments);
	  });

	  // 삭제
	  commentsList.addEventListener('click', async (e) => {
	      if (!e.target.classList.contains('delete-btn')) return;

	      const commentId = e.target.getAttribute('data-commentid');
	      if (!commentId) return;

	      if (!confirm("정말 삭제하시겠습니까?")) return;

	      try {
	          let url = '';

	          if (filterSelect.value === 'board') {
	              url = '<c:url value="/board/comments/delete"/>' + '/' + commentId;
	          } else if (filterSelect.value === 'article') {
	              url = '<c:url value="/article/comments/delete"/>' + '/' + commentId;
	          } else if (filterSelect.value === 'all') {
	              let commentObj = currentComments.find(c => c.commentId == commentId);

	              if (!commentObj.type) {
	                  commentObj.type = commentObj.boardno ? 'board' : 'article';
	              }

	              url = commentObj.type === 'board'
	                  ? '<c:url value="/board/comments/delete"/>' + '/' + commentId
	                  : '<c:url value="/article/comments/delete"/>' + '/' + commentId;
	          }

	          await fetch(url, {
	              method: 'POST',
	              headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
	              body: 'loginNo=<%= session.getAttribute("loginNo") %>'
	          });

	          currentComments = currentComments.filter(c => c.commentId != commentId);
	          renderComments(currentComments);

	      } catch (err) {
	          console.error("댓글 삭제 실패:", err);
	          alert("삭제 중 오류가 발생했습니다.");
	      }
	  });


	   // 초기 실행
	  (async function init() {
	      currentPage = 1;
	      const [boardComments, articleComments] = await Promise.all([
	          fetchBoardComments(),
	          fetchArticleComments()
	      ]);

	      // 각 댓글 type 필드 추가
	      const boardCommentsWithType = boardComments.map(c => ({ ...c, type: 'board' }));
	      const articleCommentsWithType = articleComments.map(c => ({ ...c, type: 'article' }));

	      currentComments = [...boardCommentsWithType, ...articleCommentsWithType];

	      // 최신순 정렬
	      const sortedComments = sortComments(currentComments, 'latest');

	      // 정렬 버튼 초기화
	      sortBtns.forEach(btn => btn.classList.remove('active'));
	      sortBtns[0].classList.add('active');

	      renderComments(sortedComments);
	      filterSelect.value = 'all';
	  })();


	});


</script>
</body>
</html>
