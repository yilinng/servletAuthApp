<header>
	<nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: tomato">
		<div>
			<a href="<%=request.getContextPath()%>/" class="navbar-brand">
				Book App</a>
		</div>
		<div>
			<a href="<%=request.getContextPath()%>/bookList" class="navbar-brand">bookList</a>
		</div>

		<ul class="navbar-nav navbar-collapse justify-content-end">
			<%
			String user = (String) session.getAttribute("username");
			if (user != null) {
			%>
			<li>
				<form action="logout" method="post">
					<button type="submit" class="btn btn-light">logout</button>
				</form>
			</li>
			<%
			} else {
			%>

			<li><a href="<%=request.getContextPath()%>/login"
				class="nav-link">Login</a></li>
			<li><a href="<%=request.getContextPath()%>/register"
				class="nav-link">Register</a></li>

			<%
			}
			%>

		</ul>
	</nav>
</header>