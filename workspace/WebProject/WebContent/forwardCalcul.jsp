<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Forward Calculator</title>
</head>
<body>

<%
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	
	int op1 = Integer.parseInt(num1);
	int op2 = Integer.parseInt(num2);

	int add = op1 + op2 ;
	int diff = op1 - op2 ;
		
%>

<%= op1 %> + <%= op2 %> = <%= add %> <br>
<%= op1 %> - <%= op2 %> = <%= diff %> <br>


여기서는 계산만 하고 attribute 로 저장하겠다.<br><br><br>

<%
	request.setAttribute("Sum", Integer.toString(op1 + op2));
	request.setAttribute("Product", Integer.toString(op1 * op2));

	RequestDispatcher rd = request.getRequestDispatcher("forwardResult.jsp");

	
	rd.include(request, response);
	//rd.forward(request, response);

%>

Cal.jsp 입니다. rd.include입니다.


</body>
</html>