<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="/text/html; charset=EUC-KR">
<title>로그인</title>
<link rel="icon" href="/images/favicon.ico" type="/image/x-icon"/>
<link rel="stylesheet" href="/logintemplelet/css/style.css">
</head>
<body onLoad=stb()>
	<div class="login-wrap">
		<div class="form">
				 <c:if test="${not empty param.fail }">
			<tr>
				<td colspan="2">
				<font color="red">
				<p align="center">ID,비밀번호를 확인 해 주세요</p>
				<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message }"/>
				</font>
				<c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION"/>
				</td>
			</tr>
		</c:if>
			<h2>Login</h2>
			<form name="loginInfo" method="post" action="/login">
				<br /> <input type="text" name="username" placeholder="ID"/><br /> 
				<input type="password" name="password" placeholder="Password" /><br />
				<input type="hidden" name="reg_date"/>
				 <button>Login</button>
				 
				 <a href="/createmember" data-hover="회원가입" class="links"><p>회원가입</p></a>
			</form>

			
		</div>
	</div>
	

</body>
<script type="text/javascript">
function stb(){
	document.loginInfo.username.focus();
	}
</script>
<script src='https://code.jquery.com/jquery-1.10.0.min.js'></script>

<script src="/logintemplelet/js/index.js"></script>



</html>