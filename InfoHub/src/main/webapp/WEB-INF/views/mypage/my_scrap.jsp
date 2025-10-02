<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 스크랩한 정책 콘텐츠 -->
<h2 class="content-title">스크랩한 정책</h2>
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">

<!-- 필터 -->
<div class="scrap-filter">
  <select class="filter-select" id="scrapFilter">
    <option value="all">전체</option>
  	<option value="1">일자리</option>
  	<option value="2">주거</option>
  	<option value="3">교육</option>
  	<option value="4">복지</option>
  </select>
  <div class="sort-buttons">
    <button class="sort-btn active">최신순</button>
    <button class="sort-btn">가나다순</button>
    <button class="sort-btn">마감임박순</button>
  </div>
</div>

<!-- 스크랩 리스트 -->
<div class="scrap-list"></div>
<p class="no-data" style="display:none;">스크랩한 정책이 없습니다.</p>

<!-- 페이지네이션 -->
<nav class="pagination-nav" style="display:none;">
  <button class="page-arrow" id="prevPage">«</button>
  <span id="pageInfo"></span>
  <button class="page-arrow" id="nextPage">»</button>
</nav>


<script>
var scrapApiUrl = '<c:url value="/scraps/api"/>';
var deleteScrapUrl = '<c:url value="/scraps/delete" />';

document.addEventListener('DOMContentLoaded', function() {
    const scrapList = document.querySelector('.scrap-list');
    const noData = document.querySelector('.no-data');
    const filterSelect = document.getElementById("scrapFilter");
    
    let currentSort = "latest"; // 기본 최신순
    

    // 데이터 불러오기
    function loadScraps() {
        fetch(scrapApiUrl, {
            method: 'GET',
            credentials: 'same-origin' // 세션 쿠키 포함
        })
        .then(res => res.json())
        .then(data => {
            console.log("받은 데이터:", data);
            renderList(data);
        })
        .catch(err => console.error("스크랩 불러오기 실패:", err));

    }


    // 리스트 렌더링
    function renderList(scraps) {
    	currentList = scraps.map((s, idx) => ({ ...s, id: idx }));
    	currentPage = 1;
    	
        scrapList.innerHTML = "";

        if (!scraps || scraps.length === 0) {
            noData.style.display = "block";
            renderPage();
            return;
        }
        noData.style.display = "none";

        scraps.forEach((scrap, idx) => {
        	const titleText = (scrap.policyTitle || "").toString();
            const contentText = (scrap.policyContent || "").toString();
            
            const card = document.createElement("article");
            card.classList.add("scrap-card");
            card.setAttribute("data-category", scrap.policyCategoryId);
            card.setAttribute("data-deadline", scrap.policyApplicationEnd || "");
            card.setAttribute("data-id", idx);

            card.innerHTML = 
                '<h3 class="scrap-title">' + (titleText || "(제목 없음)") + '</h3>' +
                '<p class="scrap-description">' + (contentText || "(내용 없음)") + '</p>' +
                '<div class="scrap-info">' +
                '    <span class="scrap-date">스크랩일: ' + scrap.createdAt + '</span>' +
                '</div>' +
                '<div class="scrap-actions">' +
                '    <button class="delete-btn" data-scrapid="' + scrap.scrapNo + '">삭제</button>' +
                '</div>';

            scrapList.appendChild(card);
        });
        renderPage();
    }

    // 필터 이벤트
    filterSelect.addEventListener("change", function() {
        const selectedCategoryId = this.value;
        const cards = document.querySelectorAll(".scrap-card");

        cards.forEach(card => {
            const cardCategoryId = card.getAttribute("data-category");
            card.style.display = (selectedCategoryId === "all" || cardCategoryId === String(selectedCategoryId))
                                 ? "block" : "none";
        });
    });

    // 정렬 
    function sortData(cards) {
        const arr = Array.from(cards);
        if (currentSort === "alpha") {
            return arr.sort((a, b) =>
                a.querySelector(".scrap-title").textContent.localeCompare(
                    b.querySelector(".scrap-title").textContent
                )
            );
        } else if (currentSort === "deadline") {
            return arr.sort(
                (a, b) => new Date(a.getAttribute("data-deadline")) - new Date(b.getAttribute("data-deadline"))
            );
        } else {
            return arr.sort((a, b) => {
                const dateA = new Date(a.querySelector(".scrap-date").textContent.replace("스크랩일:", "").trim());
                const dateB = new Date(b.querySelector(".scrap-date").textContent.replace("스크랩일:", "").trim());
                return dateB - dateA;
            });
        }
    }

    document.querySelectorAll(".sort-btn").forEach(btn => {
        btn.addEventListener("click", function() {
            document.querySelectorAll(".sort-btn").forEach(b => b.classList.remove("active"));
            this.classList.add("active");

            if (this.textContent.includes("가나다")) currentSort = "alpha";
            else if (this.textContent.includes("마감")) currentSort = "deadline";
            else currentSort = "latest";

            const cards = document.querySelectorAll(".scrap-card");
            const sorted = sortData(cards);

            scrapList.innerHTML = "";
            sorted.forEach(card => scrapList.appendChild(card));
        });
    });
    
    let currentPage = 1;
    const pageSize = 6;
    let currentList = [];
    
    const pageNav = document.querySelector('.pagination-nav');
    const prevBtn = document.getElementById('prevPage');
    const nextBtn = document.getElementById('nextPage');
    const pageInfo = document.getElementById('pageInfo');

    // 페이지네이션 전체 스타일
    pageNav.style.position = 'relative';
    pageNav.style.width = '200px';
    pageNav.style.height = '40px';
    pageNav.style.margin = '20px auto';

    // 페이지 정보(숫자) 스타일 - 항상 중앙 고정
    pageInfo.style.position = 'absolute';
    pageInfo.style.left = '50%';
    pageInfo.style.transform = 'translateX(-50%)';
    pageInfo.style.minWidth = '100px';
    pageInfo.style.textAlign = 'center';
    pageInfo.style.fontWeight = 'normal';
    pageInfo.style.lineHeight = '35px';


    // 버튼 스타일 - nav 양옆
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

	
    // DOM에서 카드 선택
    const cards = () => document.querySelectorAll(".scrap-card");

    // 페이지 표시 함수
    function renderPage() {
    	const allCards = Array.from(cards());
    	const totalPages = Math.ceil(currentList.length / pageSize) || 1;

    	allCards.forEach((card, idx) => {
            card.style.display = (idx >= (currentPage - 1) * pageSize && idx < currentPage * pageSize) ? "block" : "none";
        });;

    	pageInfo.textContent = currentPage + " / " + totalPages;

    	prevBtn.style.display = currentPage > 1 ? "inline-block" : "none";
        nextBtn.style.display = currentPage < totalPages ? "inline-block" : "none";
        pageNav.style.display = totalPages > 1 ? 'flex' : 'none';
	}

    // 버튼 이벤트
    document.getElementById("prevPage").addEventListener("click", () => {
        if (currentPage > 1) {
            currentPage--;
            renderPage();
        }
    });
    document.getElementById("nextPage").addEventListener("click", () => {
        const totalPages = Math.ceil(currentList.length / pageSize) || 1;
        if (currentPage < totalPages) {
            currentPage++;
            renderPage();
        }
    });
    
 	// 삭제 버튼 클릭 이벤트
    scrapList.addEventListener("click", function(e) {
        if (e.target.classList.contains("delete-btn")) {
            const scrapCard = e.target.closest(".scrap-card");
            const scrapId = e.target.getAttribute("data-scrapid");
            console.log("삭제할 scrapId:", scrapId);

            if (!scrapId) {
                alert("삭제할 스크랩 정보를 찾을 수 없습니다.");
                return;
            }

            if (!confirm("정말 삭제하시겠습니까?")) return;

            fetch(deleteScrapUrl, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'scrapsNo=' + encodeURIComponent(scrapId)
            })

            .then(res => res.text())
            .then(() => loadScraps())
            .catch(err => {
                console.error("삭제 실패:", err);
                alert("삭제 중 오류가 발생했습니다.");
            });
        }
    });

    // 실행
    loadScraps();
});
</script>
