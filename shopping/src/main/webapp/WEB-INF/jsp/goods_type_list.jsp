<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0047)http://localhost:8080/admin/goods_type_list.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title></title>
		<link href="/css/template.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.shop.common.js"></script>
		<script src="/js/jquery.poshytip.min.js"></script>
		<script>
			function ajax_update(id,fieldName,obj){
				var val=jQuery(obj).val();
			   	jQuery.ajax({
			   		type:'POST',
			        url:'http://localhost:8080/admin/goods_type_ajax.htm',
					data:{
						"id":id,
						"fieldName":fieldName,
						"value":val
					},
					beforeSend:function(){
					  
					},
				   	success:function(data){
			        	if(val==""){
					   		jQuery(obj).attr("src","http://localhost:8080/resources/style/system/manage/blue/images/"+data+".png");
					 	}else{
					   		jQuery(obj).val(val);
					 	}      
					}
			   });
			}
			//页面内修改
			function ajax_update(id,fieldName,obj){
				var val=$(obj).val();
				jQuery.ajax({
					type:'POST',
				    url:'goodstypeupdate.htm',
					data:{
						"id":id,
						 "fieldName":fieldName,
						 "value":val
					},
				   	success:function(data){
			        	if(data=="success"){
					  	
					 	}else{
					   
					 	}      
					}
				});
			}
			//单行删除 
			function deletegoodstype(obj,id){
				var f = confirm('是否确认删除');
				if (!f) {
					return ;
				}
				$.ajax({
					url:"deletegoodstype.htm",
					type:"post",
					async:true,
					data:{
						id:id
					},
					success:function(data){
						if(data == "success"){
							$(obj).parent().parent().remove();
						}
					}
				});
			}
			//多行删除
			function deletegoodstypes(){
				var arr = $(".cbaclass:checked");
				var values = "";
				for(var i = 0;i <arr.length;i++){
					values += $(arr[i]).val();
					if(i != arr.length-1){
						values += ",";
					}
				}
				var f = confirm('是否确认删除');
				if (!f) {
					return ;
				}
				window.location.href="deletegoodstypes.htm?values="+values;
			}
		</script>
		<style id="poshytip-css-tip-skyblue" type="text/css">
			div.tip-skyblue{visibility:hidden;position:absolute;top:0;left:0;}div.tip-skyblue table, div.tip-skyblue td{margin:0;font-family:inherit;font-size:inherit;font-weight:inherit;font-style:inherit;font-variant:inherit;}div.tip-skyblue td.tip-bg-image span{display:block;font:1px/1px sans-serif;height:10px;width:10px;overflow:hidden;}div.tip-skyblue td.tip-right{background-position:100% 0;}div.tip-skyblue td.tip-bottom{background-position:100% 100%;}div.tip-skyblue td.tip-left{background-position:0 100%;}div.tip-skyblue div.tip-inner{background-position:-10px -10px;}div.tip-skyblue div.tip-arrow{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;}
			.pageindex{
				font-size:14px;
			}
		</style>
	</head>
	<body>
		<form name="ListForm" id="ListForm" action="http://localhost:8080/admin/goods_type_list.htm" method="post">
	  		<div class="cont">
	    		<h1 class="seth1">商品类型管理</h1>
	    		<div class="settab">
		    		<span class="tab-one"></span> 
		    		<span class="tabs"> 
		    			<a href="javascript:void(0);" class="this">管理</a> | 
		    			<a href="goodstypeadd.htm">新增</a>
		    		</span>
		    		<span class="tab-two"></span>
	    		</div>
	    		<div class="typemanager">
	    			<pg:pager url="/goodstypefindall.htm" maxPageItems="5" maxIndexPages="5"
							export="offset,currentPageNumber=pageNumber" isOffset="false"
							index="center">
		      			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="type_manager">
		        			<tbody>
		        				<tr style="background:#2A7AD2; height:30px; color:#FFF">
						          	<td width="5%">&nbsp;</td>
						          	<td width="10%">排序</td>
						          	<td width="60%">类型名称</td>
						          	<td align="center">操作</td>
					        	</tr>
					        	<c:forEach items="${requestScope.goodstypelist }" var="tmp">
					        		<pg:item>
				                		<tr>
				          					<td align="center">
				          						<input class = "cbaclass" name="checkbox" type="checkbox" id="checkbox" value="${tmp.id }" />
				          					</td>
				          					<td>
				          						<span class="pxnum size5">
				            						<input type="text" name="1" id="1" value="${tmp.sort }" onchange="ajax_update('${tmp.id }','sort',this)" title="可编辑" />
				            					</span>
				            				</td>
				          					<td>
				          						<span class="pxnum size7">
				            						<input name="" type="text" id="" onchange="ajax_update('${tmp.id }','name',this)" value="${tmp.name }" title="" />
				            					</span>
				            				</td>
				          					<td align="center" class="ac8">
				          						<a href="goodstypeedit.htm?id=${tmp.id }&name=${tmp.name }&sort=${tmp.sort }">编辑</a>|
				          						<a href="javascript:void(0)" onclick = "deletegoodstype(this,${tmp.id });">删除</a>
				          					</td>
				        				</tr>
			        				</pg:item>
		        				</c:forEach>
		                		<tr>
		          					<td align="center">
		          						<input type="checkbox" name="all" id="all" value="" onclick="selectAll(this)" />
		            					<input name="mulitId" type="hidden" id="mulitId" />
		            					<input name="currentPage" type="hidden" id="currentPage" value="1" />
		            				</td>
		          					<td colspan="2" class="bdel">
		          						<span class="sp1">全部</span>
		          						<span class="sp2">
		            						<div class="shop_btn_del shopbtn">
		              							<input name="Input" type="button" value="删除" onclick="deletegoodstypes();" style="cursor:pointer;" />
		            						</div>
		            					</span>
		            				</td>
		          					<td>&nbsp;</td>
		        				</tr>
		      				</tbody>
		      			</table>
		      			<pg:index>
							<pg:first>
								<a class="pageindex" href="${pageUrl}">首页</a>
							</pg:first>
							<pg:prev>
								<a class="pageindex" href="${pageUrl }">上一页</a>
							</pg:prev>
							<pg:pages>
								<c:choose>
									<%--当循环页码是当前页码，则该页码不可以导航，并显示为红色--%>
									<c:when test="${currentPageNumber eq pageNumber}">
										<font color="red">[${pageNumber }]</font>
									</c:when>
				
									<%-- 当循环页码不是当前页码，则该页码可以导航 --%>
									<c:otherwise>
										<a class="pageindex" href="${pageUrl }">[${pageNumber }]</a>
									</c:otherwise>
								</c:choose>
							</pg:pages>
							<pg:next>
								<a class="pageindex" href="${pageUrl }">下一页</a>
							</pg:next>
							<pg:last>
								<a class="pageindex" href="${pageUrl }">尾页</a>
							</pg:last>
						</pg:index>
	      			</pg:pager>
	    		</div>
	  		</div>
		</form>
		<div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div>
	</body>
</html>