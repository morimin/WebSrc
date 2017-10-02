<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");  // 한글깨짐 방지 

%>


<!DOCTYPE html >
<html>
<head>
	<meta charset="UTF-8">
	<title> 사용자 입력 </title>  <!-- 시간기록들이 필요할때 사용 -->
</head>
<body>

	JSP 파일에서 바로 입력값을 내장변수 를 사용해서 검사한다.<br><br>
	
	첫작업은 한글깨짐 처리<br><br>
	
	<hr>
	
	처리는 내장변수(built-in variable) request/ response를 이용<br>
	
	입력한 id 값 : <%= request.getParameter("id") %> 이고 <br>
	입력한 비번 값 : <%= request.getParameter("password") %> 입니다.<br>
	
	


</body>
</html>

