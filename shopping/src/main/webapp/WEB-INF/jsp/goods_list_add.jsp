<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0031)http://localhost:8080/findguige -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>添加分类</title>
		<style type="text/css">
			#na{
				width:325px; 
				text-align:center; 
				display:block;
			}
			#va{
				width:300px; 
				text-align:center; 
				display:block;
			}
			#warning{
				width:300px; 
				text-align:center; 
				display:block;
			}
			#del{ 
				width:120px; 
				text-align:center;
				display:block;
			} 
		</style>
		<link href="/css/template.css" rel="stylesheet" type="text/css" />
		<link href="/css/public.css" type="text/css" rel="stylesheet" />
		<link href="/css/goods.css" type="text/css" rel="stylesheet" />
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/shopping_common.js"></script>
		<script src="/js/jquery.validate.min.js"></script>
		<script src="/ckeditor/ckeditor.js"></script>
		<script src="/js/shopping_common.js"></script>
		<!-- 开启富文本编辑器 -->
		<script type="text/javascript">
			CKEDITOR.replace('editor1');
		</script>
		<script type="text/javascript">
			//设置默认状态以及判断初始显示状态
			jQuery(document).ready(function(){
				$("#classselect").change(function(){
					var typeid = $(this).val();
					$.ajax({
						url:'getbrandbytypeid.htm',
						type:'post',
						data:{
							typeid:typeid
						},
						success:function(data){
							var rdata = JSON.parse(data);
							var arr = rdata.brandlist;
							var brandselect = $("#brandid");
							brandselect.html("");
							brandselect.append("<option value='-1'>请选择</option>");
							for(var i=0; i<arr.length; i++)
							{
								var opt = $("<option></option>");
								opt.html(arr[i].name);
								opt.val(arr[i].id);
								brandselect.append(opt);
							}
							
						}
					});
				});
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
			//ajax根据规格 更改规格值下拉列表
			function ajaxChangeSK(obj){
				var sk = $(obj).val();
				$.ajax({
					type:"Post",
					url:"/findspecval.htm",
					data:{ specid : sk },
					success:function(data1){
					
					var obj1 = JSON.parse(data1);
					var data = obj1.specvallist;
					
					var se = $("#specvalueId");
					
					se.html("");
					se.append("<option value='-1'>请选择</option>");
					for(var i=0; i<data.length; i++)
						{
						
							var opt = $("<option></option>");
							opt.html(data[i].value);
							opt.val(data[i].id);
							se.append(opt);
						}
					}
				});
			}
			function ajaxChangeSK1(obj){
				
				var sk = obj.options[obj.selectedIndex].value;
				
				$.ajax({
					type:"Post",
					url:"/findspecval",
					data:{ specid : sk },
					success:function(data){//[{guigezhiid, gugezhi1},{guigezhiid, gugezhi2}]
					var se = $("#specvalueId2");
					
					se.html("");
					for(var i=0; i<data.length; i++)
						{
						
							var opt = $("<option></option>");
							opt.html(data[i].value);
							opt.val(data[i].id);
							se.append(opt);
						}
					}
				});
			}
		</script>
		<script type="text/javascript" src="./config.js"></script>
		<link rel="stylesheet" type="text/css" href="./editor.css">
		<script type="text/javascript" src="./zh-cn.js"></script>
		<script type="text/javascript" src="./styles.js"></script>
		<style id="cke_ui_color" type="text/css"></style>
		<script type="text/javascript" src="./config.js(1)"></script>
		<link rel="stylesheet" type="text/css" href="./editor(1).css">
		<script type="text/javascript" src="./zh-cn.js(1)"></script>
		<script type="text/javascript" src="./styles.js(1)"></script>
		<link rel="stylesheet" type="text/css" href="./scayt.css">
		<link rel="stylesheet" type="text/css" href="./dialog.css">
		<link rel="stylesheet" type="text/css" href="./tableselection.css">
		<link rel="stylesheet" type="text/css" href="./wsc.css">
		<link rel="stylesheet" type="text/css" href="./copyformatting.css"></head>
	<body style="">
		<div class="cont">
  			<h1 class="seth1">商品分类</h1>
  			<div class="settab"><span class="tab-one"></span>
      			<span class="tabs">
					<a href="goodsfindall.htm">所有商品</a> | 
					<a href="javascript:void(0)" class="this">新增商品</a>
	  			</span> 
			</div>
 			<form action="goodsaddsubmit.htm" method="post">
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
							<input onclick="imgselect(this);" readonly name="img" type="text" id="brandLogo" size="30" />
							<span class="preview"></span>
							<span id="nothis">
								<strong class="q"></strong>
								<strong class="w">最佳尺寸93*33，支持格式gif,jpg,jpeg,png</strong>
								<strong class="c"></strong>
							</span>
							<div class="bigimgpre" id="brandImg" style="display:none;">
								<img src="./saved_resource" />
							</div>
						</li>
	      			</ul>     
    				<ul class="set1">
      					<li><strong class="orange fontsize20">*</strong>商品货号</li>
      					<li>
							<span class="webname">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" id="artnumber" name="number" value="" size="40"></span>
							<span id="nothis"></span>	
      					</li>     
    				</ul>   
					<ul class="set1">
      					<li><strong class="orange fontsize20">*</strong>库&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存</li>
      					<li>
							<span class="webname">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" id="stock" name="stock" value="" size="40" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></span>
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
           						<select id="classselect" name="goodsclassid" class="form-control m-b" style="height:30px;">
           							<option value="-1" selected="selected">请选择</option>	
           							<!-- 一级分类 -->
           							<c:forEach items="${requestScope.classlistforgoodsadd }" var="tmp">
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
	  							<select name="brandid" id="brandid">                   	
				      					<option value="" selected="selected">请选择</option>
				      				<!-- 品牌列表 -->
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
				            <span id="na"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="blue">规格名</font></strong></span>
				            <span id="va"><strong><font color="blue">规格值</font></strong></span>
				            <span id="warning"></span>
		        		</li>
	    				<li>
	  						<span class="webnamesec sizese" id="one_stage" style="cursor: pointer;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		    
			    				<span>
			    					<select name="goodsspecid" id="specnameId1" onchange="ajaxChangeSK(this);" class="form-control m-b">	   
										<option value="" selected="selected">请选择规格一</option>
										<!-- 规格列表 -->
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
 					</ul>
   				</div>
			   	<!-- 富文本编辑器 -->
				<div>
					<textarea cols="80" class="ckeditor" id="editor1" name="details" rows="10">
					</textarea>
				</div>
				<input type="submit" value="提交">
  			</form>
		</div>
	</body>
</html>