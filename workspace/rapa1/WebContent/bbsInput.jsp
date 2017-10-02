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
 
 <script>
 	function checkError()
 	{
 		var f = document.inputForm;
 		if( f.title.value == '' )
 		{
 			alert('제목을 입력하세요');
 			f.title.focus();  // title 자리에 커서 깜박이 
 			return false;
 		}
 		if( f.writer.value == '' )
 		{
 			alert('작성자를 입력하세요');
 			f.writer.focus();  // writer 자리에 커서 깜박이 
 			return false;
 		}
 		if( f.html.value == '' )
 		{
 			alert('작성자를 입력하세요');
 			f.html.focus();  // html 자리에 커서 깜박이 
 			return false;
 		}
 		
 	}// checkError method
 </script>
 
 <!-- bbsMenu.jsp 를 수행 후, 이 파일을 수행하기 때문에 bbsMenu.jsp 에서 
 	  bbsmanager를 검색할때 head정보를 찾아서 리스트에 넣어 놓고 attribute 로 set
 	  여기서는 head 리스트 중, bid가 같은 head값을 찾아 myHead에 셋팅 
 	  ReplyForm/ updateForm 만들때도 동일하다.
  -->
 	<c:if test="${bbsSize gt 0 }">
 		<c:forEach var="i" begin="0" end="${bbsSize -1 }">
 			<c:if test="${listIdx[i] eq param.bid}">
 				<c:set var="myHead" value="${listHead[i] }" />
 			</c:if>
 		</c:forEach>
 	</c:if>
 
 
	게시판 글쓰기
<div id=bbsinput>
	<form name = "inputForm" method=post enctype="multipart/form-data" onSubmit="return checkError()" action="bbsInput"> <!-- form으로 둘러싸야 전달 가능 -->
	
	<input type=hidden name=bid value='${param.bid }'>
		<table border = 1>
		
			<tr>
				<td class =left> 
				
				<c:set var="headlist" value="${myHead }" />
				<!-- 바로위쪽 if코드에서 참조. 왼쪽 head값을 가져오게 되는 것이다.  -->
				
				
				<select name=head>
					<option value=''>== 선택 ==</option>
					<c:forTokens var="h" items="${headlist }" delims=",">
						<option value="${h }">${h }</option>
					</c:forTokens>					
				</select>
				
				</td>
				<td class = right><input type=text id=title name=title placeholder="제목을 입력하세요." ></td>
			</tr>
			<tr>
				<td class =left> 작성자 </td>
				<td class = right><input type=text name=writer >
					<c:if test="${empty sessionScope.sessID }"> <!-- sessionID 가 비어있으면 -->
						<input type=password name = "pass" placeholder="비밀번호">
					</c:if>
					<c:if test="${sessionScope.sessLevel ge 9 }">
						<input type=checkbox name=notice> 공지사항 
					</c:if>
				
				
				</td>
			</tr>
			<tr>
				<td class = left>내용</td>
				<td class= right>
					<textarea name=html></textarea>
				</td>	
			</tr>
			<tr>
				<td class =left> 첨부파일1 </td>
				<td class = right><input type=file id=upfile1 name=upfile1 ></td>
			</tr>
			<tr>
				<td class =left> 첨부파일2 </td>
				<td class = right><input type=file id=upfile2 name=upfile2 ></td>
			</tr>						
			<tr>
				<td colspan =2> <input type= submit value="작성완료"> </td>
			</tr>
		
		</table>
	</form>
</div>









