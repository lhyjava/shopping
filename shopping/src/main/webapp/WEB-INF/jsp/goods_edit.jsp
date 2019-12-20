<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0031)http://localhost:8080/findguige -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>添加分类</title>

<style type="text/css">
#na{width:325px; text-align:center; display:block;}
#va{width:300px; text-align:center; display:block;}
#warning{width:300px; text-align:center; display:block;}
#del{ width:120px; text-align:center;display:block;} 
</style>

<link href="/css/template.css" rel="stylesheet" type="text/css">
<link href="/css/public.css" type="text/css" rel="stylesheet">
<link href="/css/goods.css" type="text/css" rel="stylesheet">
<script src="/js/jquery-1.6.2.js"></script>
<script src="/js/jquery.validate.min.js"></script>
<script src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
		CKEDITOR.replace('editor1');
</script>
<script type="text/javascript">
//ckeditor和ckfinder的配置
    var editor = null;
    window.onload = function() {
        editor = CKEDITOR.replace( 'details', {
            customConfig:'../ckeditor4.4/config.js',        
            on: {
                instanceReady: function( ev ) {
                    this.dataProcessor.writer.setRules( 'p', {
                        indent: false,
                        breakBeforeOpen: false,   //<p>之前不加换行
                        breakAfterOpen: false,    //<p>之后不加换行
                        breakBeforeClose: false,  //</p>之前不加换行
                        breakAfterClose: false    //</p>之后不加换行7
                    });
                }
            }
        });
        CKFinder.setupCKEditor( editor, '../ckfinder2.4/' );
    };

    function save(){
        editor.updateElement(); //非常重要的一句代码
        //前台验证工作
        //提交到后台
    }

//设置默认状态以及判断初始显示状态
jQuery(document).ready(function(){
	var state1 = $("#display1").val();
 	if(state1 == "true"){
 		$("#displayOn1").show();
 		$("#displayOff1").hide();
 	}else{ 
		$("#displayOn1").hide();
		$("#displayOff1").show();
 		
	};
	
	var state2 = $("#display2").val();
 	if(state2 == "true"){
 		$("#displayOn2").show();
 		$("#displayOff2").hide();
 	}else{
		$("#displayOn2").hide();
		$("#displayOff2").show();
 		
	}; 
	
	//判断库存为非负整数
	jQuery.validator.addMethod("verify",function(value,element){
		  var re = /^\d+$/;
		  if(re.test(jQuery("#stock").val())){			
		  	return true;
		  }else {
	      	return false;
		  }		  
	});
	//判断进价为非负浮点数
	jQuery.validator.addMethod("num1",function(value,element){
		  var re = /^\d+(\.\d+)?$/;
		  if(re.test(jQuery("#buyprice").val())){			
		  	return true;
		  }else {
	      	return false;
		  }		  
	});
	//判断原价为非负浮点数
	jQuery.validator.addMethod("num2",function(value,element){
		  var re = /^\d+(\.\d+)?$/;
		  if(re.test(jQuery("#originalprice").val())){			
		  	return true;
		  }else {
	      	return false;
		  }		  
	});
	//判断标价为非负浮点数
	jQuery.validator.addMethod("num3",function(value,element){
		  var re = /^\d+(\.\d+)?$/;
		  if(re.test(jQuery("#sellprice").val())){			
		  	return true;
		  }else {
	      	return false;
		  }		  
	});
	//判断重量为非负浮点数
	jQuery.validator.addMethod("num4",function(value,element){
		  var re = /^\d+(\.\d+)?$/;
		  if(re.test(jQuery("#weight").val())){			
		  	return true;
		  }else {
	      	return false;
		  }		  
	});
	
	
	
	
		
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

//表单验证
  $("#goodseditform").validate({
  	rules:{
  		name:{
  			required:true,
  			remote:{
  				url:"goodsname.htm",
  				type:"post",
  				data:{
  					name:function(){
  						return $("#goodsname").val();
  					}
  				}
  			}
  		},
  		img:{
  			required:true,
  			accept:"gif|jpg|png|jpeg"
  		},
  		number:{
  			required:true,
  			digits:true
  		},
  		stock:{
  			required:true,
  			digits:true,
  			min:1,
  			max:2000
  		},
  		opice:{
  			required:true,
  			number:true,
  			min:1
  		},
  		pice:{
  			required:true,
  			number:true,
  			min:2
  		},
  		goodsclassid:{
  			required:true
  		},
  		brandid:{
  			required:true
  		},
  		goodsspecid1:{
  			required:true
  		},
  		specvalid1:{
  			required:true
  		},
  		recommend:{
  			required:true
  		},
  		grounding:{
  			required:true
  		},
  		details:{
  			required:true
  		}
  	},
  	messages:{
  		username:{
  			required:"商品名必填",
  			remote:"商品名已存在"
  		},
  		img:{
  			required:"商品圖片必填",
  			accept:"商品图片类型只支持gif|jpg|png|jpeg"
  		},
  		number:{
  			required:"商品貨號必填",
  			digits:"商品貨號必須是整數"
  		},
  		stock:{
  			required:"庫存必填",
  			digits:"庫存必須是整數",
  			min:"庫存最小為1",
  			max:"庫存最大為2000"
  		},
  		opice:{
  			required:"商品進價必填",
  			number:"進價必须输入合法的数字（负数，小数）",
  			min:"進價最小為1"
  		},
  		pice:{
  			required:"商品售價必填",
  			number:"售價必须输入合法的数字（负数，小数）",
  			min:"售價最小為2"
  		},
  		goodsclassid:{
  			required:"上級分類必填"
  		},
  		brandid:{
  			required:"品牌名稱必填"
  		},
  		goodsspecid1:{
  			required:"規格值一必填"
  		},
  		goodsspecid2:{
  			required:"規格值二必填"
  		},
  		recommend:{
  			required:"是否推薦必填"
  		},
  		grounding:{
  			required:"是否上架必填"
  		},
  		details:{
  			required:"商品詳情必填"
  		}
  	}
  });
});
//分类选中 品牌改变
function ajaxchangeb(obj) {
	var classid = $(obj).val();
	var typeid = $("#sortId").find("option:selected").attr("typeid");
	var goodstypeid = $("#goodstypeid");
	goodstypeid.val("");
	goodstypeid.val(typeid);
		$.ajax({
			type:"Post",
			url:"typeidfortypename.htm",
			data:{goodsclassid:classid},
			success:function(data){
				//把集合里的东西放到js里
				var obj1 = JSON.parse(data);
				var data = obj1.typeforbrandname;
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

//品牌选中 规格改变
function ajaxchangea(obj) {
	var brandid = $(obj).val();
		$.ajax({
			type:"Post",
			url:"brandidforspecandval.htm",
			data:{brandid:brandid},
			success:function(data){
				//把集合里的东西放到js里
				var obj1 = JSON.parse(data);
				var data = obj1.brandforspecandval;
				var se1 = $("#specnameId1");
				se1.html("");
				for(var i=0; i<data.length; i++){
						var opt = $("<option></option>");
						opt.html(data[i].name);
						opt.val(data[i].id);
						se1.append(opt);
				}
				var se2 = $("#specnameId2");
				se2.html("");
				for(var i=0; i<data.length; i++){
					var opt = $("<option></option>");
					opt.html(data[i].name);
					opt.val(data[i].id);
					se2.append(opt);
			}
			}
		});
}

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


//ajax根据规格 更改规格值下拉列表
function ajaxChangeSK(obj){
	var sk = $(obj).val();
	$.ajax({
		type:"Post",
		url:"/findspecval.htm",
		data:{ specid : sk },
		success:function(data){//[{guigezhiid, gugezhi1},{guigezhiid, gugezhi2}]
			var obj1 = JSON.parse(data);
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
function ajaxChangeSK1(obj){
	var sk = $(obj).val();
	$.ajax({
		type:"Post",
		url:"/findspecval.htm",
		data:{ specid : sk },
		success:function(data){//[{guigezhiid, gugezhi1},{guigezhiid, gugezhi2}]
			var obj1 = JSON.parse(data);
			var data = obj1.specvallist;
			var se = $("#specvalueId2");
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


</script>
<script src="/js/shopping-img.js"></script>
</head>

<body style="">
<div class="cont">
  <h1 class="seth1">商品分类</h1>
  <div class="settab"><span class="tab-one"></span>
      <span class="tabs">
			<a href="goodsfindall.htm">所有商品</a> | 
			<a href="goodsadd.htm" class="this">新增商品</a>&nbsp;&nbsp;&nbsp;
			<input type="button" value="刷新" onclick="JavaScript:window.location.reload()"><br>			
	  </span> 
    
 </div>
 
 <form name="theForm" id="goodseditform" action="goodseditsubmit.htm" method="post">
  <input name="id" type="hidden" id="id" value="${param.id }">
  <div class="setcont">
  
    <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>商品名称</li>
      <li>
      	<span class="webname">
      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		<input type="text" id="goodsname" name="name" placeholder="请输入商品名称" value="${param.name }" size="40">
      	</span>
	    <span id="msg" style="visibility:visible;color:red;"></span>		      
      </li>
    </ul>
     
      <ul class="set1">
	      <li><strong class="orange fontsize20">*</strong>商品图片</li>
	      <li>
		      <span class="webname">
	      			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			      
		      		<input name="img" readonly type="text" id="textfield1" value="${param.img }" onclick="imgadd(this);">
		      </span>
			  <span class="filebtn">
			  		<input name="button" type="button" id="button1" value="">
			  </span>
			  <span style="float:left;" class="file">
			  		<!-- <input type="file" name="file" id="brandLogo" size="40"> -->
  			  </span>
			  <span class="preview"></span>
			  <span id="nothis"><strong class="q"></strong><strong class="w">最佳尺寸93*33，支持格式gif,jpg,jpeg,png</strong><strong class="c"></strong></span>
		  </li>
      </ul>     
     
    <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>商品货号</li>
      <li>
			<span class="webname">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" id="artnumber" name="number" value="${param.number }" size="40"></span>
			<span id="nothis"></span>	
      </li>     
    </ul>   
    
	<ul class="set1">
      <li><strong class="orange fontsize20">*</strong>库&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存</li>
      <li>
			<span class="webname">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" id="stock" name="stock" value="${param.stock }" size="40" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></span>
			<span id="nothis"></span>	      		
      </li>     
    </ul>        
     
    <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>商品价格</li>
      
      <li>
      	  <span class="webname">&nbsp;&nbsp;进&nbsp;&nbsp;&nbsp;价：<input type="text" id="buyprice" name="opice" value="${param.opice }" size="40"></span>
	      <span id="nothis"></span>      
      </li>
      <li>
      	  <span class="webname">&nbsp;&nbsp;售&nbsp;&nbsp;&nbsp;价：<input type="text" id="sellprice" name="pice" value="${param.pice }" size="40"></span>
	      <span id="nothis"></span>      
      </li>      
    </ul>        

	<input name="typeid" id="goodstypeid" type="hidden" value="1">

    <ul class="set1">
      <li><span><strong class="orange fontsize20">*</strong>上级分类&nbsp;&nbsp;&nbsp;(如果选择上级分类，那么新增的分类则为被选择上级分类的子分类) </span><span id="two_out" style="margin-left: 140px"></span></li>
      <li>
      	<span class="webnamesec sizese" id="one_stage" style="cursor: pointer;">
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           	<select id="sortId" name="goodsclassid" class="form-control m-b" onchange="ajaxchangeb(this);" style="height:30px;">
           		<option value="" selected="selected">请选择</option>	
    <c:forEach items="${requestScope.classlistforgoods }" var="tmp">					
            	<option disabled value="" typeid="1">${tmp.name }</option>
        <c:forEach items="${tmp.list }" var="tmp1">
		        	<option disabled value="" typeid="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${tmp1.name }</option>			                				
			<c:forEach items="${tmp1.list }" var="tmp2">               					
			            <option value="${tmp2.id }"
			    <c:if test="${param.goodsclassid == tmp2.id }">
					selected = "selected"
				</c:if>
			            typeid="${tmp2.typeid }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${tmp2.name }</option>
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
	  		<select name="brandid" id="brandId" onchange="ajaxchangea(this);">                   	
      			<option value="" selected="selected">请选择</option>		
      			<c:forEach items="${requestScope.brandlistforgoods }" var="tmp">
      					<option value="${tmp.id }"
      			<c:if test="${param.brandid == tmp.id }">
					selected = "selected"
				</c:if>
      					>${tmp.name }</option>
      			</c:forEach>			
       		</select>
		</span>	
		<span id="nothis"></span> 
	  </li>		
	</ul>
	
		
	<ul class="set1" id="goodsspecandval">
	    <li><strong class="orange fontsize20">*</strong>商品规格（请至少选择一个规格）</li>
	       <li id="goods_spec">
	            <span id="na"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="blue">规格名</font></strong></span>
	            <span id="va"><strong><font color="blue">规格值</font></strong></span>
	            <span id="warning">
				               
	            </span>
	        </li>
	    <li>
	  		<span class="webnamesec sizese" id="one_stage" style="cursor: pointer;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		    
		    <span>
		    <select name="goodsspecid1" id="specnameId1" onclick="ajaxChangeSK(this);" class="form-control m-b">	   
				<option value="" selected="selected">请选择规格一</option>
	<c:forEach items="${requestScope.specpluslistforgoods }" var="tmp">		
			        <option value="${tmp.id }">${tmp.name }</option>				
	</c:forEach>		        
			</select>
			</span>
			<span id="nv4">
			<select name="specvalid1" id="specvalueId" >
				<option value="" selected="selected">请选择规格值一</option>
			</select>
			</span>
			</span>
		</li>
		
		<li>
	  		<span class="webnamesec sizese" id="one_stage" style="cursor: pointer;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		    
		    <span>
		    <select name="goodsspecid2" id="specnameId2" onclick="ajaxChangeSK1(this);" class="form-control m-b">	   
				<option value="" selected="selected">请选择规格二</option>
	<c:forEach items="${requestScope.specpluslistforgoods }" var="tmp">					
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
		</li>
	</ul>
	
	<ul class="set1">
      <li><strong class="orange fontsize20">*</strong>是否推荐</li>
      <li>
      	<span class="webSwitch">
	   	 	<input name="recommend" id="display1" type="hidden" value="${param.recommend }">
	        <img src="/img/on.jpg" width="61" height="23" id="displayOn1" onclick="displayRecommend();" style="cursor: pointer;"> 
	        <img src="/img/off.jpg" width="61" height="23" id="displayOff1" onclick="displayRecommend();" style="cursor: pointer;">       	     
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
	   	 	<input name="grounding" id="display2" type="hidden" value="${param.grounding }">
	        <img src="/img/on.jpg" width="61" height="23" id="displayOn2" onclick="displayState();" style="cursor: pointer"> 
	        <img src="/img/off.jpg" width="61" height="23" id="displayOff2" onclick="displayState();" style="cursor: pointer;">       	     
        </span>
        <span id="nothis">
	        <strong class="q"></strong><strong class="w">上架商品将会在首页显示</strong><strong class="c"></strong>
        </span>
    </li>
    </ul>
    
	<ul class="set1">
		<li><strong class="orange fontsize20">*</strong>商品详情</li>
		<li>
			
    	</li>		
 	</ul>
 	


   </div>
   <div><textarea cols="80" class="ckeditor" id="editor1" name="details" rows="10">${param.details }</textarea></div>
	<div class="submit">
		<input name="" type="submit" value="提交">
	</div>
  </form>

</div>

<div class="cke_screen_reader_only cke_copyformatting_notification"><div aria-live="polite"></div></div></body></html>