<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>upload form</title>
</head>
<body>

<form method = post enctype="multipart/form-data" action="UploadRatio">
<!-- enctype 쓰지않으면 파일 이름만 전송 -->

파일 <input type = file name = upfile><br>
<input type = submit value = "업로드"><br>

</form>
<br><br><br>
업로드 수행전에 cos.jar 반드시 옮겨놓기.



</body>
</html>