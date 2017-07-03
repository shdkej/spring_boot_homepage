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

		<div class="header">
			<h4 class="title">업무 일지</h4>
			<p class="category"></p>
		</div>
		<div class="content table-responsive table-full-width">
			<table width="100%" class="table table-striped">
				<tr></tr>
				<tr>

					<td align="left" width="76">제목</td>
					<td width="319">${board.subject }</td>

				</tr>
				<tr>
					<td align="left" width="76">이름</td>
					<td width="319">${board.writer }</td>
				</tr>
				<tr>
					<td align="left" width="76">작성일</td>
					<td width="319">${board.reg_date}</td>

				</tr>
			</table>
			<table width="100%" class="table table-striped">
				<tr>
					<td width="76">&nbsp;</td>
					<td width="319">${board.content }</td>
					<td width="1" colspan="1" height="200">
				</tr>
			</table>

		</div>
	</div>

	<div class="card">
		<div class="content table-responsive table-full-width">
			<table width="100%" class="table table-striped">
				<c:forEach var="reply" items="${reply }">
					<tr>
						<td align="left" width="10%">${reply.r_name }</td>
						<td>&nbsp;</td>
						<td width="70%">${reply.r_content }</td>
						<td>&nbsp;</td>
						<td width="20%">${reply.r_date }</td>
						<c:if test="${username == reply.r_name}">
							<td><button type="button" aria-hidden="true" class="close"
									onclick="reDelete(${reply.r_name })">×</button></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			<table width="100%" class="table table-striped">
				<tr>
					<form action="/reply" method="POST" >
						<input type="hidden" name="r_name" value="${username }" />
						<!-- <input type="hidden" name="r_password" value=""/> -->
						<input type="hidden" name="bno" value="${board.bno}" />
					<td width="90%"><textarea id="content" name="r_content"
							rows="10" maxlength="100"></textarea><span id="counter">###</span></td>
					<td width="10%"><input type="submit" value="입력"
						class="btn btn-info btn-fill btn-wd" width="10%" /></td>
					</form>
				</tr>
			</table>
			<table width="100%" class="table table-striped">
				<tr align="center">
					<td colspan="2" width="399"><input type=button value="글쓰기"
						onclick="location.href='/board/post'"
						class="btn btn-info btn-fill btn-wd"> <input type=button
						value="목록" onclick="location.href='/board'"
						class="btn btn-info btn-fill btn-wd"> <c:if
							test="${username == board.writer}">
							<input type=button value="수정"
								onclick="location.href='/board/post/${board.bno}'"
								class="btn btn-info btn-fill btn-wd">
							<input type="button" value="삭제" onclick="" class="btn">
							<%-- 													<form:form action="/board/post/${board.bno}"
														method="DELETE">
														<input type="submit" value="삭제">
													</form:form> --%>
						</c:if>
				</tr>
			</table>
		</div>
	</div>

<script type="text/javascript">
$(document).ready(function() {

    $('#test').on('keyup', function() {

        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
        }

    });

});
$(function() {
    $('#content').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#counter').html(content.length + '/100');
    });
    $('#content').keyup();
});
</script>

	<script type="text/javascript">
	function reDelete(comment){
		var msg = confirm("댓글을 삭제합니다.");
		if(msg==true){
			deleteCmt(comment);
		}
		else{
			return false;
		}
	}
	
	</script>
	<script type="text/javascript">
	
	$(document).ready(function(){	
		//default usage
		$("#message1").charCount();
		//custom usage
		$("#message2").charCount({
			allowed: 150,		
			warning: 20,
			counterText: 'Characters left: '	
		});
	});
</script>
	<style>
form {
	width: 500px;
}

label {
	display: block;
	font-size: 14px;
}

textarea {
	width: 490px;
	height: 60px;
	border: 2px solid #ccc;
	padding: 3px;
	color: #555;
	font: 16px Arial, Helvetica, sans-serif;
}

form div {
	position: relative;
	margin: 1em 0;
}

form .counter {
	position: absolute;
	right: 0;
	top: 0;
	font-size: 20px;
	font-weight: bold;
	color: #ccc;
}

form .warning {
	color: #600;
}

form .exceeded {
	color: #e00;
}
</style>
</body>

</html>
