<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0048)http://localhost:8080/admin/goods_brand_list.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="/css/template.css" rel="stylesheet" type="text/css">
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
			//
			function ajax_update(id,fieldName,obj){
				var val=jQuery(obj).val();
				jQuery.ajax({type:'POST',
					url:'http://localhost:8080/admin/goods_brand_ajax.htm',
					data:{"id":id,"fieldName":fieldName,"value":val},
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
		</script>
		<style id="poshytip-css-tip-skyblue" type="text/css">
			div.tip-skyblue{visibility:hidden;position:absolute;top:0;left:0;}div.tip-skyblue table, div.tip-skyblue td{margin:0;font-family:inherit;font-size:inherit;font-weight:inherit;font-style:inherit;font-variant:inherit;}div.tip-skyblue td.tip-bg-image span{display:block;font:1px/1px sans-serif;height:10px;width:10px;overflow:hidden;}div.tip-skyblue td.tip-right{background-position:100% 0;}div.tip-skyblue td.tip-bottom{background-position:100% 100%;}div.tip-skyblue td.tip-left{background-position:0 100%;}div.tip-skyblue div.tip-inner{background-position:-10px -10px;}div.tip-skyblue div.tip-arrow{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;}
		</style>
	</head>
	<body>
		<div class="cont">
			<h1 class="seth1">品牌管理</h1>
			<div class="settab"> 
				<span class="tab-one"></span>
				<span class="tabs"> 
					<a href="http://localhost:8080/admin/goods_brand_list.htm" class="this">管理</a> | 
					<a href="http://localhost:8080/admin/goods_brand_add.htm">新增</a> | 
					<a href="http://localhost:8080/admin/goods_brand_audit.htm">申请列表</a>
				</span> 
				<span class="tab-two"></span>
			</div>
			<form name="queryForm" id="queryForm" action="http://localhost:8080/admin/goods_brand_list.htm" method="post">
				<div class="allmem_search">
					<ul>
						<li>
							<span>品牌名称</span>
							<span class="allmen size4">
								<input name="name" type="text" id="name">
							</span>
							<span>类别</span>
							<span class="allmen size4">
								<input name="category" type="text" id="category">
							</span>
							<span class="btn_search">
								<input name="" type="submit" value="搜索" style="cursor:pointer;">
							</span>
						</li>
					</ul>
				</div>
			</form>
			<div class="operation">
				<h3>友情提示</h3>
				<ul>
					<li> 通过商品品牌管理，你可以进行查看、编辑、删除系统商品品牌</li>
					<li>设置推荐的品牌会在商城首页根据序号从小到大的顺利轮换显示</li>
					<li>设置品牌首字母，在品牌列表页通过首字母搜索品牌</li>
				</ul>
			</div>
			<form name="ListForm" id="ListForm" action="http://localhost:8080/admin/goods_brand_list.htm" method="post">
				<div class="brandtable">
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
						<tr>
							<td align="center"><input name="checkbox" type="checkbox" id="checkbox" value="28"></td>
							<td><span class="pxnum size5"> <input type="text" name="0" id="0" value="${tmp.sort }" onblur="ajax_update('28','sequence',this)" title="可编辑"></span></td>
							<td><span class="pxnum size5"> <input type="text" name="N" id="N" value="${tmp.firstchar }" onblur="ajax_update('28','first_word',this)" title="可编辑"></span></td>
							<td><span class="pxnum size8"><input name="Nutrilon" type="text" id="Nutrilon" onblur="ajax_update('28','name',this)" value="${tmp.name }" title="可编辑">
							</span></td>
							<td><span class="pxnum size8"> ${tmp.type } </span></td>
							<td><img src="/img/${tmp.img }" width="88px" height="44px"></td>
							<td align="center">
								<c:if test="${tmp.recommand }">
									<img onclick="ajax_update('28','recommend',this)" src="/img/true.png" width="25" height="21" border="0" style="cursor:pointer;" title="可编辑"> 
								</c:if>
								<c:if test="${!tmp.recommand }">
									<img onclick="ajax_update('28','recommend',this)" src="/img/false.png" width="25" height="21" border="0" style="cursor:pointer;" title="可编辑"> 
								</c:if>
							</td>
							<td class="ac8" align="left"><a href="http://localhost:8080/admin/goods_brand_edit.htm?id=28">编辑</a>|<a href="http://localhost:8080/admin/goods_brand_del.htm?mulitId=28&amp;currentPage=1">删除</a></td>
						</tr>
					</c:forEach>
					<!-- add by lhy 11.11 end-->
					<tr>
						<td align="center"><input type="checkbox" name="all" id="all" value="" onclick="selectAll(this)"></td>
						<td colspan="2" class="bdel">
							<span class="sp1">全部</span>
							<span class="sp2">
								<div class="shop_btn_del shopbtn">
									<input name="" type="button" style="cursor:pointer;" value="删除" onclick="cmd('http://localhost:8080/admin/goods_brand_del.htm?currentPage=1');">
								</div>
							</span>
						</td>
						<td colspan="4"></td>
					</tr>
					</tbody>
				</table>
				<div class="fenye" align="right" id="queryCondition">
					<input name="category" type="hidden" id="category" value="">
					<input name="name" type="hidden" id="name" value="">
					<input name="mulitId" type="hidden" id="mulitId">
					<input name="currentPage" type="hidden" id="currentPage" value="1">
					<a href="javascript:void(0);" onclick="return gotoPage(1)">首页</a> 第　<a class="this" href="javascript:void(0);" onclick="return gotoPage(1)">1</a> 页　<a href="javascript:void(0);" onclick="return gotoPage(1)">末页</a> 	  
				</div>
				</div>
			</form>
		</div>

		
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>	
		</div>
		<div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div>
	</body>
</html>