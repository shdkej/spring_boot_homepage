<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="login.JDBC_memberDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="vvo" class="login.MemberVO"></jsp:useBean>
	<jsp:setProperty property="*" name="vvo" />
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		JDBC_memberDAO dao = JDBC_memberDAO.getInstance();
		int up = dao.updateMember(vvo, num);
		if(up>0){
			%><script>
			alert("수정 완료");
			location.href = "member.jsp";
		</script><%
		}else{
			%><script>
			alert("내용을 확인 해 주십시오.");
			location.href = "member.jsp";
		</script><%
		}
	%>

</body>
</html>