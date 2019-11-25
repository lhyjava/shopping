<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="/js/jquery-1.6.2.js"></script>
		<script type="text/javascript">
			$(function(){
				
				$("#addbutton").click(function(){
					var li = $("<li></li>");
					var input = $('<input type="file" name="upload_file">');
					li.append(input);
					$("ul").append(li);
				});
				
			});
		</script>
		<style type="text/css">
			ul li{
				list-style-type:none;
			}
		</style>
	</head>
	<body>
		<input id="addbutton" type="button" value="添加" />
		<form action="uploadimages.htm" enctype="multipart/form-data" method="post">
			<ul>
				<li>
					<input type="file" name="upload_file" />
				</li>
			</ul>
			<input type="submit" value="上传" />
		</form>
	</body>
</html>