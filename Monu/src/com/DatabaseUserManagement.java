package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DatabaseUserManagement implements UserManagement {
	public static void main(String args[]) {
	}

	boolean c = false;
	String userName;
	String DriverName;
	String Url;
	String role;
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public void setFilePath(String fp) {
	}

	public void setDriverName(String driverName2) {
		DriverName = driverName2;
	}

	public void setUrl(String url2) {
		Url = url2;

	}

	@Override
	public void saveUser(String a, String b, String c, String d, String e) {
		try {
			Class.forName(DriverName);
			System.out.println("hello2");
		} catch (ClassNotFoundException e1) {

			e1.printStackTrace();
		}
		System.out.println(Url);
		try {
			Connection con = DriverManager.getConnection(Url, "root", "");
			System.out.println("connection" + con);
			Statement st = con.createStatement();
			String store;
			String username = a;
			String password = b;
			String email = c;
			String mobile = d;
			String role = e;
			System.out.println("hello4");
			store = "insert into regt values(" + "'" + username + "','"
					+ password + "','" + email + "','" + mobile + "','" + role
					+ "')";
			st.executeUpdate(store);
			System.out.println("hello5");
			if (role.equals("student")) {
				String s1 = "select * from regt where role='" + role + "'";
				PreparedStatement st1 = con.prepareStatement(s1);
				ResultSet rs = st1.executeQuery(s1);
				while (rs.next()) {
					String s = "insert into stab values(" + "'"
							+ rs.getString(1) + "','" + rs.getString(2) + "','"
							+ rs.getString(3) + "','" + rs.getString(4) + "','"
							+ "')";
					Statement st2 = con.createStatement();
					st2.executeUpdate(s);
					System.out.println("hello6");
					break;
				}
			}
			st.close();
			con.close();
		} catch (Exception e1) {
			e1.getMessage();
		}
	}

	@Override
	public boolean isUserValid(String user, String pass) {

		return false;
	}

	public boolean checkInDb(String user, String pass) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.getMessage();
		}
		try {
			String s = "select * from regt where email='" + user + "'";
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sport", "root", "");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(s);
			String username = null;
			String password = null;
			System.out.println(user);
			System.out.println(pass);
			// System.out.println("hello");
			while (rs.next()) {
				username = rs.getString(3);
				password = rs.getString(2);
				System.out.println(username + password);
			}
			if (username.equals(user) && password.equals(pass)) {
				c = true;
				System.out.println(c);
			} else {
				c = false;
				System.out.println(c);
			}
		} catch (Exception e) {
			e.getMessage();
		}

		return c;
	}

	public void userProfile(String user) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.getMessage();
		}
		try {
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sport", "root", "");
			Statement st = con.createStatement();
			String str = "select *from regt where email='" + user + "'";
			ResultSet rs = st.executeQuery(str);
			String role = null;
			while (rs.next()) {
				role = rs.getString(5);
			}
			if (role.equals("admin")) {
				setRole(role);
				userName = user;
			} else if (role.equals("student")) {
				setRole(role);
			} else if (role.equals("coach")) {
				setRole(role);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
