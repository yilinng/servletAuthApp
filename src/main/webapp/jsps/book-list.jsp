<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.journaldev.first.bean.BookBean"%>
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
	<jsp:include page="./common/header.jsp"></jsp:include>
	<div class="container">
		<div class="d-flex justify-content-center align-items-center mt-3">
			<h3 class="text-center">List of Books</h3>

			<%
			String user = (String) session.getAttribute("username");
			//Boolean checkUserHaveBook = bookDao
			if (user != null) {
			%>
			<div class="addBtn ml-5">
				<a href="<%=request.getContextPath()%>/bookList/new"
					class="btn btn-success">Add New Book</a>
			</div>
			<%
			}
			%>
		</div>
		<hr>
		<br>
		<div class="table-responsive">
			<table class="table table-bordered">
				<caption>List of books</caption>
				<thead>
					<tr>
						<th>ID</th>
						<th>Title</th>
						<th>Author</th>
						<th>Price</th>
						<th>User</th>
						<%
						if (user != null) {
						%>
						<th>Actions</th>
						<%
						} else {
						%>

						<th></th>

						<%
						}
						%>

					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="book" items="${books}">
						<jsp:useBean id="Book" class="com.journaldev.first.bean.BookBean" />
						<jsp:setProperty name="Book" property="title"
							value="${book.title}" />
						<jsp:setProperty name="Book" property="author"
							value="${book.author}" />
						<tr>
							<td><c:out value="${book.id}" /></td>
							<td><c:out value="${Book.getTitle()}" /></td>
							<td><c:out value="${Book.getAuthor()}" /></td>
							<td><c:out value="${book.price}" /></td>
							<td><c:out value="${book.user.getId()}" /></td>

							<c:if test="${book.user.getId().equals(user1)}">

								<td>
									<div class="d-inline p-2">
										<a
											href="<%=request.getContextPath()%>/bookList/edit?id=<c:out value='${book.id}' />"
											class="btn btn-primary">Edit</a>
									</div> &nbsp;&nbsp;&nbsp;&nbsp;

									<div class="d-inline p-2">
										<button type="button" id="deleteModalBtn" class="btn btn-info"
											onclick="openForm(this)" data-toggle="modal"
											data-target="#deleteModal">Delete</button>
									</div>
							</c:if>

							<c:if test="${!book.user.getId().equals(user1)}">
								<td></td>
							</c:if>

						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>
			</table>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="deleteModal" tabindex="-1"
			aria-labelledby="deleteModalLabel" aria-hidden="false">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="deleteModalLabel">Do you want to
							delete this?</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" id="modal-body">this book will be
						delete!!</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>

						<button type="button" id="deleteBtn" class="btn btn-info"
							data-toggle="modal" data-target="#deleteModal">Delete</button>


					</div>
				</div>
			</div>
		</div>


	</div>
	<jsp:include page="./common/footer.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		const deleteBtn = document.getElementById("deleteBtn");
		const deleteModalBtn = document.getElementById("deleteModalBtn");
		let bookId = null;
		let url = null;
		
		deleteBtn.addEventListener("click", (event) => {
			  //button.textContent = `Click count: ${event.detail}`;
			console.log("deleteBtnwork", bookId);
			//deleteModalBtn.setAttribute('type', 'submit');
			deleteEvent();
		});
		
		function deleteEvent(){
			fetch("http://localhost:8080/FirstServletApp/bookList/delete?id=" + bookId, {
				  method: "POST",
				  headers: {
				    "Content-type": "application/json; charset=UTF-8"
				  }
				})
				.then((res) => res.json())
				.catch((error) => console.error("Error:", error))
			  .then(response =>setTimeout(refresh, 10000))
		}
		
		 function refresh() {                         
		        //Refresh page implementation here
		       // window.opener.location.reload();
		       // window.close();
		      console.log("refresh") 
			 location.reload()
		    }
		
	

		function openForm(element) {
			//document.getElementById("deleteModal").style.display = "block";
			bookId = element.parentElement.parentElement.parentElement.firstElementChild.innerHTML;
			url = element.parentElement.parentElement.firstElementChild.firstElementChild.pathname;
			console.log("work", url);
		//https://stackoverflow.com/questions/641857/javascript-window-resize-event		
		}
		
		window.addEventListener('resize', () => {
			let width = window.screen.width;
			console.log("width ", width);
			const table = document.getElementsByTagName("table")[0];  // Get the DIV element
			console.log(table);
			//element.classList.remove("mystyle"); // Remove mystyle class from DIV
			//element.classList.add("newone"); // Add newone class to DIV
			 if (width > 600) {
				 table.classList.add("table-dark")
			  } else {
				 table.classList.remove("table-dark")
			  }
		})
	</script>
</body>
</html>