<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 
	request.setCharacterEncoding("utf-8");

	String[] students = new String[3];
	students[0] = "이순신";
	students[1] = "광개토";
	students[2] = "을지문덕";
	
	request.setAttribute("STD", students);
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>C08EL.jsp</title>
</head>
<body>

	EL은 다양한 연산자를 제공<br>
	+, - , *, /, ==, >, <, ..<br>
	eq, gt, lt, ne<br>
	&&, ||, !, and, or, not <br>
	?, empty, (), [] <br>
	
	<hr>
	
	파라미터 EMPTY 연산 <br>
	
	안녕하세요 ${empty param.id ? "guest" : param.id } 님<br>
	
	파라미터 E08.jsp?id=test&str1=hello&str2=world<bR>  <!-- hello world 비교 -->
	str1 = ${param.str1 }, str2 = ${param.str2 } <br> 
	두 문자열이 같냐 : ${param.str1 eq param.str2 } <br> <!-- 같으면 출력 -->
	두 문자열이 다르냐 : ${param.str1 ne param.str2 } <br> <!-- 다르면 출력 -->
	대소비교 : ${param.str1 gt param.str2 ? param.str1 : param.str2 }<br> <!-- greater than -->
	대소비교 : ${param.str1 lt param.str2 ? param.str1 : param.str2 }<br> <!-- less than -->

	<hr>
	배열로 등록된 attribute를 EL로 읽어보기<br>
	${STD[0] }<br>
	${STD[1] }<br>
	${STD[2] }<br>
		

</body>
</html>




