<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94d8864bb37a5cec084e603dd70aa0f9&libraries=services"></script>
</head>
<body>

<!-- 여기에 상단바 include -->
<%@ include file="../include/header.jsp" %> 

<!-- 메인 컨테이너 -->
<div class="map-main-container">
  <!-- 왼쪽: 지도 영역 -->
  <div class="map-left-section">
    <h2 class="page-title">지역별 정책 찾기</h2>
    <p class="eyebrow">지도에서 지역을 선택하면 해당 지역의 정책을 확인할 수 있습니다</p>
    
   
    
    <!-- 카카오맵 영역 -->
    <div class="map-area">
      <div id="map" style="width:100%; height:500px;"></div>
    </div>
    
    <p class="map-help-text">지도를 클릭하여 지역별 정책과 혜택을 확인하세요</p>
  </div>

  <!-- 오른쪽: 검색 결과 패널 -->
  <div class="map-right-section">
    <div class="search-result-panel">
      <h3 class="result-title">검색 결과</h3>
      
      <!-- 검색창 -->
      <div class="result-search-box">
        <input type="text" class="result-search-input" placeholder="정책명 검색">
        <span class="search-icon-small">🔍</span>
      </div>
      
      <!-- 결과 목록 헤더 -->
      <div class="result-list-header">
        <h4>서울특별시 (10건)</h4>
      </div>
      
      <!-- 결과 목록 -->
      <ul class="result-list">
        <li class="result-item">청년 주거 지원 사업</li>
        <li class="result-item">창업 지원금 신청</li>
        <li class="result-item">취업 성공 패키지</li>
        <li class="result-item">교육비 지원 프로그램</li>
        <li class="result-item">문화 활동 바우처</li>
        <li class="result-item">청년 주거 지원 사업</li>
        <li class="result-item">창업 지원금 신청</li>
        <li class="result-item">취업 성공 패키지</li>
      </ul>
      
      <!-- 페이지네이션 -->
      <div class="result-pagination">
        1 / 3 페이지
      </div>
      
      <!-- 안내 텍스트 -->
      <p class="result-help-text">
        지도에서 지역을 선택하시거나<br>
        검색창에 정책명을 입력하세요
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

      // 마우스 오버 이벤트 - 즉시 반응
      kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
        if (currentPolygon !== polygon) {
          polygon.setOptions({
            fillColor: '#93c5fd',
            fillOpacity: 0.6
          });
        }
        
        var content = '<div style="padding:8px 12px; background:#fff; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,0.1); border:2px solid #0B50D0;">';
        content += '<div style="font-weight:700; color:#0B50D0; font-size:14px;">' + name + '</div>';
        content += '</div>';
        
        customOverlay.setContent(content);
        customOverlay.setPosition(mouseEvent.latLng);
        customOverlay.setMap(map);
      });

      // 마우스 아웃 이벤트 - 즉시 반응
      kakao.maps.event.addListener(polygon, 'mouseout', function() {
        if (currentPolygon !== polygon) {
          polygon.setOptions({
            fillColor: '#fff',
            fillOpacity: 0.7
          });
        }
        customOverlay.setMap(null);
      });
   
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
        
        currentPolygon = polygon;
        
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

    // 검색 결과 업데이트 함수
    function updateSearchResults(regionName) {
      var header = document.querySelector('.result-list-header h4');
      if (header) {
        header.textContent = regionName + ' (10건)';
        header.style.transition = 'color 0.2s';
        header.style.color = '#0B50D0';
        setTimeout(function() {
          header.style.color = '';
        }, 500);
      }
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
</script>

</body>
</html>