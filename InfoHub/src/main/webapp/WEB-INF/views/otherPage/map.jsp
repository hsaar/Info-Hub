<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
		String userId = (String) session.getAttribute("userId");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지역별 정책 찾기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/map.css' />">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=94d8864bb37a5cec084e603dd70aa0f9&libraries=services"></script>
</head>
<body>

<!-- 여기에 상단바 include -->
<jsp:include page="../include/header.jsp"/>

<!-- 메인 컨테이너 -->
<div class="map-main-container">
  <!-- 왼쪽: 지도 영역 -->
  <div class="map-left-section">
    <h2 class="page-title">지역별 정책 찾기</h2>
    <p class="eyebrow">지도에서 지역을 선택하면 해당 지역의 정책을 확인할 수 있습니다</p>
    
    <!-- 카테고리 필터 버튼 -->
  	<div class="filter-buttons">
    	<button class="filter-btn active" data-filter="all">종합</button>
    	<button class="filter-btn" data-filter="real-estate">일자리취업</button>
    	<button class="filter-btn" data-filter="stock">주거/복지</button>
    	<button class="filter-btn" data-filter="savings">교육</button>
    	<button class="filter-btn" data-filter="welfare">문화/여가</button>
    	<button class="filter-btn" data-filter="startup">금융/경제</button>
  	</div>
    
    <!-- 카카오맵 영역 -->
    <div class="map-area">
      <div id="map" style="width:100%; height:500px;"></div>
    </div>

    <!-- 전국 버튼 -->
    <div class="map-controls">
      <button class="reset-map-btn" id="resetMapBtn">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M3 12a9 9 0 0 1 9-9 9.75 9.75 0 0 1 6.74 2.74L21 8"/>
          <path d="M21 3v5h-5"/>
          <path d="M21 12a9 9 0 0 1-9 9 9.75 9.75 0 0 1-6.74-2.74L3 16"/>
          <path d="M3 21v-5h5"/>
        </svg>
        전국
      </button>
    </div>
    
    <p class="map-help-text">지도를 클릭하여 지역별 정책과 혜택을 확인하세요</p>
  </div>

  <!-- 오른쪽: 검색 결과 패널 -->
  <div class="map-right-section">
    <div class="search-result-panel">
      <h3 class="result-title">전국</h3>
      
      <!-- 결과 목록 헤더 -->
      <div class="result-list-header">
        <h4>종합 0건</h4>

        <!-- 정렬 드롭다운 -->
        <div class="sort-dropdown">
          <button class="sort-btn" id="sortDropdownBtn">
            <span id="currentSort">최신순</span>
            <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <polyline points="6 9 12 15 18 9"></polyline>
            </svg>
          </button>
          <div class="sort-menu" id="sortMenu">
            <button class="sort-option" data-sort="latest">최신순</button>
            <button class="sort-option" data-sort="popular">인기순</button>
          </div>
        </div>
      </div>
      
      <!-- 결과 목록 -->
      <ul class="result-list">
		<!-- 비워두기(JS 클릭 시 li 채움) -->
      </ul>
      
      <!-- 페이지네이션 -->
      <div class="result-pagination">
      </div>
      
      <!-- 안내 텍스트 -->
      <p class="result-help-text">
        지도에서 지역을 선택해주세요.<br>
      </p>
    </div>
  </div>
</div>

<!-- Top 버튼 -->
<button class="top-button" id="topButton" aria-label="맨 위로 이동">
  <svg viewBox="0 0 24 24">
    <path d="M12 4l-8 8h6v8h4v-8h6z"/>
  </svg>
</button>


<c:set var="prevIcon" value="${pageContext.request.contextPath}/resources/image/prev.png"/>
<c:set var="nextIcon" value="${pageContext.request.contextPath}/resources/image/next.png"/>

<script>
// 카카오맵 API 로딩 대기
window.addEventListener('load', function() {
  if (typeof kakao === 'undefined') {
    console.error('카카오맵 API 로드 실패');
    return;
  }
  
  initMap();
});

function initMap() {
  var mapContainer = document.getElementById('map');
  
  if (!mapContainer) {
    console.error('map 엘리먼트를 찾을 수 없습니다');
    return;
  }
  
  var mapOption = { 
    center: new kakao.maps.LatLng(36.6358, 127.4911),
    level: 12,
    draggable: true,           // 드래그 가능
    scrollwheel: true,          // 마우스 휠 확대/축소 가능
    disableDoubleClickZoom: true
  };
  
  try {
    var map = new kakao.maps.Map(mapContainer, mapOption);
    
    var customOverlay = new kakao.maps.CustomOverlay({});
    var polygons = [];
    var currentPolygon = null; // 현재 선택된 폴리곤 추적

    // GeoJSON 데이터 로드
    $.getJSON('<c:url value="/resources/data/gson.json" />', function(geojson) {
      var data = geojson.features;
      
      $.each(data, function(index, val) {
        var coordinates = val.geometry.coordinates;
        var name = val.properties.CTP_KOR_NM;
        displayMap(coordinates, name);
      });
    });

    // 지도에 폴리곤 표시
    function displayMap(coordinates, name) {
      var path = [];            
      var points = []; 
      
      $.each(coordinates[0], function(index, coordinate) {        
        var point = {};
        point.x = coordinate[1];
        point.y = coordinate[0];
        points.push(point);
        path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
      });
      
      // 다각형 생성
      var polygon = new kakao.maps.Polygon({
        map: map,
        path: path,
        strokeWeight: 2,
        strokeColor: '#0B50D0',
        strokeOpacity: 0.8,
        fillColor: '#fff',
        fillOpacity: 0.7
      });
      
      polygons.push(polygon);
      overlaySet(name, points);
   
      // 클릭 이벤트 - 즉시 반응
      kakao.maps.event.addListener(polygon, 'click', function() {
        // 이전 선택 초기화
        if (currentPolygon) {
          currentPolygon.setOptions({
            fillColor: '#fff',
            fillOpacity: 0.7,
            strokeWeight: 2
          });
        }
        
        // 현재 폴리곤 강조
        polygon.setOptions({
          fillColor: '#60a5fa',
          fillOpacity: 0.8,
          strokeWeight: 3
        });
        
        // 현재 선택된 polygon 저장
        currentPolygon = polygon;
        
        // ✅ 클릭 확인 로그
        console.log("폴리곤 클릭됨:", name);

        // 검색 결과 즉시 업데이트
        updateSearchResults(name);
      });
    }

    // 폴리곤 중심 좌표 계산
    function centerMap(points) {
      var i, j, len, p1, p2, f, area, x, y;
      area = x = y = 0;
   
      for (i = 0, len = points.length, j = len - 1; i < len; j = i++) {
        p1 = points[i];
        p2 = points[j];
        f = p1.y * p2.x - p2.y * p1.x;
        x += (p1.x + p2.x) * f;
        y += (p1.y + p2.y) * f;
        area += f * 3;
      }
      return new kakao.maps.LatLng(x / area, y / area);
    }

    // 오버레이 설정
    function overlaySet(name, points) {
      var content = '<div style="font-weight:600; font-size:12px; color:#667084;">' + name + '</div>';
      var position = centerMap(points);

      var overlay = new kakao.maps.CustomOverlay({
        position: position,
        content: content,
        xAnchor: 0.5,
        yAnchor: 0.5
      });

      overlay.setMap(map);
    }

  } catch(error) {
    console.error('지도 생성 중 에러:', error);
  }
}

// 필터 버튼 기능
document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.filter-btn').forEach(btn => {
    btn.addEventListener('click', function() {
      document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
      this.classList.add('active');
    });
  });
});

// Top 버튼 기능
window.addEventListener('load', function() {
  const topButton = document.getElementById('topButton');
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
});
document.addEventListener('DOMContentLoaded', function() {
	  var currentFilter = 'all';
	  
	  document.querySelectorAll('.filter-btn').forEach(btn => {
		  btn.addEventListener('click', function() {
		    document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
		    this.classList.add('active');

		    const filterKey = this.getAttribute('data-filter');
		    currentCategory = categoryMap[filterKey] || categoryMap["all"];

		    console.log("선택된 카테고리:", currentCategory);

		    // 다시 조회
		    updateSearchResults();
		  });
		});
	  
	  function updateFilterDisplay(filter) {
	    var filterNames = {
	      'all': '종합',
	      'real-estate': '일자리취업',
	      'stock': '주거/복지',
	      'savings': '교육',
	      'welfare': '문화/여가',
	      'startup': '금융/경제'
	    };
	    
	    var header = document.querySelector('.result-list-header h4');
	    if (header) {
	      var currentRegion = header.textContent.split(' ')[0];
	      header.textContent = currentRegion + ' - ' + filterNames[filter] + ' (10건)';
	      header.style.transition = 'all 0.3s';
	      header.style.color = '#0B50D0';
	      setTimeout(function() {
	        header.style.color = '';
	      }, 500);
	    }
	  }
	});

/// GeoJSON → DB 이름 변환 매핑
const regionNameNormalizer = {
  "서울": "서울특별시",
  "부산": "부산광역시",
  "인천": "인천광역시",
  "대구": "대구광역시",
  "광주": "광주광역시",
  "대전": "대전광역시",
  "울산": "울산광역시",
  "세종": "세종특별자치시",
  "경기": "경기도",
  "강원": "강원도",
  "충북": "충청북도",
  "충남": "충청남도",
  "전북": "전라북도",
  "전남": "전라남도",
  "경북": "경상북도",
  "경남": "경상남도",
  "제주": "제주특별자치도"
};

// regionId 매핑 (DB 기준)
const regionIdMap = {
  "서울특별시": 1,
  "인천광역시": 2,
  "대전광역시": 3,
  "광주광역시": 4,
  "대구광역시": 5,
  "울산광역시": 6,
  "부산광역시": 7,
  "경기도": 8,
  "강원도": 9,
  "충청북도": 10,
  "충청남도": 11,
  "경상북도": 12,
  "경상남도": 13,
  "전라북도": 14,
  "전라남도": 15,
  "제주특별자치도": 16,
  "세종특별자치시": 17,
  "전국": 18
};

//카테고리 매핑 (전역)
const categoryMap = {
  "all": { id: null, name: "종합" },   // 종합 → categoryId X
  "real-estate": { id: 1, name: "일자리취업" },
  "stock": { id: 2, name: "주거/복지" },
  "savings": { id: 3, name: "교육" },
  "welfare": { id: 4, name: "문화/여가" },
  "startup": { id: 5, name: "금융/경제" }
};

//전역 상태
let currentRegion = null;
let currentCategory = categoryMap["all"]; // 기본값 = 종합
let currentSortType = "latest"; // 기본 정렬 = 최신순

function updateSearchResults(regionName, sortType = currentSortType) {
  console.log("updateSearchResults 호출됨:", regionName, sortType);

  if (regionName) {
    currentRegion = regionName;
  }

  const normalized = currentRegion ? (regionNameNormalizer[currentRegion] || currentRegion) : null;
  const displayName = normalized || "전국";

  let regionId = null;
  if (displayName !== "전국") {
    regionId = normalized ? regionIdMap[normalized] : null;
  }

  // 요청 URL 만들기
  let url = "/project/api/policy?";
  if (regionId) url += "regionId=" + regionId;
  if (currentCategory && currentCategory.id) {
    url += (regionId ? "&" : "") + "categoryId=" + currentCategory.id;
  }
  if (sortType) {
    url += (url.endsWith("?") ? "" : "&") + "orderBy=" + sortType;
  }

  console.log("요청 URL:", url);

  fetch(url)
    .then(res => res.json())
    .then(list => {
      const resultList = document.querySelector(".result-list");
      const resultTitle = document.querySelector(".result-title");
      const resultHeader = document.querySelector(".result-list-header h4");

      if (!resultList || !resultTitle || !resultHeader) {
        console.error("결과 DOM 요소 없음");
        return;
      }

      if (!Array.isArray(list)) {
        console.error("서버 응답이 배열이 아님:", list);
        return;
      }

      const count = list.length;

      // 지역명
      resultTitle.textContent = displayName;

      // 카테고리명 + 건수
      const categoryName = currentCategory && currentCategory.name ? currentCategory.name : "종합";
      resultHeader.textContent = categoryName + " " + count + "건";

      if (count === 0) {
        resultList.innerHTML = `<li class="result-item">정책이 없습니다.</li>`;
        renderPageForCount(0);   // 페이지네이션 비우기
        return;
      }

      // 전체 리스트 저장
      currentList = list;
      currentPage = 1; // 새 검색 시 첫 페이지로 초기화

      // 페이지네이션 호출 (목록 출력 포함)
      renderPageForCount(count);

    })
    .catch(err => console.error("정책 불러오기 실패:", err));
}

// 페이지 로드 시 기본 실행 (종합 선택)
document.addEventListener("DOMContentLoaded", function() {
  document.querySelector('.filter-btn[data-filter="all"]').classList.add("active");
  currentCategory = categoryMap["all"];
  updateSearchResults(); // 전국 + 종합 불러오기

  // 전국 버튼
  const resetBtn = document.getElementById("resetMapBtn");
  if (resetBtn) {
    resetBtn.addEventListener("click", function() {
      currentRegion = null; // 지역 초기화
      updateSearchResults("전국", currentSortType); // 전국 전체 조회
    });
  }
});

// 카테고리 버튼 클릭 처리
document.querySelectorAll('.filter-btn').forEach(btn => {
  btn.addEventListener('click', function() {
    document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
    this.classList.add('active');

    // 매핑 테이블에서 바로 꺼냄
    currentCategory = categoryMap[this.dataset.filter];

    // 지역 유지하면서 카테고리만 바꿔서 조회
    updateSearchResults(currentRegion);
  });
});

const prevIcon = "${prevIcon}";
const nextIcon = "${nextIcon}";

// 페이지네이션 상태
let currentPage = 1;
const pageSize = 5;
let currentList = []; // 전체 리스트 저장 (옵션)

//페이지네이션 표시 전용
function renderPageForCount(totalCount) {
  const resultList = document.querySelector(".result-list");
  const pagination = document.querySelector(".result-pagination");
  if (!resultList || !pagination) return;

  const totalPages = Math.ceil(totalCount / pageSize);

  if (totalCount === 0) {
    pagination.textContent = "0 / 0";
    return;
  }

  // 현재 페이지 아이템만 출력
  const start = (currentPage - 1) * pageSize;
  const end = start + pageSize;
  const pageItems = currentList.slice(start, end);

  // DocumentFragment 활용 (DOM 교체 최소화)
  const fragment = document.createDocumentFragment();

  pageItems.forEach(p => {
    const li = document.createElement("li");
    li.classList.add("result-item");

    const strong = document.createElement("strong");
    strong.textContent = p.title || "(제목 없음)";

    const span = document.createElement("span");
    span.textContent = p.content && typeof p.content === "string"
      ? (p.content.length > 30 ? p.content.substring(0, 30) + "..." : p.content)
      : "(내용 없음)";

    li.appendChild(strong);
    li.appendChild(document.createElement("br"));
    li.appendChild(span);
    
    //상세페이지 이동
    
    
    li.style.cursor = "pointer";
    li.addEventListener("click", function() {
    	
    const userId = '<%= userId %>';
    const isLoggedIn = userId && userId.trim() !== "" && userId.trim() !== "null" && userId.trim() !== "undefined";
      
    if (isLoggedIn && p.registrationNo) {
        window.location.href = "/project/registrationContent?registrationNo=" + p.registrationNo;
      } else if(!isLoggedIn && p.registrationNo){
    	  window.location.href = "/project/noRegistrationContent?registrationNo=" + p.registrationNo;
      } else {
        alert("정책 ID가 없습니다.");
      }
    });

    fragment.appendChild(li);
  });

  // 한번에 교체
  resultList.innerHTML = "";
  resultList.appendChild(fragment);

  //페이지네이션 UI
  let container = document.createElement("div");
  container.style.display = "flex";
  container.style.alignItems = "center";   
  container.style.justifyContent = "center"; 
  container.style.gap = "40px";

  // 숫자 표시 (항상 중앙)
  const pageText = document.createElement("span");
  pageText.textContent = currentPage + " / " + totalPages;
  pageText.style.fontSize = "14px";
  pageText.style.fontWeight = "500";
  pageText.style.lineHeight = "1";
  pageText.style.minWidth = "50px";
  pageText.style.textAlign = "center";

  // 왼쪽 버튼 컨테이너
  const leftBox = document.createElement("div");
  leftBox.style.width = "20px";
  leftBox.style.display = "flex";
  leftBox.style.justifyContent = "center";

  if (currentPage > 1) {
    const prevBtn = document.createElement("button");
    prevBtn.id = "prevPage";
    prevBtn.style.background = "none";
    prevBtn.style.border = "none";
    prevBtn.style.padding = "0";
    prevBtn.style.cursor = "pointer";

    const prevImg = document.createElement("p");
    prevImg.textContent = "<";
    prevImg.style.fontSize = "20px";

    prevBtn.appendChild(prevImg);
    leftBox.appendChild(prevBtn);
  }

  // 오른쪽 버튼 컨테이너
  const rightBox = document.createElement("div");
  rightBox.style.width = "20px"; 
  rightBox.style.display = "flex";
  rightBox.style.justifyContent = "center";

  if (currentPage < totalPages) {
    const nextBtn = document.createElement("button");
    nextBtn.id = "nextPage";
    nextBtn.style.background = "none";
    nextBtn.style.border = "none";
    nextBtn.style.padding = "0";
    nextBtn.style.cursor = "pointer";

    const nextImg = document.createElement("p");
    nextImg.textContent = ">"
    nextImg.style.fontSize = "20px";

    nextBtn.appendChild(nextImg);
    rightBox.appendChild(nextBtn);
  }

  // 왼쪽 - 숫자 - 오른쪽
  container.appendChild(leftBox);
  container.appendChild(pageText);
  container.appendChild(rightBox);

  pagination.innerHTML = "";
  pagination.appendChild(container);

  // 이벤트 바인딩
  document.getElementById("prevPage")?.addEventListener("click", function() {
    if (currentPage > 1) {
      currentPage--;
      renderPageForCount(totalCount);
    }
  });
  document.getElementById("nextPage")?.addEventListener("click", function() {
    if (currentPage < totalPages) {
      currentPage++;
      renderPageForCount(totalCount);
    }
  });
}

// 정렬 드롭다운
let isMenuOpen = false;
const sortDropdownBtn = document.getElementById("sortDropdownBtn");
const sortMenu = document.getElementById("sortMenu");
const currentSort = document.getElementById("currentSort");

if (sortDropdownBtn && sortMenu && currentSort) {
  sortDropdownBtn.addEventListener("click", function(e) {
    e.stopPropagation();
    isMenuOpen = !isMenuOpen;
    sortMenu.classList.toggle("show", isMenuOpen);
    sortDropdownBtn.classList.toggle("active", isMenuOpen);
  });

  document.querySelectorAll(".sort-option").forEach(option => {
    option.addEventListener("click", function(e) {
      e.stopPropagation();

      // 선택된 정렬 기준
      currentSortType = this.getAttribute("data-sort"); // "latest" or "popular"
      currentSort.textContent = this.textContent;

      // 닫기 처리
      sortMenu.classList.remove("show");
      sortDropdownBtn.classList.remove("active");
      isMenuOpen = false;

      // 기존 updateSearchResults 호출
      updateSearchResults(currentRegion, currentSortType);
    });
  });

  // 외부 클릭하면 닫기
  document.addEventListener("click", function() {
    if (isMenuOpen) {
      sortMenu.classList.remove("show");
      sortDropdownBtn.classList.remove("active");
      isMenuOpen = false;
    }
  });
}

</script>

</body>
</html>
