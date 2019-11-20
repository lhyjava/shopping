<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0048)http://localhost:8080/admin/goods_brand_list.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title></title>
		<link href="/css/template.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.shop.common.js"></script>
		<script src="/js/jquery.poshytip.min.js"></script>
		<script>
			jQuery(document).ready(function(){
				tipStyle();
				//设置推荐的默认装态
				function recommendState(){
					var state = jQuery("#recommend").val();
					if(state=="true"){
						jQuery("#recommend").val("false");
						jQuery("#stateOff").show();
						jQuery("#stateOn").hide();
					}else{
						jQuery("#recommend").val("true");
						jQuery("#stateOff").hide();
						jQuery("#stateOn").show();
					}
				}
			});
			//网站logo file样式
			jQuery(function(){
			    var textButton="<input type='text' name='textfield' id='textfield1' class='size13' /><input type='button' name='button' id='button1' value='' class='filebtn' />"
				jQuery(textButton).insertBefore("#brandLogo");
				jQuery("#brandLogo").change(function(){
				jQuery("#textfield1").val(jQuery("#brandLogo").val());
				})
			});	
			//单条删除
			function isDelete(id) {
				var f = confirm('是否确认删除');
				if (!f) {
					return ;
				}
				window.location = 'goodsbranddel.htm?id=' + id;
			}
			//多条删除
			function deleteAll(obj){
				var arr = $(".cbclass:checked");
				var str = "";
				for(var i=0; i<arr.length; i++){
					str += $(arr[i]).val();
					if(i!=arr.length-1){
						str += ",";
					}
				}
				window.location.href="goodsbranddeleteall.htm?ids="+str;
			}
			//修改旗
			function ajax_update_img(id, obj){
				var src = $(obj).attr("src");
				var b = true;
				if('/img/true.png'==src){
					b = true;
				}else{
					b = false;
				}
				$.ajax({
					url:'goodsbrandupdateimg.htm',
					type:'post',
					async:true,
					data:{
						id:id,
						recommand:b
					},
					success:function(data){
						if(data=='success'){
							//成功换旗
							if(b){
								//换成灰色旗
								$(obj).attr("src", "/img/false.png");
							}else{
								//换成蓝色旗
								$(obj).attr("src", "/img/true.png");
							}
						}else{
							//失败不做任何事儿
						}
					}
				});
			}
			//页面内修改
			function ajax_update(id,fieldName,obj){
				//变化后的值
				var val=$(obj).val();
				$.ajax({
					type:'post',
					url:'goodsbrandupdate.htm',
					data:{
						"id":id,
						"fieldName":fieldName,
						"value":val
					},
					success:function(data){
			   			if(data == 'success'){
			   				//啥也不用做
			   			}else{
			   				window.location.href='goodsbrandfindall.htm';
			   			}
					},
					error:function(obj){
						alert("ajax error");
					}
					
			   });
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
			<h1 class="seth1">品牌管理</h1>
		  	<div class="settab"> 
				<span class="tab-one"></span>
				<span class="tabs"> 
					<a href="http://localhost:8080/admin/goods_brand_list.htm" class="this">管理</a> | 
					<a href="goodsbrandadd.htm">新增</a>
				</span> 
				<span class="tab-two"></span>
			</div>
			<!-- 搜索框 -->
			<form action="goodsbrandquery.htm" method="post">
				<div class="allmem_search">
					<ul>
						<li> 
							<span>品牌名称</span>
							<span class="allmen size4">
								<input name="name" type="text" id="name" />
							</span>
							<span>类别</span>
							<span class="allmen size4">
								<input name="type" type="text" id="category" />
							</span>
							<span class="btn_search">
								<input type="submit" value="搜索" style="cursor:pointer;" />
							</span>
						</li>
					</ul>
				</div>
			</form>
			<div class="operation">
		  		<h3>友情提示</h3>
		    	<ul>
			    	<li>通过商品品牌管理，你可以进行查看、编辑、删除系统商品品牌</li>
			    	<li>设置推荐的品牌会在商城首页根据序号从小到大的顺利轮换显示</li>
			    	<li>设置品牌首字母，在品牌列表页通过首字母搜索品牌</li>
			    </ul>
			</div>
			<form name="ListForm" id="ListForm" action="http://localhost:8080/admin/goods_brand_list.htm" method="post">
		    	<div class="brandtable">
		    		<pg:pager url="/goodsbrandfindall.htm" maxPageItems="5" maxIndexPages="5"
							export="offset,currentPageNumber=pageNumber" isOffset="false"
							index="center">
			    		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="brand_table">
			        		<tbody>
			        			<tr style="background:  #2A7AD2       ; height:30px; color:#FFF">
			          				<td width="45">&nbsp;</td>
							        <td width="60">排序</td>
							        <td width="80">首字母</td>
							        <td width="203">品牌名称</td>
							        <td width="194">类别</td>
							        <td width="183">品牌图片标识</td>
							        <td width="121" align="center">推荐</td>
							        <td width="217" align="left">操作</td>
			        			</tr>
						        <!-- add by lhy 11.11 begin-->
						        <c:forEach items="${requestScope.goodsbrandlist }" var="tmp">
							        <pg:item>
										<tr>
											<td align="center">
												<input class="cbclass" name="checkbox" type="checkbox" id="checkbox" value="${tmp.id }" />
											</td>
											<td>
												<span class="pxnum size5">
													<input type="text" name="0" id="0" value="${tmp.sort }" onchange="ajax_update('${tmp.id }','sort',this)" title="可编辑" />
												</span>
											</td>
											<td>
												<span class="pxnum size5">
													<input type="text" name="N" id="N" value="${tmp.firstchar }" onchange="ajax_update('${tmp.id }','firstchar',this)" title="可编辑" />
												</span>
											</td>
											<td>
												<span class="pxnum size8">
													<input name="Nutrilon" type="text" id="Nutrilon" onchange="ajax_update('${tmp.id }','name',this)" value="${tmp.name }" title="可编辑" />
												</span>
											</td>
											<td>
												<span class="pxnum size8"> ${tmp.type }</span>
											</td>
											<td>
												<img src="/img/${tmp.img }" width="88px" height="44px" />
											</td>
											<td align="center">
											<c:if test="${tmp.recommand }">
												<img onclick="ajax_update_img('${tmp.id }',this)" src="/img/true.png" width="25" height="21" border="0" style="cursor:pointer;" title="可编辑" /> 
											</c:if>
											<c:if test="${!tmp.recommand }">
												<img onclick="ajax_update_img('${tmp.id }',this)" src="/img/false.png" width="25" height="21" border="0" style="cursor:pointer;" title="可编辑" /> 
											</c:if>
											</td>
											<td class="ac8" align="left">
												<a href="goodsbrandedit.htm?id=${tmp.id }&name=${tmp.name }&firstchar=${tmp.firstchar }&sort=${tmp.sort }&type=${tmp.type }&img=${tmp.img }&recommand=${tmp.recommand }">编辑</a>|
												<a href="javascript:isDelete(${tmp.id });">删除</a>
											</td>
										</tr>
									</pg:item>
						        </c:forEach>
						        <!-- add by lhy 11.11 end-->
								<tr>
									<td align="center">
										<input type="checkbox" name="all" id="all" value="" onclick="selectAll(this)" />
									</td>
									<td colspan="2" class="bdel">
										<span class="sp1">全部</span>
										<span class="sp2">
											<div class="shop_btn_del shopbtn">
												<input type="button" style="cursor:pointer;" value="删除" onclick="deleteAll(this);" />
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
		    		<!-- 分页 -->
					<!-- <div class="fenye" align="right" id="queryCondition">
						<input name="category" type="hidden" id="category" value="" />
						<input name="name" type="hidden" id="name" value="" />
						<input name="mulitId" type="hidden" id="mulitId" />
						<input name="currentPage" type="hidden" id="currentPage" value="1" />
						
						<a href="javascript:void(0);" onclick="return gotoPage(1)">首页</a> 第　
						<a class="this" href="javascript:void(0);" onclick="return gotoPage(1)">1</a> 页　
						<a href="javascript:void(0);" onclick="return gotoPage(1)">末页</a> 	  
					</div> -->
				</div>
			</form>
		</div>
		<div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div>
	</body>
</html>