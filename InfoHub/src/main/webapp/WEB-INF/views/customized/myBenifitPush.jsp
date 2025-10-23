<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.time.LocalDate, java.time.temporal.ChronoUnit"%>
<%@page import="com.infohub.project.customizedservice.CustomizedDTO"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
/* 알림 목록 전체 컨테이너 */
.alert-container {
	padding: 20px;
}

/* 개별 알림 박스: 둥근 모서리 강조 */
.alert-box {
	display: flex;
	align-items: flex-start;
	padding: 20px; /* 패딩 증가 */
	margin-bottom: 15px;
	border: 1px solid #b3d9ff; /* 부드러운 푸른색 테두리 */
	border-radius: 15px; /* 둥근 모서리 */
	background-color: #f7fcff; /* 아주 연한 푸른색 배경 */
	box-shadow: 0 4px 8px rgba(0, 51, 102, 0.1); /* 푸른 계열의 은은한 그림자 */
	transition: all 0.2s ease-in-out;
	cursor: pointer;
}

.alert-box:hover {
	background-color: #e6f7ff; /* 호버 시 더 밝은 푸른색 */
	box-shadow: 0 6px 12px rgba(0, 51, 102, 0.15); /* 호버 시 그림자 강조 */
}

/* 마감 임박 아이콘/배지: 크기 확대 및 글자색 짙은 남색으로 변경 */
.alert-badge {
	flex-shrink: 0;
	width: 75px;
	height: 75px;
	background-color: #C5E1F7; /* 부드러운 파스텔 스카이 블루 */
	color: #192A56; /* 🔴 글자색을 더 짙은 남색 계열로 변경 */
	border-radius: 50%;
	text-align: center;
	padding-top: 15px;
	font-size: 1.3em;
	font-weight: bold;
	margin-right: 20px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* 배지 내부 텍스트 스타일 */
.alert-badge span {
	display: block;
	font-size: 0.75em;
	font-weight: normal;
	color: #192A56; /* 🔴 글자색을 더 짙은 남색 계열로 변경 */
}

/* 내용 영역 */
.alert-content-area {
	flex-grow: 1;
}

.alert-title {
	font-weight: 700;
	color: #333;
	font-size: 1.2em;
	margin-bottom: 6px;
}

/* 마감일 강조: 푸른색 계열로 변경 */
.alert-deadline {
	font-size: 0.95em;
	color: #555; /* 경쾌한 파란색 마감일 */
	margin-bottom: 10px;
}

.alert-link a {
	color: #007bff; /* 링크는 초록색 계열로 시각적 분리 */
	text-decoration: none;
	font-weight: 500;
	border-bottom: 1px dashed #28a74555;
}

.alert-link a:hover {
	color: #1e7e34;
	border-bottom: 1px solid #1e7e34;
}

.alert-detail-item {
	display: flex; /* 라벨과 내용을 한 줄에 정렬 */
	font-size: 0.9em;
	color: #555;
	margin-bottom: 4px;
	line-height: 1.4;
	overflow: hidden; /* 넘치는 내용 숨기기 */
	white-space: nowrap; /* 줄바꿈 방지 */
	text-overflow: ellipsis; /* 넘치는 부분 ... 처리 */
}

/* 🔴 상세 정보 라벨 스타일 */
.detail-label {
	flex-shrink: 0; /* 라벨 너비 유지 */
	font-weight: 600;
	color: #333;
	width: 80px; /* 라벨 너비를 고정하여 정렬 */
	margin-right: 5px;
}

/* 🔴 상세 정보 텍스트 스타일 */
.detail-text {
	flex-grow: 1; /* 남은 공간을 내용이 모두 차지 */
	font-weight: normal;
	color: #555;
	overflow: hidden; /* 넘치는 내용 숨기기 */
	text-overflow: ellipsis; /* 넘치는 부분 ... 처리 */
	white-space: nowrap; /* 줄바꿈 방지 */
}

/* 알림이 없을 때 메시지: 둥근 모서리 적용 */
.no-alerts {
	padding: 30px;
	text-align: center;
	color: #555;
	background-color: #f0f8ff; /* 하늘색 배경 */
	border-radius: 12px; /* 둥근 모서리 */
	border: 1px solid #cce5ff;
	margin-top: 20px;
}
</style>
<div class="alert-container">
	<c:choose>
		<c:when test="${not empty myBenifitPush}">
			<c:forEach var="benefit" items="${myBenifitPush}" varStatus="status">

				<%
				com.infohub.project.customizedservice.CustomizedDTO benefitDto = (com.infohub.project.customizedservice.CustomizedDTO) pageContext
						.getAttribute("benefit");

				String dDayText = "D-? (오류)";
				long dDayLong = -999;
				boolean isClosed = true;

				if (benefitDto != null && benefitDto.getEndDate() != null) {
					try {
						java.time.LocalDate endDate = java.time.LocalDate.parse(benefitDto.getEndDate());
						java.time.LocalDate today = java.time.LocalDate.now();
						dDayLong = java.time.temporal.ChronoUnit.DAYS.between(today, endDate);

						if (dDayLong >= 0) {
					isClosed = false;
						}

						if (dDayLong < 0) {
					dDayText = "마감";
						} else if (dDayLong == 0) {
					dDayText = "D-DAY";
						} else {
					dDayText = "D-" + dDayLong;
						}
					} catch (Exception e) {
						dDayText = "날짜 오류";
						isClosed = true;
					}
				}

				pageContext.setAttribute("dDayDisplay", dDayText);
				pageContext.setAttribute("isClosed", isClosed);
				%>

				<c:if test="${not isClosed}">

					<a
						href="${contextPath}/registrationContent?registrationNo=${benefit.registrationNo}"
						target="_top" style="text-decoration: none; color: inherit;">

						<div class="alert-box">
							<div class="alert-badge">
								${dDayDisplay} <span>마감 임박</span>
							</div>

							<div class="alert-content-area">
								<div class="alert-title">${benefit.title}
								</div>

								<div class="alert-detail-item">
									<span class="detail-label">지원 내용: <span
										class="detail-text">${benefit.content}</span>
									</span>
								</div>

								<div class="alert-detail-item">
									<span class="detail-label">연락처: <span
										class="detail-text">${benefit.regCall}</span>
									</span>
								</div>

								<div class="alert-detail-item">
									<span class="detail-label">신청 기간: <span
										class="detail-text">${benefit.startDate} ~
											${benefit.endDate}</span>
									</span>
								</div>
							</div>
						</div>
					</a>
				</c:if>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="no-alerts">
				마감 임박 알림 목록이 없습니다. <br>더 많은 혜택을 스크랩하거나 마감일이 가까운 혜택을 확인해 보세요.
			</div>
		</c:otherwise>
	</c:choose>
</div>