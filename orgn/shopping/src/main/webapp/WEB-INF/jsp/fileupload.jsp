<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>文件上传</title>
		<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style type="text/css">
			#maindiv{
				margin-left: 50px;
			}
			#name{
				width:100px;
			}
		</style>
	</head>
	<body>
		<div id="maindiv">
			<form enctype="multipart/form-data" method="post" action="fileupload">
				<div class="form-group">
					<label for="name">姓名</label>
					<input type="text" class="form-control" id="name" name="name" placeholder="请输入名称">
				</div>
				<div class="form-group">
					<label for="inputfile">文件输入</label>
					<input type="file" id="inputfile" name="files" multiple />
				</div>
		   		<input type="submit" value="上传" class="btn btn-success" />
			</form>
		</div>
	</body>
</html>