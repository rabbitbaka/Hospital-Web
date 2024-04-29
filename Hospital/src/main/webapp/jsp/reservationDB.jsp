<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbConn.jsp"%>

<%
String name = (String)session.getAttribute("name");
String birth = (String)session.getAttribute("birth");
String choice = (String)session.getAttribute("choice");
String ph01 = (String)session.getAttribute("ph01");
String ph02 = (String)session.getAttribute("ph02");
String ph03 = (String)session.getAttribute("ph03");
String number = "("+choice+")"+ph01+"-"+ph02+"-"+ph03;
String gender = (String)session.getAttribute("sex");

Object sickObject = session.getAttribute("sick");
String[] sickArray = (String[]) sickObject;
String sick = String.join(", ", sickArray);

String intro = (String)session.getAttribute("intro");
String year = (String)session.getAttribute("year");
String month = (String)session.getAttribute("month");
String day = (String)session.getAttribute("day");
String hour = (String)session.getAttribute("hour");
String minute = (String)session.getAttribute("minute");
int minute2 = 0;
if(minute != null && !minute.isEmpty()){
		minute = "0" + minute;
    minute2 = Integer.parseInt(minute);
}
String minuteStr = minute2 < 10 ? "0" + minute2 : String.valueOf(minute2);
String days = year+"-"+month+"-"+day+" "+hour+":"+minuteStr;

String sql = "INSERT INTO reservation(name, birth, number, gender, sick, intro, days) VALUES (?, ?, ?, ?, ?, ?, ?)";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, name);
pstmt.setString(2, birth);
pstmt.setString(3, number);
pstmt.setString(4, gender);
pstmt.setString(5, sick);
pstmt.setString(6, intro);
pstmt.setString(7, days);
int rs = pstmt.executeUpdate();
%>
<script>
alert("예약이 완료되었습니다!");
window.location.href = "reservation.jsp";
</script>
<%
pstmt.close();
%>