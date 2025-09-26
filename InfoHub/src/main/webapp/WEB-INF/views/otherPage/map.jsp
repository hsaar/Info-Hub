<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>지역별 정책/혜택 지도</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Gowun+Batang:wght@700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="main.css">
</head>
<body>
  <!-- 상단바 -->
		<%@ include file="../include/header.jsp"%>
 
<!-- 탭 -->
<div class="tabs">
  <button class="tab active">맞춤정책</button>
    <button class="tab" data-type="benefit"> <a href="registrationlistAll">모아보기</a></button>
</div>
  <!-- 지도 컨테이너 -->
  <section class="map-main-container">
    <!-- 왼쪽 섹션: 지도 및 필터 -->
    <div class="map-left-section">
      <!-- 카테고리 필터 버튼 -->
      <div class="filter-buttons" id="catGroup" aria-label="카테고리 선택" role="group">
        <button class="filter-btn" data-cat="finance">금융</button>
        <button class="filter-btn" data-cat="realestate">부동산</button>
        <button class="filter-btn" data-cat="job">취업</button>
        <button class="filter-btn" data-cat="welfare">복지</button>
        <button class="filter-btn" data-cat="edu">교육</button>
      </div>

      <div class="map-area" id="mapArea">
        <!-- SVG 지도가 여기에 동적으로 삽입됩니다 -->
        <div id="koreaMapMount" class="korea-map" aria-label="대한민국 지도"></div>

        <!-- 지역 정보 표시 패널 -->
        <div class="region-info" id="regionInfo" style="display: none;">
          <div class="region-label">
            <div class="region-dot"></div>
            <span class="region-name" id="regionName">지역명</span>
          </div>
        </div>

        <!-- 전체지역 버튼 -->
        <button type="button" class="filter-btn" style="position:absolute;left:10px;bottom:10px" id="nationwide">
          전체지역
        </button>
      </div>

      <p class="map-help-text">지역을 클릭하여 선택하고, 카테고리를 선택하여 정책/혜택을 필터링할 수 있습니다. 마우스를 올리면 지역명이 표시됩니다.</p>
    </div>

    <!-- 오른쪽 섹션: 검색 결과 -->
    <div class="map-right-section">
      <div class="search-result-panel">
        <h3 class="result-title">선택된 지역</h3>
        
        <div class="selected-regions" id="selectedRegions">
          <p class="result-help-text">지역을 선택해주세요</p>
        </div>

        <div class="result-search-box">
          <input type="text" class="result-search-input" placeholder="정책/혜택 검색..." id="searchInput">
          <span class="search-icon-small">🔍</span>
        </div>

        <div class="result-list-header">
          <h4>검색 결과</h4>
        </div>

        <ul class="result-list" id="resultList">
          <li class="result-item">지역과 카테고리를 선택하면 관련 정책/혜택이 표시됩니다.</li>
        </ul>

        <div class="result-pagination" id="resultPagination">
          총 0개 결과
        </div>
      </div>
    </div>
  </section>

  <!-- regions.js 스크립트 포함 -->
  <script src="regions.js"></script>

  <script>
    // ---- 전역 변수 ----
    let hoveredRegion = null;
    const selectedRegions = new Set();
    const selectedCats = new Set();
    
    // DOM 요소 참조
    const MOUNT = document.getElementById('koreaMapMount');
    const regionInfo = document.getElementById('regionInfo');
    const regionName = document.getElementById('regionName');
    const selectedRegionsDisplay = document.getElementById('selectedRegions');
    const resultList = document.getElementById('resultList');
    const resultPagination = document.getElementById('resultPagination');

    // ---- 1) 카테고리 멀티 선택 ----
    document.getElementById('catGroup').addEventListener('click', (e) => {
      const btn = e.target.closest('.filter-btn');
      if (!btn || !btn.dataset.cat) return;
      
      const key = btn.dataset.cat;
      btn.classList.toggle('active');
      
      if (btn.classList.contains('active')) {
        selectedCats.add(key);
      } else {
        selectedCats.delete(key);
      }
      
      updateResults();
    });

    // ---- 2) SVG 지도 로드 및 인터랙션 설정 ----
    function loadMap() {
      // 실제 환경에서는 외부 SVG 파일을 로드
      // fetch('assets/korea-map.svg')
      
      // 개발용: 임시 SVG 생성
      const svgContent = createTempSVG();
      MOUNT.innerHTML = svgContent;
      
      setupMapInteractions();
    }

    // 임시 SVG 생성 (실제로는 korea-map.svg 파일에서 로드)
    function createTempSVG() {
      if (typeof window.regions === 'undefined') {
        return '<p style="color:#dc2626">regions.js 파일을 로드할 수 없습니다.</p>';
      }
      
      let paths = '';
      window.regions.forEach(region => {
        // 실제 path 데이터 대신 임시 직사각형 생성
        const x = Math.random() * 600 + 50;
        const y = Math.random() * 400 + 50;
        paths += `<rect id="${region.id}" x="${x}" y="${y}" width="80" height="60" rx="5" data-region="${region.id}" class="region" />`;
      });
      
      return `<svg class="korea-map" viewBox="0 0 800 600" xmlns="http://www.w3.org/2000/svg">${paths}</svg>`;
    }

    // 지도 인터랙션 설정
    function setupMapInteractions() {
      const regions = MOUNT.querySelectorAll('[data-region]');
      
      regions.forEach(region => {
        const regionId = region.dataset.region;
        const regionData = window.getRegionById(regionId);
        
        if (!regionData) return;
        
        // 접근성 속성 설정
        region.setAttribute('tabindex', '0');
        region.setAttribute('role', 'button');
        region.setAttribute('aria-label', `${regionData.koreanName} 선택`);
        
        // 마우스 이벤트
        region.addEventListener('mouseenter', (e) => handleMouseEnter(e, regionId));
        region.addEventListener('mouseleave', handleMouseLeave);
        region.addEventListener('click', () => handleRegionClick(regionId));
        
        // 키보드 이벤트
        region.addEventListener('keydown', (e) => {
          if (e.key === 'Enter' || e.key === ' ') {
            e.preventDefault();
            handleRegionClick(regionId);
          }
        });
      });
    }

    // ---- 3) 이벤트 핸들러 ----
    function handleMouseEnter(event, regionId) {
      hoveredRegion = regionId;
      const regionData = window.getRegionById(regionId);
      
      if (regionData) {
        // 지역 정보 패널 표시
        regionName.textContent = regionData.koreanName;
        regionInfo.style.display = 'flex';
        
        // hover 스타일 적용
        event.target.classList.add('hovered');
      }
    }

    function handleMouseLeave(event) {
      hoveredRegion = null;
      regionInfo.style.display = 'none';
      event.target.classList.remove('hovered');
    }

    function handleRegionClick(regionId) {
      const regionData = window.getRegionById(regionId);
      if (!regionData) return;
      
      const regionElement = MOUNT.querySelector(`[data-region="${regionId}"]`);
      if (!regionElement) return;
      
      // 선택 상태 토글
      const isSelected = selectedRegions.has(regionId);
      
      if (isSelected) {
        selectedRegions.delete(regionId);
        regionElement.classList.remove('selected');
        regionElement.setAttribute('aria-label', `${regionData.koreanName} 선택`);
      } else {
        selectedRegions.add(regionId);
        regionElement.classList.add('selected');
        regionElement.setAttribute('aria-label', `${regionData.koreanName} 선택 해제`);
      }
      
      updateSelectedRegionsDisplay();
      updateResults();
    }

    // ---- 4) UI 업데이트 함수 ----
    function updateSelectedRegionsDisplay() {
      if (selectedRegions.size === 0) {
        selectedRegionsDisplay.innerHTML = '<p class="result-help-text">지역을 선택해주세요</p>';
        return;
      }
      
      const regionTags = Array.from(selectedRegions).map(regionId => {
        const regionData = window.getRegionById(regionId);
        return regionData ? 
          `<span class="region-tag">${regionData.koreanName} <button class="region-remove" data-region="${regionId}">×</button></span>` : 
          '';
      }).join('');
      
      selectedRegionsDisplay.innerHTML = regionTags;
      
      // 지역 제거 버튼 이벤트 설정
      selectedRegionsDisplay.querySelectorAll('.region-remove').forEach(btn => {
        btn.addEventListener('click', () => {
          const regionId = btn.dataset.region;
          handleRegionClick(regionId); // 동일한 로직 재사용
        });
      });
    }

    function updateResults() {
      const selectedRegionsList = Array.from(selectedRegions);
      const selectedCatsList = Array.from(selectedCats);
      
      // 실제로는 서버에서 데이터를 가져와야 함
      const mockResults = generateMockResults(selectedRegionsList, selectedCatsList);
      
      if (mockResults.length === 0) {
        resultList.innerHTML = '<li class="result-item">선택한 조건에 맞는 정책/혜택이 없습니다.</li>';
        resultPagination.textContent = '총 0개 결과';
      } else {
        resultList.innerHTML = mockResults.map(result => 
          `<li class="result-item">${result}</li>`
        ).join('');
        resultPagination.textContent = `총 ${mockResults.length}개 결과`;
      }
    }

    function generateMockResults(regions, cats) {
      if (regions.length === 0 && cats.length === 0) {
        return [];
      }
      
      const results = [];
      
      if (regions.length > 0) {
        regions.forEach(regionId => {
          const regionData = window.getRegionById(regionId);
          if (regionData) {
            results.push(`${regionData.koreanName} 청년 주택 지원`);
            results.push(`${regionData.koreanName} 창업 지원 프로그램`);
          }
        });
      }
      
      if (cats.length > 0) {
        cats.forEach(cat => {
          const catNames = {
            finance: '금융', realestate: '부동산', job: '취업', 
            welfare: '복지', edu: '교육'
          };
          results.push(`${catNames[cat]} 관련 정책 1`);
          results.push(`${catNames[cat]} 관련 혜택 2`);
        });
      }
      
      return results.slice(0, 10); // 최대 10개만 표시
    }

    // ---- 5) 전체지역 해제 ----
    document.getElementById('nationwide').addEventListener('click', () => {
      // 모든 선택된 지역 해제
      MOUNT.querySelectorAll('.region.selected').forEach(el => {
        el.classList.remove('selected');
        const regionId = el.dataset.region;
        const regionData = window.getRegionById(regionId);
        if (regionData) {
          el.setAttribute('aria-label', `${regionData.koreanName} 선택`);
        }
      });
      selectedRegions.clear();
      updateSelectedRegionsDisplay();
      updateResults();
    });

    // ---- 6) 검색 기능 ----
    document.getElementById('searchInput').addEventListener('input', (e) => {
      const query = e.target.value.toLowerCase().trim();
      if (query.length < 2) return;
      
      // 실제로는 서버에서 검색을 수행해야 함
      console.log('검색어:', query);
      // 검색 로직 구현...
    });

    // ---- 7) 초기화 ----
    document.addEventListener('DOMContentLoaded', () => {
      loadMap();
    });

    // ---- 8) 파라미터 빌드 함수 (서버 통신용) ----
    function buildSearchParams() {
      return {
        regions: Array.from(selectedRegions),
        categories: Array.from(selectedCats),
        query: document.getElementById('searchInput').value.trim()
      };
    }

    // 사용 예시:
    // fetch('/api/search', {
    //   method: 'POST',
    //   headers: { 'Content-Type': 'application/json' },
    //   body: JSON.stringify(buildSearchParams())
    // });
  </script>
</body>
</html>