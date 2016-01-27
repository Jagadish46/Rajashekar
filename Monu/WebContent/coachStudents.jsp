<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>
		CoachStudents
		</title>
	</head>
<body>
	<%
		String coach = request.getParameter("coach");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sport", "root", "");
			Statement st = con.createStatement();
			String str = "select username,email,mobile from stab where coach='"
					+ coach + "'";
			ResultSet rs = st.executeQuery(str);
			out.println("<table border='1'><th>UserName</th><th>Email</th><th>MobileNumber</th>");
			while (rs.next()) {
				String userName = rs.getString(1);
				String email = rs.getString(2);
				String mobile = rs.getString(3);
				out.println("<tr>");
				out.println("<td>" + userName + "</td>");
				out.println("<td>" + email + "</th>");
				out.println("<td>" + mobile + "</td>");
				out.println("</tr>");
			}
			out.println("</table>");
		} catch (Exception e) {
			e.getMessage();
		}
		try {
			String param=request.getServletContext().getInitParameter("data.store");
			if(param.equals("file")){
			String coachName = request.getParameter("coach");
			BufferedReader br = new BufferedReader(new FileReader(request
					.getServletContext().getInitParameter(
							"filePathForStudents")));
			String line = null;
			out.println("<br><table border='1'><th>UserName</th><th>Email</th><th>mobile</th>");
			while ((line = br.readLine()) != null) {
				String s[] = line.split("-");
				String coach1 = s[4];
				if (coach1.equals(coachName)) {
					String userName = s[0];
					String email = s[2];
					String mobile = s[3];
					out.println("<tr>");
					out.println("<td>" + userName + "</td>");
					out.println("<td>" + email + "</td>");
					out.println("<td>" + mobile + "</td>");
					out.println("</tr>");
				}
			}
			out.println("</table");
			br.close();
			}
		} catch (Exception e) {
			e.getMessage();
		}
	%>


</body>
</html>