package com.journaldev.first;

import java.io.IOException;

import java.sql.SQLException;


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

@WebServlet("/bookList/edit/*")
public class EditBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDao bookDao;
	private UserDao userDao;
	

	public void init() {
		bookDao = new BookDao();
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			updateBook(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// String action = request.getServletPath();

		try {
			showEditForm(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
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


	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Book book = bookDao.getBook(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("../jsps/book-form.jsp");
		request.setAttribute("book", book);
		dispatcher.forward(request, response);

	}


	private void updateBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		double price = Double.parseDouble(request.getParameter("price"));
		User user = findUserFromSession(request);
		Book book = new Book(id, title, author, price, user);

		bookDao.updateBook(book);

		response.sendRedirect("../bookList");
	}


}
