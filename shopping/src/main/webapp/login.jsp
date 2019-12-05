<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		background-image: url(img/timg111.jpg);
		width:100%;
		height:100%;
	}
	div{
		width:500px;
		height:400px;
		margin: 180px auto;
	}
	.enter{
		width:300px;
		height:30px;
		font-size:1.2em;
	}
	.line{
		height:60px;
	}
	#yan{
		width:150px;
		height:30px;
		font-size: 1.2em;
	}
	#cooki{
		font-size:0.8em;
	}
	span{
		font-size: 0.8em;
		color:red;
	}
	#login{
		background:blue;
		color:white;
		border:0px;
		width: 303px;
	}
	#ran{
		font-size: 1.2em;
	}
	input{
		border-radius:5px;
	}
</style>
</head>
<body>
	<div>
		<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xxx商城登录</h1>
		<form action="/userdenglu.htm">
			<table>
				<tr class = "line">
					<td colspan="2" width="80">用户名：</td>
					<td><input class = "enter" type = "text" name = "username"></td>
				</tr>
				<tr class = "line">
					<td colspan="2" width="80">密码：</td>
					<td><input class = "enter" type = "password" name = "password"></td>
				</tr>
				<tr class = "line">
					<td colspan="3" align="right">
						<input class="enter" type = "submit" value = "登录" id = "login">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>