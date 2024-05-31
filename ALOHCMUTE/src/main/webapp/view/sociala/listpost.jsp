<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<c:if test="${not empty message }">${message }</c:if>
	<c:if test="${not empty error }">${error }</c:if>
	
	<div class="container mt-3">
	 <table class="table table-bordered">
	
		<thead>
		<tr>
			<th>PostID</th>
			<th>Content</th>
			<th>Thời gian</th>
			<th>Ảnh</th>
			<th>Like</th>
			<th>Comment</th>
			<th>UserID</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${listpost}">
				<tr>
					<td>${i.postID}</td>
					<td>${i.content}</td>
					<td>${i.postTime}</td>
					<td>${i.imageVideoURL}</td>
					<td>${i.likes}</td>
					<td>${i.comments}</td>
					<td>${i.user.userID}</td>
					<td>
					<td><a
						href="<c:url value='/admin-deletePost?id=${i.postID}'/>">Delete</a>||
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>