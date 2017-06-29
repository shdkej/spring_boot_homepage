<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="login.JDBC_memberDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%request.setCharacterEncoding("UTF-8"); %>

	<jsp:useBean id="vo" class="login.MemberVO"/>
	<jsp:setProperty property="*" name="vo"/>
<% 	JDBC_memberDAO dao = JDBC_memberDAO.getInstance();%>
	
<%
	if(dao.memberInsert(vo)>0){
		
		out.print("<script>");
		out.print("alert('가입을 축하드립니다.');");
		out.print("location.href='loginform.jsp';");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('회원가입이 정상적으로 완료되지 않았습니다.');");
		out.print("history.back();");
		out.print("</script>");
	}



%>	
	
	
</body>
</html>