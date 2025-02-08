<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="./common/header.jsp"></jsp:include>
	<div class="container">
		<h1>Login Form</h1>
		<form action="<%=request.getContextPath()%>/login" method="post">
			<div class="form-group">
				<label for="uname">User Name:</label> <input type="text"
					class="form-control form-control-lg" id="username"
					placeholder="User Name" name="username" required>
			</div>
			<div class="form-group">
				<label for="uname">Password:</label> <input type="password"
					class="form-control form-control-lg" id="password"
					placeholder="Password" name="password" required>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
		<a href="<%=request.getContextPath()%>/register">register</a>
		<%
		if (request.getAttribute("error") != null && !request.getAttribute("error").equals("")) {
		%>
		<div class="alert alert-danger" role="alert"><%=request.getAttribute("error")%></div>
		<%
		}
		%>

		<%
		if (request.getAttribute("success") != null && !request.getAttribute("success").equals("")) {
		%>
		<div class="alert alert-success" role="alert"><%=request.getAttribute("success")%></div>
		<%
		}
		%>
		<div class="border">
			<ul class="list-group">
				<li class="list-group-item">username: admin, password: admin</li>
				<li class="list-group-item">username: user12, password: user12</li>
			</ul>
		</div>
	</div>

	<jsp:include page="./common/footer.jsp"></jsp:include>
</body>
</html>