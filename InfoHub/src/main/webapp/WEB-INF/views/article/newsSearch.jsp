<%@page import="com.infohub.project.article.ArticleVO"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
    String userId = (String) session.getAttribute("userId");
	if(userId == null) userId = "";
    String name = request.getParameter("name");
    String keyword = request.getParameter("keyword");
    String useEs = request.getParameter("useElasticsearch");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>실시간 관심 키워드 뉴스</title>
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>



<style>
/* 컨테이너 */
.news-container {
    max-width: 1150px;
    margin: 20px auto;
    padding: 0 20px;
}

/* 키워드 섹션 카드 */
.news-section {
    background-color: #f9f9f9;
    border-radius: 12px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    margin-bottom: 25px;
    padding: 20px 25px;
    transition: transform 0.2s, box-shadow 0.2s;
}

.news-section:hover {
    transform: translateY(-3px);
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}

/* 키워드 제목 */
.news-section h3 {
    margin-bottom: 15px;
    margin-top: 10px;
    font-size: 1.5rem;
    color: #333;
    border-bottom: 2px solid #87CEFA;
    padding-bottom: 10px;
}

/* 뉴스 목록 */
.news-section ul {
    list-style: none;
    padding-left: 0;
    margin: 0;
}

.news-section ul li {
    margin-bottom: 8px;
    display: flex;
    align-items: center;
}

/* 뉴스 링크 */
.news-section ul li a {
    color: #000;
    text-decoration: none;
}

.news-section ul li a:hover {
    text-decoration: underline;
}

.news-number {
    display: inline-block;
    width: 28px;
    height: 28px;
    line-height: 28px;
    text-align: center;
    background: #87CEFA;
    color: #fff;
    font-weight: bold;
    border-radius: 4px;    
    margin-right: 10px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    flex-shrink: 0;
}

/* 반응형 */
@media (max-width: 600px) {
    .news-section h3 { font-size: 1.2rem; }
    .news-section ul li { font-size: 0.95rem; }
}

aside { margin-top: 80px; }

.search-bar {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 6px; /* 아이템 간 간격 */
}

.search-bar input {
    width: 400px;
    padding: 10px 16px;
    border: none;
    border-radius: 20px;
    font-size: 1rem;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    outline: none;
}

.search-bar input:focus {
    background-color: #ffffff;
    box-shadow: 0 0 6px rgba(135, 206, 250, 0.7);
}

.search-bar button {
    padding: 8px 16px;
    border: 1px solid #87CEFA;
    background-color: #87CEFA;
    color: #fff;
    font-weight: bold;
    border-radius: 20px;
    cursor: pointer;
}

.search-bar button:hover { background-color: #2563eb; }

.reset-btn {
    border: 1px solid #ccc;
    background-color: #fff;
    color: #333;
    font-weight: bold;
    border-radius: 20px;
    margin-left: 6px;
    cursor: pointer;
    transition: 0.2s;
}

.reset-btn:hover { background-color: #f0f0f0; }

/* 검색바 체크박스 조정 */
.search-bar label {
    display: flex;
    align-items: center;
    gap: 4px; /* 체크박스와 텍스트 간격 */
    font-size: 0.9rem;
    margin: 0; /* 좌우 여백 제거 */
}

.search-bar input[type="checkbox"] {
    width: 16px;
    height: 16px;
    margin: 0;
}

</style>

<script>
const userId = '<%= userId %>';
const initialKeyword = '<%= keyword != null ? keyword.replace("'", "\\'") : "" %>';
const initialUseEs = <%= "true".equals(useEs) ? "true" : "false" %>;

$(document).ready(function() {
    const isLoggedIn = userId && userId.trim() !== "";

    // 로그인 상태 & 검색 초기값 없으면 메인 뉴스 로딩
    if(isLoggedIn && (!initialKeyword || initialKeyword.trim() === "")) {
        loadNewsTitles();
    } else if(!isLoggedIn) {
        $("#newsContainer").html("<p>로그인하면 관심 키워드 뉴스 목록을 볼 수 있습니다.</p>");
    }

    if(initialKeyword && initialKeyword.trim() !== "") {
        $("#searchKeyword").val(initialKeyword);
        $("#useElasticsearch").prop("checked", initialUseEs); // 체크박스 초기값 반영
        performSearch(initialKeyword, initialUseEs);
    }
    

    function performSearch(keyword, useEs) {
        const container = $("#newsContainer");
        container.empty();

        if(useEs) {
            $.ajax({
                url: "${pageContext.request.contextPath}/news/search",
                type: "GET",
                data: { keyword: keyword },
                success: function(data) {
                    renderNewsResults(data || [], keyword, "Elasticsearch 검색결과", useEs);
                },
                error: function() {
                    container.html("<p>Elasticsearch 검색 실패</p>");
                }
            });
        } else {
            $.ajax({
                url: "${pageContext.request.contextPath}/news/test",
                type: "GET",
                data: { keyword: keyword },
                success: function(data) {
                    let items = [];
                    try {
                        items = (data.data && data.data.items) || [];
                    } catch(e) {
                        items = [];
                    }
                    renderNewsResults(items, keyword, "Naver API 검색결과", false);
                },
                error: function() {
                    container.html("<p>뉴스 검색 실패</p>");
                }
            });
        }
    }

    function loadNewsTitles() {
        $.ajax({
            url: "${pageContext.request.contextPath}/news/titlesAndLinks",
            type: "GET",
            success: function(data) {
                const container = $("#newsContainer");
                container.empty();
                if (!data) return container.html("<p>뉴스 불러오기 실패</p>");
                for (let keyword in data) {
                    let section = $("<div>").addClass("news-section");
                    section.append("<h3> 📢 " + keyword + "</h3>");
                    let ul = $("<ul>");
                    (data[keyword] || []).forEach((item, index) => {
                        ul.append(
                            "<li><span class='news-number'>" + (index + 1) + "</span> " +
                            "<a href='" + item.link + "' target='_blank'>" + item.title + "</a></li>"
                        );
                    });
                    section.append(ul);
                    container.append(section);
                }
            },
            error: function() { $("#newsContainer").html("<p>뉴스 불러오기 실패</p>"); }
        });
    }

    $("#newsSearchForm").on("submit", function(e){
        e.preventDefault();
        const keyword = $("#searchKeyword").val().trim();
        if(!keyword) return;
        const useEs = $("#useElasticsearch").is(":checked");
        performSearch(keyword, useEs);
    });

    $("#resetButton").on("click", function(){
        $("#searchKeyword").val("");
        if(isLoggedIn) {
            loadNewsTitles();
        } else {
            $("#newsContainer").html("<p>로그인하면 관심 키워드 뉴스 목록을 볼 수 있습니다.</p>");
        }
        $("#useElasticsearch").prop("checked", false); // 리셋 시 체크 해제
    });

    function renderNewsResults(newsList, keyword, title, useElasticsearch) {
        const container = $("#newsContainer");
        container.empty();
        if (!newsList || !Array.isArray(newsList) || newsList.length === 0) 
            return container.html("<p>검색 결과가 없습니다.</p>");
        let section = $("<div>").addClass("news-section");
        section.append("<h3>🔍 " + title + " : " + keyword + "</h3>");
        let ul = $("<ul>");
        newsList.forEach((item, index) => {
            let href = item.link;
            if(useElasticsearch && item.articleId != null) {
                href = (!userId) ? "noArticleContent?articleId=" + item.articleId
                                  : "articleContent?articleId=" + item.articleId;
            } else {
                href = item.link || "#";
            }
            ul.append("<li><span class='news-number'>" + (index + 1) + "</span> " +
                      "<a href='" + href + "'>" + item.title + "</a></li>");
        });
        section.append(ul);
        container.append(section);
    }

    function updateClock() {
        const now = new Date();
        const options = { 
            year:'numeric', month:'long', day:'numeric', 
            weekday:'long', hour:'2-digit', minute:'2-digit', second:'2-digit', 
            hour12:false 
        };
        $("#realTimeClock").text(now.toLocaleString('ko-KR', options));
    }
    updateClock();
    setInterval(updateClock, 1000);
});


</script>



</head>

<body>
<jsp:include page="../include/header.jsp"/>

<div class="breadcrumb">
    <div class="container">
        <span>현재시간 ></span>
        <span id="realTimeClock"></span>
    </div>
</div>

<div class="news-container">
 <main class="news-main">
    <h1>실시간 관심 키워드 뉴스</h1>
    
    <div class="search-bar">
      <form id="newsSearchForm">
          <button type="button" id="resetButton" class="reset-btn">↩</button>
          <input type="text" id="searchKeyword" placeholder="검색어를 입력하세요" />
            <input type="checkbox" id="useElasticsearch" /> Elasticsearch
          <button type="submit">검색</button>
          
      </form>
    </div>

    <div id="newsContainer">
        <p>뉴스를 불러오는 중입니다...</p>
    </div>
    
    
</main>

<aside>
    <!-- 사이드바 -->
    <div>
    <br><br><br><br>
    <iframe src="http://192.168.0.16:5601/app/dashboards#/view/bb1a7b3d-6e61-40ed-b749-e2f090228e34?embed=true&_g=(refreshInterval%3A(pause%3A!t%2Cvalue%3A60000)%2Ctime%3A(from%3Anow-15m%2Cto%3Anow))" height="500" width="500"></iframe></div>
    
    <div>
    <iframe src="http://192.168.0.16:5601/app/dashboards#/view/57bf684e-f07f-4963-b5c7-753e868e7c69?embed=true&_g=(refreshInterval%3A(pause%3A!t%2Cvalue%3A60000)%2Ctime%3A(from%3Anow-15m%2Cto%3Anow))" height="500" width="500"></iframe>
    </div>
    
</aside>

</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
