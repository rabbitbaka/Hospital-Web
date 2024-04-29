<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "../dbConn.jsp" %>

<% 
String u_name = request.getParameter("name");
String u_email = request.getParameter("email");

String sql = "SELECT * FROM user WHERE name=? AND email=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, u_name);
pstmt.setString(2, u_email);
ResultSet rs = pstmt.executeQuery();


if (rs.next()) {
    String u_id = rs.getString("id");
    %>
    <script>
    var u_id = "<%=u_id%>";
    alert("당신의 아이디는 [ " + u_id + " ] 입니다!");
    window.location.href = "Login.jsp";
    </script>
    <% 
} else {
    %>
    <script>
    alert("존재하는 아이디가 없습니다!");
    window.location.href = "findid.jsp";
    </script>
    <% 
}
rs.close();
pstmt.close();
conn.close();
%>