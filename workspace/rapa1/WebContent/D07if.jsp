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
<title>D07if.jsp</title>
</head>
<body>
	
	D07if.jsp?num1=5&num2=3 ; 이런식으로 입력할것임<br><br>
	
	파라미터 검사(찾기) num1 = ${param.num1 }, num2=${param.num2 } <br><br>
	
	<!-- if 문을 쓸때 test 는 필수임 -->
	<c:if test="${param.num1 gt param.num2 }">  <!-- num1 이 num2 보다 더 크면 수행 -->
		큰값은 ${param.num1 } <br>	
	</c:if>
	<c:if test="${param.num1 lt param.num2 }">  <!-- num1 이 num2 보다 작으면 수행 -->
		큰값은 ${param.num2 } <br>	
	</c:if>
	<!-- jsp 에서는 else if 를 제공해주지 않기 때문에 하나하나 if문을 적어줘야 한다. -->
	
	
	

	

</body>
</html>







