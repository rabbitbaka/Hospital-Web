<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "../dbConn.jsp" %>
<%
try {
    // 작성일을 기준으로 정렬된 num 값을 가져오는 쿼리
    String num = request.getParameter("num");
    String insertQuery = "DELETE FROM hospital.post WHERE num=" + num;
    PreparedStatement deletepsmt = conn.prepareStatement(insertQuery);
    deletepsmt.executeUpdate();
    
    String insertQuery2 = "DELETE FROM hospital.comments WHERE p_num=" + num;
    PreparedStatement deletepsmt2 = conn.prepareStatement(insertQuery2);
    deletepsmt2.executeUpdate();
    
    String selectQuery = "SELECT num FROM hospital.post ORDER BY reg_date ASC";
    PreparedStatement selectpsmt = conn.prepareStatement(selectQuery);
    ResultSet rs = selectpsmt.executeQuery();

    // num 값들을 순서대로 업데이트하는 쿼리
    String updateQuery = "UPDATE hospital.post SET num=? WHERE num=?";
    PreparedStatement updatePsmt = conn.prepareStatement(updateQuery);

    int newNum = 1; // 새로운 num 값

    while (rs.next()) {
        int oldNum = rs.getInt("num"); // 이전 num 값

        // num 값을 순서대로 업데이트
        updatePsmt.setInt(1, newNum);
        updatePsmt.setInt(2, oldNum);
        updatePsmt.executeUpdate();

        newNum++; // 새로운 num 값 증가
    }
	if (session.getAttribute("UserName")=="관리자"){
		response.sendRedirect("../Manager/M_message.jsp");
	} else
	{
		response.sendRedirect("message.jsp");
	}
} catch (Exception ex) 
{
    out.println("오류가 발생했습니다. 오류 메시지: " + ex.getMessage());
}
%>