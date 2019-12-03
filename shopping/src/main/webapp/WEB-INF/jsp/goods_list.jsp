<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0031)http://localhost:8080/showgoods -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>商品管理</title>
		<link href="/css/template.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.shop.common.js"></script>
		<script src="/js/jquery.poshytip.min.js"></script>
		<script type="text/javascript">
			//ajax页面修改商品名
			function ajax_updategoodsname(id, obj){
				var val = $(obj).val();
				var secondval = $(obj).attr('cls');
				if(val != secondval){
					$.ajax({
						type:"Post",
						url:"/goods/updateGoodsName",
						data:{"id":id, "value":val},
						success:function(data){
							if(data == "repeat"){
								alert("该商品名已存在！");
								$(obj).attr("value",secondval);
							}
							if(data == "namenull"){
								alert("修改的商品名不能为空！");
								$(obj).attr("value",secondval);
							}
						}		
					}); 
				}
			}
			//ajax修改商品是否推荐状态
			function ajax_updategoodsrecommend(id,obj){
				var val = $(obj).hasClass('yes');
				$.ajax({
					type:"Post",
					url:"/goods/updateGoodsRecommend",
					data:{"id":id},
					success:function(data){
						if(val){
							$(obj).attr("src","/image/no.png");
							$(obj).removeClass('yes');
						}else{
							$(obj).attr("src","/images/yes.png");
							$(obj).addClass('yes');
						}			
					}
				});	
			}
			//ajax删除一个商品
			function ajax_deletegoodsone(obj){
				var model = $(obj).parent().parent();
				if(model.children("input[type='hidden']").length>0){
					var id = model.find("input[name='ids']")[0].value;
					if(!confirm("确定删除么")){
						return;
					}
					$.ajax({
						type:"Post",
						url:"/goods/deleteGoodsOne",
						data:{"id":id},
						success:function(data){
							if(data == "1"){
								model.remove();
							}
						}
					});
					return;
				}
			}
			
			//by zhaoyu 1127 begin
			/* $(function(){
				$("#sortId").change(function(){
					
					if($("option:selected").val() == "请选择"){
						$("option[class=show]").hide();
					}else{
						var level = $("option:selected").attr("level");
						if(level != 2){
							$("#brandid option:eq(0)").attr("selected",true);
						}else{
							var s = $(this).find("option:selected").attr("tid");
							$("option[class=show]").hide();
							$("option[typeid="+s+"]").show();
						}
					}
				});
			}); */
			
			//by zhaoyu 1127 begin
			$(function(){
				$("#sortId").change(function(){
					
					if($("option:selected").val() == "请选择"){
						$("option[class=show]").hide();
					}else{
						var level = $("option:selected").attr("level");
						if(level != 2){
							$("#brandid option:eq(0)").attr("selected",true);
						}else{
							var s = $(this).find("option:selected").attr("tid");
							$("option[class=show]").hide();
							$("option[typeid="+s+"]").show();
						}
					}
				});
			});
			//by zhaoyu 1127 end
		</script>
		<style id="poshytip-css-tip-skyblue" type="text/css">
			div.tip-skyblue{visibility:hidden;position:absolute;top:0;left:0;}div.tip-skyblue table, div.tip-skyblue td{margin:0;font-family:inherit;font-size:inherit;font-weight:inherit;font-style:inherit;font-variant:inherit;}div.tip-skyblue td.tip-bg-image span{display:block;font:1px/1px sans-serif;height:10px;width:10px;overflow:hidden;}div.tip-skyblue td.tip-right{background-position:100% 0;}div.tip-skyblue td.tip-bottom{background-position:100% 100%;}div.tip-skyblue td.tip-left{background-position:0 100%;}div.tip-skyblue div.tip-inner{background-position:-10px -10px;}div.tip-skyblue div.tip-arrow{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;}
		</style>
	</head>
	<body style="">
		<div class="cont">
			<h1 class="seth1">商品管理</h1>
			<div class="settab"> 
				<span class="tab-one"></span> <span class="tabs"> 
				<a href="javascript:void(0)" class="this">所有商品</a> |
				<a href="goodsadd.htm">新增商品</a></span> 
				<span class="tab-two"></span>	
  			</div>
			<form name="queryForm" id="queryForm" action="selectgoods.htm" method="post">
				<input type="hidden" id="currentpage" name="currentpage" value="1" />
    			<div class="allmem_search">
      				<ul>
       	 				<li>        
          					<span>商品名称</span> 
          					<span class="allmen size4">
          						<input type="text" id="name" name="name" value="" />
          					</span> 
          					<span>类别</span>
				           	<select id="sortId" name="goodsclassid" class="form-control m-b" style="height:30px;">
				           		<option value="" selected="selected" >请选择</option>
								<!-- 一级分类 -->
								<c:forEach items="${requestScope.goodsbrandbygoodsclassplus }" var="tmp1">
									<option class="typensme" value="${tmp1.id }" id = "${tmp1.level }" level = ${tmp1.level }>${tmp1.name }</option>
								<!-- 二级分类 -->
								<c:forEach items="${tmp1.list }" var="tmp2">
									<option value="${tmp2.id }" level = ${tmp2.level }>&nbsp;&nbsp;${tmp2.name }</option>
								<!-- 三级分类 -->
								<c:forEach items="${tmp2.list }" var="tmp3">
									<option value="${tmp3.id }" level = ${tmp3.level } tid = ${tmp3.typeid }>&nbsp;&nbsp;&nbsp;&nbsp;${tmp3.name }</option>
								</c:forEach>
								</c:forEach>
								</c:forEach>
				            </select>
          					<span>品牌名称</span> 
							<select name="brandid" id="brandid">                   	
      							<option value="" selected="selected" checked>请选择</option>
      							<!-- 品牌列表 -->
      							<c:forEach items="${requestScope.goodsbrandbygoods }" var = "tmp">
      								<option class="show" value="${tmp.id }" style="display: none;" typeid = ${tmp.id }>${tmp.name }</option>
								</c:forEach>
							</select>	
 							<span>特别推荐</span>
        					<select id="recommend" name="recommend" class="form-control m-b" style="height:30px;">
				        		<option value="" selected="selected">请选择</option>
				        		<option value="1">是</option>
				        		<option value="0">否</option>
							</select>
        					<span class="btn_search">
          						<input name="" type="submit" button="button" value="搜索" style="cursor:pointer;" />
       						</span> 
     					</li>
      				</ul>
    			</div>
  			</form>
			<div class="operation">
    			<h3>友情提示</h3>
    			<ul>
					<li>上架商品，在商城前台所有访客均可查看，管理员和卖家都可以设置商品上架状态</li>
					<li>违规商品，管理员根据商城访客举报结合实际情况设定违规，违规商品前台不可显示，只能管理员能取消违规</li>
    			</ul>
  			</div>
  			<form name="ListForm" id="ListForm" action="http://localhost:8080/goods/showGoods" method="post">
  				<div class="brandtable">
   	 				<pg:pager url="goodsfindall.htm" maxPageItems="5" maxIndexPages="3"
							export="offset,currentPageNumber=pageNumber" isOffset="false"
							index="center">
						<table width="100%" border="0" cellPadding="0" cellSpacing="1"  class="brand_table">
							<tr style="background:#2A7AD2; height:30px; color:#FFF">
								<td width="15%">商品名称</td>
								<td width="10%" align="center">商品图片</td>
								<td width="8%" align="center">原价</td>
								<td width="8%" align="center">售价</td>
								<td width="10%" align="center">品牌</td>
								<td width="15%" align="center">分类名</td>
								<td width="6%">商品状态</td>
								<td width="6%" align="center">特别推荐</td>
								<td align="center">操作</td>
							</tr>
							<c:if test="${!empty requestScope.goodslist}"> 
								<c:forEach items="${requestScope.goodslist }" var="tmp">
									<pg:item>
										<tr>
											<input type="hidden" name="ids" value="${tmp.id }" />
											<td>
												<input type="text" id="26" name="26" value="${tmp.name }" cls="vivovoii" title="可编辑" onblur="ajax_updategoodsname('26',this)" />
											</td>
											<td align="center">  
												<img src="/img/${tmp.img }" width="55px" height="60px" />	
											</td>
											<td align="center">${tmp.opice }</td>
											<td align="center">${tmp.pice }</td>
											<td align="center">${tmp.brandname }</td>
									        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${tmp.classtype }</td>
											<c:if test="${tmp.grounding == true }">
								  				<td align="center">上架</td>
											</c:if>  	
											<c:if test="${tmp.grounding == false }">
								  				<td align="center">下架</td>
											</c:if>         
						         			<td align="center">
									          	<c:if test="${tmp.recommend == true }">
									          		<img src="/img/yes.png" mystate="true" width="21" height="23" onclick="ajax_updategoodsrecommend(1,grounding,this)" style="cursor:pointer;" title="可编辑" />
									          	</c:if>
									          	<c:if test="${tmp.recommend == false }">
									          		<img src="/img/no.png" mystate="false" width="21" height="23" onclick="ajax_updategoodsrecommend(1,grounding,this)" style="cursor:pointer;" title="可编辑" />
									          	</c:if>
						         			</td>   
								          	<td class="ac8" align="center">
										      	<a href="http://localhost:8080/goods/updateGoods?id=26">编辑</a> 
										        <a href="http://localhost:8080/shangpindel?id=1" onclick="ajax_deletegoodsone(this);">删除</a>	
								          	</td>
						        		</tr>
									</pg:item>
								</c:forEach>
							</c:if>
							<c:if test="${empty requestScope.goodslist }">
								<tr>
									<td colspan="5" align="center" bgcolor="#EFF3F7">没有找到相应的记录</td>
								</tr>
							</c:if> 
						</table>
				   	 	<pg:index>
							<pg:first>
								<a href="${pageUrl}">首页</a>
							</pg:first>
							<pg:prev>
								<a href="${pageUrl }">上一页</a>
							</pg:prev>
							<pg:pages>
								<c:choose>
									<%--当循环页码是当前页码，则该页码不可以导航，并显示为红色--%>
									<c:when test="${currentPageNumber eq pageNumber}">
										<font color="red">[${pageNumber }]</font>
									</c:when>
				
									<%-- 当循环页码不是当前页码，则该页码可以导航 --%>
									<c:otherwise>
										<a href="${pageUrl }">[${pageNumber }]</a>
									</c:otherwise>
								</c:choose>
							</pg:pages>
							<pg:next>
								<a href="${pageUrl }">下一页</a>
							</pg:next>
							<pg:last>
								<a href="${pageUrl }">尾页</a>
							</pg:last>
						</pg:index>
					</pg:pager>
    			</div>
  			</form> 
		</div>
		<div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div>
	</body>
</html>