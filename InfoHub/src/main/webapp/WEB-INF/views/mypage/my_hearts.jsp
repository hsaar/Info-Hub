<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2 class="content-title">좋아요 누른 기사</h2>
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">

<!-- 필터 -->
<div class="heart-filter">
  <select class="filter-select" id="heartFilter">
    <option value="all">전체</option>
    <option value="1">일자리</option>
    <option value="2">주거/복지</option>
    <option value="3">교육</option>
    <option value="4">문화/여가</option>
    <option value="5">건강/의료</option>
    <option value="6">금융/경제</option>
  </select>
  <div class="sort-buttons">
    <button class="sort-btn active">최신순</button>
    <button class="sort-btn">가나다순</button>
    <button class="sort-btn">인기순</button>
  </div>
</div>

<!-- 좋아요 리스트 -->
<div class="heart-list"></div>
<p class="no-data" style="display:none;">좋아요 누른 기사가 없습니다.</p>

<!-- 페이지네이션 -->
<nav class="heart-pagination-nav" style="display:none;">
  <button class="heart-page-arrow" id="heartPrevPage">«</button>
  <span id="heartPageInfo"></span>
  <button class="heart-page-arrow" id="heartNextPage">»</button>
</nav>

<script>
var heartsApiUrl = '<c:url value="/hearts/api"/>';
var deleteHeartUrl = '<c:url value="/hearts/delete" />';

document.addEventListener('DOMContentLoaded', function() {
    const heartList = document.querySelector('.heart-list');
    const noData = document.querySelector('.no-data');
    const filterSelect = document.getElementById("heartFilter");

    let currentSort = "latest";
    let currentPage = 1;
    const pageSize = 6;
    let currentList = [];

    // 데이터 불러오기
    function loadHearts() {
        fetch(heartsApiUrl, { method: 'GET', credentials: 'same-origin' })
        .then(res => res.json())
        .then(data => {
            console.log("받은 데이터:", data);
            renderList(data);
        })
        .catch(err => console.error("좋아요 불러오기 실패:", err));
    }

    // 리스트 렌더링
    function renderList(hearts) {
        currentList = hearts.map((h, idx) => ({ ...h, id: idx }));
        currentPage = 1;

        heartList.innerHTML = "";

        if (!hearts || hearts.length === 0) {
            noData.style.display = "block";
            renderPage();
            return;
        }
        noData.style.display = "none";

        hearts.forEach((heart, idx) => {
            const titleText = (heart.articleTitle || "(제목 없음)").toString();
            const contentText = (heart.articleContent || "(내용 없음)").toString();

            const card = document.createElement("article");
            card.classList.add("heart-card");
            card.setAttribute("data-category", heart.categoryNo);
            card.setAttribute("data-hearts", heart.hearts || 0); // 인기순 정렬용
            card.setAttribute("data-id", idx);

            card.innerHTML = 
                '<h3 class="heart-title">' + (titleText || "(제목 없음)") + '</h3>' +
                '<p class="heart-description">' + (contentText || "(내용 없음)") + '</p>' +
                '<div class="heart-info">' +
                '    <span class="heart-date">좋아요: ' + heart.createdDate + '</span>' +
                '</div>' +
                '<div class="heart-actions">' +
                '    <button class="delete-btn" data-heartid="' + heart.heartNo + '">삭제</button>' +
                '</div>';
                
                card.style.cursor = "pointer";
                card.addEventListener("click", function(e) {
                    if (e.target.classList.contains("delete-btn")) return; // 삭제 클릭은 무시
                    if (heart.articleId) {
                        window.location.href = "/project/articleContent?articleId=" + heart.articleId;
                    } else {
                        alert("해당 기사 ID를 찾을 수 없습니다.");
                    }
                });

            heartList.appendChild(card);
        });

        renderPage();
    }

    // 필터 이벤트 
    filterSelect.addEventListener("change", function() {
    	currentPage = 1;
    	renderPage();
	});


    // 정렬
    function sortData(cards) {
        const arr = Array.from(cards);
        if (currentSort === "alpha") {
            return arr.sort((a, b) =>
                a.querySelector(".heart-title").textContent.localeCompare(
                    b.querySelector(".heart-title").textContent
                )
            );
        } else if (currentSort === "popularity") {
            return arr.sort((a, b) => {
                const heartsA = parseInt(a.getAttribute("data-hearts")) || 0;
                const heartsB = parseInt(b.getAttribute("data-hearts")) || 0;
                return heartsB - heartsA;
            });
        } else if (currentSort === "latest") {
            return arr.sort((a, b) => {
                const dateA = new Date(a.querySelector(".heart-date").textContent.replace("좋아요:", "").trim());
                const dateB = new Date(b.querySelector(".heart-date").textContent.replace("좋아요:", "").trim());
                return dateB - dateA;
            });
        } else {
            return arr;
        }
    }

    document.querySelectorAll(".sort-btn").forEach(btn => {
        btn.addEventListener("click", function() {
            document.querySelectorAll(".sort-btn").forEach(b => b.classList.remove("active"));
            this.classList.add("active");

            if (this.textContent.includes("가나다")) currentSort = "alpha";
            else if (this.textContent.includes("인기")) currentSort = "popularity";
            else currentSort = "latest";

            const sorted = sortData(document.querySelectorAll(".heart-card"));
            heartList.innerHTML = "";
            sorted.forEach(card => heartList.appendChild(card));
        });
    });

    // 페이지네이션
    const heartPageNav = document.querySelector('.heart-pagination-nav');
	const heartPrevBtn = document.getElementById('heartPrevPage');
	const heartNextBtn = document.getElementById('heartNextPage');
	const heartPageInfo = document.getElementById('heartPageInfo');

	// 페이지네이션 전체 스타일
	heartPageNav.style.position = 'relative';
	heartPageNav.style.width = '200px';
	heartPageNav.style.height = '40px';
	heartPageNav.style.margin = '20px auto';

	// 페이지 정보(숫자) 스타일 - 항상 중앙 고정
	heartPageInfo.style.position = 'absolute';
	heartPageInfo.style.left = '50%';
	heartPageInfo.style.transform = 'translateX(-50%)';
	heartPageInfo.style.minWidth = '100px';
	heartPageInfo.style.textAlign = 'center';
	heartPageInfo.style.fontWeight = 'normal';
	heartPageInfo.style.lineHeight = '35px';

	// 버튼 스타일 - nav 양옆
	[heartPrevBtn, heartNextBtn].forEach(btn => {
	    btn.style.width = '40px';
	    btn.style.height = '40px';
	    btn.style.borderRadius = '6px';
	    btn.style.cursor = 'pointer';
	    btn.style.display = 'inline-flex';
	    btn.style.justifyContent = 'center';
	    btn.style.alignItems = 'center';
	});
	heartPrevBtn.style.position = 'absolute';
	heartPrevBtn.style.left = '0';
	heartNextBtn.style.position = 'absolute';
	heartNextBtn.style.right = '0';

    const cards = () => document.querySelectorAll(".heart-card");

 // 페이지네이션 렌더링
    function renderPage() {
        const allCards = Array.from(cards());
        const selectedCategory = filterSelect.value;

        const filteredCards = allCards.filter(card => 
            selectedCategory === "all" || card.getAttribute("data-category") === selectedCategory
        );

        const totalPages = Math.ceil(filteredCards.length / pageSize) || 1;

        filteredCards.forEach((card, idx) => {
            card.style.display = (idx >= (currentPage - 1) * pageSize && idx < currentPage * pageSize) 
                                 ? "block" : "none";
        });

        allCards.forEach(card => {
            if (!filteredCards.includes(card)) card.style.display = "none";
        });

        heartPageInfo.textContent = currentPage + " / " + totalPages;
        heartPrevBtn.style.display = currentPage > 1 ? "inline-block" : "none";
        heartNextBtn.style.display = currentPage < totalPages ? "inline-block" : "none";
        heartPageNav.style.display = totalPages > 1 ? "flex" : 'none';
    }

    heartPrevBtn.addEventListener("click", () => {
        if(currentPage > 1) { currentPage--; renderPage(); }
    });
    heartNextBtn.addEventListener("click", () => {
        const totalPages = Math.ceil(currentList.length / pageSize) || 1;
        if(currentPage < totalPages) { currentPage++; renderPage(); }
    });


    // 삭제 버튼
    heartList.addEventListener("click", function(e) {
        if (e.target.classList.contains("delete-btn")) {
            const heartId = e.target.getAttribute("data-heartid");
            if(!heartId){ alert("삭제할 좋아요 정보를 찾을 수 없습니다."); return; }
            if(!confirm("정말 삭제하시겠습니까?")) return;

            fetch(deleteHeartUrl, {
                method:'POST',
                headers:{'Content-Type':'application/x-www-form-urlencoded'},
                body:'heartNo=' + encodeURIComponent(heartId)
            })
            .then(res=>res.text())
            .then(()=>loadHearts())
            .catch(err => { console.error("삭제 실패:", err); alert("삭제 중 오류가 발생했습니다."); });
        }
    });

    // 초기 실행
    loadHearts();
});
</script>
