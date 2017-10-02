<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 

	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");

%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>D03actionCar.jsp</title>
</head>
<body>
	
	jsp에서 표준자바(java bean)를 이용하는 방법. <br>
	<!-- ; 자바빈을 사용하면 코드가 완변하게 감춰지기 때문 -->
	
	<jsp:useBean class="kr.or.rapa1.web.D02Car" id="taxi" > </jsp:useBean>
	<!-- kr.or.rapa1.web.D02Car 객체에 있는 변수명을 taxi -->
	
	<jsp:setProperty name="taxi" property="speed" value="77" />
	<jsp:setProperty name="taxi" property="color" value="RED" />
	<!-- ; 재정의 -->
	
	taxi의 정보 확인 <br><br>
	
	<!-- name 에 있는 property 들을 불러오는 것이다. -->
	속도 : <jsp:getProperty property="speed" name="taxi" /> <br>
	색상 : <jsp:getProperty property="color" name="taxi"/> <br>
			

</body>
</html>







