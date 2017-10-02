<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>       
<%@ page import="java.util.*" %>   
<%@ page import="java.sql.*" %> 

<%@ page import="org.apache.commons.dbcp2.*" %>
<%@ page import="org.apache.commons.pool2.*" %>
<%@ page import="org.apache.commons.pool2.impl.*" %>   

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");		
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E05connectionPool.jsp</title>


</head>
<body>	

<%
	final String POOL_NAME = "/rapadb1_pool";  //rapadb1 에 접속하는 pool 로 이름 선언	
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs=null;
	
	
	try{
		ConnectionFactory connectionFactory = new DriverManagerConnectionFactory (
				"jdbc:mysql://localhost:3306/rapadb1?characterEncoding=utf8",
				"rapauser1", "rapapass1" );
		
		PoolableConnectionFactory poolableConnectionFactory = new PoolableConnectionFactory(connectionFactory, null);
		
		GenericObjectPoolConfig objectPoolConfig = new GenericObjectPoolConfig();
		
		objectPoolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
		//  ; 1000L = 1초  * 60L = 1분 * 5L = 5분 마다 확인하겠다. 
		objectPoolConfig.setTestWhileIdle(true);
		objectPoolConfig.setMinIdle(4);
		objectPoolConfig.setMaxTotal(50);
		// ; 최대 50개 까지 사용하겠다.
		
		GenericObjectPool<PoolableConnection> objectPool = new GenericObjectPool<PoolableConnection>(poolableConnectionFactory, objectPoolConfig);
		
		PoolingDriver poolingDriver = new PoolingDriver();
		poolingDriver.registerPool(POOL_NAME, objectPool);
		// ; 매번 등록을 해줘야 한다.
		
		
		/* ConnectionPool 목록 확인 */
		//
		PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:mysql");
		// 나중에 oracle 쓸때에는 mysql 자리 대신에 oracle 입력
		
		String[] names = driver.getPoolNames();
		
		for( int cnt=0 ; cnt < names.length ; cnt ++ )
		{
			out.println(cnt + " : " + names[cnt] + "<br>");			
		}
		
		
		conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:" + POOL_NAME);
		String sql = "select * from users";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			out.println(" id = " + rs.getString("id") + ", name = " + rs.getString("name") + "<br>");			
		}
		
		if (conn != null)
		{
			conn.close();
		}
		
		out.print("OKAY");
		
		
		
	}catch(Exception e){		
		out.print("Fail : " + e.getMessage());
	}
	

%>
	
</body>
</html>







