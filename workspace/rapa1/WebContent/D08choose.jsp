<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>D08choose.jsp</title>
</head>
<body>	
	c:choose 는 자바문법의 switch(ifesle 5번 이상 반복) 의 유사한 기능 <br>
	파라미터로 num 가 온다고 가정<br><br>
	
	<c:choose>
		<c:when test="${param.num eq 0 }"> <!-- param.num == 0 이 만족하면 다음을 수행 -->
			ZERO
		</c:when>
		
		<c:when test="${param.num eq 1 }"> <!-- param.num == 1 이 만족하면 다음을 수행 -->
			ONE
		</c:when>
		
		<c:when test="${param.num eq 2 }"> <!-- param.num == 2 이 만족하면 다음을 수행 -->
			TWO
		</c:when>
		
		<c:otherwise> 
			UNKNOWN
		</c:otherwise>				
	
	</c:choose>	

</body>
</html>







