<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String userId = request.getParameter("userId");
	String name = request.getParameter("name");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
   <title>timeline</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/wordcloud@1.1.2/src/wordcloud2.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<style>
#customPopup .smallText {
  font-size: 0.85em;   /* 글자 크기 조절 */
  color: #555;         /* 선택 사항: 약간 회색 */
}

/* 캘린더 크기 */
#calendar {
  max-width: 900px;
  margin: 0 auto;
  height: 900px;
}

/* 시간축 없애기 */
.fc-timegrid-axis {
  display: none !important;
}

.fc-dayGridWeek-view .fc-event {
    height: 70px !important;       /* 막대 높이 */
    line-height: 70px !important;  /* 텍스트 세로 중앙 정렬 */
    font-size: 18px !important;  /* 원하는 글씨 크기 */
    line-height: normal !important; /* 필요하면 세로 중앙 정렬 */
}

.fc-dayGridWeek-view {
    height: 800px !important;
    max-height: 800px !important;
}

.fc-listDay-view {
    height: 800px !important;
    max-height: 800px !important;
}

.fc-listDay-view .fc-event {
	font-size: 18px !important;  /* 원하는 글씨 크기 */
    line-height: normal !important; /* 필요하면 세로 중앙 정렬 */
}

/* 월간뷰는 기존 높이 유지 */
.fc-dayGridMonth-view {
    height: 900px !important;
}

#keywordWordCloud {
  display: block;
  width: 100%;
  height: 230px;
  
}

</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // 시계를 갱신하는 함수
    function updateClock() {
        const now = new Date();
        const options = {
            year: 'numeric',
            month: 'long',
            day: 'numeric',
            weekday: 'long',
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit',
            hour12: false
        };
        document.getElementById('realTimeClock').innerText = now.toLocaleString('ko-KR', options);
    }

    updateClock(); // 초기 실행
    setInterval(updateClock, 1000); // 1초마다 갱신
});
</script>

</head>

<body>
  <!-- 상단바 -->
<jsp:include page="../include/header.jsp"/>
	
	<!-- 브레드크럼 -->
	<div class="breadcrumb">
    <div class="container">
      <span>현재시간 ></span>
      <span id="realTimeClock"></span>
    </div>
	</div>

       <!-- 메인 컨테이너 -->
  <div class="news-container">
    <!-- 메인 콘텐츠 -->
    <main class="news-main">
      <h1 class="news-title">
	타임라인  
	 </h1>
	 
	 <div class="container">
	 <div style="padding-top: 1px">
	
      <div id="calendar">
      
      </div>
      <div id="customPopup" style="display:none; position:fixed; top:60%; left:42%; transform:translate(-50%,-50%);
      	width: 500px; height: 400px; max-width: 80%;  background-color: rgba(255, 255, 255, 0.97);
		text-align: center; padding:20px; border:1px solid #333; border-radius:10px; z-index:1000;">
		  <h3 id="popupTitle">제목</h3>
		  <p id="popupBody">내용</p>
		  
        
		  <button onclick="document.getElementById('customPopup').style.display='none'"
		  style="position: absolute; left: 20px; bottom: 20px; padding:6px 12px; background-color:#4CAF50;
		  color:white; border:none; border-radius:6px; cursor:pointer;">닫기</button>
		</div>
      
      </div>
      </div>
      </main>
   
      

 <!-- 사이드바 -->
    <aside>
      <div class="sidebar-section">
    
        <h2>많이 본 기사</h2>
       
        <ol class="rank-list">
        <c:forEach var="article" items="${viewsArticle}" varStatus="status">
        <li>
        <span class="rank-number">${status.index + 1}</span>
          <c:if test="${empty userId}">
            <a href="noArticleContent?articleId=${article.articleId}" style="font-size: 25; font-weight: bold;">${article.title}</a>
          </c:if>
          
          <c:if test="${not empty userId}">
          <a href="articleContent?articleId=${article.articleId}">${article.title}</a>
          </c:if>
          </li>
          </c:forEach>
        </ol>
      </div>
      
      <div class="sidebar-section">
      <h2>혜택 키워드 Top 7</h2>
      
       <!-- 워드클라우드가 표시될 영역 -->
  	<canvas id="keywordWordCloud" width="450" height="400"></canvas>
	</div>

      <div class="sidebar-section">
      
         <h2>포토·영상</h2>
	<div class="photo-grid">
	  <c:forEach var="article" items="${randomArticles}">
	  
	   <c:if test="${empty userId}">
	   <a href="noArticleContent?articleId=${article.articleId}">
	        <img src="<c:url value='/resources/image/' />${article.image}" 
	     alt="${article.image}" 
	     style="width: 270px; height: 190px;">
	    </a>
	   </c:if>
	  
	  <c:if test="${not empty userId}">
	    <a href="articleContent?articleId=${article.articleId}">
	        <img src="<c:url value='/resources/image/' />${article.image}" 
	     alt="${article.image}" 
	     style="width: 270px; height: 190px;">
	    </a>
	   </c:if>
	</c:forEach>
	</div>
	</div>
    </aside>
   </div>
 

  <!-- Top 버튼 -->
  <button class="top-button" id="topButton" aria-label="맨 위로 이동">
    <svg viewBox="0 0 24 24">
      <path d="M12 4l-8 8h6v8h4v-8h6z"/>
    </svg>
  </button>
   
   
 <jsp:include page="../include/footer.jsp"/>
<script>
    // Top 버튼 기능
    const topButton = document.getElementById('topButton');
    
    // 스크롤 시 버튼 표시/숨김
    window.addEventListener('scroll', function() {
      if (window.scrollY > 300) {
        topButton.classList.add('show');
      } else {
        topButton.classList.remove('show');
      }
    });
    
    // 버튼 클릭 시 맨 위로 스크롤
    topButton.addEventListener('click', function() {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    });
    
    var colors = [
        '#FF6B6B', '#FFD93D', '#6BCB77', '#4D96FF', '#FF6FF5',
        '#FF9F1C', '#00C2FF', '#845EC2', '#FFC75F', '#FF8066'
      ];
    
    var events = [
        <c:forEach var="timeline" items="${timelineListAll}" varStatus="status">
          {
            title: '${timeline.title}',
            content: '${timeline.content}',
            start: '${timeline.startDate}',
            end: '${timeline.endDate}',
            allDay: true,
            regCall: '${timeline.regCall}',
            link: '${timeline.link}',
            registrationNo: '${timeline.registrationNo}',
            backgroundColor: colors[${status.index} % colors.length],
            borderColor: colors[${status.index} % colors.length],
            textColor: 'white'
          }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
      ];
      console.log(events);

</script>

<script>

    document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      initialView: 'dayGridWeek',  
	      locale: 'ko',                 // 한국어
	      events: events,               // JSP에서 만든 데이터 주입
	      selectable: true,            // 드래그 선택 가능
	      contentHeight: '900px', // 내용 부분 높이
	      expandRows: true,  // 화면에 맞게 줄 맞춤
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridWeek,listDay,dayGridMonth'
	      },
	      allDaySlot: true,
	      slotLabelContent: function() {
    		return null;  // 시간 라벨 제거
 			},
 			
 			dayHeaderFormat: { weekday: 'short', month: 'numeric', day: 'numeric' },
	    
	      eventClick: function(info) {
	    	  document.getElementById('popupTitle').innerText = info.event.title;
	    	  document.getElementById('popupTitle').style.fontSize = '25px';
	    	
	    	var content = (info.event.extendedProps.content || "-");
	    	var start = "시작 : " + info.event.start.toLocaleDateString();
	    	var end = "종료 : " + (info.event.end ? info.event.end.toLocaleDateString() : "-");
	    	var regCall = "Call : " + (info.event.extendedProps.regCall || "-");
	    	var linkUrl = info.event.extendedProps.link;
	        var link = "link : " + (linkUrl
	        		? "<a href='" + linkUrl + "' target='_blank'>" + linkUrl + "</a>" 
	                : "-");
	        
	        var detailBtn = "";
	        
	        <c:if test="${empty userId}">
	        // 로그인 안 된 경우 → noRegistrationContent
	        detailBtn = "<br><br><button onclick=\"location.href='noRegistrationContent?registrationNo=" + info.event.extendedProps.registrationNo + "'\" " +
	                    "style='padding:6px 12px; background-color:#6c757d; color:white; border:none; border-radius:6px; cursor:pointer;'>혜택상세보기</button>";
	      </c:if>

	      <c:if test="${not empty userId}">
	        // 로그인 된 경우 → registrationContent
	        detailBtn = "<br><br><button onclick=\"location.href='registrationContent?registrationNo=" + info.event.extendedProps.registrationNo + "'\" " +
	                    "style='padding:6px 12px; background-color:#007BFF; color:white; border:none; border-radius:6px; cursor:pointer;'>혜택상세보기</button>";
	      </c:if>
	        
	        document.getElementById('popupBody').innerHTML =
	            "<p>" + content + "</p>" + "<br>" + "<span class='smallText'>" + start + "</span><br>" + "<span class='smallText'>"
	            + end + "</span><br>" + "<span class='smallText'>" + regCall + "</span><br>" + "<span class='smallText'>" + link + "</span>" + detailBtn;

	    	document.getElementById('customPopup').style.display = 'block';
	    	}
	    });
	    calendar.render();
	  });
	
</script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // topKeywords에서 단어와 count 가져오기
    const list = [
        <c:forEach var="RegKeywordDTO" items="${topKeywords}" varStatus="status">
            ["${RegKeywordDTO.regkeyword}", ${RegKeywordDTO.regcount}]<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    if (list.length === 0) return;

    WordCloud(document.getElementById('keywordWordCloud'), {
        list: list,
        gridSize: 18,
        weightFactor: function(count) {
            const min = 30, max = 65;
            const counts = list.map(item => item[1]);
            const maxCount = Math.max(...counts);
            const minCount = Math.min(...counts);
            return min + (count - minCount) / (maxCount - minCount) * (max - min);
        },
        fontFamily: 'Gowun Dodum, sans-serif',
        color: () => {
            const colors = ['#2563eb','#dc2626','#16a34a','#9333ea','#f59e0b','#0ea5e9','#ef4444'];
            return colors[Math.floor(Math.random() * colors.length)];
        },
        rotateRatio: 1, // 자유로운 회전 배치
        backgroundColor: '#fff',

        // 클릭 이벤트
        click: function(item) {
            const keyword = item[0]; // 클릭한 단어만 가져오기
            const searchType = 'tc'; // 제목+내용 검색
            const encodedKeyword = encodeURIComponent(keyword);

            // 검색 로그 저장 후 검색 페이지 이동
            $.ajax({
                url: "logKeyword",
                type: "POST",
                data: { keyword: keyword },
                complete: function() {
                    window.location.href = "registrationlistAll?page=1&perPageNum=10&searchType=" + searchType + "&keyword=" + encodedKeyword;
                }
            });
        }
    });
});
</script>

</body>
</html>
