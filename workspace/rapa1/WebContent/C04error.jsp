<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");  // 한글깨짐 방지 

%>


<!DOCTYPE html >
<html>
<head>
	<meta charset="UTF-8">
	<title> C04error.jsp </title>  <!-- 시간기록들이 필요할때 사용 -->
</head>
<body>

	에러가 발생했습니다. <br><br>
	
	무슨에러...???<br><br>
	
	<%= request.getAttribute("MyReason") %>  <br>
	<!-- ; 값을 보고싶을때에는 ; 이 아님. ; 는 문장이라는 소리 -->
	ExMsg = <%= request.getAttribute("ExMsg") %><br>
	


</body>
</html>

