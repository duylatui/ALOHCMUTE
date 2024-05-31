<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
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
	<%-- <c:if test="${Not empty message}"> --%>
	<c:if test="${message != null}">
		<span>${message }</span>
	</c:if>

	<c:if test="${error != null}">
		<span>${error }</span>
	</c:if>
	<div class="container mt-3">
		<table class="table table-striped">
			<tr>
				<td>Avatar</td>
				<td>Tên user</td>
				<td>Email</td>
				<td>Action</td>
			</tr>
			<c:forEach var="i" items="${listuser}">
				<tr>
					<td>${i.avatarURL}</td>
					<td>${i.userName}</td>
					<td>${i.email}</td>
					<td><a
						href="<c:url value='/admin-deleteUser?id=${i.userID}'/>">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>