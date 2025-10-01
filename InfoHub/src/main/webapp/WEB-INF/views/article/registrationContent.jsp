<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String userId = (String) session.getAttribute("userId");
	Integer loginNoObj = (Integer) session.getAttribute("loginNo");
	int loginNo = (loginNoObj != null) ? loginNoObj.intValue() : 0;
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>혜택 상세보기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	scrapsCheck();
	
	$("#scrapBtn").click(function(){
		var registrationNo = $("#registrationNo").val();
		var loginNo = ${loginNo};
   		
   		if(loginNo == 0) {
   			alert("로그인이 필요합니다.");
   			return;
   		}
   		
   		$.ajax({
			url: "scrap",
			data: {
        		"registrationNo" : registrationNo,
        		"loginNo" : loginNo
        	},
			type: "post",
			dataType: "json",
			success: function(scrap){
				if(scrap==0){
					alert("스크랩완료");
					$("#scrapBtn").html('★ <span>스크랩</span>');
				}else if(scrap==1){
					alert("스크랩취소");
					$("#scrapBtn").html('☆ <span>스크랩</span>');
				}
			},
			error : function(){
                alert("스크랩 에러");
            }
		});
	});
	
	function scrapsCheck(){
		var registrationNo = $("#registrationNo").val();
		var loginNo = ${loginNo};
		
		if(loginNo == 0) return;
   		
   	  	$.ajax({
        	url : "scrapsCheck",
          	data : {
   				"registrationNo" : registrationNo,
        		"loginNo" : loginNo
        	},
          	dataType : "json",
          	type : "post",
            success : function(result){
                 if(result.length < 1){
                	$("#scrapBtn").html('☆ <span>스크랩</span>');
                 } else {
                	$("#scrapBtn").html('★ <span>스크랩</span>');
                 }
             },
             error : function(data){
                console.log("스크랩 체크 에러", data);
             }
       });
   	}
	
	$('.benefit-tab-btn').click(function(){
		$('.benefit-tab-btn').removeClass('active');
		$(this).addClass('active');
		
		var tabId = $(this).data('tab');
		$('.benefit-tab-panel').removeClass('active');
		$('#' + tabId).addClass('active');
	});
});
</script>
</head>
<body class="benefit-detail-page">

<jsp:include page="../include/header.jsp"/>

<c:forEach var="registration" items="${registrationContent}">
	<input type="hidden" name="registrationNo" id="registrationNo" value="${registration.registrationNo}">
	
	<!-- Hero 영역 -->
	<div class="benefit-hero">
		<div class="container">
			<span class="benefit-badge">중앙부처</span>
			<h1>${registration.title}</h1>
			<p class="benefit-hero-desc">
				금격한 기술발전에 적응하고 노동시장 변화에 대응하는 사회안전망 차원에서 생애에 걸친 역량개발 향상 등을 위해 국민 스스로 직업능력개발훈련을 실시할 수 있도록 훈련비 등 지원
			</p>
			<c:if test="${not empty registration.link}">
				<a href="https://${registration.link}" target="_blank" class="benefit-link-btn">
					타사이트 이동 →
				</a>
			</c:if>
		</div>
	</div>
	
	<!-- 탭 네비게이션 -->
	<div class="benefit-tabs-nav">
		<div class="container">
			<button class="benefit-tab-btn active" data-tab="main">주요내용</button>
			<button class="benefit-tab-btn" data-tab="target">지원대상</button>
			<button class="benefit-tab-btn" data-tab="apply">지원내용</button>
			<button class="benefit-tab-btn" data-tab="method">신청방법</button>
			<button class="benefit-tab-btn" data-tab="contact">접수/문의</button>
		</div>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div class="benefit-content-area">
		<!-- 주요내용 탭 -->
		<div id="main" class="benefit-tab-panel active">
			<div class="benefit-info-section">
				<h2 class="benefit-info-title">
					<span class="benefit-info-title-icon">📅</span>
					신청기간
				</h2>
				<div class="benefit-info-content">상시신청</div>
			</div>
			
			<div class="benefit-info-section">
				<h2 class="benefit-info-title">
					<span class="benefit-info-title-icon">📞</span>
					전화문의
				</h2>
				<div class="benefit-info-content">
					고용노동부 고객상담센터 (1350)
				</div>
			</div>
			
			<div class="benefit-info-section">
				<h2 class="benefit-info-title">
					<span class="benefit-info-title-icon">🙋</span>
					신청방법
				</h2>
				<div class="benefit-info-content">기간 내 고용센터를 방문하거나 고용24를 통해 신청</div>
			</div>
			
			<div class="benefit-info-section">
				<h2 class="benefit-info-title">
					<span class="benefit-info-title-icon">🏢</span>
					접수기관
				</h2>
				<div class="benefit-info-content">고용노동부 각 지역 관할 고용센터 및 고객상담센터</div>
			</div>
			
			<div class="benefit-info-section">
				<h2 class="benefit-info-title">
					<span class="benefit-info-title-icon">🌐</span>
					지원형태
				</h2>
				<div class="benefit-info-content">서비스(일자리)</div>
			</div>
			
			<div class="benefit-info-section">
				<h2 class="benefit-info-title">
					<span class="benefit-info-title-icon">📄</span>
					제공근거
				</h2>
				<div class="benefit-info-content">
					[법령] 국민 평생 직업능력 개발법(제12조)<br>
					[법령] 국민 평생 직업능력 개발법(제16조)
				</div>
			</div>
		</div>
		
		<!-- 지원대상 탭 -->
		<div id="target" class="benefit-tab-panel">
			<div class="benefit-info-section">
				<h2 class="benefit-info-title">
					<span class="benefit-info-title-icon">😊</span>
					지원대상
				</h2>
				<ul class="benefit-info-list">
					<li>국민 누구나</li>
				</ul>
			</div>
			
			<div class="benefit-info-section">
				<h2 class="benefit-info-title">
					<span class="benefit-info-title-icon">ⓘ</span>
					시민 제외 대상
				</h2>
				<ul class="benefit-info-list">
					<li>공무원, 사립학교 교직원</li>
					<li>졸업예정자 우수인력의 것만 초과하여 낮은 대학생 및 졸업예정자가 하는 고등학생</li>
					<li>앞 해당 4학위 이상의 자유인자</li>
					<li>한 달급 3000만원 이상인 대규모기업 근로자(만 45세 미만)</li>
					<li>월 소득 5000만원 이상인 특수형태근로종사자 등</li>
					<li>만 75세 이상자 등</li>
				</ul>
			</div>
			
			<div class="benefit-detail-box">
				<strong>선정기준</strong>
				<p>◯ 직업훈련, 무급 등 수준, 시설일의 돈야, 직업훈련 경험 등 직업훈련의 필요성에 대해 우선선택이 작업하여 재외자를 설명하고, 1 경과 문의 향수식이 인정한 경우</p>
				<p>- 항후서로 문의하는층 수증 용도 사증 결정에서 개인할 부 있음</p>
				<p>◯ 향상한 장종 제외자는 제지 발행에서 시발종사법은 재산제공업완 사례에업 수 있음</p>
			</div>
		</div>
		
		<!-- 지원내용 탭 -->
		<div id="apply" class="benefit-tab-panel">
			<div class="benefit-info-section">
				<h2 class="benefit-info-title">
					<span class="benefit-info-title-icon">📋</span>
					지원내용
				</h2>
				<div class="benefit-info-content">
					◯ 보대인 300~5000만원 원도 내에서구장노동주무단 인장보는 직업훈련과정을 수강하는 경우 온라인의 일부 또는 전액을 지원
				</div>
			</div>
		</div>
		
		<!-- 신청방법 탭 -->
		<div id="method" class="benefit-tab-panel">
			<div class="benefit-info-section">
				<h2 class="benefit-info-title">
					<span class="benefit-info-title-icon">📅</span>
					신청기간
				</h2>
				<div class="benefit-info-content">상시신청</div>
			</div>
			
			<div class="benefit-info-section">
				<h2 class="benefit-info-title">
					<span class="benefit-info-title-icon">🙋</span>
					신청방법
				</h2>
				<div class="benefit-info-content">기간 내 고용센터를 방문하거나 고용24를 통해 신청</div>
			</div>
			
			<div class="benefit-info-section">
				<h2 class="benefit-info-title">
					<span class="benefit-info-title-icon">📝</span>
					신청서
				</h2>
				<div class="benefit-info-content">해당없음</div>
			</div>
			
			<div class="benefit-detail-box">
				<strong>구비서류</strong>
				<p>&lt;임업인이 제출해야 하는 서류&gt;<br>- 신청증<br>- 직업능력개발훈련 비매용과정권 지급 신청서<br>- 개인정보의 수집·이용에 대한 동의서<br>- 기타 시발내무부 입증 서류</p>
				<p>&lt;임업인이 제출해야 않아도 되는 사람(담당공무원 확인)&gt;<br>해당없음</p>
				<p>&lt;임업인이 제출해야 않아도 되는 사람(전자정부법에로 요구)&gt;<br>해당없음</p>
			</div>
		</div>
		
		<!-- 접수/문의 탭 -->
		<div id="contact" class="benefit-tab-panel">
			<div class="benefit-contact-item">
				<div class="benefit-contact-icon">🏢</div>
				<div class="benefit-contact-content">
					<div class="benefit-contact-label">접수기관</div>
					<div class="benefit-contact-value">고용노동부 각 지역 관할 고용센터 및 고객상담센터</div>
				</div>
			</div>
			
			<div class="benefit-contact-item">
				<div class="benefit-contact-icon">📞</div>
				<div class="benefit-contact-content">
					<div class="benefit-contact-label">문의처</div>
					<div class="benefit-contact-value">고용노동부 고객상담센터 (☎1350)</div>
				</div>
			</div>
			
			<c:if test="${not empty registration.link}">
				<div class="benefit-contact-item">
					<div class="benefit-contact-icon">💻</div>
					<div class="benefit-contact-content">
						<div class="benefit-contact-label">홈페이지 URL</div>
						<div class="benefit-contact-value">
							<a href="https://${registration.link}" target="_blank">https://www.work24.go.kr</a>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		
		<div class="benefit-footer-info">
			<div>• 소관기관 고용노동부</div>
			<div>• 최종수정일 2025.09.02.</div>
		</div>
		
		<a href="javascript:history.back()" class="benefit-back-btn">목록</a>
	</div>
</c:forEach>

<button class="top-button" id="topButton" aria-label="맨 위로 이동">
	<svg viewBox="0 0 24 24">
		<path d="M12 4l-8 8h6v8h4v-8h6z"/>
	</svg>
</button>

<script>
	const topButton = document.getElementById('topButton');
	
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
</script>

</body>
</html>