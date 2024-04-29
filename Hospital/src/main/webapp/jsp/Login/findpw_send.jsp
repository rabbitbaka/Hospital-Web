<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "../dbConn.jsp" %>

<% 
String u_name = request.getParameter("name");
String u_email = request.getParameter("email");
String u_id = request.getParameter("id");

String sql = "SELECT * FROM user WHERE name=? AND email=? AND id=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, u_name);
pstmt.setString(2, u_email);
pstmt.setString(3, u_id);
ResultSet rs = pstmt.executeQuery();

if (rs.next()) {
    String u_pw = rs.getString("passwd");
    %>
    <script>
    var u_pw = "<%=u_pw%>";
    alert("당신의 비밀번호는 [ " + u_pw + " ] 입니다!");
    window.location.href = "Login.jsp";
    </script>
    <% 
} else {
    %>
    <script>
    alert("정보가 틀렸습니다!");
    window.location.href = "findid.jsp";
    </script>
    <% 
}
rs.close();
pstmt.close();
conn.close();
%>