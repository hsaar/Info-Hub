<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>키워드 알림 달력</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/calendar.css' />">
</head>
<body>
<%@ include file="../include/header.jsp"%>
<div class="calendar-container">
  <!-- 왼쪽 키워드 알림 카드들 -->
  <div class="keyword-cards">
    <div class="keyword-card highlight">
      <div class="keyword-card-header">
        <div class="keyword-icon">🔥</div>
        <div class="keyword-info">
          <h3>신청한 혜택 1</h3>
          <p>신청 마감이 다가오고 있어요</p>
        </div>
      </div>
      <div class="keyword-content">
        <h4>청년 주거 지원 사업</h4>
        <p>신청한 혜택 내용 1 신청한 혜택 내용 1 신청한 혜택 내용 1 신청한 혜택 내용 1</p>
      </div>
      <div class="keyword-actions">
        <button class="btn btn-primary">자세히 보기</button>
        <button class="btn btn-secondary">알림 해제</button>
      </div>
    </div>

    <div class="keyword-card">
      <div class="keyword-card-header">
        <div class="keyword-icon">💰</div>
        <div class="keyword-info">
          <h3>신청한 혜택 2</h3>
          <p>진행 상황을 확인해보세요</p>
        </div>
      </div>
      <div class="keyword-content">
        <h4>취업 지원금 신청</h4>
        <p>신청한 혜택 내용 2 신청한 혜택 내용 2 신청한 혜택 내용 2 신청한 혜택 내용 2</p>
      </div>
      <div class="keyword-actions">
        <button class="btn btn-primary">확인하기</button>
        <button class="btn btn-secondary">나중에</button>
      </div>
    </div>

    <div class="keyword-card">
      <div class="keyword-card-header">
        <div class="keyword-icon">🎓</div>
        <div class="keyword-info">
          <h3>신청한 혜택 3</h3>
          <p>서류 보완이 필요합니다</p>
        </div>
      </div>
      <div class="keyword-content">
        <h4>교육비 지원 프로그램</h4>
        <p>신청한 혜택 내용 3 신청한 혜택 내용 3 신청한 혜택 내용 3 신청한 혜택 내용 3</p>
      </div>
      <div class="keyword-actions">
        <button class="btn btn-primary">서류 제출</button>
        <button class="btn btn-secondary">연기</button>
      </div>
    </div>
  </div>

  <!-- 오른쪽 달력 위젯 -->
  <div class="calendar-widget">
    <div class="calendar-header">
      <div class="calendar-title">신청한 혜택 수정하기</div>
      <div class="calendar-nav">
        <button class="nav-btn" onclick="changeMonth(-1)">‹</button>
        <h2 class="month-year" id="monthYear">2025년 9월</h2>
        <button class="nav-btn" onclick="changeMonth(1)">›</button>
      </div>
    </div>

    <div class="calendar-grid">
      <div class="day-header">일</div>
      <div class="day-header">월</div>
      <div class="day-header">화</div>
      <div class="day-header">수</div>
      <div class="day-header">목</div>
      <div class="day-header">금</div>
      <div class="day-header">토</div>
      
      <div class="day-cell other-month" onclick="selectDate(this, 31, false)">31</div>
      <div class="day-cell has-keyword" onclick="selectDate(this, 1, true)">1</div>
      <div class="day-cell" onclick="selectDate(this, 2, false)">2</div>
      <div class="day-cell" onclick="selectDate(this, 3, false)">3</div>
      <div class="day-cell" onclick="selectDate(this, 4, false)">4</div>
      <div class="day-cell has-keyword" onclick="selectDate(this, 5, true)">5</div>
      <div class="day-cell" onclick="selectDate(this, 6, false)">6</div>
      
      <div class="day-cell" onclick="selectDate(this, 7, false)">7</div>
      <div class="day-cell" onclick="selectDate(this, 8, false)">8</div>
      <div class="day-cell" onclick="selectDate(this, 9, false)">9</div>
      <div class="day-cell has-keyword" onclick="selectDate(this, 10, true)">10</div>
      <div class="day-cell" onclick="selectDate(this, 11, false)">11</div>
      <div class="day-cell" onclick="selectDate(this, 12, false)">12</div>
      <div class="day-cell" onclick="selectDate(this, 13, false)">13</div>
      
      <div class="day-cell" onclick="selectDate(this, 14, false)">14</div>
      <div class="day-cell has-keyword" onclick="selectDate(this, 15, true)">15</div>
      <div class="day-cell" onclick="selectDate(this, 16, false)">16</div>
      <div class="day-cell" onclick="selectDate(this, 17, false)">17</div>
      <div class="day-cell" onclick="selectDate(this, 18, false)">18</div>
      <div class="day-cell" onclick="selectDate(this, 19, false)">19</div>
      <div class="day-cell" onclick="selectDate(this, 20, false)">20</div>
      
      <div class="day-cell" onclick="selectDate(this, 21, false)">21</div>
      <div class="day-cell" onclick="selectDate(this, 22, false)">22</div>
      <div class="day-cell" onclick="selectDate(this, 23, false)">23</div>
      <div class="day-cell" onclick="selectDate(this, 24, false)">24</div>
      <div class="day-cell today" onclick="selectDate(this, 25, true)">25</div>
      <div class="day-cell" onclick="selectDate(this, 26, false)">26</div>
      <div class="day-cell" onclick="selectDate(this, 27, false)">27</div>
      
      <div class="day-cell" onclick="selectDate(this, 28, false)">28</div>
      <div class="day-cell" onclick="selectDate(this, 29, false)">29</div>
      <div class="day-cell has-keyword" onclick="selectDate(this, 30, true)">30</div>
      <div class="day-cell other-month" onclick="selectDate(this, 1, false)">1</div>
      <div class="day-cell other-month" onclick="selectDate(this, 2, false)">2</div>
      <div class="day-cell other-month" onclick="selectDate(this, 3, false)">3</div>
      <div class="day-cell other-month" onclick="selectDate(this, 4, false)">4</div>
    </div>

    <div class="calendar-footer">
      <div class="legend">
        <div class="legend-item">
          <span class="dot urgent"></span>
          <span>마감임박</span>
        </div>
        <div class="legend-item">
          <span class="dot normal"></span>
          <span>일반일정</span>
        </div>
      </div>
      <div class="today-summary">
        <div class="summary-icon">✨</div>
        <div class="summary-text">오늘의 중요 일정 3개</div>
      </div>
    </div>
  </div>
</div>

<!-- 스케줄 패널 -->
<div class="schedule-panel" id="schedulePanel">
  <div class="schedule-header">
    <h3 id="selectedDate">날짜를 선택하세요</h3>
    <button class="close-schedule" onclick="closeSchedule()">×</button>
  </div>
  <div class="schedule-content" id="scheduleContent">
    <div class="no-schedule">
      <div class="no-schedule-icon">📅</div>
      <p>선택한 날짜를 클릭하면 일정이 표시됩니다</p>
    </div>
  </div>
</div>

<script>
let currentMonth = 8; // 9월 (0-based)
let currentYear = 2025;

const monthNames = [
  '1월', '2월', '3월', '4월', '5월', '6월',
  '7월', '8월', '9월', '10월', '11월', '12월'
];

// 샘플 스케줄 데이터
const scheduleData = {
  1: [
    { title: '청년 주거 지원 신청 마감', type: 'urgent', time: '18:00' },
    { title: '취업 지원 프로그램 면접', type: 'normal', time: '14:00' }
  ],
  5: [
    { title: '교육비 지원 서류 제출', type: 'normal', time: '09:00' }
  ],
  10: [
    { title: '주택 청약 통장 신청 마감', type: 'urgent', time: '23:59' }
  ],
  15: [
    { title: '창업 지원 설명회', type: 'normal', time: '15:00' },
    { title: '멘토링 프로그램 신청', type: 'normal', time: '10:00' }
  ],
  25: [
    { title: '취업 박람회', type: 'urgent', time: '10:00' },
    { title: '장학금 신청 마감', type: 'normal', time: '17:00' },
    { title: '진로 상담', type: 'normal', time: '13:30' }
  ],
  30: [
    { title: '인턴십 프로그램 마감', type: 'urgent', time: '18:00' }
  ]
};

function changeMonth(direction) {
  currentMonth += direction;
  
  if (currentMonth > 11) {
    currentMonth = 0;
    currentYear++;
  } else if (currentMonth < 0) {
    currentMonth = 11;
    currentYear--;
  }
  
  updateCalendar();
}

function updateCalendar() {
  const monthYearElement = document.getElementById('monthYear');
  monthYearElement.textContent = currentYear + '년 ' + monthNames[currentMonth];
}

function selectDate(element, day, hasEvents) {
  // 이전 선택 제거
  document.querySelectorAll('.day-cell').forEach(cell => {
    cell.classList.remove('selected');
  });
  
  // 새로 선택된 날짜에 스타일 적용
  element.classList.add('selected');
  
  // 스케줄 패널 표시
  showSchedule(day, hasEvents);
}

function showSchedule(day, hasEvents) {
  const schedulePanel = document.getElementById('schedulePanel');
  const selectedDateEl = document.getElementById('selectedDate');
  const scheduleContent = document.getElementById('scheduleContent');
  
  // 선택된 날짜 표시
  selectedDateEl.innerHTML = `
    <span class="date-number">${day}</span>
    <span class="date-info">${currentYear}년 ${monthNames[currentMonth]}</span>
  `;
  
  // 스케줄 내용 표시
  const daySchedule = scheduleData[day];
  
  if (daySchedule && daySchedule.length > 0) {
    let scheduleHtml = '<div class="schedule-list">';
    
    daySchedule.forEach(item => {
      const urgentClass = item.type === 'urgent' ? 'urgent' : '';
      const icon = item.type === 'urgent' ? '🔥' : '📋';
      
      scheduleHtml += `
        <div class="schedule-item ${urgentClass}">
          <div class="schedule-item-header">
            <div class="schedule-icon">${icon}</div>
            <div class="schedule-details">
              <div class="schedule-title">${item.title}</div>
              <div class="schedule-time">${item.time}</div>
            </div>
          </div>
          <div class="schedule-actions">
            <button class="schedule-btn primary">확인</button>
            <button class="schedule-btn secondary">수정</button>
          </div>
        </div>
      `;
    });
    
    scheduleHtml += '</div>';
    scheduleContent.innerHTML = scheduleHtml;
  } else {
    scheduleContent.innerHTML = `
      <div class="no-schedule">
        <div class="no-schedule-icon">📅</div>
        <p>이 날짜에는 등록된 일정이 없습니다</p>
        <button class="add-schedule-btn" onclick="addSchedule()">일정 추가</button>
      </div>
    `;
  }
  
  // 스케줄 패널 표시
  schedulePanel.classList.add('show');
}

function closeSchedule() {
  const schedulePanel = document.getElementById('schedulePanel');
  schedulePanel.classList.remove('show');
  
  // 선택된 날짜 스타일 제거
  document.querySelectorAll('.day-cell').forEach(cell => {
    cell.classList.remove('selected');
  });
}

function addSchedule() {
  alert('일정 추가 기능을 구현하세요!');
}

// 키워드 카드 클릭 이벤트
document.querySelectorAll('.keyword-card').forEach(card => {
  card.addEventListener('click', function(e) {
    if (e.target.tagName !== 'BUTTON') {
      this.classList.toggle('highlight');
    }
  });
});

// 버튼 클릭 이벤트
document.addEventListener('click', function(e) {
  if (e.target.classList.contains('btn')) {
    e.stopPropagation();
    console.log(e.target.textContent + ' 버튼 클릭됨');
  }
  
  if (e.target.classList.contains('schedule-btn')) {
    e.stopPropagation();
    console.log(e.target.textContent + ' 스케줄 버튼 클릭됨');
  }
});

// 스케줄 패널 외부 클릭 시 닫기
document.addEventListener('click', function(e) {
  const schedulePanel = document.getElementById('schedulePanel');
  const calendarWidget = document.querySelector('.calendar-widget');
  
  if (schedulePanel.classList.contains('show') && 
      !schedulePanel.contains(e.target) && 
      !calendarWidget.contains(e.target)) {
    closeSchedule();
  }
});

// 페이지 로드 시 오늘 날짜 자동 선택
document.addEventListener('DOMContentLoaded', function() {
  const todayCell = document.querySelector('.day-cell.today');
  if (todayCell) {
    setTimeout(() => {
      selectDate(todayCell, 25, true);
    }, 500);
  }
});

// ESC 키로 스케줄 패널 닫기
document.addEventListener('keydown', function(e) {
  if (e.key === 'Escape') {
    const schedulePanel = document.getElementById('schedulePanel');
    if (schedulePanel.classList.contains('show')) {
      closeSchedule();
    }
  }
});
</script>

</body>
</html>