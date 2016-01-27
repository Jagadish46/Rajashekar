package com;

import java.io.IOException;
//import java.util.ArrayList;
//import java.util.Collection;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet implements UserManagement {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String param = request.getServletContext().getInitParameter(
				"data.store");
		if (param.equals("file")) {
			loginThroughFile(request, response);
		}
		if (param.equals("db")) {
			loginThroughDb(request, response);
		}
	}

	private void loginThroughDb(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		boolean b = isUserValid(user, pass);
		if (b == true) {
			PrintWriter pw = response.getWriter();
			pw.println("you are a valid User");
			DatabaseUserManagement dm = new DatabaseUserManagement();
			dm.userProfile(user);
			dm.setUserName(user);
			String role = dm.getRole();
			if (role.equals("admin")) {
				getServletContext().getRequestDispatcher(
						"/WEB-INF/adminProfile.jsp").forward(request, response);
			}
			if (role.equals("student")) {
				getServletContext()
						.getRequestDispatcher("/WEB-INF/student.jsp").forward(
								request, response);
			}
			if (role.equals("coach")) {
				System.out.println(role);
				getServletContext().getRequestDispatcher(
						"/WEB-INF/coachProfile.jsp").forward(request, response);
			}
		} else {
			PrintWriter pw = response.getWriter();
			pw.println("you are not a valid User");
		}
	}

	private void loginThroughFile(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		FileUserManagement fm = new FileUserManagement();
		fm.setUsername(userName);
		fm.setFilePath(getFilePath(request));
		boolean b = fm.isUserValid(userName, password);
		if (b == true) {
			PrintWriter pw = response.getWriter();
			pw.println("you are a valid user");
			fm.userRole(userName);
			String role = fm.getRole();
			if (role.equals("admin")) {
				getServletContext().getRequestDispatcher(
						"/WEB-INF/adminProfile.jsp").forward(request, response);
			}
			if (role.equals("student")) {
				getServletContext()
						.getRequestDispatcher("/WEB-INF/student.jsp").forward(
								request, response);
			}
			if (role.equals("coach")) {
				getServletContext().getRequestDispatcher(
						"/WEB-INF/coachProfile.jsp").forward(request, response);
			}
		}

	}

	private String getFilePath(HttpServletRequest request) {
		return request.getServletContext().getInitParameter("filePath");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	public void setFilePath(String fp) {
	}

	@Override
	public void saveUser(String a, String b, String c, String e, String f) {
	}

	@Override
	public boolean isUserValid(String user, String pass) {
		DatabaseUserManagement dm = new DatabaseUserManagement();
		dm.checkInDb(user, pass);
		return dm.c;
	}
}
