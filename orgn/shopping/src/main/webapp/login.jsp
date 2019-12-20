<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-1.6.2.js"></script>
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
		
	span{
		font-size: 1.5em;
		color:red;
	}
	#login{
		background:blue;
		color:white;
		border:0px;
	}

	input{
		border-radius:5px;
	}
	#yzm{
		height:30px;
		font-size:1.2em;
	}

</style>
<script type="text/javascript">
	$(function(){
		var ran = $("span").html();
		$("#yanzhengma").val(ran);
	});
</script>
</head>
<body>
	<div>
		<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;缘来小镇商城登录</h1>
		<form action="userdenglu.htm">
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
					<td colspan="2" width="80">验证码：</td>
					<td>
						<input class = "enter" id="yzm" type = "text" name = "yzm">						
						<% int rand = (int)(Math.random()*8999)+1000; %>										
						<span><%= rand %></span>
						<input type="hidden" name="yanzhengma" id="yanzhengma">
					</td>
				</tr>
				<tr class = "line">
					<td colspan="2" width="80"></td>
					<td>
						<input class="enter" type = "submit" value = "登录" id = "login">
					</td>
				</tr>
				<tr class = "line">
					<td colspan="2" width="80"></td>
					<td>
						<a href="zhuce.htm">注册</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>