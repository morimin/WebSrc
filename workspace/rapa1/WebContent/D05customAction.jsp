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
<title>D05customAction.jsp</title>
</head>
<body>
	
	커스텀 액션을 처리하기 위해 라이브러리가 설치되어야 한다.<br>
	Download : http://tomcat.apache.org/taglibs.html <br>
	정확한 명칭은 : JSTL (JSP Standard Tag Library) <br><br>
	
	Attr Set 예제<br><br>
	
	<c:set var="num1" value="5" /> <br>
	<!-- prefix setting 변수=num1 값은 5 // Attr set 과 같다 -->
	 
	
	<c:set var="num2" value = "3" />	<br>
	<c:set var="result" value = "${num1 + num2 }" />	
	
	${num1 } + ${num2 } = ${result } or  ${num1 + num2 } <br>
	
	<hr>
	set 할 때 scope를 설정 <br><br>
	
	<c:set var="myName" value="홍길동" scope="request" />
	<c:set var="myID" value="kdhong" scope="request" />	
	
	<jsp:forward page="D06cAResult.jsp" />  
	

</body>
</html>







