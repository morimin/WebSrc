<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> JSP -> JSP </title>
</head>
<body>

내장변수 " <+% ", 를 이용해서 포스트 된 값을 받는 처리를 해보자.<br><br><br>

입력한 id 값은 : <%= request.getParameter("id") %> 이고<br> <br>
입력한 pw 값은 : <%= request.getParameter("pass") %> 이고<br> <br>

</body>
</html>