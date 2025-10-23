<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 - 누림</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
    
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Main CSS & Login CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/login.css' />">
    
    <!-- plugin -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
  // 카카오 초기화
  Kakao.init("50d17a154d919b83d81f7ff6cd356141");
  console.log(Kakao.isInitialized()); // true 나오면 정상

  function kakaoLogin() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/project/kakaoLogin'
    });
  }
</script>

</head>
<body>
    
    <!-- 메인 컨테이너 -->
    <div class="main-content">
    <div class="login-container" id="container">
    <!-- 뒤로가기 버튼 -->
    <button onclick="history.back()" class = "back-button">
    	<i class="fas fa-arrow-left"></i>
	</button>
            <!-- 회원가입 폼 -->
            <div class="form-container sign-up-container">
                <div class="login-form-section">
                    <h1 class="login-title">회원가입</h1>
                    <p class="form-subtitle">or use your email for registration</p>
                    
                    <!-- 회원가입 폼 -->
                    <form class="login-form" action="${pageContext.request.contextPath}/memberjoin" method="post">
                        <div class="form-group">
                            <input type="text" 
                                   name="userId"
                                   id = "userId"
                                   class="form-input" 
                                   placeholder="아이디를 입력하세요"
                                   autocomplete="off"
                                   required>
	                        <span id = "idCheckMsg"></span>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" 
                                   name="password"
                                   id="password"
                                   class="form-input" 
                                   placeholder="비밀번호를 입력하세요" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" 
                                   name="passwordConfirm"
                                   id="passwordConfirm" 
                                   class="form-input" 
                                   placeholder="비밀번호 확인" 
                                   required>
                        </div>
                        <span id = "passwordCheckMsg"></span>
                        
                        <div class="form-group">
                            <input type="email" 
                                   name="email" 
                                   class="form-input" 
                                   placeholder="이메일을 입력하세요" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <input type="text" 
                                   name="name" 
                                   id="name"
                                   class="form-input" 
                                   placeholder="닉네임을 입력하세요" 
                                   autocomplete="off"
                                   required>
                        </div>
                        <span id = "nameCheckMsg"></span>
                        
                        <div class="form-group">
                            <input type="tel" 
                                   name="phone" 
                                   class="form-input" 
                                   placeholder="전화번호 '-' 없이 입력하세요" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <input type="number" 
                                   name="age" 
                                   class="form-input" 
                                   placeholder="나이를 입력하세요" 
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
                                   id="keywordsInput"
                                   name="keywords" 
                                   class="form-input" 
                                   placeholder="관심 키워드 선택 (클릭)" 
                                   readonly
                                   onclick="openKeywordModal()"
                                   required>
                            <input type="hidden" id="selectedKeywords" name="selectedKeywords" value="">
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
                    <h1 class="login-title">로 그 인</h1>
                    
                    <!-- 소셜 로그인 버튼들 -->
                    <div class="social-login">
                        
                        <button class="social-btn linkedin" onclick="kakaoLogin()">
                             <img src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png" alt="카카오 로그인" />
                        </button>
                        
                    </div>
                    
                    <!-- 구분선 -->
                    <div class="divider">아이디와 패스워드를 입력해주세요</div>
                    
                    <!-- 로그인 폼 -->
                    <form class="login-form" action="login_ok" method="post">
                        <div class="form-group">
                            <input type="text" 
                                   name="userId" 
                                   class="form-input" 
                                   placeholder="아이디 입력" 
                                   required>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" 
                                   name="password" 
                                   class="form-input" 
                                   placeholder="비밀번호 입력" 
                                   required>
                        </div>
                        
                        <!-- 비밀번호 찾기 링크 -->
                        <div class="forgot-password">
                            <a href="idfind">Forgot your password?</a>
                        </div>
                        
                        <!-- 로그인 버튼 -->
                        <button type="submit" class="login-btn">SIGN IN</button>
                        
                        <!-- CSRF 토큰 (Spring Security 사용시) -->
                        <c:if test="${not empty _csrf}">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </c:if>
                    </form>
                    
                    <!-- 에러 메시지 표시 -->
                    <c:if test="${not empty errorMsg}">
                        <div class="error-message">
                            <i class="fas fa-exclamation-circle"></i>
                            ${errorMsg}
                        </div>
                    </c:if>
                </div>
            </div>
            
            <!-- 오버레이 패널 -->
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h2 class="welcome-title">누림에 오신걸 환영합니다!</h2>
                        <p class="welcome-text">
                            저희 서비스를 계속 이용하시려면,<br>
                            개인 계정으로 로그인해주세요.
                        </p>
                        <button class="signup-btn" id="signIn">로그인</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h2 class="welcome-title">누림에 오신걸 환영합니다!</h2>
                        <p class="welcome-text">
                            정보를 입력하고 <br>
                            저희와 함께 여정을 시작해보세요!
                        </p>
                        <button class="signup-btn" id="signUp">회원가입</button>
                    </div>
                </div>
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
            </div>
        </div>
    </div>
    
        <!-- 관심 키워드 선택 모달 -->
    <div id="keywordModal" class="modal">
        <div class="modal-content keyword-modal">
            <div class="modal-header">
                <i class="fas fa-tags modal-icon primary"></i>
                <h3 class="modal-title">관심 키워드 선택</h3>
                <p class="modal-subtitle">관심있는 분야를 선택해주세요 (최대 5개)</p>
            </div>
            <div class="modal-body">
                <div class="keyword-categories">
                    <!-- 일자리/취업 -->
                    <div class="keyword-category">
                        <h4 class="category-title">
                            <i class="fas fa-briefcase"></i> 일자리/취업
                        </h4>
                        <div class="keyword-tags">
                            <button class="keyword-tag" data-keyword="청년일자리">청년일자리</button>
                            <button class="keyword-tag" data-keyword="취업지원">취업지원</button>
                            <button class="keyword-tag" data-keyword="직업훈련">직업훈련</button>
                            <button class="keyword-tag" data-keyword="창업지원">창업지원</button>
                        </div>
                    </div>

                    <!-- 주거/복지 -->
                    <div class="keyword-category">
                        <h4 class="category-title">
                            <i class="fas fa-home"></i> 주거/복지
                        </h4>
                        <div class="keyword-tags">
                            <button class="keyword-tag" data-keyword="주거지원">주거지원</button>
                            <button class="keyword-tag" data-keyword="생활안정">생활안정</button>
                            <button class="keyword-tag" data-keyword="복지혜택">복지혜택</button>
                            <button class="keyword-tag" data-keyword="임대주택">임대주택</button>
                        </div>
                    </div>

                    <!-- 교육 -->
                    <div class="keyword-category">
                        <h4 class="category-title">
                            <i class="fas fa-graduation-cap"></i> 교육
                        </h4>
                        <div class="keyword-tags">
                            <button class="keyword-tag" data-keyword="학자금지원">학자금지원</button>
                            <button class="keyword-tag" data-keyword="교육비지원">교육비지원</button>
                            <button class="keyword-tag" data-keyword="평생교육">평생교육</button>
                            <button class="keyword-tag" data-keyword="온라인교육">온라인교육</button>
                        </div>
                    </div>

                    <!-- 문화/여가 -->
                    <div class="keyword-category">
                        <h4 class="category-title">
                            <i class="fas fa-palette"></i> 문화/여가
                        </h4>
                        <div class="keyword-tags">
                            <button class="keyword-tag" data-keyword="문화바우처">문화바우처</button>
                            <button class="keyword-tag" data-keyword="여행지원">여행지원</button>
                            <button class="keyword-tag" data-keyword="스포츠">스포츠</button>
                            <button class="keyword-tag" data-keyword="공연할인">공연할인</button>
                        </div>
                    </div>

                    <!-- 건강/의료 -->
                    <div class="keyword-category">
                        <h4 class="category-title">
                            <i class="fas fa-heartbeat"></i> 건강/의료
                        </h4>
                        <div class="keyword-tags">
                            <button class="keyword-tag" data-keyword="건강검진">건강검진</button>
                            <button class="keyword-tag" data-keyword="의료비지원">의료비지원</button>
                            <button class="keyword-tag" data-keyword="심리상담">심리상담</button>
                            <button class="keyword-tag" data-keyword="건강관리">건강관리</button>
                        </div>
                    </div>

                    <!-- 금융/경제 -->
                    <div class="keyword-category">
                        <h4 class="category-title">
                            <i class="fas fa-won-sign"></i> 금융/경제
                        </h4>
                        <div class="keyword-tags">
                            <button class="keyword-tag" data-keyword="대출지원">대출지원</button>
                            <button class="keyword-tag" data-keyword="금융교육">금융교육</button>
                            <button class="keyword-tag" data-keyword="세금감면">세금감면</button>
                            <button class="keyword-tag" data-keyword="재정지원">재정지원</button>
                        </div>
                    </div>
                </div>

                <div class="selected-keywords-display">
                    <strong>선택된 키워드:</strong>
                    <span id="selectedKeywordsDisplay">없음</span>
                </div>
            </div>
            <div class="modal-footer">
                <button class="modal-btn primary" onclick="confirmKeywords()">확인</button>
                <button class="modal-btn secondary" onclick="closeKeywordModal()">취소</button>
            </div>
        </div>
    </div>
  <jsp:include page="../include/footer.jsp"/>
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
            } else if (provider === 'facebook') {
                alert('페이스북 로그인 기능을 구현해주세요.');
            } else if (provider === 'linkedin') {
                alert('링크드인 로그인 기능을 구현해주세요.');
            }
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
        
        // 폼 제출시 로딩 상태 표시
        document.querySelectorAll('.login-form').forEach(form => {
            form.addEventListener('submit', function(e) {
                const submitBtn = this.querySelector('.login-btn');
                const isSignUp = submitBtn.textContent === 'SIGN UP';
                submitBtn.textContent = isSignUp ? '가입 중...' : '로그인 중...';
                submitBtn.disabled = true;
               
                setTimeout(() => {
                    submitBtn.textContent = isSignUp ? 'SIGN UP' : 'SIGN IN';
                    submitBtn.disabled = false;
                },  2000);
            });
        });
        
        // 회원가입 성공 / 실패 모달
        function showSignupFailModal(message) {
            document.getElementById('signupModalMessage').textContent = message || '회원가입 중 오류가 발생했습니다.';
            document.getElementById('signupFailModal').style.display = 'flex';
            document.body.style.overflow = 'hidden';
        }
        
        function showSignupSuccessModal() {
            Swal.fire({
                icon: 'success',
                title: '회원가입 성공',
                text: '정상적으로 회원가입이 완료되었습니다.',
                confirmButtonText: '확인'
            }).then(() => {
                location.reload();   // 🔄 현재 페이지 새로고침
            });
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
        
        // 아이디어 / 비밀번호 찾기로 이동
        function showForgotPassword() {
            closeModal();
            // 비밀번호 찾기로 이동
            window.location.href = '<c:url value="/idfind" />';
        }
        
        // 아이디/비밀번호 찾기 페이지로 이동
        function goToIdFind(type) {
            // URL에 파라미터를 추가하여 해당 탭으로 이동
            if (type === 'password') {
                window.location.href = '<c:url value="/idfind?tab=password" />';
            } else {
                window.location.href = '<c:url value="/idfind?tab=id" />';
            }
        }
        
        // 키워드 모달 관련 변수
        let selectedKeywordsArray = [];
        const MAX_KEYWORDS = 5;
        
        // 키워드 모달 열기
        function openKeywordModal() {
            document.getElementById('keywordModal').style.display = 'flex';
            document.body.style.overflow = 'hidden';
            
            // 이미 선택된 키워드가 있으면 표시
            const currentKeywords = document.getElementById('selectedKeywords').value;
            if (currentKeywords) {
                selectedKeywordsArray = currentKeywords.split(',');
                updateKeywordDisplay();
                highlightSelectedKeywords();
            }
        }
        
        // 키워드 모달 닫기
        function closeKeywordModal() {
            document.getElementById('keywordModal').style.display = 'none';
            document.body.style.overflow = 'auto';
        }
        
        // 키워드 선택 확인
        function confirmKeywords() {
            if (selectedKeywordsArray.length === 0) {
                alert('최소 1개의 키워드를 선택해주세요.');
                return;
            }
            
            const keywordsString = selectedKeywordsArray.join(', ');
            document.getElementById('keywordsInput').value = keywordsString;
            document.getElementById('selectedKeywords').value = selectedKeywordsArray.join(',');
            
            closeKeywordModal();
        }
        
        // 키워드 태그 클릭 이벤트
        document.addEventListener('DOMContentLoaded', function() {
            const keywordTags = document.querySelectorAll('.keyword-tag');
            
            keywordTags.forEach(tag => {
                tag.addEventListener('click', function() {
                    const keyword = this.getAttribute('data-keyword');
                    
                    if (this.classList.contains('selected')) {
                        // 이미 선택된 키워드 제거
                        const index = selectedKeywordsArray.indexOf(keyword);
                        if (index > -1) {
                            selectedKeywordsArray.splice(index, 1);
                        }
                        this.classList.remove('selected');
                    } else {
                        // 새로운 키워드 추가
                        if (selectedKeywordsArray.length >= MAX_KEYWORDS) {
                            alert(`최대 5개까지만 선택할 수 있습니다.`);
                            return;
                        }
                        selectedKeywordsArray.push(keyword);
                        this.classList.add('selected');
                    }
                    
                    updateKeywordDisplay();
                });
            });
        });
        
        // 선택된 키워드 표시 업데이트
        function updateKeywordDisplay() {
            const display = document.getElementById('selectedKeywordsDisplay');
            if (selectedKeywordsArray.length === 0) {
                display.textContent = '없음';
                display.style.color = '#9ca3af';
            } else {
                display.textContent = selectedKeywordsArray.join(', ');
                display.style.color = '#1f2937';
            }
        }
        
        // 이미 선택된 키워드 하이라이트
        function highlightSelectedKeywords() {
            document.querySelectorAll('.keyword-tag').forEach(tag => {
                const keyword = tag.getAttribute('data-keyword');
                if (selectedKeywordsArray.includes(keyword)) {
                    tag.classList.add('selected');
                } else {
                    tag.classList.remove('selected');
                }
            });
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
        
        
        
     </script>
     
     <script>
        // 비밀번호 확인 검증
        function checkDuplicate(inputId, url, msgId, paramName) {
			$("#"+inputId).on("input", function() {
				let value = $(this).val();
				
				if(value.length < 3){
					$("#"+msgId).text("아이디는 3자 이상 입력하세요.").css("color", "red");
					return;
				}
				
				$.ajax({
					url : url,
					type: "GET",
					data: {[paramName] : value},
					success: function(response){
						if(response === "OK"){
							$("#"+msgId).text("사용 가능합니다.").css("color", "green");
						}else{
							$("#"+msgId).text("이미 존재합니다.").css("color", "red");
						}
					},
					error: function(xhr, status, error) {
						console.log("에이젝스에러",error);
					}
				});
			});
		}
        function checkPassword(pwId, pwConfirmId, msgId, url){
            let timeout;
            $("#"+pwId + ",#" + pwConfirmId).on("input", function(){
                clearTimeout(timeout);
                timeout = setTimeout(function(){
                    let password = $("#"+pwId).val();
                    let passwordConfirm = $("#"+pwConfirmId).val();

                    if(password.length < 8){
                        $("#"+msgId).text("비밀번호는 8자 이상 입력하세요.").css("color", "red");
                        return;
                    }

                    $.ajax({
                        url: url,
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify({password: password, passwordConfirm: passwordConfirm}),
                        success: function(response){
                            if(response === "MATCH"){
                                $("#"+msgId).text("비밀번호가 일치합니다.").css("color","green");
                            } else {
                                $("#"+msgId).text("비밀번호가 일치하지 않습니다.").css("color", "red");
                            }
                        },
                        error: function(xhr, status, error){
                            console.log("비밀번호에러",error);
                        }
                    });
                }, 300); // 0.3초 지연 후 Ajax 호출
            });
        }
		$(document).ready(function(){
			checkDuplicate("userId", "${pageContext.request.contextPath}/idCheck", "idCheckMsg", "userId");
			checkDuplicate("name", "${pageContext.request.contextPath}/nameCheck", "nameCheckMsg", "name");
			checkPassword("password", "passwordConfirm", "passwordCheckMsg", "${pageContext.request.contextPath}/passwordCheck");
		});
		
		$("form[action$='memberjoin']").on("submit", function(e){
		    e.preventDefault();
		    let form = $(this);
		    $.ajax({
		        url: form.attr("action"),
		        type: "POST",
		        data: form.serialize(),
		        success: function(response){
		            if(response === "OK"){
		                showSignupSuccessModal();
		            } else {
		                showSignupFailModal(response.message || "회원가입 실패");
		            }
		        },
		        error: function(){
		            showSignupFailModal("기입한 정보를 다시 확인해주세요");
		        }
		    });
		});

	
        
    </script>
</body>
</html>