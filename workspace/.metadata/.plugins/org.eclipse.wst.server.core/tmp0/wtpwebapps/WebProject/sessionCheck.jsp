<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>session Check</title>
</head>
<body>


ID : <%= (String)request.getAttribute("sessID") %><br>
이름 : <%= (String)request.getAttribute("sessName") %><br> 

ID : ${sessID }<br>
이름 : ${sessName }<br>


왜 안되지??

</body>
</html>