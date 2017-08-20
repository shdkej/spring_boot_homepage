<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
tbody,tr,th,td {
	border-style: groove;
	text-align: center;
}

.tdcolor {
	background-color: #f2f5f3;
	width: 10%;
}
input,textarea{
width:100%;
height:100%;
border:0;
}
input:focus, textarea:focus{
outline:none;
}
</style>
<body>
	<table height="100" width="100%">
		<tbody>
			<tr height="20">

				<td rowspan="2" width="550" align="center"><h1>근태신청서</h1></td>
				<td class="tdcolor">기안</td>
				<td class="tdcolor">결재</td>
				<td class="tdcolor">결재</td>
				<td class="tdcolor">결재</td>

			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<table width="100%">
		<tr>
			<td class="tdcolor">부서</td>
			<td width="40%"><input type="text" name="dep_name" value="${user.dep_name }"/><input type="hidden" name="department" value="${user.department }"/></td>
			<td class="tdcolor">이름</td>
			<td width="40%"><input type="text" name="name" value="${user.username }"></input></td>
		</tr>
		<tr>
			<td class="tdcolor">직급</td>
			<td width="40%"><input type="text" name="job_id" value="${user.job_name }"></input></td>
			<td class="tdcolor">기간</td>
			<td width="40%"><input type="date" name="reg_date"></input></td>
		</tr>
		<tr>
			<td class="tdcolor">프로젝트</td>
			<td width="90%" colspan=3><input type="text" name="department" value="${user.department }"></input></td>
		</tr>
		<tr>
			<td class="tdcolor" height="300">내용</td>
			<td colspan=3><textarea name="signcontent"></textarea></td>
		</tr>
	</table>

	<table height="350" width="100%">
		<tr>
			<td align="center" valign="bottom"><h2>
					상기 사항은 틀림없음을 확인합니다.<br /> ${sign.reg_date} <br />GVM.ltd
					<h2></td>
		</tr>
	</table>
</body>
</html>