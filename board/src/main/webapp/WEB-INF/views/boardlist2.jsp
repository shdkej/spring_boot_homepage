<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	response.setContentType("text/event-stream;charset=UTF-8");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Connection", "keep-alive");
	
	try{
		out.write("id: ");
		out.write("?");
		out.write("!");
		out.flush();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>

</html>