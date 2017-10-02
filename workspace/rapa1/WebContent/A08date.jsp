<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.GregorianCalendar" %>  <!-- @는 지시자로서 상황설명하는 기능 -->
<!-- ; import 해주는 방법 -->
<!DOCTYPE html >
<html>
<head>
	<meta charset=UTF-8">
	<title> 날짜처리 JSP </title>  <!-- 시간기록들이 필요할때 사용 -->
</head>
<body>

	날짜 처리 import 과정<br>
<%
	GregorianCalendar now = new GregorianCalendar();  
	// ; ctrl+shft+o 가 안먹히므로 dummy로 가서 복사해서 page import 한다.
	
	String day = String.format("%TF", now);
	String time = String.format("%TT", now);
	
%>
	현재 날짜 = <%=day %> <br>
	현재 시간 = <%=time %> <br>
	
<%@ include file = "A09include.jsp" %>

</body>
</html>

