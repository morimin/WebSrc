<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");  // 한글깨짐 방지
	
	int total = 0;
	for (int i = 1 ; i <= 100 ; i ++)
	{
		total = total + i;
	}
	
	//request.setAttribute("mytotal", total + "");  //(받으려는 변수명, 객체)
	// ; 숫자 + 문자 = 문자
	request.setAttribute("mytotal", Integer.toString(total));  //(받으려는 변수명, 객체)
	
	// 강제로 session 시킴
	session.setAttribute("sessID", "id");  
	session.setAttribute("sessName", "홍길동");  
	
			
%>

<!DOCTYPE html >
<html>
<head>
	<meta charset=UTF-8>
	<title> C07expressionLanguage.jsp </title> 
</head>
<body>

	EL(Expression Language) - 개발자 영역과 디자이너의 영역을 구분할때 사용한다.<br><br>
	<!-- ; ${mytotal} 같은 것을 예로 들 수 있다.-->
	
	1~100 합 : <%= total %><br>  <!-- 같은 파일내에 있으므로 가능 -->
	1~100 합 : ${mytotal } <br> 
	1~100 합 : <%= request.getAttribute("mytotal") %><br><br><br>  <!-- 원칙 -->
	
	 
	추가 mytotal + 100 = ${mytotal + 100 }<br><br>
	
	<hr> <br> <!-- 구분라인 그려주기 -->
	
	파라미터를 EL로 처리하는 방법<br><br>
	
	num1 = ${param.num1 } , num2 = ${param.num2 } <br> <!-- 파라미터로 넘어온 num1,2 -->
	
	<hr>
	<!-- session 과 cookie 도 읽어들일 수 있다. -->
	session 을 EL 로 처리하는 방법<br><br>
	
	sessID = ${sessionScope.sessID } , sessName = ${sessionScope.sessName }<br>
	
	
	
	
	
</body>
</html>





