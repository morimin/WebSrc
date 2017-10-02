<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<%@ page import="java.util.*" %>    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	ArrayList<String> book = new ArrayList<String>();
	
	book.add("AA");  // AA
	book.add("BB");  // AA-BB
	book.add("CC");  // AA-BB-CC
	book.add("DD");  // AA-BB-CC-DD
	book.add(1, "KK");  // AA-KK-BB-CC-DD
	// ; 1 번 자리에 KK 를 add
	
	request.setAttribute("Book", book); // Book 이라는 객체가 book 에서 왔다.	
	
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>D09forEach.jsp</title>
</head>
<body>	
	반복문 수행 = c:forEach 문을 사용 <br><br>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		${i } <br> <!-- 변수 i 가 있는데 이것은 1부터 10까지임 -->		
	</c:forEach>	
	
	<hr>
	
	<c:forEach var="b" items="${Book }" varStatus="i" >
		${i.index } - ${b } <br> 	
	</c:forEach>
	<!-- enhancedFor 문과 비슷하다. b를 Book이라는 곳에서 가져와서 i 만큼 돌려라(?) -->
	
	
	
</body>
</html>







