<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");  // 한글깨짐 방지
	
	response.addCookie( new Cookie("CookieName", "Hong kil dong") );  // 쿠키라는 이름값이 홍길동 으로 저장됨
	response.addCookie( new Cookie("CookieID", "kdhong") );  // 쿠키라는 아이디값이 kdhong 으로 저장
	response.addCookie( new Cookie("CookieAge", "23") );  
	
	Cookie cookie = new Cookie("CookieGender", "M");  // M 을 cookieGender 에 지정.
	cookie.setMaxAge(60);  // 생존시간60초. 단위는 sec.
	
	response.addCookie(cookie);

%>


<!DOCTYPE html >
<html>
<head>
	<meta charset="UTF-8">
	<title> B05setCookie.jsp </title>  
</head>
<body>

쿠키는 정보를 클라이언트에서 관리한다. <br><br>	
	
위쪽에 addCookie() 로 쿠키 저장 완료.! <br><br>


	
</body>
</html>








