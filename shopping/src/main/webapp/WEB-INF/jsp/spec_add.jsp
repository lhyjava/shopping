<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0081)http://192.168.1.3:8080/shopping/admin/goods_spec_edit.htm?id=32770&currentPage=1 -->
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
		<script src="/js/jquery.poshytip.min.js"></script>
		<script src="/js/spec_validate.js"></script>
		<script> 
			/* 
				提交表单，通过ajax提交"添加规格表单"，设置ajax同步，成功后提交"添加规格值表单"
			*/
			function saveForm(){
			 	var specname = $("#specname").val();
				var specsort = $("#specsort").val();
				$.ajax({
					url:'specinsert.htm',
					type:'post',
					async:false,
					data:{
						name:specname,
						sort:specsort
					},
					success:function(obj){
						
						if(obj == "error"){
							
							alert("规格名重复，请重输入");
							
							//window.location.href='specadd.htm';
						}else{
							
							$("#specidforval").val(obj);
							
							jQuery("#valform").submit();
						}
						
					}
				}); 
			}
			function change_img(obj){
				var sequence=jQuery(obj).attr("id").substring(10);
				var path=jQuery(obj).val();
				var src=getFullPath(jQuery(obj)[0]);
				jQuery("#image_"+sequence).attr("src",src);
				jQuery("#textfield_"+sequence).val(path);
			}
		</script>
		<style id="poshytip-css-tip-skyblue" type="text/css">
			div.tip-skyblue{visibility:hidden;position:absolute;top:0;left:0;}div.tip-skyblue table, div.tip-skyblue td{margin:0;font-family:inherit;font-size:inherit;font-weight:inherit;font-style:inherit;font-variant:inherit;}div.tip-skyblue td.tip-bg-image span{display:block;font:1px/1px sans-serif;height:10px;width:10px;overflow:hidden;}div.tip-skyblue td.tip-right{background-position:100% 0;}div.tip-skyblue td.tip-bottom{background-position:100% 100%;}div.tip-skyblue td.tip-left{background-position:0 100%;}div.tip-skyblue div.tip-inner{background-position:-10px -10px;}div.tip-skyblue div.tip-arrow{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;}
		</style>
	</head>
	<body>
		<form action="specinsert.htm" method="post" id="specform" name="specform">
	    	<h1 class="seth1">规格管理</h1>
		    <div class="settab">
		    	<span class="tab-one"></span>
		    	<span class="tabs">
		    		<a href="/specfindall.htm">管理</a> |
		    		<a href="javascript:void(0);" class="this">新增</a>
			  	</span>
			  	<span class="tab-two"></span>
			</div>
			<div class="editul ">
				<ul class="set3">
				    <li><strong class="sred">*</strong>规格名称</li>
				    <li>
				    	<span class="pxnum">
				      		<input name="name" type="text" id="specname" value="" />
				      	</span>
				      	<span id="nothis">
				      		<strong class="q"></strong>
				      		<strong class="w">请填写常用的商品规格的名称；例如：颜色；尺寸等。</strong>
				      		<strong class="c"></strong>
				      	</span>
					</li>
				</ul>
			  	<ul class="set3">
			    	<li>排序</li>
			   		<li>
			   			<span class="pxnum">
			   				<input name="sort" type="text" id="specsort" value="" />
			      		</span>
			      		<span id="nothis">
			      			<strong class="q"></strong>
			      			<strong class="w">请填写整数。类型列表将会根据排序进行由小到大排列显示。</strong>
			      			<strong class="c"></strong>
			      		</span>
			      	</li>
				</ul>
			</div>
		</form>      
		<script>
			var count=6;
			function img_spec(status){
				if(status=="1"){
					jQuery("span[id^=goods_spec_property_img_]").show();
				}
				if(status=="0"){
					jQuery("span[id^=goods_spec_property_img_]").hide();
				}
			}
			//删除一行
			function remove_goods_spec_property(obj,id){
				$(obj).remove();
			}
			//添加一行
			function add_goods_spec_property(){
				count++;
				var goods_spec_property_img="<tr id='goods_spec_'><td width='82'><span class='pxnum size5'><input name='valsort' id='sequence_count' value='' type='text'></span></td><td width='271'><span class='pxnum size7'><input name='value_count' id='value_count' value='' type='text'></span></td><td class='liul' width='558'><span id='goods_spec_property_img_' class='size13'><input name='textfield_count' id='textfield_count' type='text'></span> <span class='filebtn' id='goods_spec_property_img_'><input name='button' id='button1' value='' type='button'></span> <span id='goods_spec_property_img_' style='float:left;' class='file'><input name='specImage_count' id='specImage_count' size='30' type='file' onchange='change_img(this);'></span><span id='goods_spec_property_img_' class='pic_spe'><img id='image_count' name='image_count' src='http://tongzhen.oss-cn-beijing.aliyuncs.com/resources/style/common/images/transparent.gif' height='16' width='16'></span></td><td class='ac8' align='center' width='116'><a href='javascript:void(0);' onclick='remove_goods_spec_property(this.parentNode.parentNode,\"\")'>删除</a></td></tr>";
				var goods_spec_property_text="<tr id='goods_spec_'><td width='82'><span class='pxnum size5'><input name='valsort' id='sequence_count' value='' type='text'></span></td><td width='271'><span class='pxnum size7'><input name='valname' id='value_count' value='' type='text'></span></td><td class='liul' width='558'><span id='goods_spec_property_img_' style='display:none;' class='size13'><input name='textfield_count' id='textfield_count' type='text'></span> <span class='filebtn' id='goods_spec_property_img_'  style='display:none;'><input name='button' id='button1' value='' type='button'></span> <span id='goods_spec_property_img_'  style='float:left;display:none;' class='file'><input name='specImage_count' id='specImage_count' size='30' type='file'  onchange='change_img(this);'></span><span id='goods_spec_property_img_'  style='display:none;' class='pic_spe'><img   id='image_count' name='image_count' src='http://tongzhen.oss-cn-beijing.aliyuncs.com/resources/style/common/images/transparent.gif' height='16' width='16'></span></td><td class='ac8' align='center' width='116'><a href='javascript:void(0);' onclick='remove_goods_spec_property(this.parentNode.parentNode,\"\")'>删除</a></td></tr>";
				var type=jQuery(":radio:checked").val();
				if(type=="img"){
					jQuery(".addsx_table tr[id^=goods_spec_]").last().after(goods_spec_property_img.replace(/count/g,count));
				}else{
					jQuery(".addsx_table tr[id^=goods_spec_]").last().after(goods_spec_property_text.replace(/count/g,count));
				}
			}
		</script>
		<form action="specandvalinsert.htm" method="post" id="valform" name="valform">
    		<input type="hidden" name="specid" id="specidforval" />
    		<div class="specification">
       			<h2>新增规格值</h2>
       			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="addsx_table">
       				<tbody>
       					<tr id="goods_spec_">
							<td width="82"><strong>排序</strong></td>
							<td width="271"><strong>规格值</strong></td>
							<td width="558"><strong><span id="goods_spec_property_img_" style="display:none;">规格图片</span></strong></td>
							<td align="center">操作</td>
						</tr>
	  		  		    <tr id="goods_spec_property">
							<td width="82">
								<span class="pxnum size5">
									<input name="valsort" type="text" id="sequence_1" value="" />
								</span>
							</td>
							<td>
								<span class="pxnum size7">
									<input name="valname" type="text" id="value_1" value="" />
								</span>
							</td>
							<td width="558" class="liul">
								<span class="size13" id="goods_spec_property_img_" style="display:none;">
	              					<input name="textfield_1" type="text" id="textfield_1" />
	            				</span>
	            				<span class="filebtn" id="goods_spec_property_img_" style="display:none;">
	              					<input name="button" type="button" id="button1" value="" />
	             	 			</span>
	             	 			<span id="goods_spec_property_img_" style="float:left;" class="file">
	              					<input name="specImage_1" type="file" id="specImage_1" onchange="change_img(this);" size="30" />
	              				</span> 
	     						<span id="goods_spec_property_img_" class="pic_spe" style="display:none;">
	     							<img id="image_1" name="image_1" src="./loader02.jpg" width="16" height="16" />
	     						</span>
	     					</td>
							<td width="116" align="center" class="ac8">
								<a href="javascript:void(0);" onclick="remove_goods_spec_property(this.parentNode.parentNode,'32832')">删除</a>
							</td>
						</tr>
	  		            <tr>
           					<td colspan="3">
           						<span class="newclass">
           							<a href="javascript:void(0);" onclick="add_goods_spec_property();">新增规格值</a>
            					</span>
            				</td>
           					<td>&nbsp;</td>
        				</tr>
       				</tbody>
       			</table>
     		</div>
		</form>
		<div class="submit">
			<input name="" type="button" value="提交" onclick="saveForm();" />
		</div>
	</body>
</html>