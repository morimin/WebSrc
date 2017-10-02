<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> upload Check.jsp</title>
</head>
<body>

파일 업로드 결과 확인 <br>

업로드 파일 위치 : ${uploadFilePath } <br>
사용자가 업로드한 원본 파일 이름 : ${originalFileName } <br>
서버에 저장된 파일 이름 : ${serverFileName } <br>

링크 <a href="./upload/${serverFileName }">클릭 HERE</a><br>
<img src="./upload/${serverFileName }"><br>

<hr>
썸네일 : <img src = "./upload/thumb_${originalFileName }"> <br><br>

파일크기 : ${width } * ${height }

<!-- ${originalFileName } -->

</body>
</html>