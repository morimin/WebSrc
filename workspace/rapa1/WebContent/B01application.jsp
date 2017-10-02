<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");  // 한글깨짐 방지 

%>


<!DOCTYPE html >
<html>
<head>
	<meta charset="UTF-8">
	<title> application 정보 </title>  
</head>
<body>


	내장 변수 : request, response, application ... <br>
	현재 이 어플리케이션은 절대 경로(C:\...)같은 path정보를 알아야 파일 업로드를 할 수 있다. <br>
	
<%
	String appPath = application.getContextPath();
	String filePath = application.getRealPath("B01application.jsp"); // 현재 jsp 파일이름		

%>

	현재 파일의 경로 = <%= appPath %> <br>
	파일의 실제 경로 = <%= filePath %> <br>
	


</body>
</html>

