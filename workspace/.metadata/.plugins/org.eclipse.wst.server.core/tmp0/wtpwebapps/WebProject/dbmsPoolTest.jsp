<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pool Test.JSP</title>
</head>
<body>

<sql:query var ="rs" dataSource="jdbc/smdb_pool">
	SELECT ID, NAME, LEVEL FROM USERS	
</sql:query>

<hr>

<c:forEach var="row" items="${rs.rows }">
	이름: ${row.name }, ID: ${row.id }, LEVEL: ${row.level } <br>
</c:forEach>

</body>
</html>