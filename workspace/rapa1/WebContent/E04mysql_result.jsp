<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>       
<%@ page import="java.util.*" %> 
   
<%@ page import="java.sql.*" %>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");		
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E04mysql_result.jsp</title>

<link rel="stylesheet" href="css/style.css">

</head>
<body>	
	
	E03에서 수집한 데이터를 태그만으로 출력<br><br>
	
	데이터의 갯수 : ${listsize } <br><br>
	
	<table border=1>
		<tr>
			<td>순서</td>
			<td>아이디</td>
			<td>이름</td>
			<td>레벨</td>
			<td>비고</td>		
		</tr>	
		
		<c:forEach var="i" begin="0" end="${listsize-1 }">
			<tr>
				<td>${listIdx[i] }</td>
				<td>${listId[i] }</td>
				<td>${listName[i] }</td>
				<td>${listLevel[i] }</td>
				<td>비고</td>		
			</tr>			
		</c:forEach>		
	</table>	

	
</body>
</html>







