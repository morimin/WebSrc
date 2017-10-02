<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 페이지 지시자 : error가 생기면 C06.jsp로 이동시켜라 -->    
<%@ page errorPage = "C06error.jsp" %>


<%
	request.setCharacterEncoding("utf-8");  // 한글깨짐 방지
	
	int op1 =0 , op2 = 0, result =0 ;  // 변수들 초기화
	String num1="";
	String num2="";
	
	

		num1 = request.getParameter("num1");  // num1 값을 읽어올것임
		num2 = request.getParameter("num2");  // num2 값을 읽어올것임
		
		op1 = Integer.parseInt(num1);
		op2 = Integer.parseInt(num2);
		
		result = op1 + op2 ;


%>


<!DOCTYPE html >
<html>
<head>
	<meta charset="UTF-8">
	<title> C05. adder </title>  <!-- 시간기록들이 필요할때 사용 -->
</head>
<body>

	non try ~ catch 방식 <br><br>
		
	num1, num2를 받아서 두 수를 더하는 프로그램이다. <br><br><br>
	
	
	<%= num1 %> + <%= num2 %> = <%= result %> <br><br>
	
	
	

</body>
</html>

