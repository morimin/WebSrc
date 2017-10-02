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


	게시물 목록 보기 <br><br>
	
	리스트 사이즈 : ${BBSLIST.listSize -1 } <br><br>
	
	<div id = bbslist> <!-- bbslist 에서 table의 값들을 수정하려고한다. -->
	
	<table border = 0>
	
		<tr>
			<td class = bbsOrderHead > 순서 </td>
			
			<td class = bbsHeadHead > 머리글 </td>
			
			<td class = bbsTitleHead > 제목 </td>
			<td class = bbsWriterHead > 작성자 </td>
			<td class = bbsYmdHead > 작성일 </td>
			<td class = bbsHmsHead > 작성시간 </td>	
			<td class = bbsHitHead > 읽음 </td>			
		</tr>
			
		<c:if test="${BBSLIST.listSize gt 0 }">	<!-- 0보다 클때 아래를 수행 -->
			<!-- 목록을 보여주는 부분 -->
			<c:forEach var="cnt" begin = "0" end="${BBSLIST.listSize -1 }">
				<tr>
				
					<td class = bbsOrder >
						<c:if test="${BBSLIST.notice[cnt] eq 1}">
							<font color="#FF0000">공지</font>
						</c:if>
						<c:if test="${BBSLIST.notice[cnt] ne 1}">
							${BBSLIST.idx[cnt] } 
						</c:if>					
					</td>
					
					<td class = bbsHead >${BBSLIST.head[cnt] } </td>
					
					<td class = bbsTitle>  
						<c:forEach var="j" begin="1" end="${BBSLIST.space[cnt] -1 }">
							&nbsp; &nbsp;						
						</c:forEach>		
						<c:if test="${BBSLIST.space[cnt] >1 }">
							<img src="data/reply.gif">
						</c:if>
						
						<c:if test="${sessionScope.sessLevel ge BBSLIST.rlevel }">
							<a href="main.jsp?CMD=bbsView.jsp?bid=${param.bid }&idx=${BBSLIST.idx[cnt] }" > ${BBSLIST.title[cnt] } </a> 
						</c:if>
						
						<c:if test="${sessionScope.sessLevel lt BBSLIST.rlevel }">
							<a href="javascript:alert('권한없음')" > ${BBSLIST.title[cnt] } </a> 
						</c:if>
					</td>
									
					
					<!-- Title을 클릭했을때 href로이동 -->
					<td class = bbsWriter > ${BBSLIST.writer[cnt] } </td>
					<td class = bbsYmd > ${BBSLIST.ymd[cnt] } </td>
					<td class = bbsHms > ${BBSLIST.hms[cnt] } </td>
					<td class = bbsHit > ${BBSLIST.hit[cnt] } </td>					
				</tr>		
			
			</c:forEach>
		</c:if>
		
		<form method=post action="bbslist">
		<tr>
			<td colspan = 5 class=udlineCenter > 
				<c:if test="${ sessionScope.sessLevel ge BBSLIST.wlevel  }">
					<input type = "button" value = "글쓰기" onClick="location.href='main.jsp?CMD=bbsInput.jsp?bid=${param.bid}' " >				
				</c:if>
				
				<c:if test="${ sessionScope.sessLevel lt BBSLIST.wlevel  }"> <!-- less than -->
					<input type = "button" value = "글쓰기" onClick="alert('쓰기권한이 없습니다.')" disabled>			
				</c:if>			
			
				
				
				<select name="opt"> <!-- opt 값이 1,2  -->
					<option value = "1">제목</option>
					<option value="2">작성자</option>
				</select>				
				<input type ="text" name=key required>
				<input type = "button" value = "검색">
			</td>	
		
		</tr>
		</form>		
			
		
	</table>	
		<c:if test = "${!BBSLIST.lastpage }">
			<a href = "main.jsp?CMD=bbslist?LAST_IDX=${BBSLIST.idx[BBSLIST.listSize -1] }"> 다음페이지 </a>				
		</c:if>	
	</div>
	
