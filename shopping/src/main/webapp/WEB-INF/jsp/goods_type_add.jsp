<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0046)http://localhost:8080/admin/goods_type_add.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title></title>
		<link href="/css/template.css" rel="stylesheet" type="text/css" />
		<link href="/css/overlay.css" type="text/css" rel="stylesheet" />
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery-ui-1.8.21.js"></script>
		<script src="/js/jquery.shop.common.js"></script>
		<script src="/js/jquery.validate.min.js"></script>
		<script src="/js/goods_type_validate.js"></script>
		<script>
			function saveForm(){
				var gss="";
				var gbs="";
				jQuery(":checkbox:checked[id^='gs_']").each(function(){
			  		gss=gss+","+jQuery(this).val();
				});
				jQuery(":checkbox:checked[id^='gb_']").each(function(){
			  		gbs=gbs+","+jQuery(this).val();
				});
				jQuery("#spec_ids").val(gss);
				jQuery("#brand_ids").val(gbs);
				jQuery("#count").val(count);
				jQuery("#theForm").submit();
			}
		</script>
	</head>
	<body>
		<form id="myForm" action="goodstypeaddsubmit.htm" method="post">
			<div class="cont">
		    	<h1 class="seth1">类型管理</h1>
		    	<div class="settab">
		    		<span class="tab-one"></span>
		    		<span class="tabs">
		    			<a href="/goodstypefindall.htm">管理</a> | 
		    			<a href="javascript:void(0);" class="this">新增</a>
		    		</span>
		    		<span class="tab-two"></span>
		    	</div>
		    	<div class="edit">
		      		<div class="editul ">
		        		<ul>
			          		<li><strong style="color:#FF0000; font-size:16px; vertical-align:middle;">*</strong>类型名称</li>
			          		<li>
			          			<span class="pxnum">
			            			<input name="name" type="text" id="name" value="" />
			            		</span>
			            	</li>
		        		</ul>
		        		<ul class="set3">
		          			<li>排序</li>
		          			<li>
		          				<span class="pxnum">
		           					<input name="sort" type="text" id="sequence" value="" />
		            			</span>
		            			<span id="nothis">
		            				<strong class="q"></strong>
		            				<strong class="w">请填写整数。类型列表将会根据排序进行由小到大排列显示。</strong>
		            				<strong class="c"></strong>
		            			</span>
		            		</li>
		        		</ul>
		      		</div>
		      		<div class="specification">
		        		<h2>选择关联规格</h2>
		        		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spe_table">
							<tbody>
								<tr>
									<td width="30">&nbsp;</td>
									<td width="150"><strong>规格名称</strong></td>
									<td><strong>规格值</strong></td>
								</tr>
								<c:forEach items="${requestScope.specpluslistfortype }" var="tmp">
									<tr>
										<td align="center">
											<input name="specid" type="checkbox" id="specid" value="${tmp.id }" />
										</td>
										<td>${tmp.name }</td>
										<td>${tmp.vals }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
		      		<div class="specification">
		        		<h2>选择关联品牌</h2>
		       			<c:forEach items="${requestScope.typelistforgoodstype }" var="tmp">
		       				<ul class="spec_sports">
		         				<h3>${tmp }</h3>
		         				<c:forEach items="${requestScope.brandlistforgoodstype }" var="tmp1">
			            			<c:if test="${tmp==tmp1.type }">
					            		<li>
					            			<span class="span1">
						            			<input name="brandid" type="checkbox" id="gb_28" value="${tmp1.id }" />${tmp1.name }
						            		</span> 
					            		</li> 
			            			</c:if> 
		            			</c:forEach>               
		       				</ul>
		       			</c:forEach>
		         	</div>
		      		<script>
				  	  	var count=1;
				  	   	function remove_gtp(obj,id){
					     	jQuery.post("http://localhost:8080/admin/goods_type_property_delete.htm",{"id":id},function(data){
					            if(data=="true"){
						        	jQuery(obj).remove();
					            	count--;
						        }else alert("规格值删除失败！");
					          	},"text");
				   		}
				   		function add_gtp(){
					     	count++;
					     	var gtp="<tr id='goods_type_property_'> <td><span class='pxnum size5'><input name='gtp_sequence_count' type='text' id='gtp_sequence_count' /></span></td><td><span class='pxnum size7'><input name='gtp_name_count' type='text' id='gtp_name_count' /></span></td><td><span class='pxnum size7'><input name='gtp_value_count' type='text' id='gtp_value_count' /></span></td><td><input name='gtp_display_count' type='checkbox' checked='checked' id='gtp_display_count' value='true' /></td><td class='ac8'><a href='javascript:void(0);' onclick='remove_gtp(this.parentNode.parentNode,\"\")'>删除</a></td></tr>";		 
						 	jQuery("tr[id^=goods_type_property_]:last").after(gtp.replace(/count/g,count));
				   		}
			  		</script>
		    	</div>
		    	<div class="submit">
		      		<input name="" type="submit" value="提交" />
		    	</div>
		  	</div>
		</form>
	</body>
</html>