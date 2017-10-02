<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");  // 한글깨짐 방지
	
	int op1 =0 , op2 = 0, result =0 ;  // 변수들 초기화
	String num1="";
	String num2="";
	
	
	try
	{
		num1 = request.getParameter("num1");  // num1 값을 읽어올것임
		num2 = request.getParameter("num2");  // num2 값을 읽어올것임
		
		op1 = Integer.parseInt(num1);
		op2 = Integer.parseInt(num2);
		
		result = op1 + op2 ;
	} catch(Exception e)
	{
		RequestDispatcher rd = request.getRequestDispatcher("C04error.jsp");  // C04error.jsp 파일로 페이지를 이동시켜줌
		request.setAttribute("MyReason", "파라미터 num1, num2 가 숫자가 필요함");
		request.setAttribute("ExMsg", e.getMessage());
		rd.forward(request, response);  
	}

%>


<!DOCTYPE html >
<html>
<head>
	<meta charset="UTF-8">
	<title> C03. Get방식의 데이터 처리 </title>  <!-- 시간기록들이 필요할때 사용 -->
</head>
<body>

	num1, num2를 받아서 두 수를 더하는 프로그램이다. <br><br><br>
	
	
	<%= num1 %> + <%= num2 %> = <%= result %> <br><br>
	
	
	

</body>
</html>

