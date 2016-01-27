<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
<body>
<form action="Registration" method="post">
	<h1>
		Registration page
	</h1>
	<center>
        <br><br><br>
    <tr>
        <td><br>
     <h3>User Name:</h3><input type="text" name="username">
        </td>
    </tr>
    <tr>
        <td>
     <h3>Password:</h3><input type="password" name="password">
        </td>
    </tr>
    <tr>
        <td>
     <h3>Email:</h3><input type="text" name="email">
        </td>
    </tr>
    <tr>
        <td>
     <h3>Mobile:</h3><input type="text" name="mobile">
        </td>
    </tr><br>
    <h3>Role</h3>
    <select name="role" value="coach"/>
    <option name="select">select Role</option>
                <option name="admin" value="admin">Admin</option>
                <option name="student" value="student">Student</option>
                <option name="coach" value="coach">Coach</option>
    </select><br><br></font>
    <input type="submit" name="signup" value="signup"/>
        <input type="reset" name="" value="clear"/><br>
        </form>
</center>
</form>
</body>
</html>