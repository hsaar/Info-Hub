<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
const mainCategory = document.getElementById("mainCategory");
const subCategory = document.getElementById("subCategory");
const subCategoryLabel = document.getElementById("subCategoryLabel");

mainCategory.addEventListener("change", function() {
    const parentId = this.value;
    if (parentId) {
        fetch(`/project/selectcategory/sub?parentId=${parentId}`)
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
});
</script>
</head>
<body>
	<form action="/board/save" method="post">
    <label>게시판 선택</label>
    <select id="mainCategory" name="categoryId">
        <option value="">-- 선택 --</option>
        <c:forEach var="m" items="${mainCategories}">
            <option value="${m.categoryId}">${m.name}</option>
        </c:forEach>
    </select>

    <label id="subCategoryLabel" style="display:none;">분류</label>
    <select id="subCategory" name="subCategoryId" style="display:none;">
        <option value="">-- 선택 --</option>
    </select>
</form>
</body>
</html>