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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote-bs4.js"></script>
</head>
<body>
	<sec:authentication property="principal.username" var="username" />
	<div class="wrapper">
		<div class="content table-responsive table-full-width">
			<form id="form1" name="board" action="/board/post"
				onSubmit="return(check_form());" method="POST" enctype="multipart/form-data">

				<table class="table table-striped">
					<tr>
						<td width="100%"><input name="subject" maxlength="100"
							placeholder="제목" class="form-control border-input"></td>
						<td><input type="hidden" name="writer" size="50"
							maxlength="50" value="${username}"
							class="form-control border-input"></td>
					</tr>
					<tr>
						<td><textarea id="summernote" name="content"
								style="width: 100%; height: 200px;"></textarea>
					</tr>
					<tr align="center">
						<td colspan="2"><input type="submit" value="등록" class="btn">
							<input type=button value="취소" class="btn"
							OnClick="window.location='/board'" /></td>
					</tr>
				</table>
			</form>
			
		</div>
	</div>
	<script type="text/javascript">

	function check_form() {
		if(!board.subject.value)
		{
			alert("제목을 적어주세요");
			board.subject.focus();
			return false;
		}
	}
		$(function() {
			$('#editor')
				.keyup(
					function(e) {
						var content = $(this).val();
							$(this)
								.height(
									((content.split('\n').length + 1) * 1.5)
									+ 'em');
							$('#counter').html(content.length + '/100');
					});
			$('#editor').keyup();
		});
		

      $('#summernote').summernote({
        placeholder: 'Hello bootstrap 4',
        tabsize: 2,
        height: 300,
        fontNames: ['NanumGothic',  'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
        fontNamesIgnoreCheck: ['fontA']
      });
      $('#summernote').summernote('justifyCenter');
      $('#summernote').summernote('undo');
      $('#summernote').summernote('redo');
      $('#summernote').summernote('saveRange');
      if ($('#summernote').summernote('isEmpty')) {
    	  alert('contents is empty');
    	}
    </script>
	

</body>
</html>
