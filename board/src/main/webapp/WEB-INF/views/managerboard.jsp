<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sboard.board"%>
<%@ page import="sboard.boardVO"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.Vector"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>관리자용</title>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="assets/css/animate.min.css" rel="stylesheet" />
<!--  Paper Dashboard core CSS    -->
<link href="assets/css/paper-dashboard.css" rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="assets/css/demo.css" rel="stylesheet" />

<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>
	<%
		String checkid = "";
		checkid = (String) session.getAttribute("uid");
		if (checkid == null) {
	%><script>
		alert("직원용 게시판입니다.");
		location.href = "/main.html";
	</script>
	<%
		} else {
	%>
	<div class="wrapper">
		<div class="sidebar" data-background-color="white"
			data-active-color="danger">
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="/main.html" class="simple-text">
						GVM </a>
				</div>

				<ul class="nav">
					<li class="active"><a href="managerboard.jsp"> <i
							class="ti-view-list-alt"></i>
							<p>업무일지</p>
					</a></li>
				</ul>
				<ul class="nav">
					<li><a href="/Member.jsp"> <i
							class="ti-view-list"></i>
							<p>회원관리</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
						<span class="icon-bar bar3"></span>
					</button>
					<a class="navbar-brand" href="managerboard.jsp">업무 일지</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/logout.jsp" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="ti-panel"></i>
								<p>setting</p>
						</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="ti-bell"></i>
								<p class="notification">5</p>
								<p>Notifications</p> <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#">Notification 1</a></li>
								<li><a href="#">Notification 2</a></li>
								<li><a href="#">Notification 3</a></li>
								<li><a href="#">Notification 4</a></li>
								<li><a href="#">Another notification</a></li>
							</ul></li>
						<li><a href="/logout.jsp"> <i class="ti-settings"></i>
								<p>Logout</p>
						</a></li>
					</ul>

				</div>
			</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">업무일지</h4>
									<%long time = (session.getMaxInactiveInterval() - session.getCreationTime());%>
									<p class="category">세션 유지 시간 : <%=time%></p>
								</div>
								<%
									request.setCharacterEncoding("UTF-8");
									session.setMaxInactiveInterval(36000);
									session.setAttribute("uid",checkid);
								%>
								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</thead>
										<tbody>
											<%
												boardVO list = null;

													board Process = board.getInstance();
													Vector lists = Process.BoardView();

													for (int i = 0; i < lists.size(); i++) {
														list = (boardVO) lists.elementAt(i);
											%>
											<tr>

												<td align="center" width="10%"><%=list.getNum()%></td>
												<td align="left" width="50%"><a
													href="Viewboard.jsp?num=<%=list.getNum()%>"><%=list.getTitle()%></a></td>
												<td align="center" width="10%"><%=list.getName()%></td>
												<td align="center" width="15%"><%=list.getDate()%></td>
												<td align="center" width="10%"><%=list.getCount()%></td>
												<td>&nbsp;</td>
											</tr>
											<%
													}
											%>
										</tbody>
									</table>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="4" height="5"></td>
		</tr>
		<tr align="center">
			<td><input type=button value="글쓰기"
				onclick="location='CreateboardView.jsp'"></td>
		</tr>
	</table>
								</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>


	<%
		}
	%>
</body>
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>
</html>