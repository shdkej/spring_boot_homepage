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
</head>
<body>
<form action="/upload" enctype="multipart/form-data">
<input type="file" value="file" name="upload"/>
<input type="submit"/>
</form>

</body>
</html>
