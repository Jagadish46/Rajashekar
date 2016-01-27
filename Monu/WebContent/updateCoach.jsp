<%@page import="javax.sql.CommonDataSource"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.Login"%>
<%@page import="com.FileUserManagement"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
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
		Insert title here
		</title>
	</head>
<body>
	<%
		try {
			HttpSession session1=request.getSession();
			String email=(String)session1.getAttribute("uname");
			String coach = request.getParameter("coach");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sport", "root", "");
			Statement st = con.createStatement();

			String str = "update stab set coach='" + coach
					+ "' where email='" + email + "'";
			st.executeUpdate(str);
			String str1 = "select *from stab where coach='" + coach + "'";
			PreparedStatement ps=con.prepareStatement(str1);
			ResultSet rs = ps.executeQuery(str1);
			String userName = null;
			String coach1 = null;
			while (rs.next()) {
				userName = rs.getString(1);
				coach1 = rs.getString(5);
			}
			if (coach1.equals(coach)) {
				out.println("<h2> You Selected" + coach1 + "</h2>");
			}
		} catch (Exception e) {
			e.getMessage();
		}
		try {
			HttpSession session1=request.getSession();
			String email=(String)session1.getAttribute("uname");
			String param=request.getServletContext().getInitParameter("data.store");
			if(param.equals("file")){
			String coachName = request.getParameter("coach");
			File file = new File(request.getServletContext()
					.getInitParameter("filePathForStudents"));
			if (!file.exists()) {
				file.createNewFile();
			}
			FileWriter fw = new FileWriter(file, true);
			BufferedWriter b = new BufferedWriter(fw);
			BufferedReader br = new BufferedReader(new FileReader(request
					.getServletContext().getInitParameter("filePath")));
			String line = null;
			while ((line = br.readLine()) != null) {
				String s[] = line.split("-");
				String email1 = s[2];
				if (email.equals(email1)) {
					String userName = s[0];
					String password = s[1];
					String mobile = s[3];
					String coach = coachName;
					String s1 = userName + "-" + password + "-" + email1
							+ "-" + mobile + "-" + coach;
					b.write(s1);
					b.newLine();
					b.close();
					out.println("<h1>Your Coach Is</h1>" + coach);
				}
			}
			br.close();
			}
		} catch (Exception e) {
			e.getMessage();
		}
	%>
</body>
</html>