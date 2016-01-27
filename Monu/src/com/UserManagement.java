package com;

public interface UserManagement {
	void setFilePath(String fp);

	void saveUser(String a, String b, String c, String e, String f);

	boolean isUserValid(String user, String pass);

}
