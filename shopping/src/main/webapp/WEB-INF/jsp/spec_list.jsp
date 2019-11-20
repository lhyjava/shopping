<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0058)http://192.168.1.3:8080/shopping/admin/goods_spec_list.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title></title>
		<link href="/css/template.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.shop.common.js"></script>
		<script src="/js/jquery.poshytip.min.js"></script>
		<script>
			//页面内修改
			function ajax_update(id,fieldName,obj){
				//变化后的值
				var val=$(obj).val();
				$.ajax({
					type:'post',
					url:'specupdate.htm',
					data:{
						"id":id,
						"fieldName":fieldName,
						"value":val
					},
					success:function(data){
			   			if(data == 'success'){
			   				//啥也不用做
			   			}else{
			   				window.location.href='specfindall.htm';
			   			}
					},
					error:function(obj){
						alert("ajax error");
					}
					
			   });
			}
			//单条删除
			function isDelete(id) {
				var f = confirm('是否确认删除');
				if (!f) {
					return ;
				}
				window.location = 'specdel.htm?id=' + id;
			}
			//多条删除
			function deleteAll(){
				var arr = $(".cbclass:checked");
				var str = "";
				for(var i=0; i<arr.length; i++){
					str += $(arr[i]).val();
					if(i!=arr.length-1){
						str += ",";
					}
				}
				window.location.href="specdeleteall.htm?ids="+str;
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
		<div class="cont">
	  		<h1 class="seth1">规格管理</h1>
	  		<div class="settab">
	  			<span class="tab-one"></span>
	  			<span class="tabs">
	  				<a href="http://192.168.1.3:8080/shopping/admin/goods_spec_list.htm" class="this">管理</a> | 
	  				<a href="specadd.htm">新增</a>
	  			</span>
	  			<span class="tab-two"></span>
	  		</div>
	  		<form name="ListForm" id="ListForm" action="http://192.168.1.3:8080/shopping/admin/goods_spec_list.htm" method="post">
	  			<div id="list">
	    			<div class="typemanager">
	    				<pg:pager url="/specfindall.htm" maxPageItems="5" maxIndexPages="5"
							export="offset,currentPageNumber=pageNumber" isOffset="false"
							index="center">
		      				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="specific_table">
		        				<tbody>
		        					<tr style="background:#2A7AD2; height:30px; color:#FFF">
							        	<td width="5%">&nbsp;</td>
							          	<td width="10%">排序</td>
							          	<td width="20%">规格名称</td>
							          	<td width="40%">规格值</td>
							          	<td align="center">操作</td>
							        </tr>
		        					<!-- add by lhy 1114 begin  -->
		        					<c:forEach items="${requestScope.specpluslist }" var="tmp">
		        						<pg:item>
			        						<tr>
									        	<td align="center">
									        		<input class="cbclass" name="id" type="checkbox" id="id" value="${tmp.id }" />
									        	</td>
									          	<td>
									          		<span class="pxnum size5">
									            		<input type="text" name="1" id="1" value="${tmp.sort }" onchange="ajax_update('${tmp.id }','sort',this)" title="可编辑" />
									          		</span>
									          	</td>
									          	<td>
									          		<span class="pxnum size7">
									          			<span class="pxnum size5">
									           				<input type="text" name="颜色分类" id="颜色分类" value="${tmp.name }" onchange="ajax_update('${tmp.id }','name',this)" title="可编辑" />
									          			</span>
									          		</span>
									          	</td>
										        <td>${tmp.vals }</td>
										        <td align="center" class="ac8">
										        	<a href="spacvaledit.htm?id=${tmp.id }&sort=${tmp.sort }&name=${tmp.name }">编辑</a>|
										        	<a href="javascript:isDelete(${tmp.id });">删除</a>
										        </td>
									        </tr>
								        </pg:item>
		        					</c:forEach>
		        					<!-- add by lhy 1114 end  -->
		                			<tr>
		          						<td align="center">
		          							<input type="checkbox" name="all" id="all" value="" onclick="selectAll(this)" />
		          						</td>
		          						<td colspan="2" class="bdel">
			          						<span class="sp1">全部</span>
			          						<span class="sp2">
			            						<div class="shop_btn_del shopbtn">
								              		<input type="button" value="删除" onclick="deleteAll(this);" style="cursor:pointer;" />
								            	</div>
		          							</span>
		          						</td>
		          						<td colspan="4"></td>
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
	    			<div class="fenye">
				    	<input name="currentPage" type="hidden" id="currentPage" value="1" />
					  	<input name="mulitId" type="hidden" id="mulitId" />
				      	<a href="javascript:void(0);" onclick="return gotoPage(1)">首页</a> 第　
				      	<a class="this" href="javascript:void(0);" onclick="return gotoPage(1)">1</a> 页　
				      	<a href="javascript:void(0);" onclick="return gotoPage(1)">末页</a>
					</div>
				</div>
			</form>
		</div>
		<div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div>
	</body>
</html>