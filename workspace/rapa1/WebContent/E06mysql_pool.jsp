<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");		
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E06mysql_pool.jsp</title>


</head>
<body>	
태그를 이용하여 DB connection Pool 을 확인할 것임 <br><br>

	<!-- 커넥션풀이 정상적으로 잘 등록되어있는지만 확인하는 방법임 -->
	<sql:query var = "rs" dataSource="jdbc/rapadb1_pool">
		select id, name, level from users
	</sql:query>

	<hr>
	
	<!-- 결과보기 -->
	<c:forEach var="row" items="${rs.rows }">
		이름 : ${row.name }, id : ${row.id }, level : ${row.level } <br>
	</c:forEach> 

</body>
</html>







