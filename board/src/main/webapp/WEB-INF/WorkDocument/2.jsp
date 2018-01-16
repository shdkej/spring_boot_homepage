<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태신청서</title>
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
input,textarea {
	width: 100%;
	height: 100%;
	border: 0;
}

input:focus,textarea:focus {
	outline: none;
}

</style>
<body>
	<sec:authentication property="principal.name" var="username" />
	<table width="100%">
		<tbody>
			<tr height="30">
				<td rowspan="2" width="550" align="center"><h1>근태신청서</h1></td>
				<td class="tdcolor">기안</td>
				<td class="tdcolor">결재</td>
				<td class="tdcolor">결재</td>
				<td class="tdcolor">결재</td>
			</tr>
			<tr>
				<td>${sign.name }</td>
				<td><c:if test="${sign.department eq user.department and sign.checkman$1 eq null }">
						<input type="submit" value="결재" class="btn" />
						<input type="button" value="반려" class="btn" />
						</c:if>
						${sign.checkman$1 }
						</td>
				<td><c:if test="${sign.department eq user.department and
									 sign.checkman$1 ne null and sign.checkman$1 ne user.username and sign.checkman$2 eq null}">
						<input type="submit" value="결재" class="btn" />
						</c:if>
						${sign.checkman$2 }
						</td>
				<td><c:if test="${sign.department eq user.department and checkman$2 ne null and 
									  sign.checkman$3 eq null}">
						<input type="submit" value="결재" class="btn" />
						</c:if>
						${sign.checkman$3 }
						</td>
			</tr>
		</tbody>
	</table>
	<div></div>
	<table width="100%" id="intable">
		<tr>
			<td class="tdcolor">부서</td>
			<td width="40%">
			<c:choose>
				<c:when test="${sign.signconfirm ne 1}">
					${user.dep_name }
					<input type="hidden" name="department" value="${user.department }" />
				</c:when>
				<c:otherwise>
				${sign.dep_name}
				</c:otherwise>
			</c:choose>
				</td>
			<td class="tdcolor">이름</td>
			<td width="40%">
			<c:choose>
				<c:when test="${sign.signconfirm ne 1}">
					<input type="text" name="name" value="${user.name }" />
				</c:when>
				<c:otherwise>
				${sign.name}
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td class="tdcolor">직급</td>
			<td width="40%">
			<c:choose>
				<c:when test="${sign.signconfirm ne 1}">
					${user.job_name}
					<input type="hidden" name="signlevel" value="${user.job_id }" />
				</c:when>
				<c:otherwise>
				${sign.job_name}
				</c:otherwise>
			</c:choose>
			</td>
			<td class="tdcolor">기간</td>
			<td width="40%">
			<c:choose>
				<c:when test="${sign.signconfirm ne 1}">
					시작 : <input type="date" name="reg_date" value="${sign.reg_date }" /> <input type="date" name="reg_date" value="${sign.reg_date }"//>
				</c:when>
				<c:otherwise>
				${sign.reg_date} ~ ${sign.reg_date}
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td class="tdcolor">구분</td>
			
			<td width="90%" colspan=3>
			<c:choose>
				<c:when test="${sign.signconfirm ne 1}">
				<select name="type" class="ddropdown-select">
					<option value="1">반차</option>
					<option value="2">연차</option>
					<option value="3">휴가</option>
					<option value="4">예비군</option>
					<option value="5">병가</option>
				</select>
				</c:when>
				<c:otherwise>
				${sign.type}
				</c:otherwise>
			</c:choose>
				</td>
		</tr>
		<tr>
			<c:choose>
			<c:when test="${ sign.signconfirm ne 1}">
			<td class="tdcolor">내용</td>
			<td width="90%" colspan=3>
				<textarea type="text" rows="20" name="signcontent"></textarea>
			</td>
			</c:when>
			<c:when test="${sign.denycouse}">
			<td>${sign.denycouse}</td>
			<input type="hidden" name="denycouse" value=""/>
			</c:when>
			<c:otherwise>
				<td colspan=4 height="500" align="center">${sign.signcontent}</td>
			</c:otherwise>
			</c:choose>
		</tr>
	</table>

	<table height="250" width="100%">
		<tr>
			<td align="center" valign="bottom"><h2>
					상기 사항은 틀림없음을 확인합니다.<br /> ${sign.reg_date} <br />GVM.ltd
					</h2></td>
					<td><button name="button" value="test" onclick="check_form()"></button></td>
		</tr>
	</table>
</body>
<script>
	function check_form() {
			var denycouse = prompt("간단히 사유를 적으시겠습니까?");
			var form = document.form1;
			form.denycouse.value = denycouse;
			form.setAttribute("method","post");
			form.setAttribute("action","/sign/deny");
			form.submit();
		}
</script>
</html>