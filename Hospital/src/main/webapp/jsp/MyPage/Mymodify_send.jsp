
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "../dbConn.jsp" %>
<%
try
{
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String passwd = request.getParameter("password");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    
    String insertQuery = "SELECT * FROM hospital.user WHERE id=?";
    PreparedStatement psmt = conn.prepareStatement(insertQuery);
    psmt.setString(1, id);
    ResultSet result = psmt.executeQuery();
    
    // 받아온 정보가 있을때
    while(result.next())
    {
    	insertQuery = "UPDATE hospital.user SET name=?, id=?, passwd=?, email=? WHERE id=?";
    	psmt = conn.prepareStatement(insertQuery);
    	psmt.setString(1, name);
    	psmt.setString(2, id);
    	psmt.setString(3, passwd);
    	psmt.setString(4, email);
    	psmt.setString(5, id);
    	psmt.executeUpdate();
      
	    session.setMaxInactiveInterval(60*30);
	    session.setAttribute("UserName", name);
	    session.setAttribute("UserId", id);
	    session.setAttribute("UserPw", passwd);
	    session.setAttribute("UserEmail", email);
      response.sendRedirect("MyPage.jsp");
 	}
}
catch (Exception ex)
{
    out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>