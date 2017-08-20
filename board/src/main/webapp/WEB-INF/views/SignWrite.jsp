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
</head>
<body>
	<sec:authentication property="principal.username" var="username" />
	<div class="wrapper">
		<jsp:include page="boardTemplelet.jsp"></jsp:include>
		<div class="content table-responsive table-full-width">
			<form action="/sign/post" method="POST">
				<table class="table table-striped" width="100%" cellpadding="0"
					cellspacing="0" border="0">
					<tr>
						<input type="hidden" name="signlevel" value="${user.job_id }" />
						<input type="hidden" name="signdocno" value="${sign.docno }" />
						<input type="hidden" name="signdocname" value="${sign.docname }" />
						<jsp:include page="/WEB-INF/WorkDocument/${sign.docno }.jsp"></jsp:include>
					</tr>
					<tr align="center">
						<td align="center"><input type="submit" value="등록"
							class="btn btn-info btn-fill btn-wd" /> <input type=button
							value="취소" class="btn btn-info btn-fill btn-wd"
							OnClick="window.location='/sign'" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
