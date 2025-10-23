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
<title>Chart Analysis</title>
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">

<script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.0/dist/chart.umd.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.2.0/dist/chartjs-plugin-datalabels.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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

    updateClock(); 
    setInterval(updateClock, 1000); 
});
</script>

<style>
/* 전체 레이아웃 (Flexbox 적용) */
.chart-layout {
    display: flex; 
    justify-content: center; 
    align-items: flex-start; 
    gap: 30px; 
    margin: 20px auto;
    max-width: 1350px; /* 전체 레이아웃 가로 넓이 제한 */
}

/* 왼쪽 컨테이너 (파이 차트) - 크기 복원 */
.container-chart {
    width: 800px; /* 파이 차트 고정 너비 800px */
    margin: 0; 
    aspect-ratio: 1 / 1; /* 1:1 비율 유지 */
}

/* 오른쪽 컨테이너 묶음 - 바 차트 2개를 세로로 배열 */
.right-charts-group {
    display: flex;
    flex-direction: column;
    margin-top: 50px;
    gap: 30px; /* 👈 바 차트 간 세로 간격 축소 */
}

/* 오른쪽 바 차트 컨테이너 - 크기 최종 조정 */
.container-bar-chart {
    width: 450px; /* 👈 최종 가로 너비 */
    margin: 0; 
    padding: 20px;
    box-sizing: border-box; /* 👈 padding이 width 안에 포함되도록 하여 제목 넓어짐 방지 */
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

.chart-title {
    text-align: center;
    margin: -5px 0 5px 0; /* 위쪽 여백 더 줄임, 필요시 -10px 가능 */
}

canvas {
    width: 100% !important; /* 부모 컨테이너 너비에 100% 강제 맞춤 */
    height: auto !important; 
    display: block;
    margin: 0 auto; /* 캔버스 중앙 배치 */
}

body {
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* 화면 전체 높이 */
}

.chart-layout {
    flex: 1; /* 콘텐츠 영역이 푸터를 밀도록 */
}

footer {
    padding: 10px 0;
}
</style>

</head>

<body>

<jsp:include page="../include/header.jsp"/>

<!-- 브레드크럼 -->
	<div class="breadcrumb">
    <div class="container">
      <span>현재시간 ></span>
      <span id="realTimeClock"></span>
    </div>
	</div>
	
<div class="chart-layout">
    
    <div class="container-chart">
    	<h2 style="text-align:center; margin-top:50px; margin-bottom:10px;"> 📰 카테고리별 기사 비율</h2>
        <canvas id="categoryPieChart" width="800" height="800"></canvas> </div>

    <div class="right-charts-group">
        
	        <h2 class="chart-title"> 📊 정책 기사 키워드 Top 7</h2>
	        <canvas id="bar-chart" width="450" height="350"></canvas>
	
	        <h2 class="chart-title"> 📊 혜택 인기 검색 키워드 Top 7</h2>
	        <canvas id="reg-bar-chart" width="450" height="350"></canvas>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>

<script>
Chart.register(ChartDataLabels);

const categoryCounts = [
    <c:out value="${categoryCounts[0]}" />,
    <c:out value="${categoryCounts[1]}" />,
    <c:out value="${categoryCounts[2]}" />,
    <c:out value="${categoryCounts[3]}" />,
    <c:out value="${categoryCounts[4]}" />,
    <c:out value="${categoryCounts[5]}" />
];

const categoryUrls = [
    '<c:url value="articleListAll1" />',
    '<c:url value="articleListAll2" />',
    '<c:url value="articleListAll3" />',
    '<c:url value="articleListAll4" />',
    '<c:url value="articleListAll5" />',
    '<c:url value="articleListAll6" />'
];

const labelsPie = ['일자리/취업','주거/복지','교육','문화/여가','건강/의료','금융/경제']; // 이름 충돌 방지를 위해 labelsPie로 변경

new Chart(document.getElementById('categoryPieChart'), {
    type: 'pie',
    data: {
        labels: labelsPie,
        datasets: [{
            data: categoryCounts,
            backgroundColor: [
                'rgba(255, 99, 132, 0.7)',
                'rgba(54, 162, 235, 0.7)',
                'rgba(255, 206, 86, 0.7)',
                'rgba(75, 192, 192, 0.7)',
                'rgba(153, 102, 255, 0.7)',
                'rgba(255, 159, 64, 0.7)'
            ],
            borderColor: '#fff',
            borderWidth: 2
        }]
    },
    options: {
    	onClick: (evt, elements) => {
            if(elements.length > 0){
                const index = elements[0].index;
                window.location.href = categoryUrls[index];
            }
        },
        responsive: false, 
		maintainAspectRatio: true,
        devicePixelRatio: 1, 
        layout: {
		    padding: {
		        bottom: 40, // 범례 + 외부 라벨 공간 확보
		        top: 100
		    }
		},
        plugins: {
            legend: {
		    position: 'bottom',
		    labels: {
		        font: { size: 14 },
		        padding: 25 // 레이블 간 간격 확보
		    	}
			},
            title: {display: false},
            tooltip: { enabled: true },
            datalabels: {
                display: true,
                color: '#000',
                font: { weight: 'bold', size: 16 },
                clip: false,
               
                anchor: function(ctx) {
                    const value = ctx.dataset.data[ctx.dataIndex];
                    const total = ctx.dataset.data.reduce((a,b)=>a+b,0);
                    return value / total < 0.08 ? 'end' : 'center';
                },
                align: function(ctx) {
                    const value = ctx.dataset.data[ctx.dataIndex];
                    const total = ctx.dataset.data.reduce((a,b)=>a+b,0);
                    return value / total < 0.08 ? 'end' : 'center';
                },
                offset: function(ctx){
                    const value = ctx.dataset.data[ctx.dataIndex];
                    const total = ctx.dataset.data.reduce((a,b)=>a+b,0);
                    return value / total < 0.08 ? 20 : 0;
                },
                formatter: function(value, ctx){
                    const label = ctx.chart.data.labels[ctx.dataIndex];
                    return [label, value + '건'];
                }
                
            }
        }
    },
    plugins: [
    ChartDataLabels,
    {
        id: 'legendSpacing',
        afterLayout(chart) {
            const legend = chart.legend;
            if (legend.options.position === 'bottom') {
                // 차트 자체는 그대로 두고 범례만 아래로
                const extraSpace = 50; // 범례를 더 아래로 내릴 픽셀
                legend.top += extraSpace;
                legend.bottom += extraSpace;
            }
        }
    }
]
});
</script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    
    let policyListContent = ''; 
    
    policyListContent += '[';
    // JSTL/EL로 정책 키워드 데이터를 JavaScript 배열 문자열로 생성
    <c:forEach var="keywordDTO" items="${articleTopKeywords}" varStatus="status">
        policyListContent += '["<c:out value='${keywordDTO.skeyword}' escapeXml='true'/>", ${keywordDTO.count}]';
        <c:if test="${!status.last}">
            policyListContent += ',';
        </c:if>
    </c:forEach>
    policyListContent += ']';
    
    try {
        const policyList = JSON.parse(policyListContent);
        console.log("정책 키워드 데이터 (policyList):", policyList);

        if (policyList.length > 0) {
            
            // X축 레이블을 비워두거나, 하나로 통일합니다. (키워드는 범례로 사용)
            // 가로 막대 차트의 Y축 레이블로 키워드를 사용해야 하므로, 
            // 여기서는 labels를 키워드 목록으로 그대로 둡니다.
            const labels = policyList.map(item => item[0]); 
            
            // 각 키워드에 사용할 색상 팔레트
            const backgroundColors = ["#a8dadc", "#c6a9cf", "#79c99e", "#f1d4b6", "#e88d8b", "#ffb3c1", "#61a5c2"];
            
            // ⭐ 1. 각 키워드(막대)를 개별 데이터셋으로 생성 (범례에 키워드 이름을 넣기 위함)
            const datasets = [];
            policyList.forEach((item, index) => {
                datasets.push({
                    label: item[0], // ⭐ 이 키워드 이름이 범례에 표시됩니다.
                    data: [item[1]], // 데이터 배열은 해당 키워드의 횟수 하나만 가집니다.
                    backgroundColor: backgroundColors[index % backgroundColors.length],
                    // 겹침 방지를 위해 막대 너비 설정
                    barPercentage: 0.9,
                    categoryPercentage: 0.8 
                });
            });

            new Chart(document.getElementById("bar-chart"), {
                type: 'bar',
                data: {
                    labels: ['키워드'], // X축 레이블을 단순화하여 겹침 문제 완화 시도
                    datasets: datasets // ⭐ 키워드별로 분리된 데이터셋 사용
                },
                options: {
                    // ⭐ 2. 가로 막대 차트로 설정 (Y축에 키워드 이름, X축에 검색 횟수)
                    indexAxis: 'y', 
                    responsive: false,
                    devicePixelRatio: 1, 
                    // ⭐ 3. 범례를 표시하도록 설정
                    legend: { display: true }, 
                    title: { display: false },
                    plugins: {
                        legend: { 
                            display: true, // ✅ 범례 보이도록 변경
                            position: 'top' // 범례 위치 조정 (오른쪽에 표시)
                        }, 
                        datalabels: { font: { weight: 'bold' } }
                    },
                    scales: {
                        // X축: 검색 횟수 (값)
                        x: { 
                            beginAtZero: true, 
                            title: { display: true, text: '검색 횟수' },
                            ticks: { font: { weight: 'bold' } } 
                        },
                        // Y축: 카테고리 (단순화된 레이블)
                        y: { 
                            title: { display: false }, 
                            ticks: { font: { size: 12, weight: 'bold' } } 
                        } 
                    },
                    onClick: function(e) {
                        const activePoints = this.getElementsAtEventForMode(e, 'nearest', { intersect: true }, true);
                        if (activePoints.length > 0) {
                            // 데이터셋이 여러 개이므로 datasetIndex를 사용하여 인덱스를 가져옵니다.
                            const index = activePoints[0].datasetIndex; 
                            const keyword = policyList[index][0]; // policyList에서 키워드 추출
                            const searchType = 'tc';
                            const perPageNum = ${empty pageMaker.cri.perPageNum ? 10 : pageMaker.cri.perPageNum};
                            const encodedKeyword = encodeURIComponent(keyword);

                            $.ajax({ url: "logKeyword", type: "POST", data: { keyword: keyword },
                                success: function() { window.location.href = "articleListAll?page=1&perPageNum=" + perPageNum + "&searchType=" + searchType + "&keyword=" + encodedKeyword; },
                                error: function() { window.location.href = "articleListAll?page=1&perPageNum=" + perPageNum + "&searchType=" + searchType + "&keyword=" + encodedKeyword; }
                            });
                        }
                    }
                }
            });
        } else {
            console.warn("정책 키워드 Bar Chart: 데이터가 없어 차트를 그리지 않았습니다.");
        }
    } catch (e) {
        console.error("정책 키워드 Bar Chart 데이터 파싱 오류:", e);
    }

  // ... (이전 코드, policyList 관련 코드)

    let regListContent = ''; 
    regListContent += '[';
    <c:forEach var="RegKeywordDTO" items="${registrationTopKeywords}" varStatus="status">          regListContent += '["<c:out value='${RegKeywordDTO.regkeyword}' escapeXml='true'/>", ${RegKeywordDTO.regcount}]';
        <c:if test="${!status.last}">
            regListContent += ',';
        </c:if>
    </c:forEach>
    regListContent += ']';
    
    try {
        const regList = JSON.parse(regListContent);
        console.log("혜택 키워드 데이터 (regList):", regList);

        if (regList.length > 0) {
            
            // ⭐ 1. 키워드별 색상 팔레트 정의
            const backgroundColors = ["#a8dadc", "#c6a9cf", "#79c99e", "#f1d4b6", "#e88d8b", "#ffb3c1", "#61a5c2"];
            
            // ⭐ 2. 각 키워드를 개별 데이터셋으로 분리 (범례에 키워드 이름을 표시하기 위함)
            const datasets = [];
            regList.forEach((item, index) => {
                datasets.push({
                    label: item[0], // ⭐ 이 키워드 이름이 범례에 표시됩니다.
                    data: [item[1]], // 데이터는 해당 키워드의 횟수 하나만 가집니다.
                    backgroundColor: backgroundColors[index % backgroundColors.length]
                });
            });

            new Chart(document.getElementById("reg-bar-chart"), {
                type: 'bar',
                data: {
                    labels: ['키워드'], // ⭐ 3. X축 레이블을 단순화하여 겹침 문제 완화
                    datasets: datasets // ⭐ 분리된 데이터셋 사용
                },
                options: {
                    responsive: false,
                   devicePixelRatio: 1, 
                    // ⭐ 4. 가로 막대 차트로 설정
                    indexAxis: 'y', 
                    // ⭐ 5. 범례 표시
                    legend: { display: true }, 
               plugins: {
                   datalabels: { font: { weight: 'bold' } },
                   // ⭐ 5. 범례 표시 및 위치 지정
                   legend: { 
                       display: true,
                       position: 'top'
                   }
               },
                    title: { display: true, text: '혜택 인기 검색 키워드' },
                    scales: { 
                        // X축과 Y축 설정을 가로 막대 차트에 맞게 변경
                        x: { beginAtZero: true, title: { display: true, text: '검색 횟수' }, ticks: { font: { weight: 'bold' } } }, 
                        y: { ticks: { font: { size: 12, weight: 'bold' } } } 
                    },
                    onClick: function(e) {
                        const activePoints = this.getElementsAtEventForMode(e, 'nearest', { intersect: true }, true);

                        if (activePoints.length > 0) {
                            // ⭐ 6. 데이터셋 인덱스로 변경
                            const index = activePoints[0].datasetIndex;
                            const keyword = regList[index][0]; 
                            const searchType = 'tc'; 
                            const encodedKeyword = encodeURIComponent(keyword);
                            const perPageNum = ${empty pageMaker.cri.perPageNum ? 10 : pageMaker.cri.perPageNum};

                            $.ajax({ url: "logRegKeyword", type: "POST", data: { keyword: keyword },
                                success: function() { window.location.href = "registrationlistAll?page=1&perPageNum=" + perPageNum + "&searchType=" + searchType + "&keyword=" + encodedKeyword; },
                                error: function() { window.location.href = "registrationlistAll?page=1&perPageNum=" + perPageNum + "&searchType=" + searchType + "&keyword=" + encodedKeyword; }
                            });
                        }
                    }
                }
            });
        } else {
            console.warn("혜택 키워드 Bar Chart: 데이터가 없어 차트를 그리지 않았습니다.");
        }
    } catch (e) {
        console.error("혜택 키워드 Bar Chart 데이터 파싱 오류:", e);
    }


});
</script>

</body>
</html>