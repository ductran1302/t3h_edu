<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<jsp:useBean id="topmenu" class="neo.smartui.taglib.TreeView"
	scope="session" />
<jsp:useBean id="u" class="neo.velocity.common.ServiceUtility"
	scope="application" />
<jsp:setProperty name="n" property="language"
	value="${not empty param.language ? param.language : 'vi_VN'}" />
<%@ page import="java.util.ArrayList"%>
<%@ page import="neo.velocity.common.ServiceUtility"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="refresh"
	content="<%= session.getMaxInactiveInterval() %>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- FontAwesome 4.3.0 -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons 2.0.0 -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="assets/bootstrap/lte/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="assets/bootstrap/lte/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
<!-- iCheck -->
<link href="assets/bootstrap/plugins/iCheck/flat/blue.css"
	rel="stylesheet" type="text/css" />
<!-- Morris chart -->
<link href="assets/bootstrap/plugins/morris/morris.css" rel="stylesheet"
	type="text/css" />
<!-- jvectormap -->
<link
	href="assets/bootstrap/plugins/jvectormap/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" type="text/css" />
<!-- Date Picker -->
<link href="assets/bootstrap/plugins/datepicker/datepicker3.css"
	rel="stylesheet" type="text/css" />
<!-- Daterange picker -->
<link
	href="assets/bootstrap/plugins/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- bootstrap wysihtml5 - text editor -->
<link
	href="assets/bootstrap/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
	rel="stylesheet" type="text/css" />

<link href="assets/lte/plugins/iCheck/flat/_all.css"
	rel="stylesheet" type="text/css" />
<link href="assets/lte/plugins/iCheck/all.css"
	rel="stylesheet" type="text/css" />	
	
<link href="assets/bootstrap/lte/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<link href="assets/bootstrap/lte/css/skins/skin-blue-light.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="assets/bootstrap/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/bootstrap/plugins/datepicker/datepicker3.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="assets/bootstrap/plugins/icomoon/style.css"
	type="text/css">
<!--LTE-->
<link href="assets/bootstrap/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<script src="assets/bootstrap/plugins/jQuery/jQuery-2.1.4.min.js"
	type="text/javascript"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="assets/bootstrap/lte/js/app.min.js" type="text/javascript"></script>
<script src="assets/bootstrap/plugins/chartjs/Chart.min.js"
	type="text/javascript"></script>
<script
	src="assets/bootstrap/plugins/datepicker/bootstrap-datepicker.js"
	type="text/javascript"></script>

<script type="text/javascript" src="assets/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="assets/ckeditor/adapters/jquery.js"></script>
<script type="text/javascript" src="assets/ckfinder/ckfinder.js"></script>

<!-- phan trang -->
<link rel="stylesheet" type="text/css" media="screen"
	href="style/page_template/page_templates.css" />
<script type="text/javascript"
	src="style/page_template/page_templates.js"></script>
<script src="style/chosen.jquery.min.js" type="text/javascript"></script>
</head>
<body class="skin-blue-light sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
			<a href="index.jsp" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>${n.i18n.app_name_small}</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg">${n.i18n.app_name_large}</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="assets/bootstrap/user.png" class="user-image"
								alt="User Image" /> <span class="hidden-xs"><%=request.getUserPrincipal().getName() %></span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="assets/bootstrap/user.png" class="img-circle"
									alt="User Image" />
									<p>
										<%=request.getUserPrincipal().getName() %>
										- Java Developer <small>Member</small>
									</p></li>
								<li class="user-footer">
									<div class="pull-left">
										<a href="help.jsp" class="btn btn-default btn-flat">Help</a>
									</div>
									<div class="pull-right">
										<a href="logout" class="btn btn-default btn-flat">Sign out</a>
									</div>
								</li>
							</ul></li>
					</ul>
				</div>
				<br></br>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside id="sidebar" class="main-sidebar">
			<div id="dragbar"></div>
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- search form -->
				<form method="GET" class="sidebar-form" name="frmAgent">
					<div class="input-group">
						<input type="text" name="q" class="form-control"
							placeholder="Search..." /> <span class="input-group-btn">
							<button type='submit' name='search' id='search-btn'
								class="btn btn-flat">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- /.search form -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="active treeview menu-open"><a href="#"> <i
							class="fa fa-dashboard"></i> <span>Quản trị hệ thống</span> <span
							class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="listUser.jsp"><i class="fa fa-circle-o"></i>Người
									dùng</a></li>
							<li><a href="changepassword.jsp"><i
									class="fa fa-circle-o"></i>Thay đổi mật khẩu</a></li>
							<li><a href="grant_role.jsp"><i class="fa fa-circle-o"></i>Phân
									quyền người dùng</a></li>
						</ul></li>

					<li class=""><a href="#"> <i class="fa fa-dashboard"></i>
							<span>Quản lý nội dung</span> <span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href=""><i
									class="fa fa-circle-o"></i>Bài viết</a></li>
							<li><a href="listProduct.jsp"><i
									class="fa fa-circle-o"></i>Quản lí sản phẩm</a></li>
							<li><a href=""><i class="fa fa-circle-o"></i>Quản
									lí</a></li>
						</ul></li>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>