<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />

<title>관리자용</title>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon" />
</head>
<body>
	<div class="wrapper">
		<jsp:include page="boardTemplelet.jsp"></jsp:include>
		<div class="content table-responsive table-full-width">
			<form:form commandName="User" action="/admin/${user.username}"
				method="PATCH">
				<table class="table table-striped" width="50%">
					<tr>
						<td>&nbsp;</td>
						<td>직급</td>
						<td><select name="job_id" class="ddropdown-select">
								<option value="1">사원</option>
								<option value="2">주임</option>
								<option value="3">대리</option>
								<option value="4">과장</option>
								<option value="5">차장</option>
						</select></td>
						</div>

					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>부서</td>
						<td><select name="department" class="ddropdown-select">
								<option value="1">제어(PC)</option>
								<option value="2">제어(PLC)</option>
								<option value="3">전장</option>
								<option value="4">총무</option>
								<option value="5">제조</option>
								<option value="6">설계</option>
						</select></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>이름</td>
						<td><input name="name" size="50" maxlength="50"
							class="form-control border-input" value="${user.name}"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>생일</td>
						<td><input name="birth" size="50" maxlength="50"
							class="form-control border-input" value="${user.birth}"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>메일</td>
						<td><input name="mail" size="50" maxlength="50"
							class="form-control border-input" value="${user.mail}"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>번호</td>
						<td><input name="phone" size="50" maxlength="50"
							class="form-control border-input" value="${user.phone}"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>주소</td>
						<td><input name="address" size="50" maxlength="50"
							class="form-control border-input" value="${user.address}"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>일자</td>
						<td><input name="hire_date" size="50" maxlength="50"
							class="form-control border-input" value="${user.hire_date}"></td>
						<td>&nbsp;</td>
					</tr>

				</table>

				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td colspan="4" height="5"></td>
					</tr>
					<tr align="center">
						<td>
							<button type="submit" class="btn btn-info btn-fill btn-wd">수정
								완료</button>
						</td>
					</tr>

				</table>

			</form:form>
		</div>
	</div>
</body>

</html>
