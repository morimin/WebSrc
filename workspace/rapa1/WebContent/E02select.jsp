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
<title>E02select.jsp</title>
</head>
<body>	
	DB 데이터 확인.<br><br>
	
	데이터에 영향을 미치는 정보(insert, update, delete) : executeUpdate() 사용 <br>
	데이터에 영향을 미치지 않는 정보(select) : executeQuery() 사용<br>
	
	<%
	Connection conn;
	
	Statement stat = null;
	ResultSet rs = null;
	String sql = "";
	
	
		try{
			Class.forName("com.mysql.jdbc.Driver");  // connector 복사해둔게 있어야 가능함.
			conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/rapadb1?characterEncoding=utf8" , "rapauser1", "rapapass1" );
			
			if(conn != null)
			{
				out.print("DB Connect OK <br>");
				stat = conn.createStatement();
				
				/* insert 예제 */
				//
				sql = sql.format("insert into users (id, name, pass, level) values('%s','%s', password('%s'), '%d')","myid","내이름", "1111",1);
				int affectedCount = stat.executeUpdate(sql);  // 데이터의 영향을 미치는 것은 리턴타입이 숫자 = 영향을 미치는 갯수
				
				out.print("affectedCount = " + affectedCount + "<br>"); 
				 

				/* update 예제 */
				//
/* 				sql = sql.format("update users set id='mytestid', name='변경된 이름' where idx = '3'");
				int affectedCount = stat.executeUpdate(sql);  // 데이터의 영향을 미치는 것은 리턴타입이 숫자 = 영향을 미치는 갯수
				
				out.print("affectedCount = " + affectedCount + "<br>"); */
				

				 
				
				
				sql = "select * from users";
				rs = stat.executeQuery(sql);
				
				while(rs.next())
				{  // idx, id, name, level 값을 가져와 보기로 한다.
					int idx = rs.getInt("idx");
					String id = rs.getString("id");
					String name = rs.getString("name");
					int level = rs.getInt("level");
					
					// (idx, id, name, level) = (1, test, 홍길동 ,1);
					String result = "";
					result = result.format("(idx, id, name, level) = (%d, %s, %s, %d)<br>", idx, id, name, level);
					out.print(result);
				}
				
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







