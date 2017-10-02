<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.rapa1.bbs.BBSItem" %> 
<%@ page import="kr.or.rapa1.bbs.BBSList" %> 
<!-- ; BBSList 가져다 쓸것이기 때문에 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%> 
 
bbsUpdateForm.jsp 파일  idx = ${param.idx }<br><br>

<!-- myHead 관련 설정 -->
<c:if test="${bbsSize gt 0 }">
	<c:forEach var="i" begin="0" end="${bbsSize -1 }">
		<c:if test="${listIdx[i] eq param.bid}">
			<c:set var="myHead" value="${listHead[i] }" />
		</c:if>
	</c:forEach>
</c:if>
 


게시판 수정 글쓰기 <br>
	<div id=bbsinput>
	<form name="inputForm" method=post enctype="multipart/form-data"  onSubmit="return checkError()" action="bbsUpdate">
	
	<input type=hidden name=idx value='${param.idx }'>
	<input type=hidden name=bid value='${bid }'>
	<table border=1>
		<tr>
			<td class=left>
			
				<c:set var="headlist" value="${myHead }" />				
				
				<select name=head>
					<option value=''>== 선택 ==</option>
					<c:forTokens var="h" items="${headlist }" delims=",">
						<c:if test="${head eq h }">
							<option value="${h }" selected>${h }</option>							
						</c:if>
						<c:if test="${head ne h }">
							<option value="${h }"> ${h }</option>							
						</c:if>
						
					</c:forTokens>					
				</select>
				</td>
			
			
			<td class=right><input type=text id=title name=title  value="${title }" placeholder="제목을 입력하세요."></td>
			
			
		</tr>
		<tr>
			<td class=left>작성자</td>
			<td class=right><input type=text name=writer value="${writer }">
			
				<c:if test="${empty sessionScope.sessID }"> <!-- sessionID 가 비어있으면 -->
					<input type=password name = "pass" placeholder="비밀번호">
				</c:if>
				<c:if test="${sessionScope.sessLevel ge 9 }">
					<c:if test="${notice eq 1}">
						<input type=checkbox name=notice checked> 공지사항 
					</c:if>
					<c:if test="${notice ne 1}">
						<input type=checkbox name=notice> 공지사항 
					</c:if>
				</c:if>			
			</td>
		</tr>
		<tr>
			<td class=left>내용</td>
			<td class=right>
				<textarea name=html>${html }</textarea>
			</td>
		</tr>
		
		<tr>
			<td class=left>
				<c:if test="${file1 ne \"\"}">  <!-- file1 이 있는경우 -->
					<a href='bbsDownload.jsp?file=${file1 }'>첨부 1</a> (<input type=checkbox name=delfile1>삭제)
				</c:if>
				<c:if test="${file1 eq \"\"}">  <!-- file1 이 없는경우 -->
					첨부파일 1
				</c:if>
			</td>
			<td class=right><input type=file id=upfile1 name=upfile1></td>
		</tr>
		<tr>
			<td class=left>
				<c:if test="${file2 ne \"\"}">  <!-- file2 이 있는경우 -->
					<a href='bbsDownload.jsp?file=${file2 }'>파일 2</a> (<input type=checkbox name=delfile2>삭제)
				</c:if>
				<c:if test="${file2 eq \"\"}">  <!-- file2 이 없는경우 -->
					첨부파일 2
				</c:if>
			</td>
			<td class=right><input type=file id=upfile2 name=upfile2></td>
		</tr>
		
		<tr>
			<td colspan=2> <input type=submit value="변경 완료"> </td>
		</tr>
	
	
	</table>
	</form>
	</div>