<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>
			ChangeCoach
		</title>
	</head>
<body>
	<%
		try {
			HttpSession session1=request.getSession();
			String email=request.getParameter("username");
			session1.setAttribute("uname", email);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sport", "root", "");
			String s2 = "select username from regt where role='coach'";
			PreparedStatement st2 = con.prepareStatement(s2);
			ResultSet rs2 = st2.executeQuery(s2);
			out.println("<form action='updateCoach.jsp'>");
			//out.println("<h1>Enter Your Email</h1><input type='text' name='email'> ");
			out.println("<br><h1>Select Your Coach here</h1><select name='coach'");
			out.println("<option>select</option>");
			while (rs2.next()) {
				String x = rs2.getString(1);
				out.println("<option");
				out.println(">" + x + "</option>");
			}
			out.println("</select>");
			out.println("<input type='submit' value='submit'></form>");
		} catch (Exception e) {
			e.getMessage();
		}
		try {
			HttpSession session1=request.getSession();
			String email=request.getParameter("username");
			session1.setAttribute("uname", email);
			String param=request.getServletContext().getInitParameter("data.store");
			if(param.equals("file")){
			out.println("<h1>Hello Student<h1>");
			BufferedReader br = new BufferedReader(new FileReader(request
					.getServletContext().getInitParameter("filePath")));
			String line = null;
			out.println("<form action='updateCoach.jsp'>");
			out.println("<h2>Select Your Coach</h2>");
			out.println("<select name='coach'>");
			while ((line = br.readLine()) != null) {
				String s[] = line.split("-");
				String role = s[4];
				if (role.equals("coach")) {
					String coachName = s[0];
					out.println("<option");
					out.println(">" + coachName + "</option>");
				}
			}
			out.println("</select>");
			out.println("<input type='submit' value='submit'>");
			br.close();
			}
		} catch (Exception e) {
			e.getMessage();
		}
	%>
</body>
</html>