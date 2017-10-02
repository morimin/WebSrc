<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset=UTF-8">
	<title> B09checkLogin.jsp </title>
</head>
<body>

세션을 이용하여 로그인 되었다면, 세선정보를 확인할 수도 있어야 한다. <br><br>

<!-- session 값으로 불러오기 때문에 강제 casting 해줘야한다. -->
아이디 <%= (String)session.getAttribute("sessID") %>   
이름 <%= (String) session.getAttribute("sessName") %>  



</body>
</html>



