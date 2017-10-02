<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>       
<%@ page import="java.util.*" %> 
   
<%@ page import="java.sql.*" %>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
 request.setCharacterEncoding("utf-8");
 response.setCharacterEncoding("utf-8");  
%> 
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DBMS Query Test . JSP</title>
</head>
<body>

	<form method = post action ="DbmsInsertTest">
		
		ID <input type="text" name="id"><br>
		PW <input type="password" name="pass"><br>
		NAME <input type="text" name="name"><br>
		LEVEL <input type="text" name="level"><br><br>
		<input type="submit" value="DB정보삽입"><br>
	
	</form>

결과값은 : ${result } <br>
<br>
<br>
총 삽입 수는 : ${affectedCount }


</body>
</html>