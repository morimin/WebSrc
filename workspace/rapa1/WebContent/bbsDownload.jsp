<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import = "java.io.File" %>
<%@ page import = "java.io.*" %> 


<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");	
%> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbsDownload.jsp</title>
<link rel = "stylesheet" href="css/style.css">
</head>
<body>	
	<!-- 헤더만 변경해서 다운로드할 계획 -->
	<%
		String fileName = request.getParameter("file");
		String saveDir = "data\\bbs";  //  윈도우에서는 백슬레쉬가 디렉터리
		ServletContext context = getServletContext();
		// 파일을 가져오려면 실제 경로가 필요하기 때문에 서블릿컨텍스트 이용
		String realDir = context.getRealPath(saveDir);
		String filePath = realDir + "\\" + fileName;
		// 따라서 다운 받으려고 하는 녀석은 filePath에 있게 된다.
		
		
		try{
			out.clear();
			out = pageContext.pushBody();
			// 바디를 만들것임
						
			byte b[] = new byte[4096];
			// 크기먼저 잡아놓음
			
			
			response.reset();// 초기화 시키고
			response.setContentType("application/octet-stream");
			// 스트림으로 데이터를 줄것이다.
			
			String encoding = java.net.URLEncoder.encode(fileName, "utf-8");
			response.setHeader("Content-Disposition", "attachment; filename=" + encoding);
			// 파일 내용중 한글이 들어갈 수 도 있기 때문에 UTF-8 로 꺠짐방지
				
				
			
			
			
			FileInputStream is = new FileInputStream(filePath);
			ServletOutputStream sos = response.getOutputStream();
			
			int numRead;
			while((numRead = is.read(b, 0, b.length)) != -1)  // 파일을 하나씩 다 읽어서
			{
				sos.write(b, 0, numRead);  // 서블릿아웃풋을 열어서 사용(write)
			}// while
			
			sos.flush();
			sos.close();
			is.close();
			
			
		}catch(Exception e){
			out.println("EXCEPTION : " + e.getMessage() + "<br>");
		}
	
	
	%>  
</body>
</html>
 






