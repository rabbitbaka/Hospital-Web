<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "../dbConn.jsp" %>
<%
   String u_id = (String)session.getAttribute("UserId");
   String sql = "DELETE FROM Hospital.user WHERE id = ?";
   
   
   PreparedStatement sm = conn.prepareStatement(sql);
   sm.setString(1, u_id);
   session.invalidate();
   int count = sm.executeUpdate();
   
   if(count == 1){
	   response.sendRedirect("../Start.jsp"); 
   } else {
	   out.println("회원 탈퇴를 실패하였습니다."); 
   }
   sm.close();
   conn.close();
%>

