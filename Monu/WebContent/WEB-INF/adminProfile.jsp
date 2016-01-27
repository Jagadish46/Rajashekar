<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
<body>
	<h1>
	Hello Admin!!
	</h1>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sport", "root", "");
			Statement st = con.createStatement();
			String str = "select *from regt";

			out.println("<table border='1'><tr><th>UserName</th><th>Password</th><th>Email</th><th>Mobile</th><th>Role</th>");
			ResultSet rs = st.executeQuery(str);
			while (rs.next()) {
				String userName = rs.getString(1);
				String password = rs.getString(2);
				String email = rs.getString(3);
				String mobile = rs.getString(4);
				String role = rs.getString(5);
				out.println("<tr>");
				out.println("<td>" + userName + "</td>");
				out.println("<td>" + password + "</td>");
				out.println("<td>" + email + "</td>");
				out.println("<td>" + mobile + "</td>");
				out.println("<td>" + role + "</td>");
				out.println("</tr>");
			}
			out.println("</table>");
		} catch (Exception e) {
			e.getMessage();
		}
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sport", "root", "");
			out.println("<h1> Select Coach To View Students</h1>");
			String str1 = "select username from regt where role='coach'";
			PreparedStatement ps = con.prepareStatement(str1);
			ResultSet rs1 = ps.executeQuery(str1);
			out.println("<form action='coachStudents.jsp'>");
			out.println("<select name='coach'>");
			while (rs1.next()) {
				String coachName = rs1.getString(1);
				out.println("<option");
				out.println(">" + coachName + "</option>");
			}
			out.println("</select>");
			out.println("<input type='submit' value='submit'>");
			out.println("</form>");
		} catch (Exception e) {
			e.getMessage();
		}
		try {
			String param=request.getServletContext().getInitParameter("data.store");
			if(param.equals("file")){
			BufferedReader br = new BufferedReader(new FileReader(request
					.getServletContext().getInitParameter("filePath")));
			String line = null;
			out.println("<table border='1'><th>UserName</th><th>Password</th><th>Email</th><th>MobileNumber</th><th>Role</th>");
			while ((line = br.readLine()) != null) {
				String s[] = line.split("-");
				String userName = s[0];
				String password = s[1];
				String email = s[2];
				String mobile = s[3];
				String role = s[4];
				out.println("<tr>");
				out.println("<td>" + userName + "</td>");
				out.println("<td>" + password + "</td>");
				out.println("<td>" + email + "</td>");
				out.println("<td>" + mobile + "</td>");
				out.println("<td>" + role + "</td>");
				out.println("</tr>");
			}
			out.println("</table></html>");
			br.close();
			}
		} catch (Exception e) {
			e.getMessage();
		}
		try {
			String param=request.getServletContext().getInitParameter("data.store");
			if(param.equals("file")){
			BufferedReader br1 = new BufferedReader(new FileReader(request
					.getServletContext().getInitParameter("filePath")));
			out.println("<form action='coachStudents.jsp'>");
			out.println("<h1> Select Coach To View His Student</h1>");
			out.println("<input type='submit' value='submit'>");
			out.println("<select name='coach'>");
			String line1 = null;
			while ((line1 = br1.readLine()) != null) {
				String str[] = line1.split("-");
				String role = str[4];
				if (role.equals("coach")) {
					String coachName = str[0];
					out.println("<option");
					out.println(">" + coachName + "</option>");
				}
			}
			out.println("</select>");
			//out.println("<input type='submit' value='submit'>");
			br1.close();
			}
		} catch (Exception e) {
			e.getMessage();
		}
	%>
</body>
</html>