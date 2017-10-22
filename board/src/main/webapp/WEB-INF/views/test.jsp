<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">

<title>직원용</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

</head>
<body>
	<div class="wrapper">
		<%-- <jsp:include page="boardTemplelet.jsp"></jsp:include> --%>

		<div class="content table-responsive table-full-width">
			<form name="board" action="/board/post" onSubmit="return(check_form());" method="POST" >

				<table class="table table-striped">
					<tr>
						<td width="100%"><input name="subject" maxlength="100"
							placeholder="제목" class="form-control border-input"></td>
						<td><input type="hidden" name="writer" size="50"
							maxlength="50" value=""
							class="form-control border-input"></td>
					</tr>
					<tr>
						<td><textarea id="summernote" name="content"
								style="width: 100%; height: 200px;"></textarea></td>
					</tr>
					<tr align="center">

						<td colspan="2"><input type="submit" value="등록" class="btn" >
							<input type=button value="취소" class="btn"
							OnClick="window.location='/board'" />
					</tr>
				</table>
			</form>
			<form name="file" action="/upload" enctype="multipart/form-data" method="POST">
			<input multiple="multiple" type="file" name="file" />
			<input type="submit" value="ok"/>
			</form>
		</div>
		
	</div>

	<script type="text/javascript">
		//<![CDATA[
		CKEDITOR.replace('editor', {
			skin : 'moono-lisa',
			toolbarCanCollapse:true,
			enterMode:'2',
			filebrowserImageUploadUrl : '/testup'
			
		});
		//]]>

		$(function() {
		    $('#editor').keyup(function (e){
		        var content = $(this).val();
		        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
		        $('#counter').html(content.length + '/100');
		    });
		    $('#editor').keyup();
		});
</script>
<script>
function check_form() {
	if(!board.subject.value)
	{
		alert("제목을 적어주세요");
		board.subject.focus();
		return false;
	}
}

//이미지 파일 여부 판단
function checkImageType(fileName){
    var pattern = /jpg|gif|png|jpeg/i;
    return fileName.match(pattern);
}


$(document).ready(function() {
  $('#summernote').summernote({
    height: 300,
    minHeight: null,
    maxHeight: null,
    focus: true
  });
});

</script>

</body>
</html>
