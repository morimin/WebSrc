<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage = "true" %>
    <!-- ; 이 문서가 에러페이지라고 등록해주는 것임 -->
    


<%
	request.setCharacterEncoding("utf-8");  // 한글깨짐 방지 
	response.setStatus(200);  // 상태를 200으로 제대로 받았음 으로 인식하게 된다.

	System.out.println("JSP 파일에서 sysout을 이용한 출력하기.");
	
%>


<!DOCTYPE html >
<html>
<head>
	<meta charset="UTF-8">
	<title> C06error.jsp </title>  
</head>
<body>

	에러가 발생했습니다. <br><br>
	
	파라미터가 잘못 되었다.<br><br>
	
	<!-- 내장변수를 사용하여 에러 메시지를 나타내어보자. -->
	이유 : <%= exception.getMessage() %><br>	<br>
	
	
	<%
		application.log("[로그기록 테스트] C06error.jsp 에서 로그를 남긴다.");	
	%>
	
	


</body>
</html>

