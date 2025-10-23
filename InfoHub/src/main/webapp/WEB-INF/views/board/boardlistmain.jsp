<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 - 정책 소통 플랫폼</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/board.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/error.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/idfind.css' />">

</head>
<body>

	<header class="header">
		<%@ include file="../include/header.jsp"%>
	</header>

	<!-- 페이지 헤더 -->
	<div class="page-header">
		<div class="container">
			<h1 class="page-main-title">게시판</h1>
		</div>
	</div>

	<!-- 카테고리 필터 섹션 -->

	<!-- 카테고리 필터 섹션 -->
	<section class="filter-section">
		<div class="container">
			<div class="category-filter-buttons">
				<button class="filter-btn ${empty param.categoryNo ? 'active' : ''}"
					onclick="filterByCategory('', this)">전체</button>
				<button
					class="filter-btn ${param.categoryNo == '1' ? 'active' : ''}"
					onclick="filterByCategory('1', this)">창업지원</button>
				<button
					class="filter-btn ${param.categoryNo == '2' ? 'active' : ''}"
					onclick="filterByCategory('2', this)">직업훈련</button>
				<button
					class="filter-btn ${param.categoryNo == '3' ? 'active' : ''}"
					onclick="filterByCategory('3', this)">취업지원</button>
				<button
					class="filter-btn ${param.categoryNo == '4' ? 'active' : ''}"
					onclick="filterByCategory('4', this)">청년일자리</button>
				<button
					class="filter-btn ${param.categoryNo == '5' ? 'active' : ''}"
					onclick="filterByCategory('5', this)">추가지원</button>

			</div>
		</div>
	</section>

	<!-- 검색 섹션 -->
	<section class="search-section">
		<div class="container">
			<form action="<c:url value='/board/search' />" method="get"
				class="search-box-large">
				<input type="text" name="keyword" class="search-input-large"
					placeholder="게시글을 검색해보세요" value="${param.keyword}">
				<button type="submit" class="search-btn-large">
					<svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
          <path
							d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" />
        </svg>
				</button>
			</form>
		</div>
	</section>


	<!-- 필터 섹션 -->
	<div class="filter-section">
		<div class="container">
			<!-- 정렬 옵션: AJAX로 변경 -->
			<div class="view-options">
				<!-- JSTL을 사용하여 URL 파라미터 (param.sort) 값에 따라 active 클래스를 설정합니다. -->
				<a href="javascript:void(0)" onclick="sortBy('recent')"
					class="sort-option-btn ${empty param.sort || param.sort == 'recent' ? 'active' : ''}">최신순</a>
				<a href="javascript:void(0)" onclick="sortBy('hot')"
					class="sort-option-btn ${param.sort == 'hot' ? 'active' : ''}">인기순</a>
				<a href="javascript:void(0)" onclick="sortBy('comments')"
					class="sort-option-btn ${param.sort == 'comments' ? 'active' : ''}">댓글순</a>
			</div>
		</div>
	</div>



	<!-- 게시글 목록 -->
	<div class="board-container">
		<div class="container">
			<div id="boardListContainer">
				<c:if test="${not empty list}">
					<!-- list 변수는 첫 페이지 로드 시 Controller가 보낸 데이터입니다. -->
					<jsp:include page="/WEB-INF/views/board/boardlistFragment.jsp" />
				</c:if>
				<c:if test="${empty list}">
					<div class="empty-state">
						<h3>게시글이 없습니다</h3>
						<p>첫 번째 게시글을 작성해보세요!</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>






	<!-- 플로팅 글쓰기 버튼 -->
	<!-- 이 버튼의 URL은 JS에서 업데이트됩니다. -->
	<a id="writeButton" class="write-btn" title="글쓰기" aria-label="새 게시글 작성">
		<svg viewBox="0 0 24 24">
    <path
				d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" />
  </svg>
	</a>

	<!-- Top 버튼 -->
	<button class="top-button" id="topButton" aria-label="맨 위로 이동">
		<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
    <path d="M12 4l-8 8h6v8h4v-8h6z" />
  </svg>
	</button>

	<footer class="footer">
		<%@ include file="../include/footer.jsp"%>
	</footer>
	<script>

// =================================================================
// 1. 상태 변수 초기화 (URL 파라미터 기반)
// =================================================================
const CONTEXT_PATH = "${pageContext.request.contextPath}";

// JSP에서 전달된 값 (없을 수도 있음)
const jspCategoryId = "${param.categoryId}";
const jspSort = "${param.sort}";
const jspPage = "${param.page}";
const jspKeyword = "${param.keyword}";

//전역 선언 (let 으로 해야 window에 바인딩됨)
let currentCategoryIdJS = "${param.categoryId}" && "${param.categoryId}" !== "null" ? "${param.categoryId}" : "";
let currentSortJS = "${param.sort}" && "${param.sort}" !== "null" ? "${param.sort}" : "recent";
let currentKeywordJS = "${param.keyword}" && "${param.keyword}" !== "null" ? "${param.keyword}" : "";
let currentPageJS = parseInt("${param.page}") || 1;

console.log("초기 상태:", {
  currentCategoryIdJS,
  currentSortJS,
  currentPageJS,
  currentKeywordJS
});


// DOM 요소
const boardListContainer = $('#boardListContainer');


// =================================================================
// 2. 유틸리티 함수
// =================================================================
function getUrlParam(name, defaultValue) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name) || defaultValue;
}

function updateUrlParams(params) {
    const url = new URL(window.location);
    Object.keys(params).forEach(key => {
        if (params[key] === '' || params[key] === null || params[key] === undefined) {
            url.searchParams.delete(key);
        } else {
            url.searchParams.set(key, params[key]);
        }
    });
    history.pushState(null, '', url.toString());
}


//글쓰기
function updateWriteButtonUrl() {
    const writeButton = $('#writeButton');
    if (writeButton.length === 0) return;

    // 'register' Controller가 'category' 대신 'categoryId'를 받도록 수정 가정
    const categoryParam = currentCategoryIdJS ? `categoryId=${currentCategoryIdJS}` : ''; 
    const sortParam = currentSortJS && currentSortJS !== 'recent' ? `sort=${currentSortJS}` : '';
    
    let url = `${CONTEXT_PATH}register`; 
    const params = [categoryParam, sortParam].filter(p => p !== '').join('&');

    if (params) {
        url += `?${params}`;
    }
    writeButton.attr('href', url);
    console.log("글쓰기 버튼 URL 업데이트 완료:", url);
    
    // 로그인 체크 추가
    const loginNo = "${sessionScope.loginNo}";
    writeButton.off("click").on("click", function(e){
        if(!loginNo || loginNo === "null" || loginNo === ""){
            e.preventDefault(); // 링크 이동 막기
            alert("로그인 후 글쓰기가 가능합니다.");
            location.href = "${pageContext.request.contextPath}/login";
}
    });
}


// =================================================================
// 3. AJAX 핵심 기능 (목록 로드)
// =================================================================
window.fetchBoardList = function() {
    let finalCategoryId = null;

    if (currentCategoryIdJS !== '' && currentCategoryIdJS !== null) {
        if (!isNaN(parseInt(currentCategoryIdJS))) {
             finalCategoryId = currentCategoryIdJS; // 유효한 숫자 형태의 문자열만 사용
        } else {
             console.warn("WARN: Invalid category ID detected. Ignoring category filter for this request:", currentCategoryIdJS);
        }
    }

    const params = {
        page: currentPageJS, 
        size: 10,
        sort: currentSortJS,
        keyword: currentKeywordJS,
    };
    
    // 유효한 categoryId가 있을 때만 파라미터에 추가
    if (finalCategoryId !== null) { 
        params.categoryId = finalCategoryId; 
    } 

    console.log("fetchBoardList 실행됨. 요청 파라미터:", params);
    
    // 로딩 상태 표시
    boardListContainer.html('<div style="text-align:center; padding: 50px; color: #555;">게시글을 불러오는 중입니다...</div>');

    $.ajax({
        url: CONTEXT_PATH + '/ajaxList', 
        type: 'GET',
        data: params, 
        success: function(fragment) {
            const $fragment = $(fragment);
            const $boardListWrapper = $fragment.filter('.board-list-fragment-wrapper'); 

            if ($boardListWrapper.length > 0) {
                boardListContainer.html(fragment);
                attachBoardItemClickHandlers()
                attachPaginationHandlers();
            } else {
                boardListContainer.html(`
                    <div class="empty-state">
                        <h3>해당 조건에 맞는 게시글이 없습니다</h3>
                        <p>필터/정렬 옵션을 변경하거나 첫 번째 게시글을 작성해보세요!</p>
                    </div>
                `);
            }
            
            // AJAX 성공 후 URL 상태 동기화 및 글쓰기 버튼 업데이트
            const paramsToUpdate = {
                page: currentPageJS > 1 ? currentPageJS : null, 
                categoryId: finalCategoryId || null, // 수정된 finalCategoryId 사용
                sort: currentSortJS !== 'recent' ? currentSortJS : null, 
                keyword: currentKeywordJS || null
            };
            updateUrlParams(paramsToUpdate);
            updateWriteButtonUrl(); 
        },
        error: function(xhr, status, error) {
            console.error('AJAX 요청 실패:', error);
            boardListContainer.html(`
                <div class="empty-state" style="color: red;">
                    <h3>게시글을 불러오는데 실패했습니다. (오류: ${xhr.status} ${status})</h3>
                    <p>잠시 후 다시 시도해 주세요. 계속되면 관리자에게 문의 바랍니다.</p>
                </div>
            `);
        }
    });
};

// =================================================================
// 4. 필터 및 정렬 함수
// =================================================================
// 카테고리 필터 함수
window.filterByCategory = function(categoryId, btn) {
    currentPageJS = 1; 
    currentCategoryIdJS = categoryId; 

    // 버튼 active 스타일 제거
    document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));

    // 클릭한 버튼에 active 추가
    if (btn) btn.classList.add('active');

    window.fetchBoardList(); 
};


// 정렬 기준 변경 함수
window.sortBy = function(sortType) {
	currentPageJS = 1; 
	currentSortJS = sortType; 

	// 버튼 active 스타일 변경 
	document.querySelectorAll('.view-options .sort-option-btn')
		.forEach(btn => btn.classList.remove('active'));
	const clickedBtn = document.querySelector(`.view-options a[onclick="sortBy('${sortType}')"]`);
	if (clickedBtn) clickedBtn.classList.add('active');
    
	window.fetchBoardList();
};


//=================================================================
//5. 게시글 행 클릭 이벤트 핸들러 (새로 추가)
//=================================================================
window.attachBoardItemClickHandlers = function() {
  // 네임스페이스를 붙여서 off 처리를 안전하게 함
  $(document).off('click.boardItem', '.board-item.clickable')
    .on('click.boardItem', '.board-item.clickable', function(e) {
      // 다른 핸들러/버블링을 완전히 차단
      e.preventDefault();
      e.stopImmediatePropagation();

      // 여러 방식으로 boardno 확인
      const attrBoardno = $(this).attr('data-boardno');
      const dataBoardno = $(this).data('boardno');
      let boardno = dataBoardno !== undefined ? dataBoardno : attrBoardno;

      // 디버그 로그: 원시값/타입 확인
      console.log('[DEBUG] attrBoardno:', attrBoardno, ' dataBoardno:', dataBoardno, ' resolved boardno:', boardno, ' typeof:', typeof boardno);

      boardno = String(boardno).trim();

      if (!boardno || isNaN(Number(boardno)) || Number(boardno) <= 0) {
        console.warn('[WARN] invalid boardno:', boardno);
        return;
      }

      // categoryId 가져오기 (없으면 null)
      const currentCategoryId = (new URLSearchParams(window.location.search)).get('categoryId');

      // CONTEXT_PATH가 /project 또는 빈값일 수 있으니 안전하게 조합
      const base = typeof CONTEXT_PATH === 'string' ? CONTEXT_PATH : '';
      const sep = base && base.endsWith('/') ? '' : '/';
      const targetUrl = base + sep + 'detail?boardno=' + encodeURIComponent(boardno) + (currentCategoryId ? '&categoryId=' + encodeURIComponent(currentCategoryId) : '');

      console.log('[DEBUG] final targetUrl ->', targetUrl);

      // 최종 이동
      window.location.href = targetUrl;
    });
};


//페이지네이션
window.attachPaginationHandlers=function(){
    // 페이지 번호 클릭
    $('#boardListContainer .pagination-nav a.page-number').off('click').on('click', function(e){
        e.preventDefault();
        const href = $(this).attr('href');
        const params = new URLSearchParams(href.split('?')[1]);
        currentPageJS = parseInt(params.get('page')) || 1;
        currentCategoryIdJS = params.get('category') || '';
        currentSortJS = params.get('sort') || 'recent';

        window.fetchBoardList(); // AJAX로 다시 불러오기
    });

    // 이전/다음 화살표 클릭
    $('#boardListContainer .pagination-nav a.page-arrow').off('click').on('click', function(e){
        e.preventDefault();
        const href = $(this).attr('href');
        const params = new URLSearchParams(href.split('?')[1]);
        currentPageJS = parseInt(params.get('page')) || 1;
        currentCategoryIdJS = params.get('category') || '';
        currentSortJS = params.get('sort') || 'recent';

        window.fetchBoardList();
    });
}



// =================================================================
// 5. DOMContentLoaded
// =================================================================
document.addEventListener("DOMContentLoaded", function() {
	// Top 버튼 기능
	const topButton = document.getElementById('topButton');
	
	 const searchInput = document.querySelector(".search-input-large");
	  const searchButton = document.querySelector(".search-btn-large");

	  if (searchInput && searchButton) {
		    searchButton.addEventListener("click", function(e) {
		      e.preventDefault(); // form submit 방지
		      const keyword = searchInput.value.trim();
		      currentKeywordJS = keyword;
		      currentPageJS = 1;
		      fetchBoardList();
		    });

		    searchInput.addEventListener("keypress", function(e) {
		      if (e.key === "Enter") {
		        e.preventDefault(); // form submit 방지
		        searchButton.click();
		      }
		    });
		  }
	  
	if (topButton) { 
		window.addEventListener('scroll', function() {
			if (window.scrollY > 300) {
				topButton.classList.add('show');
			} else {
				topButton.classList.remove('show');
			}
		});

		topButton.addEventListener('click', function() {
			window.scrollTo({
				top: 0,
				behavior: 'smooth'
			});
		});
	} 
	updateWriteButtonUrl();
	
	// JSP에서 목록이 로드되지 않았거나, URL에 상태가 저장된 경우 AJAX로 로드
	const initialListPresent = boardListContainer.find('.board-list-fragment-wrapper').length > 0;
	
	if (!initialListPresent || currentCategoryIdJS !== '' || currentSortJS !== 'recent' || currentPageJS > 1 || currentKeywordJS !== '') {
		window.fetchBoardList();
	} else {
        attachBoardItemClickHandlers();
    }
});
 
</script>


</body>
</html>
