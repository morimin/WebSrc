<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");  // 한글깨짐 방지 

%>


<!DOCTYPE html >
<html>
<head>
	<meta charset="UTF-8">
	<title> forward 결과 </title>  
</head>
<body>

	
	attribute 값을 읽기 <br><br> <!-- 메모리값 읽기 -->
	
	<!-- 표현방식이 두가지 방법이다. -->
	 
	SUM : <%= request.getAttribute("Sum") %>, <br>
	PRODUCT : <%= request.getAttribute("Product") %> <br><br>
	
	SUM = ${Sum} 이고,PRODUCT = ${Product } 이다. <br> 


</body>
</html>




