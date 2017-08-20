<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<title>직원용</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
</head>
<body>

	<div class="wrapper">
		<jsp:include page="boardTemplelet.jsp"></jsp:include>

		<div class="content table-responsive table-full-width">
			<form:form commandName="BoardVO" action="/board/post/${board.bno}"
				method="PATCH">

				<table class="table table-striped">
					<tr>
						<td><input name="subject" size="50" maxlength="100"
							value="${board.subject }" class="form-control border-input"></td>
						<td><input type="hidden" name="writer" size="50"
							maxlength="50" value="${board.writer}"
							class="form-control border-input"></td>
					</tr>
					<tr>
						<td><textarea id="editor1" name="content"
								style="width: 100%; height: 200px;">${board.content}</textarea></td>
					</tr>
					<tr align="center">
						<td colspan="2"><input type="submit" value="수정" class="btn">
							<input type=button value="취소" class="btn"
							OnClick="window.location='/board'" />
					</tr>
				</table>
			</form:form>
		</div>
	</div>


	<script type="text/javascript">
		//<![CDATA[
		CKEDITOR.replace('editor1', {
			skin : 'moono-lisa'
		});
		//]]>
	</script>
</body>

</html>
