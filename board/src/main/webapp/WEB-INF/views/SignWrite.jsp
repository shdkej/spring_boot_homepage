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
			<form id="form1" action="/sign/post" method="POST">
				<table class="table table-striped" width="100%" cellpadding="0"
					cellspacing="0" border="0">
					<tr>
						<input type="hidden" name="signdocno" value="${sign.docno }"/>
						<jsp:include page="/WEB-INF/WorkDocument/${sign.docno}.jsp"></jsp:include>
					</tr>
					</table>
					<table width="100%" class="">
					<tr align="center">
						<td align="center"><button type="submit" form="form1" value="등록" style="width:10; height:10;"
							class="btn btn-info btn-fill btn-wd" >등록</button>
							<button value="취소" class="btn btn-info btn-fill btn-wd"
							OnClick="window.location='/sign'">취소</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
