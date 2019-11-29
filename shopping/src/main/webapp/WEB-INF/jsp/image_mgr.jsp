<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="/js/jquery-1.6.2.js"></script>
		<link rel="stylesheet" href="/css/baguettebox.min.css">
		<script src="/js/baguettebox.min.js"></script>
		<style type="text/css">
			.imgDiv {
				position:relative;
				float:left;
				margin:5px;
			}
			.imgDiv .delete {
				position: absolute;
				left: 90%;
				top: 0px;
				background-color: red;
				color: #fff;
				line-height: 23px;
				width: 23px;
				border-radius: 24px;
				text-align: center;
				font-size: 17px;
				cursor:pointer;
				display:none;
			}
			img{
				width:200px;
				height:200px;
				border:1px black solid;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				
				//图标显示
				$(".imgDiv").mouseenter(function(){
					$(this).find(".delete").show();
				});
				//图标隐藏
				$(".imgDiv").mouseleave(function(){
					$(this).find(".delete").hide();
				});
				//删除事件
				$('.delete').click(function(){
					
					var f = confirm('是否确认删除');
					if (!f) {
						
						window.location.reload();
						return ;
					}
					
					//当前图片名
					var name = $(this).parent().find("img").attr("src");
					
					window.location.href="imgdel.htm?name="+name;
					
					//图片所在的父级div
					//var deldiv = $(this).parent();

					/* $.ajax({
						url:'imgdel.htm',
						type:'post',
						async:true,
						data:{
							name:name
						},
						success:function(obj){
							if(obj=="success"){
								deldiv.remove();
							}else{
								alert("删除失败");
							}
						},
						error:function(obj){
							alert("删除失败");
						}
					}); */
				});
			});
		</script>
	</head>
	<body>
		<div>
			<a href="imagemgradd.htm">上传图片</a>
		</div>
		<div class="baguetteBoxOne gallery">
			<c:forEach items="${requestScope.imagelist }" var="tmp">
				<a href="${tmp }" class="img imgDiv">
		        	<img src="${tmp }" class="img">
		        	<span class="delete">x</span>
		        </a>
			</c:forEach>
		</div>
	</body>
	<script>
		baguetteBox.run('.baguetteBoxOne', {
		    animation: 'fadeIn',
		});
	</script>
</html>