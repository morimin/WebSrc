<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	response.addCookie(new Cookie("CookieName", "JO S MIN"));
	response.addCookie(new Cookie("CookieID", "SMin"));
	response.addCookie(new Cookie("CookieAge", "28"));
	
	Cookie cookie = new Cookie("CookieGender", "M");
	cookie.setMaxAge(15);
	
	response.addCookie(cookie);
    
%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "cookie.jsp"  %>

</body>
</html>