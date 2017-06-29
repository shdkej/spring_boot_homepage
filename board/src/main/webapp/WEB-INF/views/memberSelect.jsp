<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="login.MemberVO" %>
<%@ page import="login.JDBC_memberDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="dao" class="login.JDBC_memberDAO"></jsp:useBean>
    <%
    ArrayList<MemberVO> list = dao.getMemberlist();
    %>
   
    <h2>Member Info</h2>
    <table>
        <tr bgcolor="pink">
        <th>아이디</th><th>비밀번호</th><th>이름</th><th>성별</th><th>생일</th><th>메일</th><th>번호</th><th>주소</th>
        </tr>
    <%
    for(MemberVO vo : list){
    %> 
        <tr>
            <td><%=vo.getId() %></td>
            <td><%=vo.getPassword() %></td>
            <td><%=vo.getName() %></td>
            <td><%=vo.getGender() %></td>
            <td><%=vo.getBirth() %></td>
            <td><%=vo.getMail() %></td>
            <td><%=vo.getPhone() %></td>
            <td><%=vo.getAddress() %></td>
        </tr>
               
    <%
    }
     %>
    </table>
   



</body>
</html>