<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.io.File, java.io.IOException" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!-- ; 한 폴더에 계속 들어가기 때문에 중복을 허용하지 않게 하기 위해서 자동으로 이름을 결정시켜준다. -->


<%
	request.setCharacterEncoding("utf-8");  // 한글깨짐 방지
	
	String savePath = "upload" ;
	String uploadFilePath = getServletContext().getRealPath(savePath);
	
	int uploadFileSizeLimit = 30 * 1024 *  1024 ; // 30 MB 메가바이트
	String encType = "utf-8";  // 파일이름이 한글이 있을 수 있기 때문에
	
	MultipartRequest multi = new MultipartRequest(
								request,
								uploadFilePath,
								uploadFileSizeLimit,
								encType,
								new DefaultFileRenamePolicy()
			);
	String serverFileName = multi.getFilesystemName("upfile"); // db에 저장되는 파일 이름
	// ; B10에 있는 upfile
	String originalFileName = multi.getOriginalFileName("upfile");
	
%>
    
    
<!DOCTYPE html >
<html>
<head>
	<meta charset="UTF-8">
	<title> B11upLoad.jsp </title>
</head>
<body>

	<!-- upload 폴더가 만들어져 있어야 한다. -->
	파일 업로드 결과 확인<br><br>

	업로드 파일 위치 : <%= uploadFilePath %><br>
	사용자가 업로드한 원본 파일 이름 : <%= originalFileName %><br>
	서버에 저장된 파일 이름 : <%= serverFileName %><br><br>
	
	링크 <a href="./upload/<%= serverFileName %>"> 클릭 Here</a> <br>
	<img src="./upload/<%= serverFileName %> "> <br>
	
	
</body>
</html>







