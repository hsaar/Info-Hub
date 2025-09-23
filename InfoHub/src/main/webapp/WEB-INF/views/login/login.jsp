<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
	<title>로그인페이지입니다</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/login.css' />">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<c:if test="${not empty errorMsg}">
<script>
  Swal.fire({
    title: '로그인 실패',
    text: '${errorMsg}',
    icon: 'error',
    confirmButtonText: '확인'
  });
</script>
</c:if>
<h2>welcome 누림</h2>
<div class="container" id="container">
  <div class="form-container sign-up-container">
    <form action="memberjoin" method="post">
      <h1>Create Account</h1>
      <span>or use your email for registration</span>
      <input type="text" placeholder="ID" name = "username" required/>
      <input type="password" placeholder="Password" name = "password" required/>
      <input type="password" placeholder="PasswordCheak" name = "passwordcheak" required/>
      <input type="email" placeholder="Email" name = "email" required/>
      <input type="text" placeholder="Nickname" name = "name" required/>
      <input type="text" placeholder="phone" name = "phone" required/>
      <select id = "birthyear" name="birthyear" required>
      	<option value="">선택</option>
<%
   		int thisYear = Calendar.getInstance().get(Calendar.YEAR);
    	for(int y = thisYear; y>=1900; y--){
%> 		
		<option value="<%=y%>"><%=y%>년</option>
<%
    	}
%>
      </select>
      <button>Sign Up</button>
    </form>
  </div>
  <div class="form-container sign-in-container">
    <form action="login_ok" method="post">
      <h1>Sign in</h1>
      <span>or use your account</span>
      <input type="text" placeholder="Email" name = "username"/>
      <input type="password" placeholder="Password" name="password"/>
      <a href="#">Forgot your password?</a>
      <button>Sign In</button>
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>Welcome Back!</h1>
        <p>To keep connected with us please login with your personal info</p>
        <button class="ghost" id="signIn">Sign In</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>Hello, Friend!</h1>
        <p>Enter your personal details and start journey with us</p>
        <button class="ghost" id="signUp">Sign Up</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
	const signUpButton = document.getElementById('signUp');
	const signInButton = document.getElementById('signIn');
	const container = document.getElementById('container');
	
	signUpButton.addEventListener('click', () => {
	  container.classList.add("right-panel-active");
	});
	
	signInButton.addEventListener('click', () => {
	  container.classList.remove("right-panel-active");
	});
</script>
</body>
</html>
