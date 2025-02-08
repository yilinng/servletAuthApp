package com.journaldev.first;

import java.io.IOException;

import java.sql.SQLException;

import java.util.List;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.journaldev.first.dao.BookDao;
import com.journaldev.first.dao.UserDao;
import com.journaldev.first.entity.Book;
import com.journaldev.first.entity.User;

@WebServlet("/bookList")
public class BooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDao bookDao;
	private UserDao userDao;

	public void init() {
		bookDao = new BookDao();
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// String action = request.getServletPath();

		// int id = Integer.parseInt(request.getParameter("id"));
		// Book book = bookDao.getBook(id);
		// User user = findUserFromSession(request);
		// Boolean checkUserHaveBook = bookDao.userHaveBook(book, user.getId());

		// request.setAttribute("checkUserHaveBook", checkUserHaveBook);
		try {
			listBook(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private User findUserFromSession(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String username = (String) session.getAttribute("username");
		User user = userDao.findUser(username);
		return user;
	}

	private void listBook(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Book> books = bookDao.getBooks();
		request.setAttribute("books", books);
		User user = findUserFromSession(request);

		if (user != null) {
			request.setAttribute("user1", user.getId());
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("jsps/book-list.jsp");
		dispatcher.forward(request, response);
	}

}
