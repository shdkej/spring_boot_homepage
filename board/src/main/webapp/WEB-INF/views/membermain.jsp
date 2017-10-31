<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/bassets/img/apple-icon.png">
<link rel="icon" href="/images/favicon.ico" type="image/x-icon" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>관리자용</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
</head>
<body>
<sec:authentication property="principal.username" var="username" />
	<div class="wrapper">
		<jsp:include page="boardTemplelet.jsp"></jsp:include>
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-4 col-md-5">
						<div class="card card-user">
							<div class="image">
								<img src="assets/img/background.jpg" alt="..." />
							</div>
							<div class="content">
								<div class="author">
									<img class="avatar border-white"
										src="assets/img/faces/face-2.jpg" alt="..." />
									<h4 class="title">
										 <br /> <a href="#"><small></small></a>
									</h4>
								</div>
								<p class="description text-center">
									
								</p>
							</div>
							<hr>
							<div class="text-center">
								<div class="row">
									<div class="col-md-3 col-md-offset-1">
										<h5>
											23<br />
											<small>내가 올린 결재</small>
										</h5>
									</div>
									<div class="col-md-4">
										<h5>
											2<br />
											<small>결재 중</small>
										</h5>
									</div>
									<div class="col-md-3">
										<h5>
											24,6$<br />
											<small>결재 완료</small>
										</h5>
									</div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="header">
								<h4 class="title">Team Members</h4>
							</div>
							<div class="content">
								<ul class="list-unstyled team-members">
									<li>
										<div class="row">
											<div class="col-xs-3">
												<div class="avatar">
													<img src="assets/img/faces/face-0.jpg" alt="Circle Image"
														class="img-circle img-no-padding img-responsive">
												</div>
											</div>
											<div class="col-xs-6">
												DJ Khaled <br /> <span class="text-muted"><small>Offline</small></span>
											</div>

											<div class="col-xs-3 text-right">
												<btn class="btn btn-sm btn-success btn-icon">
												<i class="fa fa-envelope"></i></btn>
											</div>
										</div>
									</li>
									<li>
										<div class="row">
											<div class="col-xs-3">
												<div class="avatar">
													<img src="assets/img/faces/face-1.jpg" alt="Circle Image"
														class="img-circle img-no-padding img-responsive">
												</div>
											</div>
											<div class="col-xs-6">
												Creative Tim <br /> <span class="text-success"><small>Available</small></span>
											</div>

											<div class="col-xs-3 text-right">
												<btn class="btn btn-sm btn-success btn-icon">
												<i class="fa fa-envelope"></i></btn>
											</div>
										</div>
									</li>
									<li>
										<div class="row">
											<div class="col-xs-3">
												<div class="avatar">
													<img src="assets/img/faces/face-3.jpg" alt="Circle Image"
														class="img-circle img-no-padding img-responsive">
												</div>
											</div>
											<div class="col-xs-6">
												Flume <br /> <span class="text-danger"><small>Busy</small></span>
											</div>

											<div class="col-xs-3 text-right">
												<btn class="btn btn-sm btn-success btn-icon">
												<i class="fa fa-envelope"></i></btn>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-8 col-md-7">
						<div class="card">
							<div class="header">
								<h4 class="title">My Profile</h4>
							</div>
							<div class="content">
								<form>
									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label>Company</label> <input type="text"
													class="form-control border-input" disabled
													placeholder="Company" value="GVM">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Username</label> <input type="text" readonly="readonly"
													class="form-control border-input"
													placeholder="${user.name }">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="exampleInputEmail1">Email</label>
												${user.mail }<input type="text" readonly="readonly"
													class="form-control border-input"
													placeholder=" ${user.mail}" value="${user.mail }">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>department</label><input type="text" readonly="readonly"
													class="form-control border-input"
													placeholder=" ${user.department }" value="Melbourne, Australia">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>job</label><input type="text" readonly="readonly"
													class="form-control border-input"
													placeholder="Home Address" value="${user.job_id }">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>Address</label> <input type="text" readonly="readonly"
													class="form-control border-input"
													placeholder="Home Address" value="Melbourne, Australia">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label>City</label> <input type="text"
													class="form-control border-input" placeholder="City"
													value="Melbourne">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>Country</label> <input type="text"
													class="form-control border-input" placeholder="Country"
													value="Australia">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>Postal Code</label> <input type="number"
													class="form-control border-input" placeholder="ZIP Code">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>About Me</label>
												<textarea rows="5" class="form-control border-input"
													placeholder="Here can be your description" value="Mike"></textarea>
											</div>
										</div>
									</div>
									<div class="text-center">
										<input type="button" name="signlevel" value="Update Profile" class="btn btn-info btn-fill btn-wd"
							OnClick="window.location='/member/post/${user.username}'" />
									</div>
									<div class="clearfix"></div>
								</form>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
</body>
</html>