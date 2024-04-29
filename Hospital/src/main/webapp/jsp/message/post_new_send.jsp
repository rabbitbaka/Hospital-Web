
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "../dbConn.jsp" %>

<%
try
{
    request.setCharacterEncoding("UTF-8");
    Timestamp today_date = new Timestamp(System.currentTimeMillis());
    String writer = (String)session.getAttribute("UserName");
    String title = request.getParameter("title");
    String content = request.getParameter("contents");
	
	int num = 0;
	String insertQuery = "SELECT MAX(num) from hospital.post";
	PreparedStatement psmt = conn.prepareStatement(insertQuery);
	ResultSet result = psmt.executeQuery();
	
	// 받아온 정보가 있을때
	while(result.next())
	{
	    num = result.getInt("MAX(num)") + 1;
	}
	insertQuery = "INSERT INTO hospital.post(num, title, writer, content, reg_date) VALUES (?, ?, ?, ?, ?)";
	
	// SQL 쿼리문을, 새로운 내용을 토대로 재실행
	psmt = conn.prepareStatement(insertQuery);
	psmt.setInt(1, num);
	psmt.setString(2, title);
	psmt.setString(3, writer);
	psmt.setString(4, content);
	psmt.setTimestamp(5, today_date);
	psmt.executeUpdate();
	if (session.getAttribute("UserName")=="관리자"){
		response.sendRedirect("../Manager/M_message.jsp");
	} else
	{
		response.sendRedirect("message.jsp");
	}
}
catch (Exception ex)
{
    out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>