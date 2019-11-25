<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0047)http://localhost:8080/admin/goods_class_add.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title></title>
		<link href="/css/template.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.validate.min.js"></script>
		<script>
			jQuery(document).ready(function(){
				//设置默认状态以及判断初始显示状态
				var state = jQuery("#display").val();
				if(state == "true"){
					jQuery("#displayOn").show();
					jQuery("#displayOff").hide();
				}else{
					jQuery("#displayOn").hide();
					jQuery("#displayOff").show();
				}
				
				var state1 = jQuery("#recommend").val();
				if(state1 == "true"){
					jQuery("#recommendOn").show();
					jQuery("#recommendOff").hide();
				}else{
					jQuery("#recommendOn").hide();
					jQuery("#recommendOff").show();
				}
 				//改变系统提示的样式
  				jQuery("span .w").mousemove(function(){
					var id=jQuery(this.parentNode).attr("id");
					if(id="nothis"){
	   					jQuery(this.parentNode).attr("id","this")
					}
  				}).mouseout(function(){
     				var id=jQuery(this.parentNode).attr("id");
	 				if(id="this"){
	   					jQuery(this.parentNode).attr("id","nothis")
	 				}
  				});
			  	//下拉框控制
				$("#pid").change(function(){
					var level = $(this).find("option:selected").attr("level");
					$("#classlevel").val(parseInt(level)+1);
					if(level == 1){
						$(".typeopt").show();
					}else{
						$(".typeopt").attr("selected", false);
						$("#typeno").attr("selected", true);
						$(".typeopt").hide();
					}
				});
  				jQuery("input[type='radio']").click(function(){
	 				var val = jQuery(this).attr("value");
						if(val==1){
							jQuery("#icon_sys_ul").hide();
							jQuery("#icon_acc_ul").show();	  
						}else{
							jQuery("#icon_sys_ul").show();
							jQuery("#icon_acc_ul").hide();		  
						}
  				});
				jQuery(".icon_sys a").click(function(){
					jQuery("#icon_sys").val(jQuery(this).attr("icon"));
					jQuery(this).parent().find("a").removeClass("this");
					jQuery(this).addClass("this");
	  			});
   				jQuery("#icon_acc").change(function(){
	 				jQuery("#textfield1").val(jQuery("#icon_acc").val());
   				});
     			jQuery("#logoShow").mouseover(function(){
	    			jQuery("#logoImg").css('display','block');
   				}).mouseout(function(){
					jQuery("#logoImg").css('display','none');
				});
			});
			//设置点击显示开关
			function displayState(){
				var state = jQuery("#display").val();
				if(state=="true"){
					jQuery("#display").val("false");
					jQuery("#displayOff").show();
					jQuery("#displayOn").hide();
				}else{
					jQuery("#display").val("true");
					jQuery("#displayOff").hide();
					jQuery("#displayOn").show();
				}
			}
			//设置点击推荐开关
			function recommendState(){
				var state = jQuery("#recommend").val();
				if(state=="true"){
					jQuery("#recommend").val("false");
					jQuery("#recommendOff").show();
					jQuery("#recommendOn").hide();
				}else{
					jQuery("#recommend").val("true");
					jQuery("#recommendOff").hide();
					jQuery("#recommendOn").show();
				}
			}
		</script>
	</head>
	<body>
		<div class="cont">
  			<h1 class="seth1">商品分类</h1>
 				<div class="settab">
 					<span class="tab-one"></span>
     				<span class="tabs">
					<a href="goodsclassfindall.htm">管理</a> |
					<a href="javascript:void(0);" class="this">修改</a>	   
      	   			</span>
     				<span class="tab-two"></span>
     			</div>
				<form  action="goodsclasseditsubmit.htm" method="post" >
					<input type="hidden" name="id" value="${param.id }" />
 					<div class="setcont">
   					<ul class="set1">
						<li><strong class="orange fontsize20">*</strong>分类名称</li>
						<li>
							<span class="webname">
       							<input name="name" type="text" id="className" value="${param.name }" size="40" />
     							</span>
     						</li>
   					</ul>
   					<!--鼠标未经过样式-->
   					<ul class="set1">
    					<li>上级分类</li>
    					<input type="hidden" name="level" id="classlevel" value="0" />
    					<li>
    						<span class="webnamesec sizese">
      						<select name="parentid" id="pid">
            						<option level="-1" value="0">请选择上级商品分类...</option>
         							<!-- 一级分类 -->
         							<c:forEach items="${requestScope.goodsclasslist }" var="tmp">
         								<option level="${tmp.level }" value="${tmp.id }">${tmp.name }</option>
         							<!-- 二级分类 -->
         							<c:forEach items="${tmp.list }" var="tmp1">
         								<option level="${tmp1.level }" value="${tmp1.id }">&nbsp;&nbsp;&nbsp;&nbsp;${tmp1.name }</option>
         							</c:forEach>
         							</c:forEach>
      						</select>
    						</span>
    						<span id="nothis">
    							<strong class="q"></strong>
    							<strong class="w">如果选择上级分类，那么新增的分类则为被选择上级分类的子分类</strong>
    							<strong class="c"></strong>
    						</span>
    					</li>
   					</ul>
					<ul class="set1">
     					<li>类型</li>
     					<li>
     						<span class="webnamesec sizese">
	       						<select name="typeid" id="goodsTypeId">
		  							<option id="typeno" value="1" 
		  								<c:if test="${param.typeid != null && param.typeid == 1 }">
	  										selected = "selected"
	  									</c:if>
		  							>请选择...</option>
		  							<!-- 所有类型 -->
		  							<c:forEach items="${requestScope.goodsclasstypelist }" var="tmp">
		  								<option class='typeopt' value='${tmp.id }' 
		  									<c:if test="${param.typeid == tmp.id && param.typeid != 1 }">
		  										selected = "selected"
		  									</c:if>
		  									<c:if test="${param.typeid != null && param.type == 1 }">
		  										style = "display:none;"
		  								    </c:if> 
		  								>${tmp.name }</option>
		  							</c:forEach>
								</select>
     						</span>
     						<span id="nothis">
     							<strong class="q"></strong>
     							<strong class="w">如果当前下拉选项中没有适合的类型，可以去<a href="javascript:void(0);" onclick="window.parent.openURL('url','http://localhost:8080/admin/goods_type_list.htm','main_workspace','goods_type_op','about_goods')" style="color:#fff; background-color:#FF6600; padding:2px 4px; border-radius:4px 4px 4px 4px;">类型管理</a>功能中新增新的类型</strong>
     						</span>
     					</li>
					</ul>
					<ul class="set1">
     					<li>显示</li>
   						<input name="display" id="display" type="hidden" value="${param.display }" />
						<img src="/img/on.jpg" width="61" height="23" id="displayOn" onclick="displayState();" style="cursor:pointer;" /> 
						<img src="/img/off.jpg" width="61" height="23" id="displayOff" onclick="displayState();" style="cursor: pointer;" />
   					</ul>
					<ul class="set1">
     					<li>推荐</li>
      					<li>
      						<span class="webSwitch">
     							<input name="recommend" id="recommend" type="hidden" value="${param.recommend }" />
         						<img src="/img/on.jpg" width="61" height="23" id="recommendOn" onclick="recommendState();" style="cursor:pointer;" /> 
         						<img src="/img/off.jpg" width="61" height="23" id="recommendOff" onclick="recommendState();" style="cursor: pointer;" />
         					</span>
         					<span id="nothis">
         						<strong class="q"></strong>
         						<strong class="w">推荐商品分类将会在首页楼层显示</strong>
         						<strong class="c"></strong>
         					</span>
         				</li>
   					</ul>
   					<ul class="set1">
     					<li>排序</li>
     					<li>
     						<span class="webname">
       						<input name="sort" type="text" id="sequence" value="${param.sort }" />
     						</span>
     						<span id="nothis">
     							<strong class="q"></strong>
     							<strong class="w">序号越小，分类显示越靠前</strong>
     							<strong class="c"></strong>
     						</span>
     						</li>
   					</ul>
   					<!-- 热度相关 -->
   					<!-- <ul class="set1">
     						<li>SEO关键字</li>
     						<li>
     							<span class="webname">
       							<textarea name="seo_keywords" cols="40" rows="6" id="seo_keywords"></textarea>
     							</span>
     						</li>
   					</ul>
   					<ul class="set1">
						<li>SEO描述</li>
						<li>
							<span class="webname">
       							<textarea name="seo_description" cols="40" rows="6" id="seo_description"></textarea>
     							</span>
     						</li>
   					</ul> -->
   				</div>
 				<div class="submit">
	 				<input  type="submit" value="提交" />
				</div>
			</form>
		</div>
	</body>
</html>