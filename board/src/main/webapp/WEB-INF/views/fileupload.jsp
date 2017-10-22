<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}','${file_path}','파일전송완료');
window.opener.CKEDITOR.tools.callFunction('${CKEditorFuncNum}','${file_path}','파일전송완료');
</script>
</body>
</html>