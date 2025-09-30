<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지사이드바</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">

  <!-- 좌측 사이드바 -->
    <aside class="mypage-sidebar" id="sidebar" style="display: none;">
      <h3 class="sidebar-title">프로필 정보</h3>
      
      <nav class="sidebar-menu">
        <a href="#" class="menu-item" data-page="my-info">
          <span class="menu-text">나의 정보</span>
        </a>
        <a href="#" class="menu-item" data-page="my-policy">
          <span class="menu-text">나의 정책</span>
        </a>
        <a href="#" class="menu-item" data-page="timeline">
          <span class="menu-text">타임라인</span>
        </a>
        <a href="#" class="menu-item" data-page="board">
          <span class="menu-text">게시판</span>
        </a>
        <a href="#" class="menu-item" data-page="likes">
          <span class="menu-text">기사스크랩</span>
        </a>
      
      </nav>

     
    </aside>
<script> // 사이드바 메뉴 클릭 시 콘텐츠 전환
const menuItems = document.querySelectorAll('.menu-item');
const contentBoxes = document.querySelectorAll('.content-box');

menuItems.forEach(item => {
  item.addEventListener('click', function(e) {
    e.preventDefault();
    </script>
</head>
<body>
