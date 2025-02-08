<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>register</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="./common/header.jsp"></jsp:include>
	<div class="container col-md-8 col-md-offset-3" style="overflow: auto">
		<h1>Register Form</h1>
		<form action="<%=request.getContextPath()%>/register" method="post">
			<div class="form-group">
				<label for="uname">User Name:</label> <input type="text"
					class="form-control" id="username" placeholder="User Name"
					name="username" required>
			</div>
			<div class="form-group">
				<label for="uname">Email:</label> <input type="text"
					class="form-control" id="email" placeholder="Email" name="email"
					required>
			</div>
			<div class="form-group">
				<label for="uname">Password:</label> <input type="password"
					class="form-control" id="password" placeholder="Password"
					name="password" required>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
		<a href="<%=request.getContextPath()%>/login">login</a>
		<%
		if (request.getAttribute("error") != null && !request.getAttribute("error").equals("")) {
		%>
		<div class="alert alert-danger" role="alert"><%=request.getAttribute("error")%></div>
		<%
		}
		%>
	</div>
	<jsp:include page="./common/footer.jsp"></jsp:include>
</body>
</html>