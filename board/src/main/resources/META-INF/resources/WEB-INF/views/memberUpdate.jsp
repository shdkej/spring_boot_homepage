<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />

<title>관리자용</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon"/>
</head>
<body>
<jsp:include page="memberTemplelet.jsp"></jsp:include>
	<!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->
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
									<h4 class="title">회원 정보 수정</h4>
									<p class="category">1</p>
								</div>
								<div class="content table-responsive table-full-width">
									<form:form commandName="User" action="/Member/${user.username}"
										method="PATCH">
										<table class="table table-striped" width="50%">
											<tr>
												<td>&nbsp;</td>
												<td>번호</td>
												<td><input name="num" size="50" maxlength="100"
													value="${user.num}" class="form-control border-input"></td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>직급</td>
												<td><select name="job_id" class="ddropdown-select">
														<option value="사원">사원</option>
														<option value="주임">주임</option>
														<option value="대리">대리</option>
														<option value="과장">과장</option>
														<option value="차장">과장</option>
												</select></td>
												</div>

											</tr>

											<tr>
												<td>&nbsp;</td>
												<td>부서</td>
												<td><select name="department" class="ddropdown-select">
														<option value="제어">제어</option>
														<option value="설계">설계</option>
														<option value="제조">제조</option>
														<option value="인사">인사</option>
												</select></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>이름</td>
												<td><input name="name" size="50" maxlength="50"
													class="form-control border-input" value="${user.name}"></td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>생일</td>
												<td><input name="birth" size="50" maxlength="50"
													class="form-control border-input" value="${user.birth}"></td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>메일</td>
												<td><input name="mail" size="50" maxlength="50"
													class="form-control border-input" value="${user.mail}"></td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>번호</td>
												<td><input name="phone" size="50" maxlength="50"
													class="form-control border-input" value="${user.phone}"></td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>주소</td>
												<td><input name="address" size="50" maxlength="50"
													class="form-control border-input" value="${user.address}"></td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>일자</td>
												<td><input name="hire_date" size="50" maxlength="50"
													class="form-control border-input" value="${user.hire_date}"></td>
												<td>&nbsp;</td>
											</tr>

										</table>

										<table width="100%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td colspan="4" height="5"></td>
											</tr>
											<tr align="center">
												<td>
													<button type="submit" class="btn btn-info btn-fill btn-wd">수정
														완료</button>
												</td>
											</tr>

										</table>

									</form:form>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>

</html>
