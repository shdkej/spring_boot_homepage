<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="login.JDBC_memberDAO"%>
<%@ page import="login.MemberVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="sboard/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="sboard/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>관리자용</title>
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="sboard/assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="sboard/assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="sboard/assets/css/paper-dashboard.css" rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="sboard/assets/css/demo.css" rel="stylesheet" />

<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="sboard/assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		JDBC_memberDAO dao = JDBC_memberDAO.getInstance();
	int num =Integer.parseInt(request.getParameter("num"));
		ArrayList<MemberVO> list = (ArrayList)dao.getMemberlist();
		MemberVO vo = null;
		vo=(MemberVO)list.get(num);
	%>
		<!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->
	<div class="wrapper">
		<div class="sidebar" data-background-color="white"
			data-active-color="danger">
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="/main.html" class="simple-text">
						GVM </a>
				</div>

				<ul class="nav">
					<li><a href="board.jsp"> <i
							class="ti-view-list"></i>
							<p>업무일지</p>
					</a></li>
				</ul>
				<ul class="nav">
					<li class="active"><a href="/member.jsp"> <i
							class="ti-view-list-alt"></i>
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
					<a class="navbar-brand" href="board.jsp">관리자 메뉴</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="logout.jsp" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="ti-panel"></i>
								<p>Logout</p>
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
						<li><a href="#"> <i class="ti-settings"></i>
								<p>Settings</p>
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
								<h4 class="title">회원 정보 수정</h4>
								<p class="category">1</p>
							</div>
							<div class="content table-responsive table-full-width">
							<form method = "post" action="Updatemember.jsp?num=<%=vo.getNum()%>" >
								<table class="table table-striped">
								 
									<thead>
										<th>번호</th>
										<th>부서</th>
										<th>직급</th>
										<th>이름</th>
										<th>생일</th>
										<th>메일</th>
										<th>번호</th>
										<th>주소</th>
										<th>입사 일자</th>
									</thead>
									<tbody>
										<tr>
											<td align="center" width="10%" value="num"><%=vo.getNum()%></td>
											<td>
													<il> <select name="job_id" appearance:none;>
														<option value="사원">사원</option>
														<option value="주임">주임</option>
														<option value="대리">대리</option>
														<option value="과장">과장</option>
														<option value="차장">과장</option>
													</select> </il></td>
													<td>
													<il> <select name="department_id">
														<option value="제어">제어</option>
														<option value="설계">설계</option>
														<option value="제조">제조</option>
														<option value="인사">인사</option>
													</select> </il>
											</td>
												<td align="center" width="20%"><input
												type="text" name="name" class="form-control border-input"
												disabled placeholder="Company" value="<%=vo.getName()%>"></td>
											<td align="left" width="10%"><a><input
													type="text" name="birth" class="form-control border-input"
													placeholder="Username" value="<%=vo.getBirth()%>"></a></td>
											<td align="center" width="20%"><input type="text"
												class="form-control border-input" name="mail"
												placeholder="<%=vo.getMail()%>"></td>
											<td align="center" width="15%"><input type="text" name="phone"
												class="form-control border-input"
												placeholder="<%=vo.getPhone()%>"></td>
											<td align="center" width="20%"><input type="text" name="address"
												class="form-control border-input"
												placeholder="<%=vo.getAddress()%>"></td>
											<td align="center" width="15%"><input type="text" name="hire_date"
												class="form-control border-input"
												placeholder="<%=vo.getHire_date()%>"></td>
											
										</tr>
									</tbody>
								</table>
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td colspan="4" height="5"></td>
									</tr>
									<tr align="center">
											<td>
											<button type="submit" class="btn btn-info btn-fill btn-wd">수정 완료</button></td>
									</tr>
									</form>
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
<script src="sboard/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="sboard/assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="sboard/assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="sboard/assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="sboard/assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="sboard/assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="sboard/assets/js/demo.js"></script>

</html>
