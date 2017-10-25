<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon" />
<title>직원용</title>

</head>
<body>
	<div class="wrapper">
		<jsp:include page="boardTemplelet.jsp"></jsp:include>
		<table class="table table-striped">
			<thead>
				<th width="10%">번호</th>
				<th>제목</th>
			</thead>
			<tbody>

				<c:forEach var="sign" items="${sign}">
					<tr>
						<td align="center" width="10%">${sign.docno }</td>
						<td class="" align="center"><a href="/sign/${sign.docno }">${sign.docname }</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
