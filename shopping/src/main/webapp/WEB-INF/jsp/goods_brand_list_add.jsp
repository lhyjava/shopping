<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0047)http://localhost:8080/admin/goods_brand_add.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title></title>
		<link href="/css/template.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.validate.min.js"></script>
		<script>
			jQuery(document).ready(function(){
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
				//设置推荐的默认装态
				var rec = jQuery("#recommend").val();
				if(rec=="true"){
					jQuery("#stateOn").show();
					jQuery("#stateOff").hide();
				}else{
					jQuery("#stateOn").hide();
					jQuery("#stateOff").show();
				}
				//标志图片鼠标经过显示
				jQuery("#brandImgShow").mouseover(function(){
					jQuery("#brandImg").show();
				})
				jQuery("#brandImgShow").mouseout(function(){
					jQuery("#brandImg").hide();
				})
				jQuery("#brandLogo").change(function(){
					jQuery("#textfield1").val(jQuery("#brandLogo").val());
				})
				/* jQuery("#theForm").validate({
				    rules:{
					  name:{
					    required :true,
					     remote:{
						    url: "http://localhost:8080/admin/goods_brand_verify.htm",     //后台处理程序
				            type: "post",               //数据发送方式
				            dataType: "json",           //接受数据格式   
				            data: {                     //要传递的数据
				                  "name": function(){return jQuery("#name").val();},
								  "id":function(){return jQuery("#id").val()}
						     }
							}
					  }  ,
					  brandLogo:{
					   required :true,
					    accept:"gif|jpg|png"
					  }	 },
					messages:{
					  name:{required:"品牌名称不能为空",remote:"该品牌已经存在"}  ,
					  brandLogo:{required :"品牌图片不能为空",accept:"系统不允许的文件类型"}	}
				  }); */
				//编辑
				jQuery("#cid").val('');
			//结束
			});
			//修改推荐状态
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
			//品牌保存
			function saveBrand(method){
				jQuery("#cmd").val(method);
				jQuery("#theForm").submit();
			}
		</script>
	</head>
	<body>
		<form action="goodsbrandaddsubmit.htm" method="post">
			<div class="cont">
			    <h1 class="seth1">品牌管理</h1>
			    <div class="settab"> 
					<span class="tab-one"></span>
					<span class="tabs">
				    	<a href="http://localhost:8080/admin/goods_brand_list.htm">管理</a> | 
						<a class="this" href="http://localhost:8080/admin/goods_brand_add.htm">新增</a> |
				    	<a href="http://localhost:8080/admin/goods_brand_audit.htm">申请列表</a> 
					</span> 
					<span class="tab-two"></span>
				</div>
			    <div class="setcont" id="base">
					<!--鼠标经过样式-->
					<ul class="set1">
						<li><strong class="orange fontsize20">*</strong>品牌名称</li>
						<li><span class="webname"><input name="name" type="text" id="name" value=""></span></li>
					</ul>
					<ul class="set1">
						<li><strong class="orange fontsize20"></strong>首字母</li>
						<li>
							<span class="webname">
								<input name="firstchar" type="text" id="first_word" value="">
							</span>
							<span id="nothis">
								<strong class="q"></strong>
								<strong class="w">输入品牌首字母，在品牌列表页通过首字母查询</strong><strong class="c"></strong>
							</span>
						</li>
					</ul>
					<!--鼠标未经过样式-->
					<ul class="set1">
						<li>类别</li>
						<li>
							<span class="webname">
								<input name="type" type="text" id="cat_name" value="">
							</span>
							<span id="nothis">
								<strong class="q"></strong>
								<strong class="w">输入品牌类型，系统自动归类相同类型的品牌</strong>
								<strong class="c"></strong>
							</span>
						</li>
			 		</ul>
					<ul class="set1">
						<li>品牌图片</li>
					    <li>
						  	<span class="preview">
						  		<input name="img" type="text" id="brandLogo" size="30" />
						  	</span>
						  	<span id="nothis">
						  		<strong class="q"></strong>
						  		<strong class="w">最佳尺寸93*33，支持格式gif,jpg,jpeg,png</strong>
						  		<strong class="c"></strong>
						  	</span>
						  	<div class="bigimgpre" id="brandImg" style="display:none;">
						  		<img src="./saved_resource">
						  	</div>
						</li>
					</ul>
					<ul class="set1">
						<li>是否推荐</li>
						<li>
							<span class="webSwitch">
								<input name="recommand" id="recommend" type="hidden" value="">
								<img src="/img/on.jpg" width="61" height="23" id="stateOn" onclick="recommendState();" style="cursor: pointer; display: none;"> <img src="/img/off.jpg" width="61" height="23" id="stateOff" onclick="recommendState();" style="cursor:pointer">
							</span>
							<span id="nothis">
								<strong class="q"></strong>
								<strong class="w">推荐品牌将在首页轮换显示</strong>
								<strong class="c"></strong>
							</span>
						</li> 
					</ul>
					<ul class="set1">
						<li>排序</li>
						<li>
							<span class="webname">
								<input name="sort" type="text" id="sequence" value="">
							</span>
							<span id="nothis">
								<strong class="q"></strong>
								<strong class="w">序号越小显示越靠前</strong>
								<strong class="c"></strong>
							</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="submit">
				<input  type="submit" value="提交">
			</div>
		</form>
	</body>
</html>