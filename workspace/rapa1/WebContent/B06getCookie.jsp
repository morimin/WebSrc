<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");  // 한글깨짐 방지
	
%>


<!DOCTYPE html >
<html>
<head>
	<meta charset="UTF-8">
	<title> B06getCookie.jsp </title>  
</head>
<body>

쿠키는 정보를 클라이언트에서 관리한다. <br><br><br>
	
	
위쪽에 addCookie() 로 쿠키 저장 완료.! <br><br>
	
저장된 쿠키값을 읽어보기<br><br>
	
<%
	Cookie[] cookies = request.getCookies() ;  // 쿠키 배열로 가져옴=읽는부분
	
		
%>

	내장 변수 : request, response, application, cookie, session ... <br><br>
	
	쿠키 이름 <%= getCookieValue(cookies, "CookieName") %> <br>
	쿠키 ID <%= getCookieValue(cookies, "CookieID") %> <br>
	쿠키 AGE <%= getCookieValue(cookies, "CookieAge") %> <br>
	쿠키 성별 <%= getCookieValue(cookies, "CookieGender") %> <br>
	


</body>
</html>


<%!  // 함수를 만들때에는 ! 를 꼭 붙여준다.!!
	private String getCookieValue(Cookie[] cookies, String name)
	{
		if( cookies == null )
			return null;
		for( Cookie cookie : cookies )  // enhanced for 문
		{
			if ( cookie.getName().equals(name) )
				return cookie.getValue();  // 같으면 value 값을 리턴.
		}// for
		return null;  // cookie 의 이름이 name 과 같은것을 찾았을때 없으면 null 값 리턴.	
				
	}// getCookieValue Method
%>








