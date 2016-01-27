package com;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.IOException;

public class FileUserManagement implements UserManagement {
	String username;
	String password;
	String email;
	String mobile;
	String role;
	String str;
	public String getUsername() {
		return username;
	}

	public void setUsername(String usernam) {
		username = usernam;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public void setFilePath(String fp) {
		str = fp;

	}

	@Override
	public void saveUser(String a, String b, String c, String d, String e) {
		try {
			File file = new File(str);
			if (!file.exists()) {
				try {
					file.createNewFile();
				} catch (IOException ee) {
					// TODO Auto-generated catch block
					ee.printStackTrace();
				}
			}
			FileWriter fw = new FileWriter(file, true);
			BufferedWriter bb = new BufferedWriter(fw);
			String s = a + "-" + b + "-" + c + "-" + d + "-" + e;
			bb.write(s);
			bb.newLine();
			bb.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	@Override
	public boolean isUserValid(String user, String pass) {
		String userName = user;
		System.out.println(userName);
		String password = pass;
		boolean b = false;
		try {
			BufferedReader br = new BufferedReader(new FileReader(str));
			String line = null;
			while ((line = br.readLine()) != null) {
				String t[] = line.split("-");
				String pas = t[1];
				String email = t[2];
				if (email.equals(userName) && pas.equals(password)) {
					b = true;
				}
			}
			br.close();
		} catch (Exception e) {
			e.getMessage();
		}
		return b;
	}

	public void userRole(String userName2) {
		String user = userName2;
		try {
			BufferedReader br = new BufferedReader(new FileReader(str));
			String line = null;
			while ((line = br.readLine()) != null) {
				String s[] = line.split("-");
				String usern = s[2];
				if (user.equals(usern)) {
					String role = s[4];
					setRole(role);
				}
			}
			br.close();
		} catch (Exception e) {
			e.getMessage();
		}

	}
}
