<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오류 발생</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/error.css' />">
</head>
<body>

<!-- 상단바 -->
<%@ include file="../include/header.jsp"%>
<!-- my_hearts error -->
<div class="error-container">
  <div class="error-content">
    <div class="error-icon">
      <svg viewBox="0 0 24 24">
        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z"/>
      </svg>
    </div>
    
    <c:choose>
      <c:when test="${not empty statusCode}">
        <div class="error-code">${statusCode}</div>
      </c:when>
      <c:otherwise>
        <div class="error-code">ERROR</div>
      </c:otherwise>
    </c:choose>
    
    <h1 class="error-title">오류가 발생했습니다</h1>
    
    <p class="error-message">
      <c:choose>
        <c:when test="${not empty param.msg}">
          ${param.msg}
        </c:when>
        <c:when test="${not empty errorMessage}">
          ${errorMessage}
        </c:when>
        <c:otherwise>
          요청을 처리하는 중에 문제가 발생했습니다.<br>
          잠시 후 다시 시도해주세요.
        </c:otherwise>
      </c:choose>
    </p>
    
    <c:if test="${not empty exception or not empty pageContext.exception}">
      <div class="error-details">
        <h4>오류 상세 정보</h4>
        <p><strong>오류 유형:</strong> 
          <c:choose>
            <c:when test="${not empty exception}">
              ${exception.class.simpleName}
            </c:when>
            <c:otherwise>
              ${pageContext.exception.class.simpleName}
            </c:otherwise>
          </c:choose>
        </p>
        <p><strong>오류 메시지:</strong> 
          <c:choose>
            <c:when test="${not empty exception}">
              ${exception.message}
            </c:when>
            <c:otherwise>
              ${pageContext.exception.message}
            </c:otherwise>
          </c:choose>
        </p>
        <c:if test="${not empty requestURI}">
          <p><strong>요청 URI:</strong> ${requestURI}</p>
        </c:if>
      </div>
    </c:if>
    
    <div class="error-actions">
      <button onclick="history.back()" class="error-btn secondary">
        <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
          <path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"/>
        </svg>
        이전 페이지
      </button>
      <a href="<c:url value='/' />" class="error-btn primary">
        <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
          <path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/>
        </svg>
        홈으로 가기
      </a>
    </div>
  </div>
</div>
 <jsp:include page="../include/footer.jsp"/>
</body>
</html>