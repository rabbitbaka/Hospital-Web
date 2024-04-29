<%@ page import="java.sql.*"%>
<% 
	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/hospital";
	String username = "root";
	String password = "happy60997";
	conn = DriverManager.getConnection(url, username, password);
%>
