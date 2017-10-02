<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<!-- ; DataSource 들어가있다. -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");		
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E07dbcp.jsp</title>


</head>
<body>	
	
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/rapadb1_pool");
		// ; Context 내부를 읽어오면서 rapadb1_pool 을 찾아서 가져온다.
		
		
		/* get connection */
		//
		conn = ds.getConnection();
		String sql = "select * from users";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while( rs.next() )
		{
			out.print("name = " + rs.getString("name") );
			out.print(", id = " + rs.getString("id") );
			out.print(", idx = " + rs.getInt("idx") );
			out.print(", level = " + rs.getInt("level") + "<br>" );
			
		}// while
			
			
		/* resource release into connection pool */
		//
		rs.close();
		pstmt.close();
		conn.close();
		
	}catch(Exception e){
		out.print("ERROR : " + e.getMessage() + "<br>");
	}

%>


</body>
</html>







