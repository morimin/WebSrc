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
<title>DBMS Conn Test . JSP</title>
</head>
<body>

<%
 Connection conn;
 
  try{
   Class.forName("com.mysql.jdbc.Driver");  // connector 복사해둔게 있어야 가능함.
   conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/smdb?characterEncoding=utf8" , "smuser1", "smpass" );
   
   if(conn != null)
   {
    out.print("DB Connect OK <br>");
    
    conn.close();
    out.print("DB Close OK");
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