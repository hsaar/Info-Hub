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

<style>
#customPopup .smallText {
  font-size: 0.85em;   /* 글자 크기 조절 */
  color: #555;         /* 선택 사항: 약간 회색 */
}

/* 캘린더 크기 */
#calendar {
  max-width: 1200px;
  margin: 0 auto;
  height: 850px;
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
    height: 550px !important;
    max-height: 550px !important;
}

.fc-listDay-view {
    height: 550px !important;
    max-height: 550px !important;
}

.fc-listDay-view .fc-event {
	font-size: 18px !important;  /* 원하는 글씨 크기 */
    line-height: normal !important; /* 필요하면 세로 중앙 정렬 */
}

/* 월간뷰는 기존 높이 유지 */
.fc-dayGridMonth-view {
    height: 850px !important;
}


</style>

</head>
<body>
  <!-- 상단바 -->
<jsp:include page="../include/header.jsp"/>

<!-- 네비게이션 -->
  	<div class="news-header">
    <nav class="news-nav">
      <a href="articleListAll" class="active">종합</a>
      <a href="articleListAll1">부동산</a>
      <a href="articleListAll2">주식</a>
      <a href="articleListAll3">적금</a>
      <a href="articleListAll4">복지</a>
      <a href="articleListAll5">창업</a>
      <a href="#">기타</a>
    </nav>
	</div>
	
	<!-- 브레드크럼 -->
	<div class="breadcrumb">
    <div class="container">
      <a href="#">공지사항</a>
      <span>></span>
      <span>2025년 3/4분기 입회심사 결과</span>
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
      <h2>키워드</h2>
      <c:forEach var="article" items="${keywordArticle}">
      
       <c:if test="${empty userId}">
            <a href="noArticleContent?articleId=${article.articleId}" style="font-size: 25; font-weight: bold;"> ${article.keyword}</a>
          </c:if>
          
          <c:if test="${not empty userId}">
          <a href="articleContent?articleId=${article.articleId}"> ${article.keyword}</a>
          </c:if>
       
      </c:forEach>
      </div>

      <div class="sidebar-section">
      <%
      Random random = new Random();
      
      Set<Integer> set = new HashSet<>();
     
      while(set.size()<2){
    	  Double d = Math.random()*50+1;
    	  set.add(d.intValue());
    	}
     
      List<Integer> list = new ArrayList<>(set);
      
      int number1 = list.get(0);
      int number2 = list.get(1);
      %>
      
        <h2>포토·영상</h2>
        <div class="photo-grid">
          <div>
          <c:if test="${empty userId}">
            <a href="noArticleContent?articleId=<%=number1+1%>"><img src="resources/image/image_<%=number1%>.jpg" style=" width: 270px; height: 180px;"></a>
          </c:if>
          
          <c:if test="${not empty userId}">
          <a href="articleContent?articleId=<%=number1+1%>"><img src="resources/image/image_<%=number1%>.jpg" style=" width: 270px; height: 180px;"></a>
          </c:if>
      	  </div>
      	 
         <div>
          <c:if test="${empty userId}">
            <a href="noArticleContent?articleId=<%=number2+1%>"><img src="resources/image/image_<%=number2%>.jpg" style=" width: 270px; height: 180px;"></a>
          </c:if>
          
          <c:if test="${not empty userId}">
          <a href="articleContent?articleId=<%=number2+1%>"><img src="resources/image/image_<%=number2%>.jpg" style=" width: 270px; height: 180px;"></a>
          </c:if>
      	  </div>
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
   
   
  <footer class="container" style="text-align: center; padding: 40px 0; color: #6b7280;">
    © 2025 누림 — Mist Blue Theme
  </footer>
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
            call: '${timeline.call}',
            link: '${timeline.link}',
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
	      contentHeight: '800px', // 내용 부분 높이
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
	    	var call = "call : " + (info.event.extendedProps.call || "-");
	    	var linkUrl = info.event.extendedProps.link;
	        var link = "link : " + (linkUrl
	        		? "<a href='https://" + linkUrl + "' target='_blank'>" + linkUrl + "</a>" 
	                : "-");
	        
	        document.getElementById('popupBody').innerHTML =
	            "<p>" + content + "</p>" + "<br>" + "<span class='smallText'>" + start + "</span><br>" + "<span class='smallText'>"
	            + end + "</span><br>" + "<span class='smallText'>" + call + "</span><br>" + "<span class='smallText'>" + link + "</span>";

	    	document.getElementById('customPopup').style.display = 'block';
	    	}
	    });
	    calendar.render();
	  });
	
</script> 
</body>
</html>
