<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>get Path</title>
</head>
<body>

<%
	String appPath = application.getContextPath();
	String filePath = application.getRealPath("getPath.jsp");
	
%>

현재 파일의 결로 = <%= appPath %><br>
파일의 실재 경로 = <%= filePath %> <br>



</body>
</html>