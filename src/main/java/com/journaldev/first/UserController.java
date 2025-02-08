package com.journaldev.first;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.journaldev.first.dao.UserDao;
import com.journaldev.first.entity.User;

@WebServlet("/register")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;
	private String error = "";
	private String success = "";

	public void init() {
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			register(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//response.sendRedirect("jsps/register.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsps/register.jsp");
		dispatcher.forward(request, response);
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		

		if (userDao.checkUsernameOrEmail(username, email)) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsps/register.jsp");
			error = "username or email is exist, plase try another one.";
			request.setAttribute("error", error);
			rd.include(request, response);
		} else {
			User user = new User();

			user.setUsername(username);
			user.setEmail(email);
			user.setPassword(password);

			userDao.saveUser(user);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsps/login.jsp");
			success = "register successfully";
			request.setAttribute("success", success);
			rd.include(request, response);
		}

	}

}
