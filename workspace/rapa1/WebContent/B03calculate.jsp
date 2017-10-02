<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");  // 한글깨짐 방지 

%>

<!DOCTYPE html >
<html>
<head>
	<meta charset="UTF-8">
	<title> B03calculate.jsp </title>  
</head>
<body>

<%
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	
	//  포장함수를 이용하여 String type 을 Int type으로 바꾼다.
	//
	int op1 = Integer.parseInt(num1);  
	int op2 = Integer.parseInt(num2);

	int add = op1 + op2 ;
	int diff = op1 - op2 ;
%>

	<%= op1 %> + <%= op2 %> =  <%= add %> <br>
	<%= op1 %> - <%= op2 %> =  <%= diff %> <br>
	
	여기서는 계산만 하고 값을 attribute로 저장하겠다.<br><br>
	
<%
	request.setAttribute( "Sum", Integer.toString(op1 + op2) );
	// ; SUM 이라는 변수는 String타입의 op1+op2 를 integer 타입으로 바꿔서 저장하라.
	request.setAttribute( "Product", Integer.toString(op1 * op2) );
	
	RequestDispatcher rd = request.getRequestDispatcher("B04Result.jsp");  // B04Result.jsp 파일로 페이지를 이동시켜줌
	//rd.forward(request, response);  // servlet 에서 할수 있는것은 jsp 에서도 거의다 만들 수 있다.
	
	/* forward() VS include() */
	// rd.forward() 는 제어권이 넘어가서 돌아오지 않는다.
	// rd.include() 는 제어권이 넘어온다.
	//
	rd.include(request, response);  

%>
		
	여기는 B03파일의 마지막부분 입니다.<br>

</body>
</html>




