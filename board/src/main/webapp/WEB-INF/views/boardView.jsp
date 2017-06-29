<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/bassets/img/apple-icon.png">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>게시판</title>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon" />
<link href="/bassets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="/bassets/css/animate.min.css" rel="stylesheet" />
<!--  Paper Dashboard core CSS    -->
<link href="/bassets/css/paper-dashboard.css" rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="/bassets/css/demo.css" rel="stylesheet" />

<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="/bassets/css/themify-icons.css" rel="stylesheet">
</head>
<body>
	<div class="wrapper">
		<div class="sidebar" data-background-color="white"
			data-active-color="danger">
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="/" class="simple-text"> GVM </a>
				</div>

				<ul class="nav">
					<li class="active"><a href="managerboard.jsp"> <i
							class="ti-view-list-alt"></i>
							<p>업무일지</p>
					</a></li>
				</ul>
				<ul class="nav">
					<li><a href="/Member.jsp"> <i class="ti-view-list"></i>
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
						<li><a href="/logout"> <i class="ti-settings"></i>
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
									<h4 class="title">업무 일지</h4>
									<p class="category"></p>
								</div>
								<div class="content table-responsive table-full-width">
									<table width="100%" class="table table-striped">
										<tr></tr>
										<tr>

											<td align="left" width="76">제목</td>
											<td width="319">${board.subject }</td>

										</tr>
										<tr>
											<td align="left" width="76">이름</td>
											<td width="319">${board.writer }</td>
										</tr>
										<tr>
											<td align="left" width="76">작성일</td>
											<td width="319">${board.reg_date}</td>

										</tr>
									</table>
									<table width="100%" class="table table-striped">
										<tr>
											<td width="76">&nbsp;</td>
											<td width="319">${board.content }</td>
											<td width="1" colspan="1" height="200">
										</tr>
										<tr align="center">
											<td colspan="2" width="399"><input type=button
												value="글쓰기" onclick="location.href='/board/post'"> <input
												type=button value="목록" onclick="location.href='/board'">
												<input type=button value="수정"
												onclick="location.href='/board/post/${board.bno}'">
												<form:form action="/board/post/${board.bno}" method="DELETE">
													<input type="submit" value="삭제">
												</form:form>
										</tr>
									</table>
									<table>
									<c:forEach var="reply" items="${reply }">
									<tr>
									<td>${reply.r_name }</td>
									<td>&nbsp;</td>
									<td>|</td>
									<td>&nbsp;</td>
									<td>${reply.r_content }</td>
									<td>&nbsp;</td>
									<td>|</td>
									<td>&nbsp;</td>
									<td>${reply.r_date }</td>
									</c:forEach>
									</table>
								<form action="/board/{bno}" >
									<input type="hidden" name="r_name" value="${r_name }"/>
									
								</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="/bassets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="/bassets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="/bassets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="/bassets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="/bassets/js/demo.js"></script>
</html>
