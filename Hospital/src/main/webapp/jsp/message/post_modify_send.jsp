
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "../dbConn.jsp" %>
<%
try
{
    request.setCharacterEncoding("UTF-8");
    String writer = request.getParameter("writer");
    String title = request.getParameter("title");
    String content = request.getParameter("contents");
    String num = request.getParameter("num");
    
    String insertQuery = "SELECT * FROM hospital.post WHERE num=" + num;
    PreparedStatement psmt = conn.prepareStatement(insertQuery);
    ResultSet result = psmt.executeQuery();
 	
    // 받아온 정보가 있을때
    while(result.next())
    {
        insertQuery = "UPDATE hospital.post set title=?, writer=?, content=? WHERE num=" + num;
        psmt = conn.prepareStatement(insertQuery);
        psmt.setString(1, title);
        psmt.setString(2, writer);
        psmt.setString(3, content);
        psmt.executeUpdate();
    	if (session.getAttribute("UserName")=="관리자"){
    		response.sendRedirect("../Manager/M_message.jsp");
    	} else
    	{
    		response.sendRedirect("message.jsp");
    	}
    }
}
catch (Exception ex)
{
    out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>