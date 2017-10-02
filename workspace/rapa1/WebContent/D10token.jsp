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
<title>D10token.jsp</title>
</head>
<body>	
	Token 은 Delimeter(comma)로 문자를 구분할때 사용 <br><br>
	
	<select name=color style='width:150px; height:30px; background-color:#FFFF00;'>
	
		<c:set var="colors" value="RED, BLUE, YELLO, GREEN, BLACK" />
		<c:forTokens var="color" items="${colors }" delims="," >
		<!-- colors 로부터 가져와서 , 로 쪼갠 것을 color 로 셋팅하겠다. -->
			<option>${color } </option> 
		</c:forTokens>
		
	</select>
	
</body>
</html>







