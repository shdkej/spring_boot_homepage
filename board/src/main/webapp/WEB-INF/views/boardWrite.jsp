<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/bassets/img/apple-icon.png">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>직원용</title>

<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.4/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.4/summernote.js"></script>
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
					<a href="/main.html" class="simple-text"> GVM </a>
				</div>

				<ul class="nav">
					<li class="active"><a href="/board"> <i
							class="ti-view-list-alt"></i>
							<p>업무일지</p>
					</a></li>
				</ul>
				<ul class="nav">
					<li><a href="/Member.jsp"> <i class="ti-user"></i>
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
									<p class="category">Daily News</p>
								</div>
								<div class="content table-responsive table-full-width">
										<form action="/board/post" method="POST">

											<table class="table table-striped">
												<tr>
													<td>&nbsp;</td>
													<td>제목</td>
													<td><input name="subject" size="50" maxlength="100"></td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>프로젝트</td>
													<td><input name="writer" size="50" maxlength="50"></td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>내용</td>
													<td><textarea id="editor1" name="content" style="width:100%;height:200px;"></textarea></td>
													<td>&nbsp;</td>
												</tr>
												<tr align="center">
													<td>&nbsp;</td>
													<td colspan="2"><input type="submit" value="등록"">
														<input type=button value="취소"
														OnClick="window.location='/board'" />
													<td>&nbsp;</td>
												</tr>
											</table>
										</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

<script type="text/javascript">
//<![CDATA[
 CKEDITOR.replace( 'editor1',{
	skin:'moono-lisa'		 
 });
//]]>
</script>
</body>
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
