<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/bassets/img/apple-icon.png">
<link rel="icon" href="/images/favicon.ico" type="image/x-icon" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>관리자용</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
</head>
<body>
	<div class="wrapper">
		<jsp:include page="boardTemplelet.jsp"></jsp:include>
		<table class="table table-striped">
			<thead>
				<th>번호</th>
				<th>직급</th>
				<th>부서</th>
				<th>이름</th>
				<th>생일</th>
				<th>메일</th>
				<th>번호</th>
				<th>주소</th>
				<th>입사 일자</th>
			</thead>
			<c:forEach var="member" items="${list }">
				<tbody>
					<tr>
						<td align="center" width="9%">${member.num }</td>
						<td align="center" width="9%">${member.job_id}</td>
						<td align="center" width="9%">${member.department}</td>
						<td align="center" width="10%"><a>${member.name}</a></td>
						<td align="left" width="12%">${member.birth}</td>
						<td align="center" width="15%">${member.mail}</td>
						<td align="center" width="15%">${member.phone}</td>
						<td align="center" width="15%">${member.address}</td>
						<td align="center" width="20%">${member.hire_date}</td>
						<td>
							<button type="submit" class="btn btn-info btn-fill btn-wd"
								onclick="location='/admin/${member.username}'">수정 하기</button>
						</td>
					</tr>

				</tbody>
			</c:forEach>
		</table>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="4" height="5"></td>
			</tr>
			<tr align="center">

			</tr>
		</table>
	</div>
</body>
</html>
