<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<!DOCTYPE html >
<html>
<head>
	<meta charset="UTF-8">
	<title> 사용자 입력 </title>  <!-- 시간기록들이 필요할때 사용 -->
</head>
<body>

<!-- Servlet이 아니라JSP에게 던져서 처리하기 위함. -->

<form method=post action="A11input.jsp">
	ID <input type=text name=id> <br>
	PW <input type=text name= password> <br>
	<input type=submit value="확인">

</form>


</body>
</html>

