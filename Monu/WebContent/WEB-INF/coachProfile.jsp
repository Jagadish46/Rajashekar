<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.Login"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.DatabaseUserManagement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
			String email = request.getParameter("username");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sport", "root", "");
			Statement st=con.createStatement();
			String str="select username from regt where email='"+email+"'";
			ResultSet rs=st.executeQuery(str);
			String userName=null;
			while(rs.next()){
				userName=rs.getString(1);
			}
			String str1 = "select *from stab where coach='" + userName + "'";
			PreparedStatement ps=con.prepareStatement(str1);
			ResultSet rs1 = ps.executeQuery(str1);
			out.println("<table border='1'><th>UserName</th><th>Email</th><th>MobileNumber</th>");
			while (rs1.next()) {
				out.println("<tr>");
				String userName1 = rs1.getString(1);
				String email1 = rs1.getString(3);
				String mobile = rs1.getString(4);
				out.println("<td>" + userName1 + "</td>");
				out.println("<td>" + email1 + "</td>");
				out.println("<td>" + mobile + "</td>");
				out.println("</tr>");
			}
		} catch (Exception e) {
			e.getMessage();
		}
		try {
			String param=request.getServletContext().getInitParameter("data.store");
			if(param.equals("file")){
			String email = request.getParameter("username");
			BufferedReader br1=new BufferedReader(new FileReader(request.getServletContext().getInitParameter("filePath")));
			BufferedReader br = new BufferedReader(new FileReader(request
					.getServletContext().getInitParameter(
							"filePathForStudents")));
			String line1=null;
			String coachName=null;
			while((line1=br1.readLine())!=null){
				String s1[]=line1.split("-");
				String str=s1[4];
				if(str.equals("coach")){
					coachName=s1[1];
				}
			}
			String line = null;
			out.println("<br><table border='1'><th>UserName</th><th>Email</th><th>mobile</th>");
			while ((line = br.readLine()) != null) {
				String s[] = line.split("-");
				String coach = s[4];
				if (coach.equals(coachName)) {
					String userName = s[0];
					String email1 = s[2];
					String mobile = s[3];
					out.println("<tr>");
					out.println("<td>" + userName + "</td>");
					out.println("<td>" + email1 + "</td>");
					out.println("<td>" + mobile + "</td>");
					out.println("</tr>");
				}
			}
			br1.close();
			br.close();
			}
		} catch (Exception e) {
			e.getMessage();
		}
	%>
</body>
</html>