<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.or.rapa1.bbs.BBSItem" %>

<%@ page import = "kr.or.rapa1.bbs.BBSList" %> 
<!-- ; BBSList 가져다 쓸것이기 때문에 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");	
%> 
 <!-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbsResult.jsp</title>
<link rel = "stylesheet" href="css/style.css">
</head>
<body>	
  -->
 <!-- 메인 소스에서 보면 이부분이 중복되기 때문에 주석처리 or 지워도 된다. -->
  
 	DB처리 결과를 보여주는 페이지<br><br>
 	
 	attribute로 설정해 놓은 dbResult, dbResultMsg 를 이용하여 화면 보여주기<br><br>
 	
 	결과 : ${dbResult }<br>
 	결과 메시지 : ${dbResultMsg } <br>
 	
 	
 	<c:if test="${nextURL eq null }"> <!-- nextURL 없으면 원래대로  -->
 		<script>
 		alert("${dbResultMsg }"); // 팝업창으로 dbResultMsg 를 띄우고
 		location.href='main.jsp?CMD=bbslist';  // 팝업창을 닫으면 bbslist로 이동
 	</script>
 	</c:if>
 	<c:if test="${nextURL ne null }"> <!-- nextURL 있으면 nextURL 로 이동 -->
 		<script>
 		alert("${dbResultMsg }"); // 팝업창으로 dbResultMsg 를 띄우고
 		location.href='${nextURL} ';  // 팝업창을 닫으면 nextURL로 이동
 	</script>
 	</c:if>
 	
 	
	
 <!-- 
</body>
</html>
  -->






