<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Forward Result</title>
</head>
<body>

attribute 값 읽기 <br><br>

/* <+% 방식 */ <br>
SUM : <%= request.getAttribute("Sum") %> ,<br>
PRODUCT:  <%= request.getAttribute("Product") %> <br><br>


/* $+{+} 방식 */<br>
SUM = ${Sum } 이고, PRODUCT = ${Product } 이다.<br>

</body>
</html>