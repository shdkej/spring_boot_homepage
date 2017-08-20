<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<title>직원용</title>

</head>
<body>

	<%
		session.setAttribute("username", request.getParameter("username"));

		Calendar cal = Calendar.getInstance();

		int year = cal.get(Calendar.YEAR);
		int month1 = cal.get(Calendar.MONTH);
		int month = month1 + 1;
		int date = cal.get(Calendar.DATE);

		String strYear = request.getParameter("year");
		String strMonth = request.getParameter("month");

		if (strYear != null) {
			year = Integer.parseInt(strYear);
			int month2 = Integer.parseInt(strMonth);
			month = month2++;
		}
	%>


	<div class="wrapper">
		<jsp:include page="boardTemplelet.jsp"></jsp:include>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center"><a
						href="<c:url value='/board/daily' />?year=<%=year - 1%>&amp;month=<%=month%>"
						target="_self"> <b>&lt;&lt;</b> <!-- 이전해 -->
					</a> <%
 	if (month > 1) {
 %> <a
						href="<c:url value='/board/daily' />?year=<%=year%>&amp;month=<%=month - 1%>"
						target="_self"> <b>&lt;</b> <!-- 이전달 -->
					</a> <%
 	} else {
 %><a
						href="<c:url value='/board/daily' />?year=<%=year - 1%>&amp;month=<%=month + 11%>"
						target="_self"> <b>&lt;</b> <!-- 이전달 -->
					</a> <%
 	}
 %> &nbsp;&nbsp; <%=year%>년 <%=month%>월 &nbsp;&nbsp; <%
 	if (month < 12) {
 %> <a
						href="<c:url value='/board/daily' />?year=<%=year%>&amp;month=<%=month + 1%>"
						target="_self"> <!-- 다음달 --> <b>&gt;</b>
					</a> <%
 	} else {
 %> <a
						href="<c:url value='/board/daily' />?year=<%=year + 1%>&amp;month=<%=month - 11%>"
						target="_self"> <!-- 다음해 --> <b>&gt;&gt;</b>
					</a> <%
 	}
 %> <a
						href="<c:url value='/board/daily' />?year=<%=year + 1%>&amp;month=<%=month%>"
						target="_self"> <!-- 다음해 --> <b>&gt;&gt;</b>
					</a></td>
				</tr>
			</table>

			<table class="table table-striped">
				<thead class="thide">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</thead>
				<tbody>

					<c:forEach var="board" items="${list}">
						<tr class="trtr">
							<td class="thide" align="center" width="10%">${board.bno }</td>
							<td class="tbold"><a
								href="/board/${board.bno }">${board.subject }</a></td>
							<td align="center" >${board.writer }</td>
							<td align="center" >${board.reg_date }</td>
							<td class="thide" align="center" width="10%">${board.hit }</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td colspan="4" height="5"></td>
				</tr>
				<tr align="center">
					<td><input type=button value="글쓰기"
						onclick="location.href='/board/post'" class="btn"></td>
				</tr>
			</table>
	</div>
</body>


</html>