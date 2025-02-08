<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Book Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="./jsps/common/header.jsp"></jsp:include>
	<div class="container">

		<h2>index.jsp</h2>
		<%
		//allow access only if session exists
		String user = (String) session.getAttribute("username");
		String userName = null;
		String sessionID = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username"))
			userName = cookie.getValue();
				if (cookie.getName().equals("JSESSIONID"))
			sessionID = cookie.getValue();
			}
		}
		%>
		<h3>
			Hi cookie
			<%=userName%>, Login successful. Your Session ID=<%=sessionID%></h3>
		<br>session User=<%=user%>
		<%
		if (request.getAttribute("meg") != null && !request.getAttribute("meg").equals("")) {
		%>
		<div class="alert alert-success" role="alert"><%=request.getAttribute("meg")%></div>
		<%
		}
		%>
		<br>
	</div>
	<jsp:include page="./jsps/common/footer.jsp"></jsp:include>
</body>
</html>