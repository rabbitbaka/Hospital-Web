<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="user" class="member.User" scope="session"/>
<jsp:setProperty name="user" property="*" />
<%@ page import = "java.sql.*" %>
<%@ include file = "../dbConn.jsp" %>

<%
   String u_name = user.getName();
   String u_id = user.getId();
   String u_pw = user.getPassword();
   String u_mail = user.getEmail();

   // 중복된 ID 확인
   String checkIdSql = "SELECT COUNT(*) FROM user WHERE id = ?";
   PreparedStatement checkIdStmt = conn.prepareStatement(checkIdSql);
   checkIdStmt.setString(1, u_id);
   ResultSet checkIdResult = checkIdStmt.executeQuery();
   checkIdResult.next();
   int duplicateIdCount = checkIdResult.getInt(1);
   
   // 중복된 Name 확인
   String checkNameSql = "SELECT COUNT(*) FROM user WHERE name = ?";
   PreparedStatement checkNameStmt = conn.prepareStatement(checkNameSql);
   checkNameStmt.setString(1, u_name);
   ResultSet checkNameResult = checkNameStmt.executeQuery();
   checkNameResult.next();
   int duplicateNameCount = checkNameResult.getInt(1);
   
   if (duplicateIdCount > 0) {
	  		response.sendRedirect("Join_failed.jsp");
	   } else if (duplicateNameCount > 0) {
	      response.sendRedirect("Join_failed_name.jsp");
	   } else {
      String sql = "INSERT INTO user(name, id, passwd, email) VALUES (?, ?, ?, ?)";
      PreparedStatement insertStmt = conn.prepareStatement(sql);
      insertStmt.setString(1, u_name);
      insertStmt.setString(2, u_id);
      insertStmt.setString(3, u_pw);
      insertStmt.setString(4, u_mail);
      
      int count = insertStmt.executeUpdate();
      if (count == 1) {
         response.sendRedirect("../Login/Login.jsp");
      } else {
         response.sendRedirect("Join_failed.jsp");
      }

      insertStmt.close();
   }

   checkIdResult.close();
   checkIdStmt.close();
   checkNameResult.close();
   checkNameStmt.close();
   conn.close();
%>