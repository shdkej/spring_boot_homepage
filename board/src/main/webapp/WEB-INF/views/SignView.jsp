<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원용</title>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
</head>
<body>
	<sec:authentication property="principal.name" var="username" />
	<div class="wrapper">
		<jsp:include page="boardTemplelet.jsp"></jsp:include>
		<div class="content table-responsive table-full-width">
			<form action="/sign/permit" method="POST">
				<table class="table table-striped">
					<tr>
						<input type="hidden" name="signno" value="${sign.signno }"/>
						<input type="hidden" name="checkno" value="${sign.checkno}"/>
						<input type="hidden" name="name" value="${username}"/>
						<jsp:include page="/WEB-INF/WorkDocument/${sign.signdocno }.jsp"></jsp:include>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>