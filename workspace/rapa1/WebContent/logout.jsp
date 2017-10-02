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


<%
	/* 낱개로 지울때 */
	/* session.removeAttribute("sessId");
	session.removeAttribute("sessName");
	session.removeAttribute("sessLevel"); */
	
	/* 한방에 다 지울때 */
	session.invalidate();

%>


<script>
	alert('로그아웃 되었습니다.');
	location.href='main.jsp';
</script>




