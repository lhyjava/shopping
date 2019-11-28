<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0031)http://localhost:8080/findguige -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>添加分类</title>
		<style type="text/css">
			#na{width:325px; text-align:center; display:block;}
			#va{width:300px; text-align:center; display:block;}
			#warning{width:300px; text-align:center; display:block;}
			#del{ width:120px; text-align:center;display:block;} 
		</style>
		<link href="/css/template.css" rel="stylesheet" type="text/css" />
		<link href="/css/public.css" type="text/css" rel="stylesheet" />
		<link href="/css/goods.css" type="text/css" rel="stylesheet" />
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.validate.min.js"></script>
		<script type="text/javascript">
			//设置默认状态以及判断初始显示状态
			jQuery(document).ready(function(){
	
				//判断规格值是否相同
				$("#specnameId2").blur(function(){
					var nn1 = $("#specnameId1").val();
					var nn2 = $("#specnameId2").val();
					if((nn1 == nn2) && (nn1 != 0)){
						$("#specnameId2").val("");
						$("#nv2").empty();
						sb=[];
						sb.push("<select id='specvalueId' name='specvalueId' onchange='ajaxChangeSK(this)'>");
						sb.push("<option value=''>请选择规格值二</option>");
						sb.push("</select>");
						$("#nv2").append(sb.join(""));
					}
				});
				$("#specnameId1").blur(function(){
					var nn1 = $("#specnameId1").val();
					var nn2 = $("#specnameId2").val();
					if((nn1 == nn2) && (nn1 != 0)){
						$("#specnameId1").val("");
						$("#nv4").empty();
						sb=[];
						sb.push("<select id='specvalueId' name='specvalueId' onchange='ajaxChangeSK(this)'>");
						sb.push("<option value=''>请选择规格值一</option>");
						sb.push("</select>");
						$("#nv4").append(sb.join(""));
					}
				});
				var state1 = jQuery("#display1").val();
			 	if(state1 == ""){
			 		jQuery("#display1").val("1");
			 		jQuery("#displayOff1").hide();
			 	}else{
			 		 if(state1 == "1"){
			 			jQuery("#displayOff1").hide();
			 		}else{
			 			jQuery("#displayOn1").hide();
			 		}
				};
				
				var state2 = jQuery("#display2").val();
			 	if(state2 == ""){
			 		jQuery("#display2").val("1");
			 		jQuery("#displayOff2").hide();
			 	}else{
			 		 if(state2 == "1"){
			 			jQuery("#displayOff2").hide();
			 		}else{
			 			jQuery("#displayOn2").hide();
			 		}
				};
					
				//标志图片鼠标经过显示
				jQuery("#brandImgShow").mouseover(function(){
					jQuery("#brandImg").show();
				});
				jQuery("#brandImgShow").mouseout(function(){
					jQuery("#brandImg").hide();
				});
				jQuery("#brandLogo").change(function(){
					jQuery("#textfield1").val(jQuery("#brandLogo").val());
				});	
				
				//改变系统提示的样式
			  	jQuery("span .w").mousemove(function(){
					var id = jQuery(this.parentNode).attr("id");
					if(id="nothis"){
					   jQuery(this.parentNode).attr("id","this");
					}
			  	}).mouseout(function(){
					var id = (this.parentNode).attr("id");
				 	if(id="this"){
				   		jQuery(this.parentNode).attr("id","nothis");
				 	}
				});
			  
			});
			//修改是否推荐状态
			function displayRecommend(){
				var state1 = jQuery("#display1").val();
				if(state1=="1"){
					jQuery("#display1").val("0");
					jQuery("#displayOff1").show();
					jQuery("#displayOn1").hide();
				}else{
					jQuery("#display1").val("1");
					jQuery("#displayOff1").hide();
					jQuery("#displayOn1").show();
				}
			}
			//修改是否显示状态
			function displayState(){
				var state2 = jQuery("#display2").val();
				if(state2=="1"){
					jQuery("#display2").val("0");
					jQuery("#displayOff2").show();
					jQuery("#displayOn2").hide();
				}else{
					jQuery("#display2").val("1");
					jQuery("#displayOff2").hide();
					jQuery("#displayOn2").show();
				}
			}
			//提交
			function saveForm(method){
				   jQuery("#theForm").submit();
			}
			
			//add by lhy 1128 begin

			/* 根据规格名展示相应的规格值 */
			function ajaxChangeSK(obj){
				
				var sk = $(obj).val();
				
				$.ajax({
					type:"Post",
					url:"/findspecval.htm",
					data:{ 
						specid:sk
					},
					success:function(data1){
					
						var obj1 = JSON.parse(data1);
						var data = obj1.specvallist;
						
						var se = $("#specvalueId");
						
						se.html("");
						for(var i=0; i<data.length; i++){
								var opt = $("<option></option>");
								opt.html(data[i].value);
								opt.val(data[i].id);
								se.append(opt);
							}
					}
				});
			}
			
			/* 根据选择的第三级分类显示相应的品牌 */
			function classChange(obj){
				
				var sk = $(obj).val();
				
				$.ajax({
					type:"Post",
					url:"/findbrand.htm",
					data:{ 
						brandid:sk
					},
					success:function(data1){
					
						var obj1 = JSON.parse(data1);
						var data = obj1.brandlist;
						
						var se = $("#brandId");
						
						se.html("");
						for(var i=0; i<data.length; i++){
							var opt = $("<option></option>");
							opt.html(data[i].name);
							opt.val(data[i].id);
							se.append(opt);
						}
					}
				});
			}
			
			function ajaxChangeBrand(obj){
				
				var sk = $(obj).val();
				
				$.ajax({
					type:"Post",
					url:"/findspec.htm",
					data:{ 
						brandid:sk
					},
					success:function(data1){
					
						var obj1 = JSON.parse(data1);
						var data = obj1.speclist;
						
						var se = $("#specnameId1");
						
						se.html("");
						for(var i=0; i<data.length; i++){
							var opt = $("<option></option>");
							opt.html(data[i].specname);
							opt.val(data[i].id);
							se.append(opt);
						}
					}
				});
			}
			
			
			
			//add by lhy 1128 end
		</script>
		<script type="text/javascript" src="./config.js"></script>
		<link rel="stylesheet" type="text/css" href="./editor.css" />
		<script type="text/javascript" src="./zh-cn.js"></script>
		<script type="text/javascript" src="./styles.js"></script>
		<style id="cke_ui_color" type="text/css" ></style>
		<script type="text/javascript" src="./config.js(1)"></script>
		<link rel="stylesheet" type="text/css" href="./editor(1).css" />
		<script type="text/javascript" src="./zh-cn.js(1)"></script>
		<script type="text/javascript" src="./styles.js(1)"></script>
		<link rel="stylesheet" type="text/css" href="./scayt.css">
		<link rel="stylesheet" type="text/css" href="./dialog.css">
		<link rel="stylesheet" type="text/css" href="./tableselection.css">
		<link rel="stylesheet" type="text/css" href="./wsc.css">
		<link rel="stylesheet" type="text/css" href="./copyformatting.css">
	</head>
	<body style="">
		<div class="cont">
			<h1 class="seth1">商品分类</h1>
			<div class="settab">
				<span class="tab-one"></span>
      			<span class="tabs">
					<a href="http://localhost:8080/goods/showGoods">所有商品</a> | <a href="http://localhost:8080/findguige" class="this">新增商品</a>
		      		&nbsp;&nbsp;&nbsp;<input type="button" value="刷新" onclick="JavaScript:window.location.reload()"><br>			
	  			</span> 
 			</div>
 			<form name="theForm" id="theForm" action="http://localhost:8080/goodsaddsubmit" method="post" enctype="multipart/form-data" novalidate="novalidate">
  				<input name="id" type="hidden" id="id" value="">
  				<div class="setcont">
    				<ul class="set1">
      					<li><strong class="orange fontsize20">*</strong>商品名称</li>
      					<li>
      						<span class="webname">
					      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					      		<input type="text" id="goodsname" name="name" placeholder="请输入商品名称" value="" size="40">
      						</span>
	    					<span id="msg" style="visibility:visible;color:red;"></span>		      
      					</li>
    				</ul>
      				<ul class="set1">
	      				<li><strong class="orange fontsize20">*</strong>商品图片</li>
	      				<li>
							<span class="webname">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			      
								<input name="img" type="text" id="textfield1">
							</span>
							<span class="filebtn">
								<input name="button" type="button" id="button1" value="浏览">
							</span>
							<span style="float:left;" class="file">
								<input type="file" name="file" id="brandLogo" size="40">
							 </span>
							<span class="preview"></span>
							<span id="nothis">
								<strong class="q"></strong>
								<strong class="w">最佳尺寸93*33，支持格式gif,jpg,jpeg,png</strong>
								<strong class="c"></strong>
							</span>
		  				</li>
      				</ul>     
    				<ul class="set1">
      					<li><strong class="orange fontsize20">*</strong>商品货号</li>
						<li>
							<span class="webname">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="artnumber" name="number" value="" size="40">
							</span>
							<span id="nothis"></span>	
						</li>     
    				</ul>   
					<ul class="set1">
	      				<li><strong class="orange fontsize20">*</strong>库&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存</li>
	      				<li>
							<span class="webname">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="stock" name="stock" value="" size="40" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
							</span>
							<span id="nothis"></span>	      		
	      				</li>     
	    			</ul>        
    				<ul class="set1">
	     				<li><strong class="orange fontsize20">*</strong>商品价格</li>
	      				<li>
							<span class="webname">&nbsp;&nbsp;进&nbsp;&nbsp;&nbsp;价：<input type="text" id="buyprice" name="opice" value="" size="40"></span>
							<span id="nothis"></span>      
	      				</li>
	     				<li>
							<span class="webname">&nbsp;&nbsp;售&nbsp;&nbsp;&nbsp;价：<input type="text" id="sellprice" name="pice" value="" size="40"></span>
							<span id="nothis"></span>      
	      				</li>      
	    			</ul>        
	    			<ul class="set1">
	      				<li><span><strong class="orange fontsize20">*</strong>上级分类&nbsp;&nbsp;&nbsp;(如果选择上级分类，那么新增的分类则为被选择上级分类的子分类) </span><span id="two_out" style="margin-left: 140px"></span></li>
	      				<li>
	      					<span class="webnamesec sizese" id="one_stage" style="cursor: pointer;">
		       					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	           					<select id="sortId" name="goodsclassid" class="form-control m-b" style="height:30px;" onchange="classChange(this);">
	           						<option value="" selected="selected">请选择</option>	
	           						<!-- 一级分类 -->
	           						<c:forEach items="${requestScope.goodsclasslist }" var="tmp">
	            						<option disabled="" value="" typeid="1">${tmp.name }</option>
	            					<!-- 二级分类 -->
	            					<c:forEach items="${tmp.list }" var="tmp1">
	              						<option disabled="" value="" typeid="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${tmp1.name }</option>			                				
		                			<!-- 三级分类 -->
		                			<c:forEach items="${tmp1.list }" var="tmp2">
		                					<option value="${tmp2.id }" typeid="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${tmp2.name }</option>
		                			</c:forEach>
				                	</c:forEach>				
				                	</c:forEach>		
	           					</select>
		      				</span>
		      				<span id="nothis"></span> 	      
	      				</li>
	    			</ul>     
					<ul class="set1">
	      				<li><strong class="orange fontsize20">*</strong>品牌名称</li>
		  				<li>	        
	  						<span class="webnamesec sizese" id="one_stage" style="cursor: pointer;">	
		  						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  		  
		  						<select name="brandid" id="brandId" onchange="ajaxChangeBrand(this);">                   	
	      							<option value="" selected="selected">请选择</option>
	      							<!-- 品牌名称 -->
				      				<c:forEach items="${requestScope.brandlistforgoodsadd }" var="tmp">
				      					<option value="${tmp.id }">${tmp.name }</option>
				      				</c:forEach>	
	       						</select>
							</span>	
							<span id="nothis"></span> 
		  				</li>		
					</ul>
					<ul class="set1">
		    			<li><strong class="orange fontsize20">*</strong>商品规格（请至少选择一个规格）</li>
		       			<li id="goods_spec">
		            		<span id="na">
		            			<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="blue">规格名</font></strong>
		            		</span>
		            		<span id="va">
		            			<strong><font color="blue">规格值</font></strong>
		            		</span>
		            		<span id="warning"></span>
		        		</li>
		    			<li>
		  					<span class="webnamesec sizese" id="one_stage" style="cursor: pointer;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		    
			    				<span>
			    					<select name="goodsspecid1" id="specnameId1" onchange="ajaxChangeSK(this);" class="form-control m-b">	   
										<option value="" selected="selected">请选择规格一</option>
										<!-- 规格名1 -->
										<c:forEach items="${requestScope.speclistforgoodsadd }" var="tmp">
									        <option value="${tmp.id }">${tmp.name }</option>				
										</c:forEach>		
									</select>
								</span>
								<span id="nv4">
									<select name="specvalid1" id="specvalueId">
										<option value="">请选择规格值一</option>
									</select>
								</span>
							</span>
						</li>
						<%-- <li>
		  					<span class="webnamesec sizese" id="one_stage" style="cursor: pointer;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		    
			    				<span>
			    					<select name="goodsspecid2" id="specnameId2" onchange="ajaxChangeSK1(this);" class="form-control m-b">	   
										<option value="" selected="selected">请选择规格二</option>
									    <!-- 规格名2 -->
									    <c:forEach items="${requestScope.speclistforgoodsadd }" var="tmp">
									        <option value="${tmp.id }">${tmp.name }</option>				
										</c:forEach>
									</select>
								</span>
								<span id="nv2">
									<select name="specvalid2" specvalueid="" id="specvalueId2">
										<option value="" selected="selected">请选择规格值二</option>
									</select>
								</span>
							</span>
						</li> --%>
					</ul>
					<ul class="set1">
	      				<li><strong class="orange fontsize20">*</strong>是否推荐</li>
	      				<li>
					    	<span class="webSwitch">
						   		<input name="recommend" id="display1" type="hidden" value="1">
						        <img src="/img/on.jpg" width="61" height="23" id="displayOn1" onclick="displayRecommend();" style="cursor: pointer"> 
						        <img src="/img/off.jpg" width="61" height="23" id="displayOff1" onclick="displayRecommend();" style="cursor: pointer; display: none;">       	     
					        </span>
					        <span id="nothis">
						        <strong class="q"></strong><strong class="w">推荐商品将会在首页显示</strong><strong class="c"></strong>
					        </span>
		    			</li>
	    			</ul>
					<ul class="set1">
	      				<li><strong class="orange fontsize20">*</strong>是否上架</li>
	      				<li>
					      	<span class="webSwitch">
						   	 	<input name="grounding" id="display2" type="hidden" value="1">
						        <img src="/img/on.jpg" width="61" height="23" id="displayOn2" onclick="displayState();" style="cursor: pointer"> 
						        <img src="/img/off.jpg" width="61" height="23" id="displayOff2" onclick="displayState();" style="cursor: pointer; display: none;">       	     
					        </span>
					        <span id="nothis">
						        <strong class="q"></strong><strong class="w">上架商品将会在首页显示</strong><strong class="c"></strong>
					        </span>
	    				</li>
	    			</ul>
					<ul class="set1">
						<li><strong class="orange fontsize20">*</strong>商品详情</li>
						<li><!-- <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
				    		<textarea id="details" name="details" style="visibility: hidden; display: none;"></textarea><div id="cke_details" class="cke_1 cke cke_reset cke_chrome cke_editor_details cke_ltr cke_browser_webkit" dir="ltr" lang="zh-cn" role="application" aria-labelledby="cke_details_arialbl"><span id="cke_details_arialbl" class="cke_voice_label">所见即所得编辑器, details</span><div class="cke_inner cke_reset" role="presentation"><span id="cke_1_top" class="cke_top cke_reset_all" role="presentation" style="height: auto; user-select: none;"><span id="cke_9" class="cke_voice_label">工具栏</span><span id="cke_1_toolbox" class="cke_toolbox" role="group" aria-labelledby="cke_9" onmousedown="return false;"><span id="cke_14" class="cke_toolbar" aria-labelledby="cke_14_label" role="toolbar"><span id="cke_14_label" class="cke_voice_label">文档</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_15" class="cke_button cke_button__source  cke_button_off" href="javascript:void('源码')" title="源码" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_15_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(2,event);" onfocus="return CKEDITOR.tools.callFunction(3,event);" onclick="CKEDITOR.tools.callFunction(4,this);return false;"><span class="cke_button_icon cke_button__source_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1824px;background-size:auto;">&nbsp;</span><span id="cke_15_label" class="cke_button_label cke_button__source_label" aria-hidden="false">源码</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_16" class="cke_button cke_button__save  cke_button_off" href="javascript:void('保存')" title="保存" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_16_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(5,event);" onfocus="return CKEDITOR.tools.callFunction(6,event);" onclick="CKEDITOR.tools.callFunction(7,this);return false;"><span class="cke_button_icon cke_button__save_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1704px;background-size:auto;">&nbsp;</span><span id="cke_16_label" class="cke_button_label cke_button__save_label" aria-hidden="false">保存</span></a><a id="cke_17" class="cke_button cke_button__newpage  cke_button_off" href="javascript:void('新建')" title="新建" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_17_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(8,event);" onfocus="return CKEDITOR.tools.callFunction(9,event);" onclick="CKEDITOR.tools.callFunction(10,this);return false;"><span class="cke_button_icon cke_button__newpage_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1440px;background-size:auto;">&nbsp;</span><span id="cke_17_label" class="cke_button_label cke_button__newpage_label" aria-hidden="false">新建</span></a><a id="cke_18" class="cke_button cke_button__preview  cke_button_off" href="javascript:void('预览')" title="预览" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_18_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(11,event);" onfocus="return CKEDITOR.tools.callFunction(12,event);" onclick="CKEDITOR.tools.callFunction(13,this);return false;"><span class="cke_button_icon cke_button__preview_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1632px;background-size:auto;">&nbsp;</span><span id="cke_18_label" class="cke_button_label cke_button__preview_label" aria-hidden="false">预览</span></a><a id="cke_19" class="cke_button cke_button__print  cke_button_off" href="javascript:void('打印')" title="打印" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_19_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(14,event);" onfocus="return CKEDITOR.tools.callFunction(15,event);" onclick="CKEDITOR.tools.callFunction(16,this);return false;"><span class="cke_button_icon cke_button__print_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1656px;background-size:auto;">&nbsp;</span><span id="cke_19_label" class="cke_button_label cke_button__print_label" aria-hidden="false">打印</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_20" class="cke_button cke_button__templates  cke_button_off" href="javascript:void('模板')" title="模板" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_20_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(17,event);" onfocus="return CKEDITOR.tools.callFunction(18,event);" onclick="CKEDITOR.tools.callFunction(19,this);return false;"><span class="cke_button_icon cke_button__templates_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -456px;background-size:auto;">&nbsp;</span><span id="cke_20_label" class="cke_button_label cke_button__templates_label" aria-hidden="false">模板</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_21" class="cke_toolbar" aria-labelledby="cke_21_label" role="toolbar"><span id="cke_21_label" class="cke_voice_label">剪贴板/撤销</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_22" class="cke_button cke_button__cut cke_button_disabled " href="javascript:void('剪切')" title="剪切" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_22_label" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(20,event);" onfocus="return CKEDITOR.tools.callFunction(21,event);" onclick="CKEDITOR.tools.callFunction(22,this);return false;"><span class="cke_button_icon cke_button__cut_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -312px;background-size:auto;">&nbsp;</span><span id="cke_22_label" class="cke_button_label cke_button__cut_label" aria-hidden="false">剪切</span></a><a id="cke_23" class="cke_button cke_button__copy cke_button_disabled " href="javascript:void('复制')" title="复制" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_23_label" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(23,event);" onfocus="return CKEDITOR.tools.callFunction(24,event);" onclick="CKEDITOR.tools.callFunction(25,this);return false;"><span class="cke_button_icon cke_button__copy_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -264px;background-size:auto;">&nbsp;</span><span id="cke_23_label" class="cke_button_label cke_button__copy_label" aria-hidden="false">复制</span></a><a id="cke_24" class="cke_button cke_button__paste  cke_button_off" href="javascript:void('粘贴')" title="粘贴" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_24_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(26,event);" onfocus="return CKEDITOR.tools.callFunction(27,event);" onclick="CKEDITOR.tools.callFunction(28,this);return false;"><span class="cke_button_icon cke_button__paste_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -360px;background-size:auto;">&nbsp;</span><span id="cke_24_label" class="cke_button_label cke_button__paste_label" aria-hidden="false">粘贴</span></a><a id="cke_25" class="cke_button cke_button__pastetext  cke_button_off" href="javascript:void('粘贴为无格式文本')" title="粘贴为无格式文本" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_25_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(29,event);" onfocus="return CKEDITOR.tools.callFunction(30,event);" onclick="CKEDITOR.tools.callFunction(31,this);return false;"><span class="cke_button_icon cke_button__pastetext_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1536px;background-size:auto;">&nbsp;</span><span id="cke_25_label" class="cke_button_label cke_button__pastetext_label" aria-hidden="false">粘贴为无格式文本</span></a><a id="cke_26" class="cke_button cke_button__pastefromword  cke_button_off" href="javascript:void('从 MS Word 粘贴')" title="从 MS Word 粘贴" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_26_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(32,event);" onfocus="return CKEDITOR.tools.callFunction(33,event);" onclick="CKEDITOR.tools.callFunction(34,this);return false;"><span class="cke_button_icon cke_button__pastefromword_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1584px;background-size:auto;">&nbsp;</span><span id="cke_26_label" class="cke_button_label cke_button__pastefromword_label" aria-hidden="false">从 MS Word 粘贴</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_27" class="cke_button cke_button__undo cke_button_disabled " href="javascript:void('撤消')" title="撤消" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_27_label" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(35,event);" onfocus="return CKEDITOR.tools.callFunction(36,event);" onclick="CKEDITOR.tools.callFunction(37,this);return false;"><span class="cke_button_icon cke_button__undo_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1992px;background-size:auto;">&nbsp;</span><span id="cke_27_label" class="cke_button_label cke_button__undo_label" aria-hidden="false">撤消</span></a><a id="cke_28" class="cke_button cke_button__redo cke_button_disabled " href="javascript:void('重做')" title="重做" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_28_label" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(38,event);" onfocus="return CKEDITOR.tools.callFunction(39,event);" onclick="CKEDITOR.tools.callFunction(40,this);return false;"><span class="cke_button_icon cke_button__redo_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1944px;background-size:auto;">&nbsp;</span><span id="cke_28_label" class="cke_button_label cke_button__redo_label" aria-hidden="false">重做</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_29" class="cke_toolbar" aria-labelledby="cke_29_label" role="toolbar"><span id="cke_29_label" class="cke_voice_label">编辑</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_30" class="cke_button cke_button__find  cke_button_off" href="javascript:void('查找')" title="查找" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_30_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(41,event);" onfocus="return CKEDITOR.tools.callFunction(42,event);" onclick="CKEDITOR.tools.callFunction(43,this);return false;"><span class="cke_button_icon cke_button__find_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -528px;background-size:auto;">&nbsp;</span><span id="cke_30_label" class="cke_button_label cke_button__find_label" aria-hidden="false">查找</span></a><a id="cke_31" class="cke_button cke_button__replace  cke_button_off" href="javascript:void('替换')" title="替换" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_31_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(44,event);" onfocus="return CKEDITOR.tools.callFunction(45,event);" onclick="CKEDITOR.tools.callFunction(46,this);return false;"><span class="cke_button_icon cke_button__replace_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -552px;background-size:auto;">&nbsp;</span><span id="cke_31_label" class="cke_button_label cke_button__replace_label" aria-hidden="false">替换</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_32" class="cke_button cke_button__selectall  cke_button_off" href="javascript:void('全选')" title="全选" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_32_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(47,event);" onfocus="return CKEDITOR.tools.callFunction(48,event);" onclick="CKEDITOR.tools.callFunction(49,this);return false;"><span class="cke_button_icon cke_button__selectall_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1728px;background-size:auto;">&nbsp;</span><span id="cke_32_label" class="cke_button_label cke_button__selectall_label" aria-hidden="false">全选</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_33" class="cke_button cke_button__scayt cke_button_off " href="javascript:void('拼写检查')" title="拼写检查" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_33_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(50,event);" onfocus="return CKEDITOR.tools.callFunction(51,event);" onclick="CKEDITOR.tools.callFunction(52,this);return false;"><span class="cke_button_icon cke_button__scayt_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1872px;background-size:auto;">&nbsp;</span><span id="cke_33_label" class="cke_button_label cke_button__scayt_label" aria-hidden="false">即时拼写检查</span><span class="cke_button_arrow"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_34" class="cke_toolbar" aria-labelledby="cke_34_label" role="toolbar"><span id="cke_34_label" class="cke_voice_label">表单</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_35" class="cke_button cke_button__form  cke_button_off" href="javascript:void('表单')" title="表单" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_35_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(53,event);" onfocus="return CKEDITOR.tools.callFunction(54,event);" onclick="CKEDITOR.tools.callFunction(55,this);return false;"><span class="cke_button_icon cke_button__form_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -648px;background-size:auto;">&nbsp;</span><span id="cke_35_label" class="cke_button_label cke_button__form_label" aria-hidden="false">表单</span></a><a id="cke_36" class="cke_button cke_button__checkbox  cke_button_off" href="javascript:void('复选框')" title="复选框" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_36_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(56,event);" onfocus="return CKEDITOR.tools.callFunction(57,event);" onclick="CKEDITOR.tools.callFunction(58,this);return false;"><span class="cke_button_icon cke_button__checkbox_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -624px;background-size:auto;">&nbsp;</span><span id="cke_36_label" class="cke_button_label cke_button__checkbox_label" aria-hidden="false">复选框</span></a><a id="cke_37" class="cke_button cke_button__radio  cke_button_off" href="javascript:void('单选按钮')" title="单选按钮" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_37_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(59,event);" onfocus="return CKEDITOR.tools.callFunction(60,event);" onclick="CKEDITOR.tools.callFunction(61,this);return false;"><span class="cke_button_icon cke_button__radio_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -720px;background-size:auto;">&nbsp;</span><span id="cke_37_label" class="cke_button_label cke_button__radio_label" aria-hidden="false">单选按钮</span></a><a id="cke_38" class="cke_button cke_button__textfield  cke_button_off" href="javascript:void('单行文本')" title="单行文本" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_38_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(62,event);" onfocus="return CKEDITOR.tools.callFunction(63,event);" onclick="CKEDITOR.tools.callFunction(64,this);return false;"><span class="cke_button_icon cke_button__textfield_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -864px;background-size:auto;">&nbsp;</span><span id="cke_38_label" class="cke_button_label cke_button__textfield_label" aria-hidden="false">单行文本</span></a><a id="cke_39" class="cke_button cke_button__textarea  cke_button_off" href="javascript:void('多行文本')" title="多行文本" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_39_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(65,event);" onfocus="return CKEDITOR.tools.callFunction(66,event);" onclick="CKEDITOR.tools.callFunction(67,this);return false;"><span class="cke_button_icon cke_button__textarea_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -816px;background-size:auto;">&nbsp;</span><span id="cke_39_label" class="cke_button_label cke_button__textarea_label" aria-hidden="false">多行文本</span></a><a id="cke_40" class="cke_button cke_button__select  cke_button_off" href="javascript:void('列表/菜单')" title="列表/菜单" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_40_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(68,event);" onfocus="return CKEDITOR.tools.callFunction(69,event);" onclick="CKEDITOR.tools.callFunction(70,this);return false;"><span class="cke_button_icon cke_button__select_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -768px;background-size:auto;">&nbsp;</span><span id="cke_40_label" class="cke_button_label cke_button__select_label" aria-hidden="false">列表/菜单</span></a><a id="cke_41" class="cke_button cke_button__button  cke_button_off" href="javascript:void('按钮')" title="按钮" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_41_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(71,event);" onfocus="return CKEDITOR.tools.callFunction(72,event);" onclick="CKEDITOR.tools.callFunction(73,this);return false;"><span class="cke_button_icon cke_button__button_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -600px;background-size:auto;">&nbsp;</span><span id="cke_41_label" class="cke_button_label cke_button__button_label" aria-hidden="false">按钮</span></a><a id="cke_42" class="cke_button cke_button__imagebutton  cke_button_off" href="javascript:void('图像按钮')" title="图像按钮" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_42_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(74,event);" onfocus="return CKEDITOR.tools.callFunction(75,event);" onclick="CKEDITOR.tools.callFunction(76,this);return false;"><span class="cke_button_icon cke_button__imagebutton_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -696px;background-size:auto;">&nbsp;</span><span id="cke_42_label" class="cke_button_label cke_button__imagebutton_label" aria-hidden="false">图像按钮</span></a><a id="cke_43" class="cke_button cke_button__hiddenfield  cke_button_off" href="javascript:void('隐藏域')" title="隐藏域" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_43_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(77,event);" onfocus="return CKEDITOR.tools.callFunction(78,event);" onclick="CKEDITOR.tools.callFunction(79,this);return false;"><span class="cke_button_icon cke_button__hiddenfield_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -672px;background-size:auto;">&nbsp;</span><span id="cke_43_label" class="cke_button_label cke_button__hiddenfield_label" aria-hidden="false">隐藏域</span></a></span><span class="cke_toolbar_end"></span></span><span class="cke_toolbar_break"></span><span id="cke_44" class="cke_toolbar" aria-labelledby="cke_44_label" role="toolbar"><span id="cke_44_label" class="cke_voice_label">基本格式</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_45" class="cke_button cke_button__bold  cke_button_off" href="javascript:void('加粗')" title="加粗" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_45_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(80,event);" onfocus="return CKEDITOR.tools.callFunction(81,event);" onclick="CKEDITOR.tools.callFunction(82,this);return false;"><span class="cke_button_icon cke_button__bold_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -24px;background-size:auto;">&nbsp;</span><span id="cke_45_label" class="cke_button_label cke_button__bold_label" aria-hidden="false">加粗</span></a><a id="cke_46" class="cke_button cke_button__italic  cke_button_off" href="javascript:void('倾斜')" title="倾斜" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_46_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(83,event);" onfocus="return CKEDITOR.tools.callFunction(84,event);" onclick="CKEDITOR.tools.callFunction(85,this);return false;"><span class="cke_button_icon cke_button__italic_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -48px;background-size:auto;">&nbsp;</span><span id="cke_46_label" class="cke_button_label cke_button__italic_label" aria-hidden="false">倾斜</span></a><a id="cke_47" class="cke_button cke_button__underline  cke_button_off" href="javascript:void('下划线')" title="下划线" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_47_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(86,event);" onfocus="return CKEDITOR.tools.callFunction(87,event);" onclick="CKEDITOR.tools.callFunction(88,this);return false;"><span class="cke_button_icon cke_button__underline_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -144px;background-size:auto;">&nbsp;</span><span id="cke_47_label" class="cke_button_label cke_button__underline_label" aria-hidden="false">下划线</span></a><a id="cke_48" class="cke_button cke_button__strike  cke_button_off" href="javascript:void('删除线')" title="删除线" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_48_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(89,event);" onfocus="return CKEDITOR.tools.callFunction(90,event);" onclick="CKEDITOR.tools.callFunction(91,this);return false;"><span class="cke_button_icon cke_button__strike_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -72px;background-size:auto;">&nbsp;</span><span id="cke_48_label" class="cke_button_label cke_button__strike_label" aria-hidden="false">删除线</span></a><a id="cke_49" class="cke_button cke_button__subscript  cke_button_off" href="javascript:void('下标')" title="下标" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_49_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(92,event);" onfocus="return CKEDITOR.tools.callFunction(93,event);" onclick="CKEDITOR.tools.callFunction(94,this);return false;"><span class="cke_button_icon cke_button__subscript_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -96px;background-size:auto;">&nbsp;</span><span id="cke_49_label" class="cke_button_label cke_button__subscript_label" aria-hidden="false">下标</span></a><a id="cke_50" class="cke_button cke_button__superscript  cke_button_off" href="javascript:void('上标')" title="上标" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_50_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(95,event);" onfocus="return CKEDITOR.tools.callFunction(96,event);" onclick="CKEDITOR.tools.callFunction(97,this);return false;"><span class="cke_button_icon cke_button__superscript_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -120px;background-size:auto;">&nbsp;</span><span id="cke_50_label" class="cke_button_label cke_button__superscript_label" aria-hidden="false">上标</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_51" class="cke_button cke_button__removeformat  cke_button_off" href="javascript:void('清除格式')" title="清除格式" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_51_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(98,event);" onfocus="return CKEDITOR.tools.callFunction(99,event);" onclick="CKEDITOR.tools.callFunction(100,this);return false;"><span class="cke_button_icon cke_button__removeformat_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1680px;background-size:auto;">&nbsp;</span><span id="cke_51_label" class="cke_button_label cke_button__removeformat_label" aria-hidden="false">清除格式</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_52" class="cke_toolbar" aria-labelledby="cke_52_label" role="toolbar"><span id="cke_52_label" class="cke_voice_label">段落</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_53" class="cke_button cke_button__numberedlist  cke_button_off" href="javascript:void('编号列表')" title="编号列表" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_53_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(101,event);" onfocus="return CKEDITOR.tools.callFunction(102,event);" onclick="CKEDITOR.tools.callFunction(103,this);return false;"><span class="cke_button_icon cke_button__numberedlist_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1368px;background-size:auto;">&nbsp;</span><span id="cke_53_label" class="cke_button_label cke_button__numberedlist_label" aria-hidden="false">编号列表</span></a><a id="cke_54" class="cke_button cke_button__bulletedlist  cke_button_off" href="javascript:void('项目列表')" title="项目列表" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_54_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(104,event);" onfocus="return CKEDITOR.tools.callFunction(105,event);" onclick="CKEDITOR.tools.callFunction(106,this);return false;"><span class="cke_button_icon cke_button__bulletedlist_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1320px;background-size:auto;">&nbsp;</span><span id="cke_54_label" class="cke_button_label cke_button__bulletedlist_label" aria-hidden="false">项目列表</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_55" class="cke_button cke_button__outdent cke_button_disabled " href="javascript:void('减少缩进量')" title="减少缩进量" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_55_label" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(107,event);" onfocus="return CKEDITOR.tools.callFunction(108,event);" onclick="CKEDITOR.tools.callFunction(109,this);return false;"><span class="cke_button_icon cke_button__outdent_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1032px;background-size:auto;">&nbsp;</span><span id="cke_55_label" class="cke_button_label cke_button__outdent_label" aria-hidden="false">减少缩进量</span></a><a id="cke_56" class="cke_button cke_button__indent  cke_button_off" href="javascript:void('增加缩进量')" title="增加缩进量" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_56_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(110,event);" onfocus="return CKEDITOR.tools.callFunction(111,event);" onclick="CKEDITOR.tools.callFunction(112,this);return false;"><span class="cke_button_icon cke_button__indent_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -984px;background-size:auto;">&nbsp;</span><span id="cke_56_label" class="cke_button_label cke_button__indent_label" aria-hidden="false">增加缩进量</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_57" class="cke_button cke_button__blockquote  cke_button_off" href="javascript:void('块引用')" title="块引用" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_57_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(113,event);" onfocus="return CKEDITOR.tools.callFunction(114,event);" onclick="CKEDITOR.tools.callFunction(115,this);return false;"><span class="cke_button_icon cke_button__blockquote_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -216px;background-size:auto;">&nbsp;</span><span id="cke_57_label" class="cke_button_label cke_button__blockquote_label" aria-hidden="false">块引用</span></a><a id="cke_58" class="cke_button cke_button__creatediv  cke_button_off" href="javascript:void('创建 DIV 容器')" title="创建 DIV 容器" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_58_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(116,event);" onfocus="return CKEDITOR.tools.callFunction(117,event);" onclick="CKEDITOR.tools.callFunction(118,this);return false;"><span class="cke_button_icon cke_button__creatediv_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -480px;background-size:auto;">&nbsp;</span><span id="cke_58_label" class="cke_button_label cke_button__creatediv_label" aria-hidden="false">创建 DIV 容器</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_59" class="cke_button cke_button__justifyleft  cke_button_off" href="javascript:void('左对齐')" title="左对齐" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_59_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(119,event);" onfocus="return CKEDITOR.tools.callFunction(120,event);" onclick="CKEDITOR.tools.callFunction(121,this);return false;"><span class="cke_button_icon cke_button__justifyleft_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1128px;background-size:auto;">&nbsp;</span><span id="cke_59_label" class="cke_button_label cke_button__justifyleft_label" aria-hidden="false">左对齐</span></a><a id="cke_60" class="cke_button cke_button__justifycenter  cke_button_off" href="javascript:void('居中')" title="居中" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_60_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(122,event);" onfocus="return CKEDITOR.tools.callFunction(123,event);" onclick="CKEDITOR.tools.callFunction(124,this);return false;"><span class="cke_button_icon cke_button__justifycenter_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1104px;background-size:auto;">&nbsp;</span><span id="cke_60_label" class="cke_button_label cke_button__justifycenter_label" aria-hidden="false">居中</span></a><a id="cke_61" class="cke_button cke_button__justifyright  cke_button_off" href="javascript:void('右对齐')" title="右对齐" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_61_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(125,event);" onfocus="return CKEDITOR.tools.callFunction(126,event);" onclick="CKEDITOR.tools.callFunction(127,this);return false;"><span class="cke_button_icon cke_button__justifyright_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1152px;background-size:auto;">&nbsp;</span><span id="cke_61_label" class="cke_button_label cke_button__justifyright_label" aria-hidden="false">右对齐</span></a><a id="cke_62" class="cke_button cke_button__justifyblock  cke_button_off" href="javascript:void('两端对齐')" title="两端对齐" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_62_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(128,event);" onfocus="return CKEDITOR.tools.callFunction(129,event);" onclick="CKEDITOR.tools.callFunction(130,this);return false;"><span class="cke_button_icon cke_button__justifyblock_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1080px;background-size:auto;">&nbsp;</span><span id="cke_62_label" class="cke_button_label cke_button__justifyblock_label" aria-hidden="false">两端对齐</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_63" class="cke_button cke_button__bidiltr  cke_button_off" href="javascript:void('文字方向为从左至右')" title="文字方向为从左至右" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_63_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(131,event);" onfocus="return CKEDITOR.tools.callFunction(132,event);" onclick="CKEDITOR.tools.callFunction(133,this);return false;"><span class="cke_button_icon cke_button__bidiltr_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -168px;background-size:auto;">&nbsp;</span><span id="cke_63_label" class="cke_button_label cke_button__bidiltr_label" aria-hidden="false">文字方向为从左至右</span></a><a id="cke_64" class="cke_button cke_button__bidirtl  cke_button_off" href="javascript:void('文字方向为从右至左')" title="文字方向为从右至左" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_64_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(134,event);" onfocus="return CKEDITOR.tools.callFunction(135,event);" onclick="CKEDITOR.tools.callFunction(136,this);return false;"><span class="cke_button_icon cke_button__bidirtl_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -192px;background-size:auto;">&nbsp;</span><span id="cke_64_label" class="cke_button_label cke_button__bidirtl_label" aria-hidden="false">文字方向为从右至左</span></a><a id="cke_65" class="cke_button cke_button__language  cke_button_off" href="javascript:void('设置语言')" title="设置语言" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_65_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(137,event);" onfocus="return CKEDITOR.tools.callFunction(138,event);" onclick="CKEDITOR.tools.callFunction(139,this);return false;"><span class="cke_button_icon cke_button__language_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1176px;background-size:auto;">&nbsp;</span><span id="cke_65_label" class="cke_button_label cke_button__language_label" aria-hidden="false">设置语言</span><span class="cke_button_arrow"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_66" class="cke_toolbar" aria-labelledby="cke_66_label" role="toolbar"><span id="cke_66_label" class="cke_voice_label">链接</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_67" class="cke_button cke_button__link  cke_button_off" href="javascript:void('插入/编辑超链接')" title="插入/编辑超链接" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_67_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(140,event);" onfocus="return CKEDITOR.tools.callFunction(141,event);" onclick="CKEDITOR.tools.callFunction(142,this);return false;"><span class="cke_button_icon cke_button__link_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1248px;background-size:auto;">&nbsp;</span><span id="cke_67_label" class="cke_button_label cke_button__link_label" aria-hidden="false">插入/编辑超链接</span></a><a id="cke_68" class="cke_button cke_button__unlink cke_button_disabled " href="javascript:void('取消超链接')" title="取消超链接" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_68_label" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(143,event);" onfocus="return CKEDITOR.tools.callFunction(144,event);" onclick="CKEDITOR.tools.callFunction(145,this);return false;"><span class="cke_button_icon cke_button__unlink_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1272px;background-size:auto;">&nbsp;</span><span id="cke_68_label" class="cke_button_label cke_button__unlink_label" aria-hidden="false">取消超链接</span></a><a id="cke_69" class="cke_button cke_button__anchor  cke_button_off" href="javascript:void('插入/编辑锚点链接')" title="插入/编辑锚点链接" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_69_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(146,event);" onfocus="return CKEDITOR.tools.callFunction(147,event);" onclick="CKEDITOR.tools.callFunction(148,this);return false;"><span class="cke_button_icon cke_button__anchor_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1224px;background-size:auto;">&nbsp;</span><span id="cke_69_label" class="cke_button_label cke_button__anchor_label" aria-hidden="false">插入/编辑锚点链接</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_70" class="cke_toolbar" aria-labelledby="cke_70_label" role="toolbar"><span id="cke_70_label" class="cke_voice_label">插入</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_71" class="cke_button cke_button__image  cke_button_off" href="javascript:void('图像')" title="图像" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_71_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(149,event);" onfocus="return CKEDITOR.tools.callFunction(150,event);" onclick="CKEDITOR.tools.callFunction(151,this);return false;"><span class="cke_button_icon cke_button__image_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -936px;background-size:auto;">&nbsp;</span><span id="cke_71_label" class="cke_button_label cke_button__image_label" aria-hidden="false">图像</span></a><a id="cke_72" class="cke_button cke_button__flash  cke_button_off" href="javascript:void('Flash')" title="Flash" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_72_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(152,event);" onfocus="return CKEDITOR.tools.callFunction(153,event);" onclick="CKEDITOR.tools.callFunction(154,this);return false;"><span class="cke_button_icon cke_button__flash_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -576px;background-size:auto;">&nbsp;</span><span id="cke_72_label" class="cke_button_label cke_button__flash_label" aria-hidden="false">Flash</span></a><a id="cke_73" class="cke_button cke_button__table  cke_button_off" href="javascript:void('表格')" title="表格" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_73_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(155,event);" onfocus="return CKEDITOR.tools.callFunction(156,event);" onclick="CKEDITOR.tools.callFunction(157,this);return false;"><span class="cke_button_icon cke_button__table_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1896px;background-size:auto;">&nbsp;</span><span id="cke_73_label" class="cke_button_label cke_button__table_label" aria-hidden="false">表格</span></a><a id="cke_74" class="cke_button cke_button__horizontalrule  cke_button_off" href="javascript:void('插入水平线')" title="插入水平线" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_74_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(158,event);" onfocus="return CKEDITOR.tools.callFunction(159,event);" onclick="CKEDITOR.tools.callFunction(160,this);return false;"><span class="cke_button_icon cke_button__horizontalrule_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -888px;background-size:auto;">&nbsp;</span><span id="cke_74_label" class="cke_button_label cke_button__horizontalrule_label" aria-hidden="false">插入水平线</span></a><a id="cke_75" class="cke_button cke_button__smiley  cke_button_off" href="javascript:void('表情符')" title="表情符" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_75_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(161,event);" onfocus="return CKEDITOR.tools.callFunction(162,event);" onclick="CKEDITOR.tools.callFunction(163,this);return false;"><span class="cke_button_icon cke_button__smiley_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1056px;background-size:auto;">&nbsp;</span><span id="cke_75_label" class="cke_button_label cke_button__smiley_label" aria-hidden="false">表情符</span></a><a id="cke_76" class="cke_button cke_button__specialchar  cke_button_off" href="javascript:void('插入特殊符号')" title="插入特殊符号" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_76_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(164,event);" onfocus="return CKEDITOR.tools.callFunction(165,event);" onclick="CKEDITOR.tools.callFunction(166,this);return false;"><span class="cke_button_icon cke_button__specialchar_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1848px;background-size:auto;">&nbsp;</span><span id="cke_76_label" class="cke_button_label cke_button__specialchar_label" aria-hidden="false">插入特殊符号</span></a><a id="cke_77" class="cke_button cke_button__pagebreak  cke_button_off" href="javascript:void('插入打印分页符')" title="插入打印分页符" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_77_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(167,event);" onfocus="return CKEDITOR.tools.callFunction(168,event);" onclick="CKEDITOR.tools.callFunction(169,this);return false;"><span class="cke_button_icon cke_button__pagebreak_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1488px;background-size:auto;">&nbsp;</span><span id="cke_77_label" class="cke_button_label cke_button__pagebreak_label" aria-hidden="false">插入打印分页符</span></a><a id="cke_78" class="cke_button cke_button__iframe  cke_button_off" href="javascript:void('IFrame')" title="IFrame" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_78_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(170,event);" onfocus="return CKEDITOR.tools.callFunction(171,event);" onclick="CKEDITOR.tools.callFunction(172,this);return false;"><span class="cke_button_icon cke_button__iframe_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -912px;background-size:auto;">&nbsp;</span><span id="cke_78_label" class="cke_button_label cke_button__iframe_label" aria-hidden="false">IFrame</span></a></span><span class="cke_toolbar_end"></span></span><span class="cke_toolbar_break"></span><span id="cke_79" class="cke_toolbar" aria-labelledby="cke_79_label" role="toolbar"><span id="cke_79_label" class="cke_voice_label">样式</span><span class="cke_toolbar_start"></span><span id="cke_10" class="cke_combo cke_combo__styles  cke_combo_off" role="presentation"><span id="cke_10_label" class="cke_combo_label">样式</span><a class="cke_combo_button" title="样式" tabindex="-1" href="javascript:void('样式')" hidefocus="true" role="button" aria-labelledby="cke_10_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(174,event,this);" onfocus="return CKEDITOR.tools.callFunction(175,event);" onclick="CKEDITOR.tools.callFunction(173,this);return false;"><span id="cke_10_text" class="cke_combo_text cke_combo_inlinelabel">样式</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span id="cke_11" class="cke_combo cke_combo__format  cke_combo_off" role="presentation"><span id="cke_11_label" class="cke_combo_label">格式</span><a class="cke_combo_button" title="格式" tabindex="-1" href="javascript:void('格式')" hidefocus="true" role="button" aria-labelledby="cke_11_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(177,event,this);" onfocus="return CKEDITOR.tools.callFunction(178,event);" onclick="CKEDITOR.tools.callFunction(176,this);return false;"><span id="cke_11_text" class="cke_combo_text cke_combo_inlinelabel">格式</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span id="cke_12" class="cke_combo cke_combo__font  cke_combo_off" role="presentation"><span id="cke_12_label" class="cke_combo_label">字体</span><a class="cke_combo_button" title="字体" tabindex="-1" href="javascript:void('字体')" hidefocus="true" role="button" aria-labelledby="cke_12_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(180,event,this);" onfocus="return CKEDITOR.tools.callFunction(181,event);" onclick="CKEDITOR.tools.callFunction(179,this);return false;"><span id="cke_12_text" class="cke_combo_text cke_combo_inlinelabel">字体</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span id="cke_13" class="cke_combo cke_combo__fontsize  cke_combo_off" role="presentation"><span id="cke_13_label" class="cke_combo_label">大小</span><a class="cke_combo_button" title="大小" tabindex="-1" href="javascript:void('大小')" hidefocus="true" role="button" aria-labelledby="cke_13_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(183,event,this);" onfocus="return CKEDITOR.tools.callFunction(184,event);" onclick="CKEDITOR.tools.callFunction(182,this);return false;"><span id="cke_13_text" class="cke_combo_text cke_combo_inlinelabel">大小</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_80" class="cke_toolbar" aria-labelledby="cke_80_label" role="toolbar"><span id="cke_80_label" class="cke_voice_label">颜色</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_81" class="cke_button cke_button__textcolor cke_button_off " href="javascript:void('文本颜色')" title="文本颜色" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_81_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(185,event);" onfocus="return CKEDITOR.tools.callFunction(186,event);" onclick="CKEDITOR.tools.callFunction(187,this);return false;"><span class="cke_button_icon cke_button__textcolor_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -408px;background-size:auto;">&nbsp;</span><span id="cke_81_label" class="cke_button_label cke_button__textcolor_label" aria-hidden="false">文本颜色</span><span class="cke_button_arrow"></span></a><a id="cke_82" class="cke_button cke_button__bgcolor cke_button_off " href="javascript:void('背景颜色')" title="背景颜色" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_82_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(188,event);" onfocus="return CKEDITOR.tools.callFunction(189,event);" onclick="CKEDITOR.tools.callFunction(190,this);return false;"><span class="cke_button_icon cke_button__bgcolor_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -384px;background-size:auto;">&nbsp;</span><span id="cke_82_label" class="cke_button_label cke_button__bgcolor_label" aria-hidden="false">背景颜色</span><span class="cke_button_arrow"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_83" class="cke_toolbar" aria-labelledby="cke_83_label" role="toolbar"><span id="cke_83_label" class="cke_voice_label">工具</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_84" class="cke_button cke_button__maximize  cke_button_off" href="javascript:void('全屏')" title="全屏" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_84_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(191,event);" onfocus="return CKEDITOR.tools.callFunction(192,event);" onclick="CKEDITOR.tools.callFunction(193,this);return false;"><span class="cke_button_icon cke_button__maximize_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1392px;background-size:auto;">&nbsp;</span><span id="cke_84_label" class="cke_button_label cke_button__maximize_label" aria-hidden="false">全屏</span></a><a id="cke_85" class="cke_button cke_button__showblocks  cke_button_off" href="javascript:void('显示区块')" title="显示区块" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_85_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(194,event);" onfocus="return CKEDITOR.tools.callFunction(195,event);" onclick="CKEDITOR.tools.callFunction(196,this);return false;"><span class="cke_button_icon cke_button__showblocks_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 -1776px;background-size:auto;">&nbsp;</span><span id="cke_85_label" class="cke_button_label cke_button__showblocks_label" aria-hidden="false">显示区块</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_86" class="cke_toolbar" aria-labelledby="cke_86_label" role="toolbar"><span id="cke_86_label" class="cke_voice_label">about</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_87" class="cke_button cke_button__about  cke_button_off" href="javascript:void('关于 CKEditor')" title="关于 CKEditor" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_87_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(197,event);" onfocus="return CKEDITOR.tools.callFunction(198,event);" onclick="CKEDITOR.tools.callFunction(199,this);return false;"><span class="cke_button_icon cke_button__about_icon" style="background-image:url(http://localhost:8080/ckeditor4.4/plugins/icons.png?t=F0RD);background-position:0 0px;background-size:auto;">&nbsp;</span><span id="cke_87_label" class="cke_button_label cke_button__about_label" aria-hidden="false">关于 CKEditor</span></a></span><span class="cke_toolbar_end"></span></span></span></span><div id="cke_1_contents" class="cke_contents cke_reset" role="presentation" style="height: 200px;"><span id="cke_92" class="cke_voice_label">按 ALT+0 获得帮助</span><iframe src="./saved_resource.html" frameborder="0" class="cke_wysiwyg_frame cke_reset" style="width: 100%; height: 100%;" title="所见即所得编辑器, details" aria-describedby="cke_92" tabindex="0" allowtransparency="true"></iframe></div><span id="cke_1_bottom" class="cke_bottom cke_reset_all" role="presentation" style="user-select: none;"><span id="cke_1_resizer" class="cke_resizer cke_resizer_vertical cke_resizer_ltr" title="拖拽以改变大小" onmousedown="CKEDITOR.tools.callFunction(0, event)">◢</span><span id="cke_1_path_label" class="cke_voice_label">元素路径</span><span id="cke_1_path" class="cke_path" role="group" aria-labelledby="cke_1_path_label"><span class="cke_path_empty">&nbsp;</span></span></span></div></div></span> -->
				    	</li>		
	 				</ul>
	  				<div class="submit">
					<!-- <input type="button" value="保存" id="save" onclick="save()" /> -->
	 				</div>
	   			</div>
				<input name="" type="submit" value="提交">
	  		</form>
		</div>
	</body>
</html>