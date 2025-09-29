<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 - 정책 포털</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
    
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Main CSS & Login CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/login.css' />">
</head>
<body>
    <!-- 기존 헤더 include -->
    
    <!-- 메인 컨테이너 -->
    <div class="main-content">
        <div class="login-container" id="container">
            
            <!-- 회원가입 폼 -->
            <div class="form-container sign-up-container">
                <div class="login-form-section">
                    <h1 class="login-title">Create Account</h1>
                    <p class="form-subtitle">or use your email for registration</p>
                    
                    <!-- 회원가입 폼 -->
                    <form class="login-form" action="<c:url value='/signup' />" method="post">
                        <div class="form-group">
                            <input type="text" 
                                   name="userId" 
                                   class="form-input" 
                                   placeholder="ID" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" 
                                   name="password" 
                                   class="form-input" 
                                   placeholder="Password" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" 
                                   name="passwordCheck" 
                                   class="form-input" 
                                   placeholder="Password Check" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <input type="email" 
                                   name="email" 
                                   class="form-input" 
                                   placeholder="Email" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <input type="text" 
                                   name="nickname" 
                                   class="form-input" 
                                   placeholder="Nickname" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <input type="tel" 
                                   name="phone" 
                                   class="form-input" 
                                   placeholder="Phone" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <input type="number" 
                                   name="age" 
                                   class="form-input" 
                                   placeholder="나이" 
                                   min="1" 
                                   max="120" 
                                   required>
                        </div>
                        
                        <!-- 성별 선택 -->
                        <div class="form-group">
                            <select name="gender" class="form-select" required>
                                <option value="">성별</option>
                                <option value="M">남성</option>
                                <option value="F">여성</option>
                            </select>
                        </div>
                        
                        <!-- 관심 키워드 -->
                        <div class="form-group">
                            <input type="text" 
                                   name="keywords" 
                                   class="form-input" 
                                   placeholder="관심 키워드 (쉼표로 구분)" 
                                   required>
                        </div>
                        
                        <!-- 회원가입 버튼 -->
                        <button type="submit" class="login-btn">SIGN UP</button>
                        
                        <!-- CSRF 토큰 (Spring Security 사용시) -->
                        <c:if test="${not empty _csrf}">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </c:if>
                    </form>
                </div>
            </div>
            
            <!-- 로그인 폼 -->
            <div class="form-container sign-in-container">
                <div class="login-form-section">
                    <h1 class="login-title">Sign in</h1>
                    
                    <!-- 소셜 로그인 버튼들 -->
                    <div class="social-login">
                        <button class="social-btn facebook" onclick="socialLogin('facebook')">
                            <i class="fab fa-facebook-f"></i>
                        </button>
                        <button class="social-btn google" onclick="socialLogin('google')">
                            <i class="fab fa-google"></i>
                        </button>
                        <button class="social-btn linkedin" onclick="socialLogin('linkedin')">
                            <i class="fab fa-linkedin-in"></i>
                        </button>
                    </div>
                    
                    <!-- 구분선 -->
                    <div class="divider">or use your account</div>
                    
                    <!-- 로그인 폼 -->
                    <form class="login-form" action="<c:url value='/login' />" method="post">
                        <div class="form-group">
                            <input type="email" 
                                   name="email" 
                                   class="form-input" 
                                   placeholder="Email" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" 
                                   name="password" 
                                   class="form-input" 
                                   placeholder="Password" 
                                   required>
                        </div>
                        
                        <!-- 비밀번호 찾기 링크 -->
                        <div class="forgot-password">
                            <a href="<c:url value='/forgot-password' />">Forgot your password?</a>
                        </div>
                        
                        <!-- 로그인 버튼 -->
                        <button type="submit" class="login-btn">SIGN IN</button>
                        
                        <!-- CSRF 토큰 (Spring Security 사용시) -->
                        <c:if test="${not empty _csrf}">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </c:if>
                    </form>
                    
                    <!-- 에러 메시지 표시 -->
                    <c:if test="${not empty error}">
                        <div class="error-message">
                            <i class="fas fa-exclamation-circle"></i>
                            ${error}
                        </div>
                    </c:if>
                </div>
            </div>
            
            <!-- 오버레이 패널 -->
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h2 class="welcome-title">Welcome 누림!</h2>
                        <p class="welcome-text">
                            To keep connected with us please login<br>
                            with your personal info
                        </p>
                        <button class="signup-btn" id="signIn">SIGN IN</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h2 class="welcome-title">Hello, Friend!</h2>
                        <p class="welcome-text">
                            Enter your personal details and start<br>
                            journey with us
                        </p>
                        <button class="signup-btn" id="signUp">SIGN UP</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 로그인 실패 모달 -->
    <div id="loginFailModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <i class="fas fa-times-circle modal-icon error"></i>
                <h3 class="modal-title">로그인 실패</h3>
            </div>
            <div class="modal-body">
                <p id="modalMessage">아이디 또는 비밀번호가 올바르지 않습니다.</p>
            </div>
            <div class="modal-footer">
                <button class="modal-btn primary" onclick="closeModal()">확인</button>
                <button class="modal-btn secondary" onclick="showForgotPassword()">비밀번호 찾기</button>
            </div>
        </div>
    </div>

    <!-- 회원가입 실패 모달 -->
    <div id="signupFailModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <i class="fas fa-exclamation-triangle modal-icon warning"></i>
                <h3 class="modal-title">회원가입 실패</h3>
            </div>
            <div class="modal-body">
                <p id="signupModalMessage">회원가입 중 오류가 발생했습니다.</p>
            </div>
            <div class="modal-footer">
                <button class="modal-btn primary" onclick="closeSignupModal()">확인</button>
            </div>
        </div>
    </div>

    <!-- 회원가입 성공 모달 -->
    <div id="signupSuccessModal" class="modal">
        <div class="modal-content success">
            <div class="modal-header">
                <i class="fas fa-check-circle modal-icon success"></i>
                <h3 class="modal-title">회원가입 완료</h3>
            </div>
            <div class="modal-body">
                <p id="successModalMessage">
                    <strong>누림</strong>에 오신 것을 환영합니다!<br>
                    회원가입이 성공적으로 완료되었습니다.
                </p>
            </div>
            <div class="modal-footer">
                <button class="modal-btn primary" onclick="goToLoginFromSuccess()">로그인하기</button>
                <button class="modal-btn secondary" onclick="closeSuccessModal()">닫기</button>
            </div>
        </div>
    </div>

    <script>
        const signUpButton = document.getElementById('signUp');
        const signInButton = document.getElementById('signIn');
        const container = document.getElementById('container');

        // 회원가입 버튼 클릭시
        signUpButton.addEventListener('click', () => {
            container.classList.add("right-panel-active");
        });

        // 로그인 버튼 클릭시
        signInButton.addEventListener('click', () => {
            container.classList.remove("right-panel-active");
        });
        
        // 소셜 로그인 함수
        function socialLogin(provider) {
            console.log(provider + ' 로그인 시도');
            
            if (provider === 'google') {
                alert('구글 로그인 기능을 구현해주세요.');
            } else if (provider === 'naver') {
                alert('네이버 로그인 기능을 구현해주세요.');
            } else if (provider === 'kakao') {
                alert('카카오 로그인 기능을 구현해주세요.');
            }
        }
        
        // 폼 제출시 로딩 상태 표시
        document.querySelectorAll('.login-form').forEach(form => {
            form.addEventListener('submit', function(e) {
                const submitBtn = this.querySelector('.login-btn');
                const isSignUp = submitBtn.textContent === 'SIGN UP';
                submitBtn.textContent = isSignUp ? '가입 중...' : '로그인 중...';
                submitBtn.disabled = true;
                
                // 실제 서버 응답 처리는 백엔드에서 하지만, 
                // 테스트용으로 실패 모달 표시 (실제로는 제거)
                // setTimeout(() => {
                //     if (isSignUp) {
                //         showSignupFailModal('이미 존재하는 아이디입니다.');
                //     } else {
                //         showLoginFailModal('아이디 또는 비밀번호가 올바르지 않습니다.');
                //     }
                //     submitBtn.textContent = isSignUp ? 'SIGN UP' : 'SIGN IN';
                //     submitBtn.disabled = false;
                // }, 2000);
            });
        });
        
        // 모달 관련 함수들
        function showLoginFailModal(message) {
            document.getElementById('modalMessage').textContent = message || '아이디 또는 비밀번호가 올바르지 않습니다.';
            document.getElementById('loginFailModal').style.display = 'flex';
            document.body.style.overflow = 'hidden';
        }
        
        function showSignupFailModal(message) {
            document.getElementById('signupModalMessage').textContent = message || '회원가입 중 오류가 발생했습니다.';
            document.getElementById('signupFailModal').style.display = 'flex';
            document.body.style.overflow = 'hidden';
        }
        
        function showSignupSuccessModal(message) {
            const defaultMessage = '<strong>누림</strong>에 오신 것을 환영합니다!<br>회원가입이 성공적으로 완료되었습니다.';
            document.getElementById('successModalMessage').innerHTML = message || defaultMessage;
            document.getElementById('signupSuccessModal').style.display = 'flex';
            document.body.style.overflow = 'hidden';
        }
        
        function closeModal() {
            document.getElementById('loginFailModal').style.display = 'none';
            document.body.style.overflow = 'auto';
        }
        
        function closeSignupModal() {
            document.getElementById('signupFailModal').style.display = 'none';
            document.body.style.overflow = 'auto';
        }
        
        function closeSuccessModal() {
            document.getElementById('signupSuccessModal').style.display = 'none';
            document.body.style.overflow = 'auto';
        }
        
        function goToLoginFromSuccess() {
            closeSuccessModal();
            // 로그인 폼으로 슬라이드
            const container = document.getElementById('container');
            container.classList.remove("right-panel-active");
        }
        
        function showForgotPassword() {
            closeModal();
            alert('비밀번호 찾기 페이지로 이동합니다.');
            // 실제로는: window.location.href = '<c:url value="/forgot-password" />';
        }
        
        // 모달 외부 클릭시 닫기
        window.addEventListener('click', function(event) {
            const loginModal = document.getElementById('loginFailModal');
            const signupModal = document.getElementById('signupFailModal');
            const successModal = document.getElementById('signupSuccessModal');
            
            if (event.target === loginModal) {
                closeModal();
            }
            if (event.target === signupModal) {
                closeSignupModal();
            }
            if (event.target === successModal) {
                closeSuccessModal();
            }
        });
        
        // ESC 키로 모달 닫기
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                closeModal();
                closeSignupModal();
                closeSuccessModal();
            }
        });
        
        // 페이지 로드 시 서버에서 전달된 메시지 확인
        window.addEventListener('DOMContentLoaded', function() {
            <c:if test="${not empty error}">
                showLoginFailModal('${error}');
            </c:if>
            
            <c:if test="${not empty success}">
                showSignupSuccessModal('${success}');
            </c:if>
        });
        
        // 비밀번호 확인 검증
        const passwordInput = document.querySelector('input[name="password"]');
        const passwordCheckInput = document.querySelector('input[name="passwordCheck"]');
        
        if (passwordCheckInput) {
            passwordCheckInput.addEventListener('blur', function() {
                if (passwordInput.value !== this.value) {
                    this.style.borderColor = '#ef4444';
                    this.style.backgroundColor = '#fef2f2';
                } else {
                    this.style.borderColor = '#C9E1F9';
                    this.style.backgroundColor = '';
                }
            });
        }
        
        // 입력 필드 포커스 효과
        document.querySelectorAll('.form-input, .form-select').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('focused');
            });
        });
    </script>
</body>
</html>