<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>게시판</title>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon" />

</head>
<body>

	<sec:authentication property="principal.username" var="username" />

	<div class="wrapper">
		<jsp:include page="boardTemplelet.jsp"></jsp:include>

		<div class="content table-responsive table-full-width">
			<table width="100%" class="table table-striped">
				<tr></tr>
				<tr>

					<td align="left" width="76">제목</td>
					<td class="tleft" width="319">${board.subject }</td>

				</tr>
				<tr>
					<td align="left" width="76">이름</td>
					<td class="tleft" width="319">${board.writer }</td>
				</tr>
				<tr>
					<td align="left" width="76">작성일</td>
					<td class="tleft" width="319">${board.reg_date}</td>

				</tr>
			</table>
			<table width="100%" class="table table-striped">
				<tr>
					<td width="100%">${board.content }</td>
				</tr>
			</table>

		</div>
	</div>
<%-- 		<div class="card">
		<div class="content table-responsive table-full-width">
			<table width="100%" class="table table-striped">
				<tr>
				<c:forEach var="board" items="${board }">
						<td align="left" width="10%">${board.file}</td>
				</c:forEach>
				</tr>
			</table>
			</div>
			</div> --%>

	<div class="card">
		<div class="content table-responsive table-full-width">
			<table width="100%" class="table table-striped">
				<c:forEach var="reply" items="${reply }">
				<form:form action="/reply/delete/${reply.r_no}" method="DELETE">
					<tr>
						
						<td align="left" width="10%">${reply.r_name }</td>
						<td>&nbsp;</td>
						<td class="tleft" width="70%">${reply.r_content }</td>
						<td>&nbsp;<input type="hidden" name="bno" value="${board.bno}"/></td>
						<td width="20%">${reply.r_date }</td>
						<c:if test="${username == reply.r_name}">
						<td><button type="submit" aria-hidden="true" class="close" name="btnDelete">×</button></td>
						</c:if>
					</tr>
				</form:form>
				</c:forEach>
			</table>
			<table width="100%" class="table table-striped">
				<tr>
					<form action="/reply" method="POST" >
						<input type="hidden" name="r_name" value="${username }" />
						<!-- <input type="hidden" name="r_password" value=""/> -->
						<input type="hidden" name="bno" value="${board.bno}" />
					<tr><td><textarea id="content" name="r_content"
							rows="5" maxlength="100" style="width:100%;"></textarea><br/><span id="counter">###</span></td></tr>
					<td><input type="submit" value="입력"
						class="btn btn-fill btn-wd" align="center" /></td>
					</form>
				</tr>
			</table>
			<table width="100%" class="table table-striped">
				<tr align="center">
				<form:form action="/board/delete/${board.bno}" method="DELETE">
					<td class="trtr"><input type=button value="글쓰기"
						onclick="location.href='/board/post'"
						class="btn btn-info btn-fill btn-wd"/> <input type=button
						value="목록" onclick="location.href='/board'"
						class="btn btn-info btn-fill btn-wd"/>
						<c:if test="${username == board.writer}">
							<input type=button value="수정"
								onclick="location.href='/board/post/${board.bno}'"
								class="btn btn-info btn-fill btn-wd">
								<input type="submit" value="삭제" class="btn btn-info btn-fill btn-wd">
						</c:if></td>
						</form:form>
				</tr>
			</table>
		</div>
	</div>

<script type="text/javascript">

$(function() {
    $('#content').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#counter').html(content.length + '/100');
    });
    $('#content').keyup();
});
</script>


</body>

</html>
