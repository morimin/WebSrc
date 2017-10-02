<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cookie.jsp</title>
</head>
<body>

addCookie() 로 저장 先 완료.!!<br><br>

저장된 쿠키값 읽어보기 <+%+ br <br> <br>

<%
	Cookie[] cookies = request.getCookies();
%>

getCookieValue라는 메소드를 만들어서 사용<br>

쿠키 이름 : <%= getCookieValue(cookies, "CookieName") %>
쿠키 ID : <%= getCookieValue(cookies, "CookieID") %>
쿠키 AGE : <%= getCookieValue(cookies, "CookieAge") %>
쿠키 성별: <%= getCookieValue(cookies, "CookieGender") %>





</body>
</html>



<%!
	private String getCookieValue(Cookie[] cookies, String name){
	
		if(cookies == null){
			return null;			
		}//if
		for(Cookie cookie : cookies){
			if(cookie.getName().equals(name)){
				return cookie.getValue();
			}//if
		}//for
	return null;

}

%>



