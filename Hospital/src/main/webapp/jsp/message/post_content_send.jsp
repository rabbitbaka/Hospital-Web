<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "../dbConn.jsp" %>

<%
try
{
    request.setCharacterEncoding("UTF-8");
    Timestamp today_date = new Timestamp(System.currentTimeMillis());
    String p_num = request.getParameter("num");
    String name = request.getParameter("name");
    String content = request.getParameter("content");
	
	int num = 0;
	String insertQuery = "SELECT MAX(num) from hospital.comments";
	PreparedStatement psmt = conn.prepareStatement(insertQuery);
	ResultSet result = psmt.executeQuery();
	
	// 받아온 정보가 있을때
	while(result.next())
	{
	    num = result.getInt("MAX(num)") + 1;
	}
	insertQuery = "INSERT INTO hospital.comments(p_num, num, name, content, reg_date) VALUES (?, ?, ?, ?, ?)";
	
	// SQL 쿼리문을, 새로운 내용을 토대로 재실행
	psmt = conn.prepareStatement(insertQuery);
	psmt.setString(1, p_num);
	psmt.setInt(2, num);
	psmt.setString(3, name);
	psmt.setString(4, content);
	psmt.setTimestamp(5, today_date);
	psmt.executeUpdate();

	response.sendRedirect("post_read.jsp?num=" + p_num);
}
catch (Exception ex)
{
    out.println("post_content_send 오류 메시지 : " + ex.getMessage());
}
%>