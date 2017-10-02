<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "kr.or.rapa1.bbs.BBSItem" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");		
	
	int idx = 0;
	
	try{
		String strIdx = request.getParameter("idx");  // 파라미터에서 idx 값을 가져옴
		idx = Integer.parseInt(strIdx);  // 파라미터로 넘어온 애를 int 값으로 셋팅
		
	}catch(Exception e){
		idx = 1;  // 파라미터가 없으면 (default) idx 값이 1임
	}
	
	BBSItem bbsItem = new BBSItem();
	bbsItem.setIdx(idx);  // idx 값만 셋팅해주면
	bbsItem.readDB();  // BBSItem 에서 채워진다.
	
	/* [02] start */
	request.setAttribute("idx", bbsItem.getIdx() );
	request.setAttribute("title", bbsItem.getTitle() );
	request.setAttribute("writer", bbsItem.getWriter() );
	request.setAttribute("ymd", bbsItem.getYmd() );
	request.setAttribute("hms", bbsItem.getHms() );
	request.setAttribute("html", bbsItem.getHtml() );
	request.setAttribute("file1", bbsItem.getFile1() );
	request.setAttribute("file2", bbsItem.getFile2() );
	
	request.setAttribute("hit", bbsItem.getHit() );
	request.setAttribute("head", bbsItem.getHead() );
	
	
	/* [02] end */
	
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbsView.jsp</title>
<link rel = "stylesheet" href="css/style.css">
</head>
<body>	

<b> 게시글 확인 </b> <br><br>

idx = <%= bbsItem.getIdx() %><br>
title = <%= bbsItem.getTitle() %> <br>
writer = <%= bbsItem.getWriter() %> <br>
ymd = <%= bbsItem.getYmd() %> <br>
hms = <%= bbsItem.getHms() %> <br>
<hr>
<%= bbsItem.getHtml() %>
	
	
	<!-- [03] start -->
	<br><br><br>
	
	
	<div id=bbsview>
		<table border = 1>
			
			<tr>
				<td class = "left" > ${head } </td> <!-- 제목 -->
				<td class = "right"> ${title } </td>			
			</tr>			
			<tr>
				<td colspan = 2 class=headderRight>  <!-- 두칸 합치는 방법 + 오른쪽으로 되는 헤더-->
					작성자 : <b> ${writer }</b> |
					작성일 : <b>${ymd } ${hms }</b> |
					읽음 : <b> ${hit }</b> &nbsp;
				</td>
			</tr>			
			<tr height = 300>  <!-- 형태를 맞춰주기 위해 임의로 칸의 높이를 주었다 -->
				<td colspan =2 class=html>
					${html }
					
					<br>

					이미지파일이라고 가정<br>
					
					<!-- 내용물 내에 사진을 보여줌 
					<c:if test="${file1  ne null}">
						<img src="./data/bbs/${file1 }">
					</c:if>
					<c:if test="${file1  ne null}">
						<img src="./data/bbs/${file1 }">
					</c:if>
					 -->
					
				</td>
			</tr>			
			<tr>
				<td class="left"> 첨부파일1</td>
				<td class="right"><a href="bbsDownload.jsp?file=${file1 }"> ${file1 }</a></td>
				<!-- file1 을 클릭하면 하이퍼링크를 타고 다운로드  -->
			</tr>
			<tr>
				<td class="left"> 첨부파일2</td>
				<td class="right"><a href="bbsDownload.jsp?file=${file2 }"> ${file2 }</a> </td>
			</tr>			
			<tr>
				<td class= "left"> 이전글 <br> 다음글</td>
				<td class = "right"> 이전글제목 <br> 다음글제목 </td>>		
			</tr>			
			<tr>
				<td colspan = 2> 
					<input type="button" value="수정" onClick="location.href='main.jsp?CMD=BBSUpdateForm?idx=${param.idx}'" >
					<!-- 주소창은 그대로 있고 이전 값들을 DB에서 가져와야 하기 때문에 서블릿으로 처리 -->
					
					<!--  -->
					<!-- 답글달거나, 수정하기는 쓰기권한 있는 경우에만 활성화 bbsList.jsp 파일 참조 -->
					<!--  -->
					
					<input type="button" value="답글" onClick="location.href='main.jsp?CMD=BBSReplyForm?idx=${param.idx}'" >
					<input type="button" value="목록" onClick="location.href='main.jsp?CMD=bbslist'" >
					<input type="button" value="삭제">
				</td>			
			</tr>
				
		</table>
	</div>
	<!-- [03] end -->


</body>
</html>







