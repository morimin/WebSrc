<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset=UTF-8">
		<title> 한글 첫페이지 </title>  <!-- 한글이 깨지냐 안깨지냐가 중요 -->
	</head>
<body>

JSP 첫번째 페이지 <br>

<%

	int i =0;
	int sum =0;

	for (i =1 ; i <=10 ; i ++)
	{
		sum = sum + i;
		out.print(sum + "<br>");
	}
	out.print(sum + "<br>");
%>

sum = <%= sum %>입니다.<br>  
<!-- ; html에서 자바코딩한것 불러올때/ 변수는 '=변수명' 만 쓰면 가능하다. -->


</body>
</html>

