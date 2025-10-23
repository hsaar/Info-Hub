<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>실시간 관심 키워드 뉴스</title>
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
#result table {
    width: 80%;           /* 화면 폭의 80% */
    max-width: 1000px;     /* 최대 800px */
    margin: 20px auto;    /* 상하 여백 20px, 가로 가운데 정렬 */
    border-collapse: collapse;
}
#result th, #result td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: left;
}

#result th {
    background-color: #87CEFA;
    color: #fff;
}

#result tr:nth-child(even) { background-color: #f9f9f9; }
#result tr:hover { background-color: #e0f0ff; }
#result a { color: #2563eb; text-decoration: none; }
#result a:hover { text-decoration: underline; }

.search-bar {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 6px; /* 아이템 간 간격 */
    margin-top: 80px; /* 위쪽 여백 추가 */
    margin-bottom: 80px;
}

.search-bar input {
    width: 500px;
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

</style>

<script>
$(document).ready(function() {
    const urlParams = new URLSearchParams(window.location.search);
    const keyword = urlParams.get('keyword') || '';

    // 검색어 input에 세팅
    $('#searchKeyword').val(keyword);

    function loadData(keyword) {
        $.ajax({
            url: '<%=request.getContextPath()%>/site/indexAll',
            type: 'GET',
            data: { keyword: keyword },
            dataType: 'json',
            success: function(data) {
                console.log("data:", data);

                if (!data || data.length === 0) {
                    return;
                }

                // 테이블 헤더
                let html = "<table><thead><tr>" +
		           "<th>이름</th>" +
		           "<th>링크</th>" +
		           "</tr></thead><tbody>";
		
				for (let i = 0; i < data.length; i++) {
				    const item = data[i];
				
				    const name = String(item.name || "N/A");
				    const link = String(item.link || "#");
				
				    html += "<tr>" +
				            "<td>" + name + "</td>" +
				            "<td><a href='" + link + "'>" + link + "</a></td>" +
				            "</tr>";
				}
				
				html += "</tbody></table>";

                $("#result").html(html);
            },
            error: function(xhr) {
                console.error(xhr.responseText);
                $("#result").html("<p>❌ 데이터를 불러오는 중 오류가 발생했습니다.</p>");
            }
        });
    }

    // 초기 로딩
    loadData(keyword);

    // 검색 버튼 클릭
    $('#newsSearchForm').on('submit', function(e) {
        e.preventDefault();
        const keyword = $('#searchKeyword').val().trim();
        const contextPath = '${pageContext.request.contextPath}';
        window.location.href = contextPath + '/siteIndex?keyword=' + encodeURIComponent(keyword);
    });
    
    $('#resetBtn').on('click', function() {
        const contextPath = '${pageContext.request.contextPath}';
        window.location.href = contextPath + '/siteIndex'; // keyword 없이 새로고침
    });
    
    function updateClock() {
        const now = new Date();
        const options = { 
            year:'numeric', month:'long', day:'numeric', 
            weekday:'long', hour:'2-digit', minute:'2-digit', second:'2-digit', 
            hour12:false 
        };
        $("#realTimeClock").text(now.toLocaleString('ko-KR', options));
    }
    setInterval(updateClock, 1000);
    updateClock();
});
</script>

</head>
<body>
<jsp:include page="./include/header.jsp"/>

<div class="breadcrumb">
    <div class="container">
        <span>현재시간 ></span>
        <span id="realTimeClock"></span>
    </div>
</div>


<div class="search-bar">
<form id="newsSearchForm">
	<button type="button" class="reset-btn" id="resetBtn">↩</button>
    <input type="text" id="searchKeyword" placeholder="검색어를 입력하세요">
    <button type="submit" id="searchBtn">검색</button>
</form>
</div>

<div id="result">
    <table>
        <thead>
            <tr>
                <th>이름</th>
                <th>링크</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${results}">
                <tr>
                    <td>${item.name}</td>
                    <td><a href="${item.link}">${item.link}</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="./include/footer.jsp"/>
</body>
</html>
