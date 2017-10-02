<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<%@ page import="java.util.*" %>    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="date" value="<%= new Date() %>" />
<!-- ; 벨류값에 자바값으로 불러온 현재시간을 들어감 -->

<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");		
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>D12format.jsp</title>
</head>
<body>	
	date = ${date } <br>
	2016-08-12 12:34:56 의 형식으로 맞춰 주고 싶을 때, format을 이용한다.<br><br>
	
	오늘 날짜 : <fmt:formatDate value="${date }"/> <br>
	현재 시간 : <fmt:formatDate value="${date }" type="time"/> <br><br>
	
	표현방식 1 : <fmt:formatDate value="${date }" type="both"/> <br>
	표현방식 2 : <fmt:formatDate value="${date }" type="both" pattern="yyyy-MM-dd hh:mm:ss" /> : 이 형태로 맞춰주고 이형태를 주로 사용.!!<br>
	표현방식 3 : <fmt:formatDate value="${date }" type="both" pattern="(E)yyyy-MM-dd hh:mm:ss" />
	
	<hr>
	
	숫자 표현 방법<br>
	<fmt:formatNumber value="1234567890123" groupingUsed = "true" /> <br>
	
		
	
</body>
</html>







