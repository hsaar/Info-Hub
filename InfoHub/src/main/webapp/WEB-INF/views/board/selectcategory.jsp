<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
    <label></label>
   <select id="mainCategory" name="categoryId" required>
    <option value="">-- 선택 --</option>
    <c:forEach var="m" items="${mainCategories}">
        <c:choose>
            <c:when test="${m.name == '공지' && role != 2}">
            </c:when>
            <c:otherwise>
                <option value="${m.categoryId}"
                    <c:if test="${categoryId != null && categoryId == m.categoryId}">selected</c:if>>
                    ${m.name}
                </option>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</select>

 <!-- <label id="subCategoryLabel" style="display:none;">분류</label>
    <select id="subCategory" name="subCategoryId" style="display:none;">
        <option value="">-- 선택 --</option>
        <c:forEach var="s" items="${subCategories}">
            <option value="${s.categoryId}">${s.name}</option>
        </c:forEach>
    </select> -->   

<script>
const mainCategory = document.getElementById("mainCategory");
//const subCategory = document.getElementById("subCategory");
//const subCategoryLabel = document.getElementById("subCategoryLabel");

/*
function loadSubCategories(parentId) {
    if (parentId) {
        fetch('${pageContext.request.contextPath}/selectcategory/sub?parentId=' + parentId)
            .then(response => response.json())
            .then(data => {
                subCategory.innerHTML = '<option value="">-- 선택 --</option>';
                data.forEach(item => {
                    const option = document.createElement('option');
                    option.value = item.categoryId;
                    option.textContent = item.name;
                    subCategory.appendChild(option);
                });
                subCategory.style.display = 'inline';
                subCategoryLabel.style.display = 'inline';
            })
            .catch(error => console.error("Fetch error:", error));
    } else {
        subCategory.style.display = 'none';
        subCategoryLabel.style.display = 'none';
        subCategory.value = '';
    }
}

// 대분류 변경 이벤트
mainCategory.addEventListener("change", function() {
    loadSubCategories(this.value);
});
*/
/* 페이지 로드 시 자동 선택된 값이 있으면 소분류 로드
window.addEventListener("DOMContentLoaded", () => {
    if (mainCategory.value) {
        loadSubCategories(mainCategory.value);
    }
});
*/
</script>

  <!-- <select name="category">
    <option value="">-- 선택 --</option>
    <c:forEach var="category" items="${mainCategories}">
        <option value="${category.categoryId}">${category.name}</option>
    </c:forEach>
</select>
 -->
</body>
</html>