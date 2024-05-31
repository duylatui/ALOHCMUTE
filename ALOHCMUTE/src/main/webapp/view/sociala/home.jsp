<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from uitheme.net/sociala/default.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Nov 2023 14:30:43 GMT -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ALOHCMUTE - Nhom 3</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/view/sociala/css/themify-icons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/view/sociala/css/feather.css">


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/view/sociala/css/comment.css">

<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/view/sociala/images/favicon.png">

<!-- Custom Stylesheet -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/view/sociala/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/view/sociala/css/emoji.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/view/sociala/css/lightbox.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<style>
.edit-post-content {
	display: none;
}
</style>
<style>
.liked {
	color: red; /* Change color or add a specific style for liked state */
}
</style>
</head>

<body class="color-theme-blue mont-font">

	<div class="preloader"></div>


	<div class="main-wrapper">

		<!-- navigation top-->
		<div class="nav-header bg-white shadow-xs border-0">
			<div class="nav-top">
				<a href="/ALOHCMUTE/home"><i
					class="feather-zap text-success display1-size me-2 ms-0"></i><span
					class="d-inline-block fredoka-font ls-3 fw-600 text-current font-xxl logo-text mb-0">ALOHCMUTE</span>
				</a> <a href="#" class="mob-menu ms-auto me-2 chat-active-btn"><i
					class="feather-message-circle text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
				<a href="default-video.html" class="mob-menu me-2"><i
					class="feather-video text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
				<a href="#" class="me-2 menu-search-icon mob-menu"><i
					class="feather-search text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
				<button class="nav-menu me-0 ms-2"></button>
			</div>

			<form action="#" class="float-left header-search">
				<div class="form-group mb-0 icon-input">
					<i class="feather-search font-sm text-grey-400"></i> <input
						type="text" placeholder="Start typing to search.."
						class="bg-grey border-0 lh-32 pt-2 pb-2 ps-5 pe-3 font-xssss fw-500 rounded-xl w350 theme-dark-bg">
				</div>
			</form>
			<a href="/ALOHCMUTE/home"
				class="p-2 text-center ms-3 menu-icon center-menu-icon"><i
				class="feather-home font-lg alert-primary btn-round-lg theme-dark-bg text-current "></i></a>


			<a href="#" class="p-2 text-center ms-auto menu-icon"
				id="dropdownMenu3" data-bs-toggle="dropdown" aria-expanded="false"><span
				class="dot-count bg-warning"></span><i
				class="feather-bell font-xl text-current"></i></a>
			<div
				class="dropdown-menu dropdown-menu-end p-4 rounded-3 border-0 shadow-lg"
				aria-labelledby="dropdownMenu3">

				<h4 class="fw-700 font-xss mb-4">Notification</h4>
				<div class="card bg-transparent-card w-100 border-0 ps-5 mb-3">
					<img
						src="<%=request.getContextPath()%>/view/sociala/images/user-8.png"
						alt="user" class="w40 position-absolute left-0">
					<h5 class="font-xsss text-grey-900 mb-1 mt-0 fw-700 d-block">
						Hendrix Stamp <span
							class="text-grey-400 font-xsssss fw-600 float-right mt-1">
							3 min</span>
					</h5>
					<h6 class="text-grey-500 fw-500 font-xssss lh-4">There are
						many variations of pass..</h6>
				</div>
				<div class="card bg-transparent-card w-100 border-0 ps-5 mb-3">
					<img src="images/user-4.png" alt="user"
						class="w40 position-absolute left-0">
					<h5 class="font-xsss text-grey-900 mb-1 mt-0 fw-700 d-block">
						Goria Coast <span
							class="text-grey-400 font-xsssss fw-600 float-right mt-1">
							2 min</span>
					</h5>
					<h6 class="text-grey-500 fw-500 font-xssss lh-4">Mobile Apps
						UI Designer is require..</h6>
				</div>

				<div class="card bg-transparent-card w-100 border-0 ps-5 mb-3">
					<img src="images/user-7.png" alt="user"
						class="w40 position-absolute left-0">
					<h5 class="font-xsss text-grey-900 mb-1 mt-0 fw-700 d-block">
						Surfiya Zakir <span
							class="text-grey-400 font-xsssss fw-600 float-right mt-1">
							1 min</span>
					</h5>
					<h6 class="text-grey-500 fw-500 font-xssss lh-4">Mobile Apps
						UI Designer is require..</h6>
				</div>
				<div class="card bg-transparent-card w-100 border-0 ps-5">
					<img src="images/user-6.png" alt="user"
						class="w40 position-absolute left-0">
					<h5 class="font-xsss text-grey-900 mb-1 mt-0 fw-700 d-block">
						Victor Exrixon <span
							class="text-grey-400 font-xsssss fw-600 float-right mt-1">
							30 sec</span>
					</h5>
					<h6 class="text-grey-500 fw-500 font-xssss lh-4">Mobile Apps
						UI Designer is require..</h6>
				</div>
			</div>
			<a href="chat?userid=${id}"
				class="p-2 text-center ms-3 menu-icon chat-active-btn"><i
				class="feather-message-square font-xl text-current"></i></a>
			<div
				class="p-2 text-center ms-3 position-relative dropdown-menu-icon menu-icon cursor-pointer">
				<i
					class="feather-settings animation-spin d-inline-block font-xl text-current"></i>
				<div class="dropdown-menu-settings switchcolor-wrap">
					<h4 class="fw-700 font-sm mb-4">Settings</h4>
					<h6 class="font-xssss text-grey-500 fw-700 mb-3 d-block">Choose
						Color Theme</h6>
					<ul>
						<li><label class="item-radio item-content"> <input
								type="radio" name="color-radio" value="red" checked=""><i
								class="ti-check"></i> <span class="circle-color bg-red"
								style="background-color: #ff3b30;"></span>
						</label></li>
						<li><label class="item-radio item-content"> <input
								type="radio" name="color-radio" value="green"><i
								class="ti-check"></i> <span class="circle-color bg-green"
								style="background-color: #4cd964;"></span>
						</label></li>
						<li><label class="item-radio item-content"> <input
								type="radio" name="color-radio" value="blue" checked=""><i
								class="ti-check"></i> <span class="circle-color bg-blue"
								style="background-color: #132977;"></span>
						</label></li>
						<li><label class="item-radio item-content"> <input
								type="radio" name="color-radio" value="pink"><i
								class="ti-check"></i> <span class="circle-color bg-pink"
								style="background-color: #ff2d55;"></span>
						</label></li>
						<li><label class="item-radio item-content"> <input
								type="radio" name="color-radio" value="yellow"><i
								class="ti-check"></i> <span class="circle-color bg-yellow"
								style="background-color: #ffcc00;"></span>
						</label></li>
						<li><label class="item-radio item-content"> <input
								type="radio" name="color-radio" value="orange"><i
								class="ti-check"></i> <span class="circle-color bg-orange"
								style="background-color: #ff9500;"></span>
						</label></li>
						<li><label class="item-radio item-content"> <input
								type="radio" name="color-radio" value="gray"><i
								class="ti-check"></i> <span class="circle-color bg-gray"
								style="background-color: #8e8e93;"></span>
						</label></li>

						<li><label class="item-radio item-content"> <input
								type="radio" name="color-radio" value="brown"><i
								class="ti-check"></i> <span class="circle-color bg-brown"
								style="background-color: #D2691E;"></span>
						</label></li>
						<li><label class="item-radio item-content"> <input
								type="radio" name="color-radio" value="darkgreen"><i
								class="ti-check"></i> <span class="circle-color bg-darkgreen"
								style="background-color: #228B22;"></span>
						</label></li>
						<li><label class="item-radio item-content"> <input
								type="radio" name="color-radio" value="deeppink"><i
								class="ti-check"></i> <span class="circle-color bg-deeppink"
								style="background-color: #FFC0CB;"></span>
						</label></li>
						<li><label class="item-radio item-content"> <input
								type="radio" name="color-radio" value="cadetblue"><i
								class="ti-check"></i> <span class="circle-color bg-cadetblue"
								style="background-color: #5f9ea0;"></span>
						</label></li>
						<li><label class="item-radio item-content"> <input
								type="radio" name="color-radio" value="darkorchid"><i
								class="ti-check"></i> <span class="circle-color bg-darkorchid"
								style="background-color: #9932cc;"></span>
						</label></li>
					</ul>

					<div class="card bg-transparent-card border-0 d-block mt-3">
						<h4 class="d-inline font-xssss mont-font fw-700">Header
							Background</h4>
						<div class="d-inline float-right mt-1">
							<label class="toggle toggle-menu-color"><input
								type="checkbox"><span class="toggle-icon"></span></label>
						</div>
					</div>
					<div class="card bg-transparent-card border-0 d-block mt-3">
						<h4 class="d-inline font-xssss mont-font fw-700">Menu
							Position</h4>
						<div class="d-inline float-right mt-1">
							<label class="toggle toggle-menu"><input type="checkbox"><span
								class="toggle-icon"></span></label>
						</div>
					</div>
					<div class="card bg-transparent-card border-0 d-block mt-3">
						<h4 class="d-inline font-xssss mont-font fw-700">Dark Mode</h4>
						<div class="d-inline float-right mt-1">
							<label class="toggle toggle-dark"><input type="checkbox"><span
								class="toggle-icon"></span></label>
						</div>
					</div>

				</div>
			</div>


			<a href="/ALOHCMUTE/view/sociala/default-settings.jsp"
				class="p-0 ms-3 menu-icon"><img src="${sessionScope.AvatarURL}"
				alt="user" class="w40 mt--1"></a>

		</div>
		<!-- navigation top -->

		<!-- navigation left -->
		<nav class="navigation scroll-bar">
			<div class="container ps-0 pe-0">
				<div class="nav-content">


					<div
						class="nav-wrap bg-white bg-transparent-card rounded-xxl shadow-xss pt-3 pb-1 mb-2 mt-2">
						<div class="nav-caption fw-600 font-xssss text-grey-500">
							<span>New </span>Feeds
						</div>
						<ul class="mb-1 top-content">
							<li class="logo d-none d-xl-block d-lg-block"></li>
							<li><a href="chat?userid=${id}"
								class="nav-content-bttn open-font"><i
									class="feather-tv btn-round-md bg-blue-gradiant me-3"></i><span>Chat</span></a></li>

							<li><a href="default-group.html"
								class="nav-content-bttn open-font"><i
									class="feather-zap btn-round-md bg-mini-gradiant me-3"></i><span>Popular
										Groups</span></a></li>
							<li><a href="/ALOHCMUTE/user-page?userid=${sessionScope.userID}"
								class="nav-content-bttn open-font"><i
									class="feather-user btn-round-md bg-primary-gradiant me-3"></i><span>Author
										Profile </span></a></li>
						</ul>
					</div>
					<div
						class="section full pe-3 ps-4 pt-4 position-relative feed-body">
						<h4 class="font-xsssss text-grey-500 text-uppercase fw-700 ls-3">CONTACTS</h4>

						<ul class="list-group list-group-flush">
							<c:forEach var="i" items="${listfriend}">
								<li
									class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
									<figure class="avatar float-left mb-0 me-2">
										<img src="${i.avatarURL}" alt="image" class="w35">
									</figure>
									<h3 class="fw-700 mb-0 mt-0">
										<a
											class="font-xssss text-grey-600 d-block text-dark "
											href="user-page?userid=${i.userID}">${i.userName}</a>
									</h3> <span class="bg-success ms-auto btn-round-xss"></span>
								</li>
							</c:forEach>

						</ul>

					</div>
				</div>
			</div>
		</nav>
		<!-- navigation left -->
		<!-- main content -->
		<div class="main-content right-chat-active">

			<div class="middle-sidebar-bottom">
				<div class="middle-sidebar-left">
					<!-- loader wrapper -->
					<div class="preloader-wrap p-3">
						<div class="box shimmer">
							<div class="lines">
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
							</div>
						</div>
						<div class="box shimmer mb-3">
							<div class="lines">
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
							</div>
						</div>
						<div class="box shimmer">
							<div class="lines">
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
							</div>
						</div>
					</div>
					<!-- loader wrapper -->
					<div class="row feed-body">

						<div class="col-xl-8 col-xxl-9 col-lg-8">

							<div
								class="card w-100 shadow-xss rounded-xxl border-0 ps-4 pt-4 pe-4 pb-3 mb-3">
								<div class="card-body p-0">
									<a href="#"
										class="font-xssss fw-600 text-grey-500 card-body p-0 d-flex align-items-center">
										<i
										class="btn-round-sm font-xs text-primary feather-edit-3 me-2 bg-greylight"></i>Create
										Post
									</a>
								</div>
								<div class="card-body p-0 mt-3 position-relative">
									<figure class="avatar position-absolute ms-2 mt-1 top-5">
										<img src="${sessionScope.AvatarURL}" alt="ảnh"
											class="shadow-sm rounded-circle w30">
									</figure>
									<form action="/ALOHCMUTE/insertPost" method="post"
										enctype="multipart/form-data">
										<!-- Thay "dia_chi_xu_ly_form" bằng địa chỉ thực xử lý form -->
										<input type="text" name="content"
											class="h100 bor-0 w-100 rounded-xxl p-2 ps-5 font-xssss text-grey-500 fw-500 border-light-md theme-dark-bg"
											cols="30" rows="10" placeholder="Bạn đang nghĩ gì?">
										<div class="card-body d-flex p-0 mt-0">
											<label for="fileInput"
												class="d-flex align-items-center font-xssss fw-600 ls-1 text-grey-700 text-dark pe-4">
												<i class="font-md text-success feather-image me-2"></i> <span
												class="d-none-xs">Photo/Video</span>
											</label> <input type="file" id="fileInput" name="imageVideoURL"
												class="d-none"> <a href="#" class="ms-auto"
												id="dropdownMenu4" data-bs-toggle="dropdown"
												aria-expanded="false"><i
												class="ti-more-alt text-grey-900 btn-round-md bg-greylight font-xss"></i></a>
											<div
												class="dropdown-menu dropdown-menu-start p-4 rounded-xxl border-0 shadow-lg"
												aria-labelledby="dropdownMenu4">
												<div class="card-body p-0 d-flex">
													<i class="feather-bookmark text-grey-500 me-3 font-lg"></i>
													<h4 class="fw-600 text-grey-900 font-xssss mt-0 me-4">
														Save Link <span
															class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Add
															this to your saved items</span>
													</h4>
												</div>
												<div class="card-body p-0 d-flex mt-2">
													<i class="feather-alert-circle text-grey-500 me-3 font-lg"></i>
													<h4 class="fw-600 text-grey-900 font-xssss mt-0 me-4">
														Hide Post <span
															class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Save
															to your saved items</span>
													</h4>
												</div>
												<div class="card-body p-0 d-flex mt-2">
													<i class="feather-alert-octagon text-grey-500 me-3 font-lg"></i>
													<h4 class="fw-600 text-grey-900 font-xssss mt-0 me-4">
														Hide all from Group <span
															class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Save
															to your saved items</span>
													</h4>
												</div>
												<div class="card-body p-0 d-flex mt-2">
													<i class="feather-lock text-grey-500 me-3 font-lg"></i>
													<h4 class="fw-600 mb-0 text-grey-900 font-xssss mt-0 me-4">
														Unfollow Group <span
															class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Save
															to your saved items</span>
													</h4>
												</div>
											</div>
										</div>
										<button type="submit"
											class="form-control text-center style2-input text-white fw-600 bg-dark border-0 p-0">Post</button>
									</form>


								</div>

							</div>

							<!-- hhh -->


							<!--create post-->
							<!--post 1 -->
							<c:forEach var="i" items="${listpost}">
								<div class="card w-100 shadow-xss rounded-xxl border-0 p-4 mb-3"
									data-post-id="post_${i.postID}">
									<div
										class="card w-100 shadow-xss rounded-xxl border-0 p-4 mb-3">
										<div class="card-body p-0 d-flex">
											<figure class="avatar me-3">
												<img src="${i.user.avatarURL}" alt="image"
													class="shadow-sm rounded-circle w45">
											</figure>
											<h4 class="fw-700 text-grey-900 font-xssss mt-1">${i.user.userName}<span
													class="d-block font-xssss fw-500 mt-1 lh-3 text-grey-500">${i.postTime}</span>
											</h4>
											<a href="#" class="ms-auto" id="dropdownMenu2"
												data-bs-toggle="dropdown" aria-expanded="false"><i
												class="ti-more-alt text-grey-900 btn-round-md bg-greylight font-xss"></i></a>
											<div
												class="dropdown-menu dropdown-menu-end p-4 rounded-xxl border-0 shadow-lg"
												aria-labelledby="dropdownMenu2">


												<c:if test="${i.user.userID eq sessionScope.userID}">
													<div class="card-body p-0 d-flex mt-2">
														<i class="feather-alert-circle text-grey-500 me-3 font-lg"></i>
														<h4 class="fw-600 text-grey-900 font-xssss mt-0 me-4">
															Edit Post <span
																class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Edit
																your post</span>
														</h4>

													</div>
												</c:if>
												<c:if test="${i.user.userID eq sessionScope.userID}">
													<div class="middle-sidebar-left"
														id="editPostForm${i.postID}">
														<div class="middle-wrap">
															<div
																class="card w-100 border-0 bg-white shadow-xs p-0 mb-4">
																<div
																	class="card-body p-4 w-100 bg-current border-0 d-flex rounded-3">
																	<a href="default-settings.html"
																		class="d-inline-block mt-2"><i
																		class="ti-arrow-left font-sm text-white"></i></a>
																	<h4 class="font-xs text-white fw-600 ms-4 mb-0 mt-2">Post
																		Details</h4>
																</div>
																<div class="card-body p-lg-5 p-4 w-100 border-0 ">
																	<div class="row justify-content-center">
																		<div class="col-lg-4 text-center">
																			<figure class="avatar ms-auto me-auto mb-0 mt-2 w100">
																				<img src="${sessionScope.AvatarURL}" alt="image"
																					class="shadow-sm rounded-3 w-100">
																			</figure>
																			<h2 class="fw-700 font-sm text-grey-900 mt-3">${sessionScope.UserName}</h2>
																			<h4 class="text-grey-500 fw-500 mb-3 font-xsss mb-4">${sessionScope.userEmail}</h4>
																			<!-- <a href="#" class="p-3 alert-primary text-primary font-xsss fw-500 mt-2 rounded-3">Upload New Photo</a> -->
																		</div>
																	</div>

																	<form action="/ALOHCMUTE/updatePost" method="post"
																		enctype="multipart/form-data">

																		<input type="hidden" name="postID" value="${i.postID}">
																		<div class="row">

																			<div class="col-lg-6 mb-3">
																				<div class="form-group">
																					<label class="mont-font fw-600 font-xsss">Content</label>
																					<input type="text" name="content"
																						value="${i.content}" class="form-control">
																				</div>
																			</div>
																			<div class="col-lg-12 mb-3">
																				<!-- Hiển thị ảnh của bài đăng -->
																				<img src="${i.imageVideoURL}" alt="Post Image"
																					class="w-100 rounded-3">
																			</div>
																		</div>

																		<div class="row">


																			<div class="col-lg-12 mb-3">
																				<div class="card mt-3 border-0">
																					<div
																						class="card-body d-flex justify-content-between align-items-end p-0">
																						<div class="form-group mb-0 w-100">
																							<label for="file">Choose File:</label> <input
																								type="file" name="imageVideoURL"
																								id="imageVideoURL" required>
																						</div>
																					</div>
																				</div>
																			</div>

																			<div class="col-lg-12">
																				<button type="submit"
																					class="bg-current text-center text-white font-xsss fw-600 p-3 w175 rounded-3 d-inline-block">Update</button>
																			</div>


																		</div>

																	</form>
																</div>
															</div>
														</div>
													</div>
												</c:if>
											</div>




										</div>
										<div class="card-body p-0 me-lg-5">
											<p class="fw-500 text-grey-500 lh-26 font-xssss w-100">
												${i.content}<a href="#" class="fw-600 text-primary ms-2">See
													more</a>
											</p>
										</div>
										<div class="card-body d-block p-0">
											<div class="row ps-2 pe-2 justify-content-center">
												<div class="col-xs-4 col-sm-4 p-1 text-center">
													<a href="${i.imageVideoURL}" data-lightbox="roadtrip">
														<img src="${i.imageVideoURL}" class="rounded-3 w-100"
														alt="image">
													</a>
												</div>
											</div>

										</div>
										<div class="card-body d-flex p-0 mt-3">
											<a href="#" id="likeButton"
												class="emoji-bttn d-flex align-items-center fw-600 text-grey-900 text-dark lh-26 font-xssss me-2">
												<i
												class="feather-thumbs-up text-white bg-primary-gradiant me-1 btn-round-xs font-xss"></i>
												<i
												class="feather-heart text-white bg-red-gradiant me-2 btn-round-xs font-xss"></i>
												<span id="likeCount">0</span> Like <!-- Initialize with 0 likes -->
											</a>
											<div class="emoji-wrap">
												<ul class="emojis list-inline mb-0">
													<li class="emoji list-inline-item"><i
														class="em em---1"></i></li>
													<li class="emoji list-inline-item"><i
														class="em em-angry"></i></li>
													<li class="emoji list-inline-item"><i
														class="em em-anguished"></i></li>
													<li class="emoji list-inline-item"><i
														class="em em-astonished"></i></li>
													<li class="emoji list-inline-item"><i
														class="em em-blush"></i></li>
													<li class="emoji list-inline-item"><i
														class="em em-clap"></i></li>
													<li class="emoji list-inline-item"><i
														class="em em-cry"></i></li>
													<li class="emoji list-inline-item"><i
														class="em em-full_moon_with_face"></i></li>
												</ul>
											</div>
											<!-- Add this attribute to the comment button -->

											<a href="/ALOHCMUTE/listComment?postid=${i.postID}"
												onclick="listComment(event);" data-postid="${i.postID}"
												class="d-flex align-items-center fw-600 text-grey-900 text-dark lh-26 font-xssss">
												<i
												class="feather-message-circle text-dark text-grey-900 btn-round-sm font-lg"></i>
												<span class="d-none-xss">Comment</span>
											</a>
										</div>
									</div>

									<div id="comment">
										<!-- Comment List -->
										<div hidden class="cm" aria-label="Viết bình luận"
											contenteditable="true" role="textbox" spellcheck="true">
											<div data-contents="true">
												<div class="" data-block="true" data-editor="bnm76"
													data-offset-key="29s3j-0-0"></div>
											</div>
										</div>

										<div class="comment-form">
											<form id="commentForm" action="/ALOHCMUTE/addComment"
												method="post" enctype="multipart/form-data">
												<input type="hidden" name="postID" value="${i.postID}">
												<div class="content">
													<input type="text" name="content" id="content"
														placeholder="Viết bình luận">
												</div>
												<button class="btn-comment" type="submit">
													<svg viewBox='0 0 240 240' fill='none'>
                    <path d='M 230 120 L 10 10 L 50 120 L 10 230 Z' />
                </svg>
												</button>
											</form>
										</div>


										<c:forEach var="comment"
											items="${sessionScope.sortedComments}">
											<!-- Check if the comment belongs to the current post -->
											<c:if test="${comment.post.postID eq i.postID}">

												<div class="comment-list">
													<!-- Your existing code to display comments -->
													<div class="comment">

														<div class="cmt">
															<div class="cmt-avt">
																<img src="${comment.user.avatarURL}" alt="">
															</div>
															<div class="cmt-right">
																<div class="cmt-box">
																	<h2 class="name">
																		<a href="#"
																			class="fw-700 text-grey-900 font-xssss mt-0 mb-1">${comment.user.userName}</a>
																	</h2>
																	<div class="cmt-content">${comment.content}</div>
																</div>
																<div class="cmt-footer">
																	<div class="timeamp">${comment.commentTime}</div>

																	<c:if
																		test="${comment.user.userID eq sessionScope.userID}">

																		<a
																			href="/ALOHCMUTE/deleteComment?commentID=${comment.commentID}&postid=${comment.post.postID}"
																			class="d-flex align-items-center fw-600 text-grey-900 text-dark lh-26 font-xssss">

																			<span class="d-none-xss">delete</span>
																		</a>
																	</c:if>
																</div>
															</div>
														</div>

													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:forEach>

							<!--post 1 -->


							<div
								class="card w-100 text-center shadow-xss rounded-xxl border-0 p-4 mb-3 mt-3">
								<div class="snippet mt-2 ms-auto me-auto"
									data-title=".dot-typing">
									<div class="stage">
										<div class="dot-typing"></div>
									</div>
								</div>
							</div>
						</div>
						<!--friend request -->
						<div class="col-xl-4 col-xxl-3 col-lg-4 ps-lg-0">
							<div class="card w-100 shadow-xss rounded-xxl border-0 mb-3">
								<div class="card-body d-flex align-items-center p-4">
									<h4 class="fw-700 mb-0 font-xssss text-grey-900">Friend
										Request</h4>
									<a href="/ALOHCMUTE/listfriend"
										class="fw-600 ms-auto font-xssss text-primary">See all</a>
								</div>
								<c:forEach var="i" items="${listfriendrequest}"
									varStatus="loopStatus">
									<c:if test="${loopStatus.index < 3}">
										<div
											class="card-body d-flex pt-4 ps-4 pe-4 pb-0 border-top-xs bor-0">
											<figure class="avatar me-3">
												<img src="${i.user1.avatarURL}" alt="image"
													class="shadow-sm rounded-circle w45">
											</figure>
											<h4 class="fw-700 text-grey-900 font-xssss mt-1">${i.user1.userName}<span
													class="d-block font-xssss fw-500 mt-1 lh-3 text-grey-500">12
													mutual friends</span>
											</h4>
										</div>
										<div
											class="card-body d-flex align-items-center pt-0 ps-4 pe-4 pb-4">
											<a
												href="home/confirm?userid=${i.user1.userID}&requestid=${i.requestID}"
												class="p-2 lh-20 w100 bg-primary-gradiant me-2 text-white text-center font-xssss fw-600 ls-1 rounded-xl">Confirm</a>
											<a href="home/delete?requestid=${i.requestID}"
												class="p-2 lh-20 w100 bg-grey text-grey-800 text-center font-xssss fw-600 ls-1 rounded-xl">Delete</a>
										</div>
									</c:if>
								</c:forEach>




							</div>

							<div class="card w-100 shadow-xss rounded-xxl border-0 p-0 ">
								<div class="card-body d-flex align-items-center p-4 mb-0">
									<h4 class="fw-700 mb-0 font-xssss text-grey-900">Confirm
										Friend</h4>
									<a href="/ALOHCMUTE/listfriend"
										class="fw-600 ms-auto font-xssss text-primary">See all</a>
								</div>
								<c:forEach var="i" items="${listConfirm}" varStatus="loopStatus">
									<c:set var="isInList" value="false" />
									<c:if test="${loopStatus.index < 5}">
										<div
											class="card-body bg-transparent-card d-flex p-3 bg-greylight m-3 rounded-3">
											<figure class="avatar me-2 mb-0">
												<img src="${i.avatarURL}" alt="image"
													class="shadow-sm rounded-circle w45">
											</figure>
											<h4 class="fw-700 text-grey-900 font-xssss mt-2">
												${i.userName}<span
													class="d-block font-xssss fw-500 mt-1 lh-3 text-grey-500">
													mutual friends</span>
											</h4>
											<c:forEach var="i2" items="${listadd}">
												<c:if
													test="${i.userID eq i2.user2.userID && sessionScope.userID eq i2.user1.userID}">
													<c:set var="isInList" value="true" />
												</c:if>
											</c:forEach>
											<a href="home/addrequest?userid=${i.userID}"
												class="btn-round-sm bg-white text-grey-900 ${isInList ? 'spinner-border' : 'feather-plus'}  font-xss ms-auto mt-2""></a>
										</div>
									</c:if>
								</c:forEach>



							</div>







						</div>

						<!--friend request -->

					</div>
				</div>
			</div>
			<!-- main content -->

			<!-- right chat -->
			<div class="right-chat nav-wrap mt-2 right-scroll-bar">
				<div
					class="middle-sidebar-right-content bg-white shadow-xss rounded-xxl">

					<!-- loader wrapper -->
					<div class="preloader-wrap p-3">
						<div class="box shimmer">
							<div class="lines">
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
							</div>
						</div>
						<div class="box shimmer mb-3">
							<div class="lines">
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
							</div>
						</div>
						<div class="box shimmer">
							<div class="lines">
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
								<div class="line s_shimmer"></div>
							</div>
						</div>
					</div>
					<!-- loader wrapper -->

					<div
						class="section full pe-3 ps-4 pt-4 position-relative feed-body">
						<h4 class="font-xsssss text-grey-500 text-uppercase fw-700 ls-3">CONTACTS</h4>

						<ul class="list-group list-group-flush">
							<c:forEach var="i" items="${listfriend}">
								<li
									class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
									<figure class="avatar float-left mb-0 me-2">
										<img src="${i.avatarURL}" alt="image" class="w35">
									</figure>
									<h3 class="fw-700 mb-0 mt-0">
										<a
											class="font-xssss text-grey-600 d-block text-dark model-popup-chat"
											href="user-page?userid=${i.userID}">${i.userName}</a>
									</h3> <span class="bg-success ms-auto btn-round-xss"></span>
								</li>
							</c:forEach>

						</ul>

					</div>
					<div
						class="section full pe-3 ps-4 pt-4 pb-4 position-relative feed-body">
						<h4 class="font-xsssss text-grey-500 text-uppercase fw-700 ls-3">GROUPS</h4>
						<ul class="list-group list-group-flush">
							<li
								class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">

								<span
								class="btn-round-sm bg-primary-gradiant me-3 ls-3 text-white font-xssss fw-700">UD</span>
								<h3 class="fw-700 mb-0 mt-0">
									<a
										class="font-xssss text-grey-600 d-block text-dark model-popup-chat"
										href="#">Studio Express</a>
								</h3> <span
								class="badge mt-0 text-grey-500 badge-pill pe-0 font-xsssss">2
									min</span>
							</li>
							<li
								class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">

								<span
								class="btn-round-sm bg-gold-gradiant me-3 ls-3 text-white font-xssss fw-700">AR</span>
								<h3 class="fw-700 mb-0 mt-0">
									<a
										class="font-xssss text-grey-600 d-block text-dark model-popup-chat"
										href="#">Armany Design</a>
								</h3> <span class="bg-warning ms-auto btn-round-xss"></span>
							</li>
							<li
								class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">

								<span
								class="btn-round-sm bg-mini-gradiant me-3 ls-3 text-white font-xssss fw-700">UD</span>
								<h3 class="fw-700 mb-0 mt-0">
									<a
										class="font-xssss text-grey-600 d-block text-dark model-popup-chat"
										href="#">De fabous</a>
								</h3> <span class="bg-success ms-auto btn-round-xss"></span>
							</li>
						</ul>
					</div>
					<div
						class="section full pe-3 ps-4 pt-0 pb-4 position-relative feed-body">
						<h4 class="font-xsssss text-grey-500 text-uppercase fw-700 ls-3">Pages</h4>
						<ul class="list-group list-group-flush">
							<li
								class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">

								<span
								class="btn-round-sm bg-primary-gradiant me-3 ls-3 text-white font-xssss fw-700">AB</span>
								<h3 class="fw-700 mb-0 mt-0">
									<a
										class="font-xssss text-grey-600 d-block text-dark model-popup-chat"
										href="#">Armany Seary</a>
								</h3> <span class="bg-success ms-auto btn-round-xss"></span>
							</li>
							<li
								class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">

								<span
								class="btn-round-sm bg-gold-gradiant me-3 ls-3 text-white font-xssss fw-700">SD</span>
								<h3 class="fw-700 mb-0 mt-0">
									<a
										class="font-xssss text-grey-600 d-block text-dark model-popup-chat"
										href="#">Entropio Inc</a>
								</h3> <span class="bg-success ms-auto btn-round-xss"></span>
							</li>

						</ul>
					</div>

				</div>
			</div>


			<!-- right chat -->

			<div class="app-footer border-0 shadow-lg bg-primary-gradiant">
				<a href="/default.html" class="nav-content-bttn nav-center"><i
					class="feather-home"></i></a> <a href="default-video.html"
					class="nav-content-bttn"><i class="feather-package"></i></a> <a
					href="default-live-stream.html" class="nav-content-bttn"
					data-tab="chats"><i class="feather-layout"></i></a> <a
					href="shop-2.html" class="nav-content-bttn"><i
					class="feather-layers"></i></a> <a
					href="/ALOHCMUTE/view/sociala/default-settings.jsp"
					class="nav-content-bttn"><img src="images/female-profile.png"
					alt="user" class="w30 shadow-xss"></a>
			</div>

			<div class="app-header-search">
				<form class="search-form">
					<div class="form-group searchbox mb-0 border-0 p-1">
						<input type="text" class="form-control border-0"
							placeholder="Search..."> <i class="input-icon"> <ion-icon
								name="search-outline" role="img" class="md hydrated"
								aria-label="search outline"></ion-icon>
						</i> <a href="#"
							class="ms-1 mt-1 d-inline-block close searchbox-close"> <i
							class="ti-close font-xs"></i>
						</a>
					</div>
				</form>
			</div>

		</div>

		<div class="modal bottom side fade" id="Modalstory" tabindex="-1"
			role="dialog" style="overflow-y: auto;">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content border-0 bg-transparent">
					<button type="button"
						class="close mt-0 position-absolute top--30 right--10"
						data-dismiss="modal" aria-label="Close">
						<i class="ti-close text-grey-900 font-xssss"></i>
					</button>
					<div class="modal-body p-0">
						<div
							class="card w-100 border-0 rounded-3 overflow-hidden bg-gradiant-bottom bg-gradiant-top">
							<div
								class="owl-carousel owl-theme dot-style3 story-slider owl-dot-nav nav-none">
								<div class="item">
									<img src="images/story-5.jpg" alt="image">
								</div>
								<div class="item">
									<img src="images/story-6.jpg" alt="image">
								</div>
								<div class="item">
									<img src="images/story-7.jpg" alt="image">
								</div>
								<div class="item">
									<img src="images/story-8.jpg" alt="image">
								</div>

							</div>
						</div>
						<div
							class="form-group mt-3 mb-0 p-3 position-absolute bottom-0 z-index-1 w-100">
							<input type="text"
								class="style2-input w-100 bg-transparent border-light-md p-3 pe-5 font-xssss fw-500 text-white"
								value="Write Comments"> <span
								class="feather-send text-white font-md text-white position-absolute"
								style="bottom: 35px; right: 30px;"></span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="modal-popup-chat">
			<div class="modal-popup-wrap bg-white p-0 shadow-lg rounded-3">
				<div class="modal-popup-header w-100 border-bottom">
					<div class="card p-3 d-block border-0 d-block">
						<figure class="avatar mb-0 float-left me-2">
							<img src="images/user-12.png" alt="image" class="w35 me-1">
						</figure>
						<h5 class="fw-700 text-primary font-xssss mt-1 mb-1">ten user</h5>
						<h4 class="text-grey-500 font-xsssss mt-0 mb-0">
							<span class="d-inline-block bg-success btn-round-xss m-0"></span>
							Available
						</h4>
						<a href="#"
							class="font-xssss position-absolute right-0 top-0 mt-3 me-4"><i
							class="ti-close text-grey-900 mt-2 d-inline-block"></i></a>
					</div>
				</div>
				<div class="modal-popup-body w-100 p-3 h-auto">
					<div class="message">
						<div class="message-content font-xssss lh-24 fw-500">Hi, how
							can I help you?</div>
					</div>
					<div
						class="date-break font-xsssss lh-24 fw-500 text-grey-500 mt-2 mb-2">Mon
						10:20am</div>
					<div class="message self text-right mt-2">
						<div class="message-content font-xssss lh-24 fw-500">I want
							those files for you. I want you to send 1 PDF and 1 image file.</div>
					</div>
					<div
						class="snippet pt-3 ps-4 pb-2 pe-3 mt-2 bg-grey rounded-xl float-right"
						data-title=".dot-typing">
						<div class="stage">
							<div class="dot-typing"></div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="modal-popup-footer w-100 border-top">
					<div class="card p-3 d-block border-0 d-block">
						<div class="form-group icon-right-input style1-input mb-0">
							<input type="text" placeholder="Start typing.."
								class="form-control rounded-xl bg-greylight border-0 font-xssss fw-500 ps-3"><i
								class="feather-send text-grey-500 font-md"></i>
						</div>
					</div>
				</div>
			</div>
		</div>






		
		
		<!-- Add this script at the end of your HTML body or in a separate JavaScript file -->
		<script>
			function showEditPost() {
				var editPostContent = document
						.querySelector('.edit-post-content');
				editPostContent.style.display = 'block';
			}
		</script>

		<script>
			function toggleComments(postID) {
				var commentSection = document
						.getElementById('comment' + postID);
				if (commentSection.style.display === 'none'
						|| commentSection.style.display === '') {
					commentSection.style.display = 'block';
				} else {
					commentSection.style.display = 'none';
				}
			}
		</script>

		<script>
			//Example using jQuery for simplicity, but you can use vanilla JavaScript as well
			$(document)
					.ready(
							function() {
								$(".comment-form form")
										.submit(
												function(event) {
													event.preventDefault();

													// Serialize the form data
													var formData = $(this)
															.serialize();

													// AJAX request to submit the comment
													$
															.ajax({
																type : "POST",
																url : "/ALOHCMUTE/listComment",
																data : formData,
																success : function(
																		data) {
																	// Update the comment list container with the new comments
																	$(
																			"#comment"
																					+ data.postID
																					+ " .comment-list")
																			.html(
																					data.commentsHtml);
																},
																error : function(
																		error) {
																	console
																			.error(
																					"Error submitting comment:",
																					error);
																}
															});
												});
							});
		</script>


		<script>
			let likeCount = 0;
			const likeButton = document.getElementById('likeButton');
			const likeCountElement = document.getElementById('likeCount');
			likeButton.addEventListener('click', function() {
				if (likeButton.classList.contains('liked')) {
					// If already liked, decrease the like count
					likeCount--;
				} else {
					// If not liked, increase the like count
					likeCount++;
				}

				// Toggle the liked state
				likeButton.classList.toggle('liked');

				// Update the like count element text
				likeCountElement.textContent = likeCount;
			});
		</script>
		<!-- Include jQuery -->
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script src="<%=request.getContextPath()%>/view/sociala/js/plugin.js"></script>

		<script
			src="<%=request.getContextPath()%>/view/sociala/js/lightbox.js"></script>
		<script src="<%=request.getContextPath()%>/view/sociala/js/scripts.js"></script>
		
</body>


<!-- Mirrored from uitheme.net/sociala/default.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Nov 2023 14:31:04 GMT -->
</html>