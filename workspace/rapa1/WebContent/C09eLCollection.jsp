<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");

	ArrayList<String> person = new ArrayList<String>();
	person.add("First");
	person.add("Second"); // First - Second
	person.add("Test"); // First - Second - Test
	person.set(2, "Third User"); // First - Second - Third
	
	request.setAttribute("PERSON", person);
	
	/* 파라미터 키값을 가져옴 */
	HashMap<String, String> protocol = new HashMap<String, String>();
	protocol.put("IP", "Internet Protocol");
	protocol.put("TCP", "Transmission Control Protocol");
	protocol.put("UDP", "User Datagram Protocol");
	// 키값(IP,TCP,UDP)을 불러오면 저장된 데이터(InternetProtocol ...) 값이 나옴.
	
	request.setAttribute("PROTOCOL", protocol);	
		
%> 

    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>C09ELCollection.jsp</title>
</head>
<body>

	List 정보 확인 <br>
	${PERSON[0] }<br>
	${PERSON[1] }<br>
	${PERSON[2] }<br>
	
	
	<hr>
	C09ELCollection.jsp?key=IP<br>
	${param.key } 의 뜻은 ${PROTOCOL[param.key] } 입니다.<br>
	<!-- 파라미터내의 key -->


</body>
</html>




