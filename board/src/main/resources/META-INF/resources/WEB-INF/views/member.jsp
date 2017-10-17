<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/bassets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/bassets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>관리자용</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon"/>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
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
					<li class=""><a href="/board"> <i
							class="ti-view-list-alt"></i>
							<p>전체 글 보기</p>
					</a></li>

					<li class=""><a
						href="/board2"> <i
							class="ti-view-list"></i>
							<p>공유 자료</p>
					</a></li>

					<li class=""><a
						href="/board"> <i
							class="ti-view-list"></i>
							<p>업무일지</p>
					</a></li>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="active"><a href="/Member"> <i class="ti-user"></i>
							<p>회원관리</p>
					</a></li>
					</sec:authorize>
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
					<a class="navbar-brand" href="/board">전체 글 보기</a>
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
								<h4 class="title">회원 정보 보기</h4>
								<p class="category"></p>
							</div>
							<div class="content table-responsive table-full-width">
								<table class="table table-striped">
									<thead>
										<th>번호</th>
										<th>직급</th>
										<th>부서</th>
										<th>이름</th>
										<th>생일</th>
										<th>메일</th>
										<th>번호</th>
										<th>주소</th>
										<th>입사 일자</th>
									</thead>
									<c:forEach var="member" items="${list }"> 
									<tbody>
										<tr>
											<td align="center" width="9%">${member.num }</td>
											<td align="center" width="9%">${member.job_id}</td>
											<td align="center" width="9%">${member.department}</td>
											<td align="center" width="10%"><a>${member.name}</a></td>
											<td align="left" width="12%">${member.birth}</td>
											<td align="center" width="15%">${member.mail}</td>
											<td align="center" width="15%">${member.phone}</td>
											<td align="center" width="15%">${member.address}</td>
											<td align="center" width="20%">${member.hire_date}</td>
											<td>
												<button type="submit" class="btn btn-info btn-fill btn-wd"
													onclick="location='/member/${member.username}'">수정
													하기</button>
											</td>
										</tr>

									</tbody>
									</c:forEach>
								</table>
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td colspan="4" height="5"></td>
									</tr>
									<tr align="center">

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
</body>

<!--   Core JS Files   -->
<script src="/bassets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="/bassets/js/bootstrap.min.js" type="text/javascript"></script>

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
