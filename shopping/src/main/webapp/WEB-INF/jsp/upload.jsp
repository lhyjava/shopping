<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form enctype="multipart/form-data" method="post" action="upload">
		    文件:<input type="file" name="file"/><br>
		    姓名:<input type="text" name="name"/><br>
		     <input type="submit" value="上传"/>
		</form>
	</body>
</html>