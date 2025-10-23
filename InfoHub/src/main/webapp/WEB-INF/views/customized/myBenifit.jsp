<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Random"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.infohub.project.login.LoginService"%>
<%@page import="org.springframework.web.context.request.RequestContextHolder"%>
<%@page import="org.springframework.web.context.request.ServletRequestAttributes"%>
<%@page import="com.infohub.project.article.ArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String userId = (String) session.getAttribute("userId");
    int loginNo = ((Integer) session.getAttribute("loginNo")).intValue();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 혜택모음</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
$(document).ready(function(){

    let currentPage = 1;
    const itemsPerPage = 6;
    let allScraps = [];
    const loginNo = ${loginNo};



    // 스크랩 렌더링
    function renderScraps(page) {
        const start = (page - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const scrapsToShow = allScraps.slice(start, end);

        let htmls = "";

        if(scrapsToShow.length < 1){
            htmls = "<h3>등록된 스크랩이 없습니다.</h3>";
        } else {
            scrapsToShow.forEach(item => {
            	htmls += '<article class="scrap-card">';
                htmls += '<h3 class="scrap-title">' + item.title + '</h3>';
                htmls += '<p class="scrap-description">' + item.content + '</p>';
                htmls += '<p><span class="scrap-period">신청기간: ' + item.startDate + ' - ' + item.endDate + '</span><br>';
                htmls += '<span class="scrap-date">스크랩: ' + item.createdDate + '</span></p>';
                htmls += '<div class="scrap-info">자세히보기 →&nbsp;&nbsp;<a href="' + item.link + '" class="scrap-link">' + item.trachea + '</a></div>';
                htmls += '<button type="button" class="deleteBtn btn-common" data-no="' + item.registrationNo + '">삭제</button>';
                htmls += '</article>';
            });
        }

        $("#scrapsList").html(htmls);
        renderPagination();
    }

    // 페이징 렌더링
    function renderPagination() {
        const totalPages = Math.ceil(allScraps.length / itemsPerPage);
        let paginationHtml = '';

        if(totalPages <= 1) {
            $("#pagination").html('');
            return;
        }
        
        if(currentPage > 1) {
            paginationHtml += '<button class="page-btn" data-page="' + (currentPage - 1) + '">◀</button>';
        }

        for(let i=1; i<=totalPages; i++){
            // 올바른 JS 삼항 연산자 사용
            paginationHtml += '<button class="page-btn ' + (i===currentPage ? 'active' : '') + '" data-page="' + i + '">' + i + '</button>';
        }
        
        if(currentPage < totalPages) {
            paginationHtml += '<button class="page-btn" data-page="' + (currentPage + 1) + '">▶</button>';
        }

        $("#pagination").html(paginationHtml);
    }

    // 스크랩 목록 불러오기
    function loadScraps(){
        $.ajax({
            url: "scraps/myscraps",
            type: "post",
            dataType: "json",
            data: { loginNo: loginNo },
            success: function(result){
                allScraps = result;
                currentPage = 1;
                renderScraps(currentPage);
            },
            error: function(err){
                alert("스크랩 불러오기 에러");
            }
        });
    }

    // 삭제 버튼 클릭
    $(document).on("click",".deleteBtn", function(){
        const registrationNo = $(this).data("no");
        $.ajax({
            url: "scrapsDelete",
            type: "post",
            dataType: "json",
            data: { registrationNo: registrationNo, loginNo: loginNo },
            success: function(data){
                if(data==1){
                    loadScraps();
                }
            },
            error: function(){ alert("삭제 에러"); }
        });
    });

    // 카드 클릭 → 상세 페이지
    $(document).on("click",".scrap-card", function(e){
        if($(e.target).hasClass("deleteBtn")) return;
        const registrationNo = $(this).find(".deleteBtn").data("no");
        window.location.href = "registrationContent?registrationNo=" + registrationNo;
    });

    // 페이징 버튼 클릭
    $(document).on("click", ".page-btn", function(){
        currentPage = parseInt($(this).data("page"));
        renderScraps(currentPage);
        window.scrollTo(0,0);
    });

    // 초기 로드
    loadScraps();
});
</script>

<style>
.scrap-list {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
    gap: 24px;
    padding: 30px;
    max-width: 1200px;
    margin: 0 auto;
}

.scrap-card {
    background-color: #ffffff;
    border: 1px solid #e5e7eb;
    border-radius: 18px;
    padding: 20px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
    transition: all 0.25s ease;
    cursor: pointer;
}

.scrap-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.1);
}

.scrap-title {
    font-family: 'Gowun Dodum', sans-serif;
    font-size: 1.2rem;
    font-weight: bold;
    color: #222;
    margin-bottom: 10px;
    line-height: 1.4;
}

.scrap-description {
    font-size: 0.95rem;
    color: #555;
    line-height: 1.5;
    margin-bottom: 12px;
    min-height: 60px;
}

.scrap-period, .scrap-date {
    font-size: 0.85rem;
    color: #888;
}

.scrap-info {
    margin-top: 8px;
    font-size: 0.9rem;
    color: #0066cc;
    word-break: break-all;
}

.scrap-info a {
    color: #0077cc;
    text-decoration: none;
}

.scrap-info a:hover {
    text-decoration: underline;
}

.deleteBtn {
    margin-top: 12px;
    background-color: #ff7675;
    color: #fff;
    border: none;
    padding: 6px 14px;
    border-radius: 20px;
    font-size: 0.85rem;
    cursor: pointer;
    transition: background-color 0.2s;
}

.deleteBtn:hover {
    background-color: #e84118;
}

/* 페이징 버튼 */
#pagination {
    text-align: center;
    margin: 20px 0;
}

.page-btn {
    border: 1px solid #ccc;
    background-color: #f5f5f5;
    margin: 0 3px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 0.85rem; /* 🔹 글씨 크기도 조금 줄이면 더 슬림 */
}

.page-btn.active {
    background-color: #87CEFA;
    color: white;
    border-color: #87CEFA;
}
</style>
</head>
<body>

<main class="news-main">
    <div class="scrap-list" id="scrapsList"></div>
    <div id="pagination"></div>
</main>

<!-- Top 버튼 -->
<button class="top-button" id="topButton" aria-label="맨 위로 이동">
    <svg viewBox="0 0 24 24">
        <path d="M12 4l-8 8h6v8h4v-8h6z"/>
    </svg>
</button>

</body>
</html>
