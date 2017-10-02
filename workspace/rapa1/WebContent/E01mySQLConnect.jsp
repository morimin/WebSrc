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
<meta charset=UTF-8">
<title>E01mySQLConnect.jsp</title>
</head>
<body>	
	DB 접속을 프로그램으로 확인해보겠다. <br><br>
	
	<%
	Connection conn;
	
		try{
			Class.forName("com.mysql.jdbc.Driver");  // connector 복사해둔게 있어야 가능함.
			conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/rapadb1?characterEncoding=utf8" , "rapauser1", "rapapass1" );
			
			if(conn != null)
			{
				out.print("DB Connect OK <br>");
				
				conn.close();
				out.print("DB Class OK");
			}else
			{
				out.print("DB Connect Error <br>");
			}	
			
			
		}catch(Exception e)
		{
			out.print("Error : " + e.getMessage());
		}
			
	%>	
	
</body>
</html>







