<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset=UTF-8">
	<title> JSP + Servlet </title>
</head>
<body>

	서블릿에서 1~100 까지의 합을 계산하고, 그 결과를 JSP에서 가져다 출력
	<!-- 서블릿에서는 계산만 왜나면 html형식 써주기 힘들기 때문 -->
	
<%	
	int sum =0;
	for(int i = 1; i <= 100 ; i++)
	{
		sum = sum + i;		
	}	
%>
	sum = <%=sum %> 입니다.<br>   <!-- 단발성으로 사용할때 이런식으로 사용 -->
	<hr>

	mytotal값은 서블릿에서 계산한 값 그값은 ${mytotal }	 

</body>
</html>



