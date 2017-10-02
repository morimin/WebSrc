<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<%@ page import="java.util.*" %>    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
		
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>D11catch.jsp</title>
</head>
<body>	

	try~catch 와 같이 예외처리를 하고 싶을때 사용<br><br>
	
	<c:set var="num1" value = "3" />	
	<c:set var="num2" value = "0" />
	
	<c:catch var = "e">
		${num1 } / ${num2 } = ${num1 / num2 } <br>	
		<% int result = 2/0; %>
	</c:catch>	
	<!-- 예외시 e라는 곳에 뭔가를 적어주겠다는 소리 -->
	
	<c:if test="${e ne null }"> <!-- e가 null이 아니면 -->
		에러 발생 : ${e.message }	
	</c:if>

	
</body>
</html>







