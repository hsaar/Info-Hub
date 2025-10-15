<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디/비밀번호 찾기 - 정책 포털</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
    
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Main CSS & Login CSS & Idfind CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/login.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/idfind.css' />">
</head>
<body>
    <!-- 기존 헤더 include -->
    
    <!-- 메인 컨테이너 -->
    <div class="main-content">
        <div class="idfind-container" id="idfindContainer">
            
            <!-- 아이디 찾기 폼 -->
            <div class="form-container find-id-container">
                <div class="idfind-form-section">
                    <div class="back-btn" onclick="goBack()">
                        <i class="fas fa-arrow-left"></i>
                        <span>로그인으로 돌아가기</span>
                    </div>
                    
                    <h1 class="idfind-title">아이디 찾기</h1>
                    <p class="form-subtitle">가입 시 입력한 정보로 아이디를 찾을 수 있습니다</p>
                    
                    <!-- 아이디 찾기 폼 -->
                    <form class="idfind-form" action="findid" method="post">
                        <div class="form-group">
                            <label class="form-label">이름</label>
                            <input type="text" 
                                   name="name" 
                                   class="form-input" 
                                   placeholder="가입 시 입력한 이름을 입력하세요" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">이메일</label>
                            <input type="email" 
                                   name="email" 
                                   class="form-input" 
                                   placeholder="가입 시 입력한 이메일을 입력하세요" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">전화번호</label>
                            <input type="tel" 
                                   name="phone" 
                                   class="form-input" 
                                   placeholder="가입 시 입력한 전화번호를 입력하세요" 
                                   required>
                        </div>
                        
                        <!-- 아이디 찾기 버튼 -->
                        <button type="submit" class="idfind-btn">아이디 찾기</button>
                    </form>
                </div>
            </div>
            
            <!-- 비밀번호 찾기 폼 -->
            <div class="form-container find-password-container">
                <div class="idfind-form-section">
                    <div class="back-btn" onclick="goBack()">
                        <i class="fas fa-arrow-left"></i>
                        <span>로그인으로 돌아가기</span>
                    </div>
                    
                    <h1 class="idfind-title">비밀번호 찾기</h1>
                    <p class="form-subtitle">가입 시 입력한 정보로 비밀번호를 재설정할 수 있습니다</p>
                    
                    <!-- 비밀번호 찾기 폼 -->
                    <form class="idfind-form" action="findpassword" method="post">
                        <div class="form-group">
                            <label class="form-label">아이디</label>
                            <input type="text" 
                                   name="userId" 
                                   class="form-input" 
                                   placeholder="아이디를 입력하세요" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">이메일</label>
                            <input type="email" 
                                   name="email" 
                                   class="form-input" 
                                   placeholder="가입 시 입력한 이메일을 입력하세요" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">전화번호</label>
                            <input type="tel" 
                                   name="phone" 
                                   class="form-input" 
                                   placeholder="가입 시 입력한 전화번호를 입력하세요" 
                                   required>
                        </div>
                        
                        <!-- 비밀번호 찾기 버튼 -->
                        <button type="submit" class="idfind-btn">비밀번호 재설정 하기</button>
                       
                    </form>
                </div>
            </div>
            
            <!-- 탭 전환 사이드바 -->
            <div class="tab-container">
                <div class="tab-sidebar">
                    <div class="tab-header">
                        <h2>계정 찾기</h2>
                        <p>필요한 서비스를 선택해주세요</p>
                    </div>
                    
                    <div class="tab-buttons">
                        <button class="tab-btn active" id="findIdTab" onclick="switchTab('id')">
                            <i class="fas fa-user"></i>
                            <div class="tab-text">
                                <strong>아이디 찾기</strong>
                                <span>이름, 이메일, 전화번호로 찾기</span>
                            </div>
                        </button>
                        
                        <button class="tab-btn" id="findPasswordTab" onclick="switchTab('password')">
                            <i class="fas fa-key"></i>
                            <div class="tab-text">
                                <strong>비밀번호 찾기</strong>
                                <span>아이디, 이메일로 재설정</span>
                            </div>
                        </button>
                    </div>
                    
                    <div class="help-section">
                        <h3>도움이 필요하신가요?</h3>
                        <ul class="help-list">
                            <li><i class="fas fa-phone"></i> 고객센터: 1004-7979</li>
                            <li><i class="fas fa-envelope"></i> 이메일: modaltodal@nurim.com</li>
                            <li><i class="fas fa-clock"></i> 평일 21:00-06:00</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 결과 모달 -->
    <div id="resultModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <i id="modalIcon" class="fas fa-check-circle modal-icon success"></i>
                <h3 id="modalTitle" class="modal-title">아이디 찾기 완료</h3>
            </div>
            <div class="modal-body">
                <p id="modalMessage">회원님의 아이디를 찾았습니다.</p>
                <div id="resultContent" class="result-content"></div>
            </div>
            <div class="modal-footer">
                <button class="modal-btn primary" onclick="goToLogin()">로그인하러 가기</button>
                <button class="modal-btn secondary" onclick="closeResultModal()">닫기</button>
            </div>
        </div>
    </div>
    
    <!-- 비밀번호 결과 모달 -->
    <div id="resultPasswordModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <i id="modalIcon" class="fas fa-check-circle modal-icon success"></i>
                <h3 id="modalTitle" class="modal-title">비밀번호 변경 완료</h3>
            </div>
            <div class="modal-body">
                <p id="modalMessage">비밀번호 변경이 완료되었습니다.</p>
            </div>
            <div class="modal-footer">
                <button class="modal-btn primary" onclick="goToLogin()">로그인하러 가기</button>
                <button class="modal-btn secondary" onclick="closePasswordResultModal()">닫기</button>
            </div>
        </div>
    </div>
    
    <!-- 비밀번호 변경 모달 -->
	<div id="passwordModal" class="modal">
	    <div class="modal-content">
	        <div class="modal-header">
	            <h3>비밀번호 변경</h3>
	        </div>
	        <div class="modal-body">
	            <form id="passwordForm" method="post" action="<c:url value='/updatePassword' />">
	                <div class="form-group">
	                	<input type="hidden" name = "userId" value = "${resetEmail}">
	                    <label>새 비밀번호</label>
	                    <input type="password" name="newPassword" id="newPasswordInput" required>
	                    <small id="passwordHint" style="color:#f59e0b; display:block; margin-top:4px;">
	                        8자 이상, 문자/숫자/특수문자 포함
	                    </small>
	                </div>
	                <div class="form-group">
	                    <label>비밀번호 확인</label>
	                    <input type="password" name="confirmPassword" id="confirmPasswordInput" required>
	                    <small id="confirmHint" style="color:red; display:none;">비밀번호가 일치하지 않습니다.</small>
	                </div>
	                <button type="submit" class="idfind-btn">변경하기</button>
	            </form>
	        </div>
	    </div>
	</div>

    <!-- 에러 모달 -->
    <div id="errorModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <i class="fas fa-exclamation-triangle modal-icon error"></i>
                <h3 class="modal-title">정보를 찾을 수 없습니다</h3>
            </div>
            <div class="modal-body">
                <p id="errorMessage">입력하신 정보와 일치하는 계정을 찾을 수 없습니다.</p>
                <div class="error-help">
                    <p><strong>다음 사항을 확인해주세요:</strong></p>
                    <ul>
                        <li>가입 시 입력한 정보와 동일한지 확인</li>
                        <li>이메일 주소나 전화번호의 오타 확인</li>
                        <li>여러 계정이 있는 경우 다른 정보로 시도</li>
                    </ul>
                </div>
            </div>
            <div class="modal-footer">
                <button class="modal-btn primary" onclick="closeErrorModal()">다시 시도</button>
                <button class="modal-btn secondary" onclick="contactSupport()">고객센터 문의</button>
            </div>
        </div>
    </div>
    
    <c:if test="${passwordChanged != null && passwordChanged}">
	    <script>
	        window.addEventListener('DOMContentLoaded', function() {
	            showPasswordResultModal();
	        });
	    </script>
	</c:if>

    <script>
	    const newPasswordInput = document.getElementById('newPasswordInput');
	    const confirmPasswordInput = document.getElementById('confirmPasswordInput');
	    const passwordHint = document.getElementById('passwordHint');
	    const confirmHint = document.getElementById('confirmHint');
	    
        // 탭 전환 함수
        function switchTab(type) {
            const container = document.getElementById('idfindContainer');
            const idTab = document.getElementById('findIdTab');
            const passwordTab = document.getElementById('findPasswordTab');
            
            if (type === 'password') {
                container.classList.add('show-password');
                idTab.classList.remove('active');
                passwordTab.classList.add('active');
            } else {
                container.classList.remove('show-password');
                idTab.classList.add('active');
                passwordTab.classList.remove('active');
            }
        }
        
        // 로그인 페이지로 돌아가기
        function goBack() {
            window.location.href = '<c:url value="/login" />';
        }
        
        // 로그인 페이지로 이동
        function goToLogin() {
            closeResultModal();
            window.location.href = '<c:url value="/login" />';
        }
        
        //비밀번호 체크
        if (newPasswordInput) {
		  newPasswordInput.addEventListener('input', function() {
		    const password = this.value;
		    const hasMinLength = password.length >= 8;
		    const hasLetter = /[a-zA-Z]/.test(password);
		    const hasNumber = /\d/.test(password);
		    const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);
		
		    if (!hasMinLength || !hasLetter || !hasNumber || !hasSpecial) {
		      this.style.borderColor = '#f59e0b';
		      passwordHint.style.color = '#f59e0b';
		    } else {
		      this.style.borderColor = '#10b981';
		      passwordHint.style.color = '#10b981';
		    }
		
		    // 확인 비밀번호 초기화
		    if (confirmPasswordInput) {
		      confirmPasswordInput.value = '';
		      confirmHint.style.display = 'none';
		    }
		  });
		}
        
        document.getElementById('passwordForm').addEventListener('submit', function(e) {
        	  const password = newPasswordInput.value;
        	  const confirm = confirmPasswordInput.value;
        	  
        	  // 강도 체크
        	  const hasMinLength = password.length >= 8;
        	  const hasLetter = /[a-zA-Z]/.test(password);
        	  const hasNumber = /\d/.test(password);
        	  const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);

        	  if (!hasMinLength || !hasLetter || !hasNumber || !hasSpecial) {
        	    e.preventDefault();
        	    passwordHint.style.color = 'red';
        	    passwordHint.textContent = '비밀번호는 8자 이상, 문자/숫자/특수문자를 포함해야 합니다.';
        	    return;
        	  }

        	  if(password !== confirm) {
        	    e.preventDefault();
        	    confirmHint.style.display = 'block';
        	    }
        });
        
        // 결과 모달 관련 함수들
        function showResultModal(type, message, result) {
            const modal = document.getElementById('resultModal');
            const icon = document.getElementById('modalIcon');
            const title = document.getElementById('modalTitle');
            const messageEl = document.getElementById('modalMessage');
            const content = document.getElementById('resultContent');
            
            if (type === 'id') {
                icon.className = 'fas fa-user modal-icon success';
                title.textContent = '아이디 찾기 완료';
                messageEl.textContent = '회원님의 아이디를 찾았습니다.';
                content.innerHTML = `<div class="found-id">아이디: <strong>${foundId}</strong></div>`;
            }
            
            modal.style.display = 'flex';
            document.body.style.overflow = 'hidden';
        }
        
        function showPasswordResultModal() {
            const modal = document.getElementById('resultPasswordModal');
            const icon = document.getElementById('modalIcon');
            const title = document.getElementById('modalTitle');
            const messageEl = document.getElementById('modalMessage');
            const content = document.getElementById('resultContent');
            
            icon.className = 'fas fa-user modal-icon success';
            title.textContent = '비밀번호 변경 완료';
            messageEl.textContent = '비밀번호 변경이 완료되었습니다.';
            
            modal.style.display = 'flex';
            document.body.style.overflow = 'hidden';
        }
        
        function showErrorModal(message) {
            document.getElementById('errorMessage').textContent = message;
            document.getElementById('errorModal').style.display = 'flex';
            document.body.style.overflow = 'hidden';
        }
        
        function closeResultModal() {
            document.getElementById('resultModal').style.display = 'none';
            document.body.style.overflow = 'auto';
        }
        
        function closeErrorModal() {
            document.getElementById('errorModal').style.display = 'none';
            document.body.style.overflow = 'auto';
        }
        
        function closePasswordResultModal() {
            document.getElementById('resultPasswordModal').style.display = 'none';
            document.body.style.overflow = 'auto';
        }
        
        function contactSupport() {
            closeErrorModal();
            alert('고객센터(1004-7979)로 연락주시면 도움을 드리겠습니다.');
        }
        
        function openPasswordModal() {
            document.getElementById('passwordModal').style.display = 'flex';
            document.body.style.overflow = 'hidden';
        }

        function closePasswordModal() {
            document.getElementById('passwordModal').style.display = 'none';
            document.body.style.overflow = 'auto';
        }
        
        // 폼 제출시 로딩 상태
        document.querySelectorAll('.idfind-form').forEach(form => {
            form.addEventListener('submit', function(e) {
                const submitBtn = this.querySelector('.idfind-btn');
                const originalText = submitBtn.textContent;
                submitBtn.textContent = '처리 중...';
                submitBtn.disabled = true;
                
            });
        });
        
        // 모달 외부 클릭으로 닫기
        window.addEventListener('click', function(event) {
            const resultModal = document.getElementById('resultModal');
            const errorModal = document.getElementById('errorModal');
            const modal = document.getElementById('passwordModal');
            
            if (event.target === resultModal) {
                closeResultModal();
            }
            if (event.target === errorModal) {
                closeErrorModal();
            }
            if(event.target === modal){
            	closePasswordModal();
            }
        });
        
        // ESC 키로 모달 닫기
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                closeResultModal();
                closeErrorModal();
                closePasswordModal();
            }
        });
        
        const foundId = "${foundId != null ? foundId : ''}";
        const resetEmail = "${resetEmail != null ? resetEmail : ''}";
        const error = "${error != null ? error : ''}";
        
        // 서버에서 전달된 결과 처리
        window.addEventListener('DOMContentLoaded', function() {
            if(foundId) {
                showResultModal('id', '', foundId);
            }
            if(resetEmail) {
            	openPasswordModal('password', '', resetEmail);
            }
            if(error) {
                showErrorModal(error);
            }
        });
    </script>
     <jsp:include page="../include/footer.jsp"/>
</body>
</html>