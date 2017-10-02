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
<title>D03process.jsp</title>
</head>
<body>	
	DB에서 데이터 수집만 하고, 그 결과를 attribute에 설정만 하기.<br>
	수집이 끝나면 페이지를 이동 <br>
	이동된 페이지에서 태그형태로 표현<br>
	
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
				
				sql = "select * from users";
				rs = stat.executeQuery(sql);				
				
				List<String> listName = new ArrayList<String>();
				List<Integer> listIdx = new ArrayList<Integer>();
				List<String> listId = new ArrayList<String>();
				List<Integer> listLevel = new ArrayList<Integer>();
				
				
				
				while(rs.next())
				{  // idx, id, name, level 값을 가져와 보기로 한다.
					int idx = rs.getInt("idx");
					String id = rs.getString("id");
					String name = rs.getString("name");
					int level = rs.getInt("level");
					
					
					listName.add(name);  // name 값을 listName 에 추가
					listIdx.add(idx);
					listId.add(id);
					listLevel.add(level);		

				}// while
					
					
				request.setAttribute("listName", listName);
				request.setAttribute("listIdx", listIdx);
				request.setAttribute("listId", listId);
				request.setAttribute("listLevel", listLevel);
				
				int listsize = listName.size();  // length 와 같음
				request.setAttribute("listsize", Integer.toString(listsize));			
				
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
		
		
		RequestDispatcher rd = request.getRequestDispatcher("E04mysql_result.jsp");  // A06add.jsp 파일로 페이지를 이동시켜줌
		rd.forward(request, response);  
			
	%>	
	
</body>
</html>







