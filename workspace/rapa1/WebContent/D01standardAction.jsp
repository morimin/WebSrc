<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 

	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	


%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>D01standardAction.jsp</title>
</head>
<body>
	표준 액션 vs 커스텀 액션 <br><br>
	
	<!-- 자바를 태그형태로 사용하는 방법. 표준액션 -->
	
	<!-- 
	<jsp:include page="index.html" /> <br><br>
	 -->
	
	<%
		request.setAttribute("TestAttr", "1234");	
	%> 
	 
	<jsp:forward page="C08eL.jsp" /> ${TestAttr }
	
	
	
	
	
	
	
	

</body>
</html>







