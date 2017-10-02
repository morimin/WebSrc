<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.or.rapa1.bbs.BBSItem" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");			
	String CMD = request.getParameter("CMD");
	
	// Session 기능 : id, name, level 정보가 있어야함.
	// - sessID, sessName, sessLevel 로 사용할것임
		if (session.getAttribute("sessLevel")==null)
	{
		session.setAttribute("sessLevel","0");
	}
	
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<link rel = "stylesheet" href="css/style.css">
</head>
<body>	

	<!-- 나중에 DIV 로 변환... 처음에는 편의상 table로 만들어야 이해하기 쉽다.<br><br> -->
	
	<table border = "1">
	
		<tr height = 100px; >
			<td colspan = "2"> <a href="main.jsp"> 홈 </a></td>		
		</tr>
		
		<tr height = 400>
			<td width=150 valign=top>
			
				로그인 기능<br>				
				<hr>							
				<c:if test="${sessionScope.sessID ne null }">
					<b>${sessionScope.sessName }</b> <input type="button" value="Exit" onClick="location.href='main.jsp?CMD=logout.jsp' " > <br>
					
					<c:if test="${sessionScope.sessLevel ge 9 }"> <!-- 개발자가 10이라고 하는 경우가 종종 있다. -->
						<br>
						
						<a href="main.jsp?CMD=manBBS.jsp">게시판 관리</a>
												
											
					</c:if>
					
				</c:if>
				<c:if test="${sessionScope.sessID eq null }">
					<a href = 'main.jsp?CMD=printlogin.jsp'> 로그인 </a> <br>
				</c:if>
				
				<hr>	
				
					<jsp:include page="bbsMenu.jsp" />
				
				<hr>
													
				
				<!-- bid를 이용해서 게시판들을 구별하겠다. -->
				<a href="main.jsp?CMD=bbslist?bid=1" >공지사항 </a><br>
				<!-- ; servlet 이므로.java를 안써줘도 된다. -->
				<a href="main.jsp?CMD=bbslist?bid=2" >자유게시판 </a><br>
				<a href="main.jsp?CMD=bbslist?bid=3" >QnA 게시판 </a><br><br>					
						
				<a href="main.jsp?CMD=bbsInput.jsp"> 글 쓰기</a> <br>
				<!-- ; jsp파일이므로 .jsp 써줘야한다. -->
			</td>	
			<td width=700 valign=top>
			
				<div id=display>
				<jsp:include page="${param.CMD }" /> <!-- display 부분 -->
				</div>
				
			</td>	
	
	</table>

</body>
</html>











