<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="/text/html; charset=EUC-KR">
<title>로그인</title>
<link rel="icon" href="/images/favicon.ico" type="/image/x-icon"/>
<link rel="stylesheet" href="/logintemplelet/css/style.css">
</head>
<body>
	<div class="login-wrap">
		<div class="form">
		
			<h2>Login</h2>
			<form name="loginInfo" method="post" action="/login">
				<br /> <input type="text" name="username" placeholder="ID"/><br /> 
				<input type="password" name="password" placeholder="Password" /><br />
				<input type="hidden" name="reg_date"/>
				 <button>Login</button>
				 <a href="/createmember" data-hover="회원가입" class="links"><p>회원가입</p></a>
			</form>
			<%-- <c:if test="${not empty error }"> --%>
			<tr>
				<td colspan="2">
				<font color="red">
				<p>Your login attempt was not successful, try again.</p>
				</font>
				<c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION"/>
				</td>
			</tr>
			
			
		</div>
	</div>
	

</body>
<script src='https://code.jquery.com/jquery-1.10.0.min.js'></script>

<script src="/logintemplelet/js/index.js"></script>



</html>