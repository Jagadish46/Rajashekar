package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		
		try {
			String param = request.getServletContext().getInitParameter(
					"data.store");

			if (param.equals("file")) {
				pw.print("hello");
				saveUserInFileSystem(request);
			} else if (param.equals("db")) {
				saveUserInDb(request);
				pw.print("completed");
			}
		} catch (Exception e) {
		}
		
	}

	private void saveUserInDb(HttpServletRequest request) {

		DatabaseUserManagement dm = new DatabaseUserManagement();
		dm.setDriverName(getDriverName(request));
		dm.setUrl(getUrl(request));
		saveUser(request, dm);

	}

	public String getUrl(HttpServletRequest request) {
		return request.getServletContext().getInitParameter("ConnectionUrl");
	}

	public String getDriverName(HttpServletRequest request) {
		return request.getServletContext().getInitParameter("driverName");
	}

	private void saveUser(HttpServletRequest request, UserManagement um) {

		String user = request.getParameter("username");

		String pass = request.getParameter("password");

		String email = request.getParameter("email");

		String mob = request.getParameter("mobile");

		String role = request.getParameter("role");

		um.saveUser(user, pass, email, mob, role);

	}

	private void saveUserInFileSystem(HttpServletRequest request) {
		FileUserManagement fm = new FileUserManagement();

		fm.setFilePath(getFilePath(request));
		saveUser(request, fm);

	}

	private String getFilePath(HttpServletRequest request) {
		return request.getServletContext().getInitParameter("filePath");

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
