<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Elomoas - Online Course and LMS HTML Template</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/view/sociala/css/themify-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/view/sociala/css/feather.css">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/view/sociala/images/favicon.png">
<!-- Custom Stylesheet -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/view/sociala/css/style.css">



</head>

<body class="color-theme-blue">

	<div class="preloader"></div>

	<div class="main-wrap">

		<div class="nav-header bg-transparent shadow-none border-0">
			<div class="nav-top w-100">
				<a href="index.html"><i
					class="feather-zap text-success display1-size me-2 ms-0"></i><span
					class="d-inline-block fredoka-font ls-3 fw-600 text-current font-xxl logo-text mb-0">Sociala.
				</span> </a> <a href="#" class="mob-menu ms-auto me-2 chat-active-btn"><i
					class="feather-message-circle text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
				<a href="default-video.html" class="mob-menu me-2"><i
					class="feather-video text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
				<a href="#" class="me-2 menu-search-icon mob-menu"><i
					class="feather-search text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
				<button class="nav-menu me-0 ms-2"></button>

				<a href="login.jsp"
					class="header-btn d-none d-lg-block bg-dark fw-500 text-white font-xsss p-3 ms-auto w100 text-center lh-20 rounded-xl">Login</a>
				<a href="register.jsp"
					class="header-btn d-none d-lg-block bg-current fw-500 text-white font-xsss p-3 ms-2 w100 text-center lh-20 rounded-xl">Register</a>

			</div>


		</div>

		<div class="row">
			<div
				class="col-xl-5 d-none d-xl-block p-0 vh-100 bg-image-cover bg-no-repeat"
				style="background-image: url(images/login-bg.jpg);"></div>
			<div
				class="col-xl-7 vh-100 align-items-center d-flex bg-white rounded-3 overflow-hidden">
				<div class="card shadow-none border-0 ms-auto me-auto login-card">
					<div class="card-body rounded-0 text-left">
						<h2 class="fw-700 display1-size display2-md-size mb-3">
							Login into <br>your account
						</h2>
						<form action="/ALOHCMUTE/login" method="post">

							<div class="form-group icon-input mb-3">
								<i class="font-sm ti-email text-grey-500 pe-0"></i> <input
									type="text" name="email"
									class="style2-input ps-5 form-control text-grey-900 font-xsss fw-600"
									placeholder="Your Email Address">
							</div>
							<div class="form-group icon-input mb-1">
								<input type="Password" name="password"
									class="style2-input ps-5 form-control text-grey-900 font-xss ls-3"
									placeholder="Password"> <i
									class="font-sm ti-lock text-grey-500 pe-0"></i>
							</div>
							<div class="form-check text-left mb-3">
								<input type="checkbox" class="form-check-input mt-2"
									id="exampleCheck5"> <label
									class="form-check-label font-xsss text-grey-500"
									for="exampleCheck5">Remember me</label> <a href="forgot.html"
									class="fw-600 font-xsss text-grey-700 mt-1 float-right">Forgot
									your Password?</a>
							</div>
							<div class="form-group mb-1">
								<button type="submit"
									class="form-control text-center style2-input text-white fw-600 bg-dark border-0 p-0">
									Login</button>
							</div>
							<c:if test="${loginFailed}">
								<div class="alert alert-danger" role="alert">Incorrect
									username or password. Please try again.</div>
							</c:if>
						</form>

						<div class="col-sm-12 p-0 text-left">

							<h6 class="text-grey-500 font-xsss fw-500 mt-0 mb-0 lh-32">
								Dont have account <a href="register.jsp" class="fw-700 ms-1">Register</a>
							</h6>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>




	<script src="<%=request.getContextPath()%>/view/sociala/js/plugin.js"></script>
	<script src="<%=request.getContextPath()%>/view/sociala/js/scripts.js"></script>

</body>


<!-- Mirrored from uitheme.net/sociala/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Nov 2023 14:44:42 GMT -->
</html>