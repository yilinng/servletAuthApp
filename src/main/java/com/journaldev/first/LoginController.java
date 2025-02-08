package com.journaldev.first;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
import com.journaldev.first.dao.UserDao;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;
	private String error = "";
	private String meg = "";

	public void init() {
		userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//response.sendRedirect("jsps/login.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsps/login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			authenticate(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void authenticate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (userDao.validate(username, password)) {
			// RequestDispatcher dispatcher = request.getRequestDispatcher("/bookList");
			// meg ="login successfully.";
			// request.setAttribute("meg", meg);
			// dispatcher.forward(request, response);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			// setting session to expiry in 30 mins
			session.setMaxInactiveInterval(30 * 60 * 60);
			Cookie userName = new Cookie("username", username);
			userName.setMaxAge(30 * 60 * 60);
			response.addCookie(userName);
			// meg ="login successfully.";
			// request.setAttribute("meg", meg);
			// dispatcher.forward(request, response);
			response.sendRedirect("index.jsp");
		} else {
			// throw new Exception("Login not successful..");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsps/login.jsp");
			// PrintWriter out = response.getWriter();

			// out.println("<font color=red>Either user name or password is wrong.</font>");
			error = "Either user name or password is wrong.";
			request.setAttribute("error", error);
			rd.include(request, response);
		}
	}

}
