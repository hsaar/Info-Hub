<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>혜택 스트랩</title>
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
</head>
<body>
<!-- 스크랩한 정책 콘텐츠 -->
<h2 class="content-title">스크랩한 혜택</h2>

<!-- 필터 -->
<div class="scrap-filter">
  <select class="filter-select" id="scrapFilter">
    <option value="all">전체 (15)</option>
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
  <span id="pageInfo">0 / 0</span>
  <button class="page-arrow" id="nextPage">»</button>
</nav>


<script>
var scrapApiUrl = '<c:url value="/scraps/api"/>';


document.addEventListener('DOMContentLoaded', function() {
    const scrapList = document.querySelector('.scrap-list');
    const noData = document.querySelector('.no-data');
    const filterSelect = document.getElementById("scrapFilter");
    
    let currentSort = "latest"; // 기본 최신순

    // ---------------- 데이터 불러오기 ----------------
    function loadScraps() {
        fetch(scrapApiUrl, {
            method: 'GET',
            credentials: 'same-origin' // 세션 쿠키 포함
        })
        .then(res => res.json())
        .then(data => {
            console.log("받은 데이터:", data);
            
            if (data && data.length > 0) {
                console.log("첫 번째 스크랩 policyTitle 값:", data[0].policyTitle);
                console.log("첫 번째 스크랩 policyTitle 타입:", typeof data[0].policyTitle); // 이것이 'string'이 아닌 'boolean'인지 확인!
            }
            renderList(data);
        })
        .catch(err => console.error("스크랩 불러오기 실패:", err));

    }


    // ---------------- 리스트 렌더링 ----------------
    function renderList(scraps) {
        scrapList.innerHTML = "";

        if (!scraps || scraps.length === 0) {
            noData.style.display = "block";
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
                '<p class="scrap-description">' + (contentText || "(내용 없음)") + '</p>' + // 👈 false 대신 "(내용 없음)"이 출력됩니다.
                '<div class="scrap-info">' +
                '    <span class="scrap-date">스크랩일: ' + scrap.createdAt + '</span>' +
                '</div>';
                
            scrapList.appendChild(card);
        });
    }

    // ---------------- 필터 이벤트 ----------------
    filterSelect.addEventListener("change", function() {
        const selectedCategoryId = this.value;
        const cards = document.querySelectorAll(".scrap-card");

        cards.forEach(card => {
            const cardCategoryId = card.getAttribute("data-category");
            card.style.display = (selectedCategoryId === "all" || cardCategoryId === String(selectedCategoryId))
                                 ? "block" : "none";
        });
    });

    // ---------------- 정렬 ----------------
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

    // ---------------- 실행 ----------------
    loadScraps();
});
</script>
</body>
</html>
