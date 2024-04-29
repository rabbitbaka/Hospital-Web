<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "../dbConn.jsp" %>
<%
try {
    String id = request.getParameter("id");
    String insertQuery = "DELETE FROM hospital.user WHERE id='" + id + "'";
    PreparedStatement deletepsmt = conn.prepareStatement(insertQuery);
    deletepsmt.executeUpdate();

    response.sendRedirect("Manager.jsp");
    
    conn.close();
    deletepsmt.close();
    
} catch (Exception ex) 
{
    out.println("오류가 발생했습니다. 오류 메시지: " + ex.getMessage());
}
%>