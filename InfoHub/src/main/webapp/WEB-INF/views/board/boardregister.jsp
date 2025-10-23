<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>새 글쓰기 - 정책 소통 플랫폼</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/board.css' />">
</head>
<body>

	<header class="header">
		<%@ include file="../include/header.jsp"%>
	</header>

	<!-- 브레드크럼 네비게이션 -->
	<div class="breadcrumb-nav">
		<div class="container">
			<a href="${pageContext.request.contextPath}/">홈</a>
			<svg viewBox="0 0 24 24" width="16" height="16" fill="#9ca3af">
            <path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z" />
        </svg>
			<a
				href="${pageContext.request.contextPath}/listcategory?category=${categoryId}&sort=${sort}">게시판</a>
			<svg viewBox="0 0 24 24" width="16" height="16" fill="#9ca3af">
            <path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z" />
        </svg>
			<span>새 글쓰기</span>
		</div>
	</div>

	<!-- 글쓰기 헤더 -->
	<div class="write-header">
		<div class="container">
			<h1 class="write-page-title">새 글쓰기</h1>
			<p class="write-page-subtitle">여러분의 소중한 의견을 자유롭게 작성해주세요</p>
		</div>
	</div>

	<!-- 글쓰기 폼 -->
	<div class="write-container">
		<div class="container">
			<form method="post"
				action="${pageContext.request.contextPath}/register"
				onsubmit="return validateForm()" name="write_frm"
				enctype="multipart/form-data" class="write-form-card">

				<!-- 작성자 및 카테고리 -->
				<div class="form-row">
					<div class="form-group half">
						<label for="name" class="form-label"> <svg
								viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
								<path
									d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" /></svg>
							작성자
						</label> <span id="name" class="writer-display">${board.regiId}</span>
					</div>

					<div class="form-group half">
						<label class="form-label"> <svg viewBox="0 0 24 24"
								width="18" height="18" fill="currentColor">
								<path
									d="M10 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2h-8l-2-2z" /></svg>
							카테고리
						</label>
						<%@ include file="selectcategory.jsp"%>
					</div>
					<%-- 공지 여부 hidden --%>
					<input type="hidden" id="isNotice" name="isNotice" value="0">
				</div>

				<div class="form-row">
					<div class="form-group" id="title-group">
						<label for="title" class="form-label"> <svg
								viewBox="0 0 24 24" width="25" height="18" fill="currentColor">
								<path
									d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" /></svg>
							제목
						</label> <input type="text" id="title" name="title" class="form-input"
							placeholder="제목을 입력하세요" maxlength="80" />
					</div>

					<div class="form-group half photo-upload-container">
						<label for="uploadFile" class="form-label"> <svg
								viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
								<path
									d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2zm0 14h16V6H4v12zm1-5h3l-1.5-2-1.5 2zm5 0h7l-2-3-2 3-3 2z" /></svg>
							사진 첨부
						</label>

						<div class="photo-upload-actions">
							<label for="uploadFile" id="uploadButton"
								class="custom-photo-btn"> <span id="buttonText">파일
									선택</span>
							</label> <input type="file" id="uploadFile" name="uploadFile"
								accept="image/*" multiple style="display: none;"
								onchange="updatePhotoStatus(this)">
						</div>

						<div id="fileListContainer" class="file-list-container"></div>
					</div>
				</div>

				<div class="form-group">
					<label for="content" class="form-label"> <svg
							viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
							<path
								d="M14 2H6c-1.1 0-1.99.9-1.99 2L4 20c0 1.1.89 2 1.99 2H18c1.1 0 2-.9 2-2V8l-6-6zm2 16H8v-2h8v2zm0-4H8v-2h8v2zm-3-5V3.5L18.5 9H13z" /></svg>
						내용
					</label>
					<textarea id="content" name="content" class="form-textarea"
						placeholder="내용을 입력하세요 (최대 3000자)" maxlength="3000" rows="15"></textarea>
					<div class="char-count">
						<span id="currentLength">0</span> / 3000자
					</div>
				</div>

				<div class="form-actions-write">
					<button type="button" class="btn-cancel"
						onclick="location.href='${pageContext.request.contextPath}/listmain'">
						<svg viewBox="0 0 24 24" width="20" height="20"
							fill="currentColor">
							<path
								d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" /></svg>
						취소
					</button>
					<button type="submit" class="btn-submit">
						<svg viewBox="0 0 24 24" width="20" height="20"
							fill="currentColor">
							<path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" /></svg>
						작성 완료
					</button>
				</div>
			</form>
		</div>
	</div>

	<footer class="footer">
		<%@ include file="../include/footer.jsp"%>
	</footer>

	<script>
		function updatePhotoStatus(input) {
			const button = document.getElementById("uploadButton");
			const buttonText = document.getElementById("buttonText");

			if (input.files && input.files.length > 0) {
				button.classList.add("attached");
				buttonText.textContent = "첨부 완료";
			} else {
				button.classList.remove("attached");
				buttonText.textContent = "파일 선택";
			}
		}

		//공지 필터
		const categorySelect = document.querySelector('#mainCategory');
		const isNoticeInput = document.querySelector('#isNotice');
		const NOTICE_CATEGORY_ID = '37';

		categorySelect.addEventListener('change', function() {
			// 카테고리 값이 공지라면 1로 설정
			if (this.value === NOTICE_CATEGORY_ID) {
				isNoticeInput.value = '1';
			} else {
				isNoticeInput.value = '0';
			}
		});

		// 글자 수 카운터
		const contentTextarea = document.getElementById('content');
		const currentLength = document.getElementById('currentLength');

		contentTextarea.addEventListener('input', function() {
			const length = this.value.length;
			currentLength.textContent = length;

			// 글자 수가 2700자를 넘으면 경고 색상
			if (length > 2700) {
				currentLength.style.color = '#dc2626';
			} else {
				currentLength.style.color = '#6b7280';
			}
		});

		// 폼 유효성 검사
		function validateForm() {
			console.log("validateForm 실행됨");

			const title = document.getElementById('title').value.trim();
			const content = document.getElementById('content').value.trim();
			const mainCategory = document.getElementById('mainCategory').value;

			if (mainCategory === "" || mainCategory === null) {
				showAlert("카테고리를 선택해주세요.", 'mainCategory');
				return false;
			}

			if (title === "") {
				showAlert("제목을 작성해주세요.", 'title');
				return false;
			}

			if (content === "") {
				showAlert("내용을 작성해주세요.", 'content');
				return false;
			}

			// 제출 확인
			if (confirm("게시글을 등록하시겠습니까?")) {
				return true;
			}
			return false;
		}

		// 커스텀 알림 함수
		function showAlert(message, fieldId) {
			alert(message);
			if (fieldId) {
				document.getElementById(fieldId).focus();
			}
		}

		// 페이지 이탈 방지
		let formChanged = false;

		document.querySelector('.write-form-card').addEventListener('input',
				function() {
					formChanged = true;
				});

		window.addEventListener('beforeunload', function(e) {
			if (formChanged) {
				e.preventDefault();
				e.returnValue = '';
			}
		});

		// 폼 제출 시에는 이탈 방지 해제
		document.querySelector('.write-form-card').addEventListener('submit',
				function() {
					formChanged = false;
				});
	</script>

</body>
</html>
