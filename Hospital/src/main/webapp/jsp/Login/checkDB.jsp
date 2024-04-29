<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="user" class="member.User" scope="session"/>
<jsp:setProperty name="user" property="*" />
<%@ page import = "java.sql.*" %>
<%@ include file = "../dbConn.jsp" %>

<%
		String u_id = user.getId();
		String u_pw = user.getPassword();

		String sql = "SELECT * FROM user WHERE id=? AND passwd=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, u_id);
		pstmt.setString(2, u_pw);
		ResultSet rs = pstmt.executeQuery();

		if (u_id.equals("space") && u_pw.equals("1234")) {
			session.setAttribute("UserName", "관리자");
			response.sendRedirect("../Manager/Manager.jsp");
		} else if (rs.next()) {
		    // 로그인 성공 시, 세션 추가
		    String u_name = rs.getString("name");
        String u_email = rs.getString("email");
        
		    session.setMaxInactiveInterval(60*30);
		    session.setAttribute("UserName", u_name);
		    session.setAttribute("UserId", u_id);
		    session.setAttribute("UserPw", u_pw);
		    session.setAttribute("UserEmail", u_email);
		    response.sendRedirect("../Start.jsp"); 
		} else {
		    // 로그인 실패 시
		    response.sendRedirect("Login_failed.jsp"); 
		}

		rs.close();
		pstmt.close();
%>