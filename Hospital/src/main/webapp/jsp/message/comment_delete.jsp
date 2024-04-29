<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "../dbConn.jsp" %>
<%
try {
    // 작성일을 기준으로 정렬된 num 값을 가져오는 쿼리
    String num = request.getParameter("num");
    String p_num = request.getParameter("p_num");
    String insertQuery = "DELETE FROM hospital.comments WHERE num=" + num;
    PreparedStatement deletepsmt = conn.prepareStatement(insertQuery);
    deletepsmt.executeUpdate();
    
    String selectQuery = "SELECT num FROM hospital.comments ORDER BY reg_date ASC";
    PreparedStatement selectpsmt = conn.prepareStatement(selectQuery);
    ResultSet rs = selectpsmt.executeQuery();

    // num 값들을 순서대로 업데이트하는 쿼리
    String updateQuery = "UPDATE hospital.comments SET num=? WHERE num=?";
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

    response.sendRedirect("post_read.jsp?num=" + p_num);
} catch (Exception ex) 
{
    out.println("오류가 발생했습니다. 오류 메시지: " + ex.getMessage());
}
%>