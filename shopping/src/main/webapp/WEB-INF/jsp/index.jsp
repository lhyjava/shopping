<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0037)http://localhost:8080/admin/index.htm -->
<html xmlns="http://www.w3.org/1999/xhtml" style="overflow: hidden;">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>我的商城 - Powered by shopping</title>
		<meta name="keywords" content="shopping1,shopping2" />
		<meta name="description" content="shopping1,shopping2" />
		<meta name="generator" content="shopping 1.3" />
		<meta name="author" content="www.shopping.com" />
		<meta name="copyright" content="shopping Inc. All Rights Reserved" />
		<link href="/css/template.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.shop.base.js"></script>
		<script>
			jQuery(document).ready(function(){
				pagestyle();
				jQuery(".webmap a").click(function(){
					jQuery(".webmap_box").fadeIn('normal');
				});
				jQuery(".close_map").click(function(){
					jQuery(".webmap_box").fadeOut('normal');
				});
				jQuery("a[id^=complex_]").click(function(){
					var suffix=jQuery(this).attr("suffix");
					if(jQuery("#"+suffix+"info").css("display")=="block"){
						jQuery("#"+suffix+"info").hide();
						jQuery("#"+suffix+"img").attr("src","http://localhost:8080/resources/style/system/manage/blue/images/spread.jpg");
					}else{
						jQuery("#"+suffix+"info").show();
						jQuery("#"+suffix+"img").attr("src","http://localhost:8080/resources/style/system/manage/blue/images/contract.jpg");	  
					}
				});
				jQuery(".webskin em a img").click(function(){
					var webcss = jQuery(this).attr("webcss");
					jQuery.post("http://localhost:8080/admin/set_websiteCss.htm",{
						"webcss":webcss
					},function(data){
						window.location.href="http://localhost:8080/admin/index.htm";	
					},"text");
				});
			});	
		</script>
	</head>
	<body scroll="yes">
		<div class="main">
			<div class="top">
				<div class="login">您登录的身份是：admin &nbsp;&nbsp;| <a href="http://localhost:8080/admin/logout.htm" target="_self">安全退出</a>|<a href="http://localhost:8080/admin/admin_pws.htm" target="main_workspace">修改密码</a>| <a href="http://localhost:8080/index.htm" target="_blank">商城首页</a>
				</div>
				<div class="logo"></div>
				<div class="nav">
					<ul>
						<li><a href="javascript:void(0);" class="" id="common_operation_menu" onclick="openURL('show','common_operation')">首页</a></li>
						<li><a href="javascript:void(0);" class="active" id="base_set_menu" onclick="openURL('show','base_set')">设置</a></li>
						<li><a href="javascript:void(0);" class="active" id="about_goods_menu" onclick="openURL('show','about_goods')">商品</a></li>
						<li><a href="javascript:void(0);" class="active" id="about_sparegoods_menu" onclick="openURL('show','about_sparegoods')">闲置</a></li>
						<li><a href="javascript:void(0);" class="active" id="about_store_menu" onclick="openURL('show','about_store')">店铺</a></li>
						<li><a href="javascript:void(0);" class="active" id="about_member_menu" onclick="openURL('show','about_member')">会员</a></li>
						<li><a href="javascript:void(0);" class="active" id="about_trade_menu" onclick="openURL('show','about_trade')">交易</a></li>
						<li><a href="javascript:void(0);" class="active" id="about_website_menu" onclick="openURL('show','about_website')">网站</a></li>
						<li><a href="javascript:void(0);" class="active" id="business_operation_menu" onclick="openURL('show','business_operation')">运营</a></li>
						<li><a href="javascript:void(0);" class="active" id="sys_tool_menu" onclick="openURL('show','sys_tool')">工具</a></li>
					</ul>
				</div>
			</div>
			<div class="index" id="workspace">
				<div class="left" style="width: 10%;">
					<div class="lefttop"> </div>
					<div class="left_ul">
						<ul class="ulleft" id="common_operation" style="display: none;">
							<div class="leftone">常用操作</div>
							<li><a class="" id="welcome_op" href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/welcome.htm','main_workspace','welcome_op')">欢迎页面</a> 
							</li>         
							<li><a href="javascript:void(0);" id="set_site_op_q" onclick="openURL('url','http://localhost:8080/admin/set_site.htm','main_workspace','set_site_op_q')">站点设置</a></li>
							<li><a href="javascript:void(0);" id="user_list_op_q" onclick="openURL('url','http://localhost:8080/admin/user_list.htm','main_workspace','user_list_op_q')">会员管理</a></li>
							<li><a href="javascript:void(0);" id="store_list_op_q" onclick="openURL('url','http://localhost:8080/admin/store_list.htm','main_workspace','store_list_op_q')">店铺管理</a></li>
							<li><a href="javascript:void(0);" id="goods_manage_op_q" onclick="openURL('url','http://localhost:8080/admin/goods_list.htm','main_workspace','goods_manage_op_q')">商品管理</a></li>
							<li><a href="javascript:void(0);" id="order_list_op_q" onclick="openURL('url','http://localhost:8080/admin/order_list.htm','main_workspace','order_list_op_q')">订单管理</a></li>
						</ul>
						<ul class="ulleft" id="base_set" style="display: none;">
							<div class="leftone">基本设置</div>
							<li><a href="javascript:void(0);" id="set_site_op" class="" onclick="openURL('url','http://localhost:8080/admin/set_site.htm','main_workspace','set_site_op')">站点设置</a></li>
							<li><a href="javascript:void(0);" id="set_image_op" onclick="openURL('url','http://localhost:8080/admin/set_image.htm','main_workspace','set_image_op')">上传设置</a></li>
							<li><a href="javascript:void(0);" id="set_seo_op" onclick="openURL('url','http://localhost:8080/admin/set_seo.htm','main_workspace','set_seo_op')">SEO设置</a></li>
							<li><a href="javascript:void(0);" id="set_email_op" onclick="openURL('url','http://localhost:8080/admin/set_email.htm','main_workspace','set_email_op')">Email设置</a></li>
							<li><a href="javascript:void(0);" id="set_second_domain_op" class="" onclick="openURL('url','http://localhost:8080/admin/set_second_domain.htm','main_workspace','set_second_domain_op')">二级域名</a></li>
							<li><a href="javascript:void(0);" id="template_list_op" onclick="openURL('url','http://localhost:8080/admin/template_list.htm','main_workspace','template_list_op')">通知模板</a></li>
							<li><a href="javascript:void(0);" id="admin_list_op" onclick="openURL('url','http://localhost:8080/admin/admin_list.htm','main_workspace','admin_list_op')">管理员管理</a></li>
							<li><a href="javascript:void(0);" id="complex_trans" suffix="trans_"><img id="trans_img" src="./品牌管理_files/contract.jpg" width="13" height="13">地区管理</a> 
								<ul id="trans_info">
									<li><a id="arealist_op" href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/area_list.htm','main_workspace','arealist_op')">常用地区</a></li>
									<li><a href="javascript:void(0);" id="trans_area_op" onclick="openURL('url','http://localhost:8080/admin/trans_area_list.htm','main_workspace','trans_area_op')">运费区域</a></li>
								</ul>
							</li>
							<li><a href="javascript:void(0);" id="complex_payment" suffix="payment_"><img id="payment_img" src="./品牌管理_files/contract.jpg" width="13" height="13" />支付管理</a> 
								<ul id="payment_info">
									<li><a href="javascript:void(0);" id="payment_list_op" onclick="openURL('url','http://localhost:8080/admin/payment_list.htm','main_workspace','payment_list_op')">支付方式</a></li>
									<li><a href="javascript:void(0);" id="fenrun_list_op" onclick="openURL('url','http://localhost:8080/admin/set_fenrun.htm','main_workspace','fenrun_list_op')">分润管理</a></li>
								</ul>
							</li>
							<li><a href="javascript:void(0);" id="complex_kuaidi" suffix="kuaidi_"><img id="kuaidi_img" src="./品牌管理_files/contract.jpg" width="13" height="13" />快递设置</a> 
								<ul id="kuaidi_info">
									<li><a href="javascript:void(0);" id="kaudi_set_op" onclick="openURL('url','http://localhost:8080/admin/set_kuaidi.htm','main_workspace','kaudi_set_op')">快递设置</a></li>
									<li><a href="javascript:void(0);" id="kaudi_company_op" onclick="openURL('url','http://localhost:8080/admin/express_company_list.htm','main_workspace','kaudi_company_op')">快递公司</a></li>
								</ul>
							</li>
						</ul>
						<ul class="ulleft" style="" id="about_goods">
							<!-- 左侧菜单 -->
							<div class="leftone" target="main_workspace" class="">商品相关</div>
							<li><a href="goodsclassfindall.htm" target="main_workspace" class="">分类管理</a> </li>
							<li><a href="goodsbrandfindall.htm" target="main_workspace" class="">品牌管理</a></li>
							<li><a href="goodsfindall.htm" target="main_workspace" class="">商品管理</a></li>
							<li><a href="goodstypefindall.htm" target="main_workspace" class="">类型管理</a></li>
							<li><a href="specfindall.htm" target="main_workspace" class="">规格管理</a></li>
							<!-- <li><a href="javascript:void(0);" id="goods_floor_op" onclick="openURL('url','http://localhost:8080/admin/goods_floor_list.htm','main_workspace','goods_floor_op')" class="">首页楼层</a></li> -->
							<!-- <li><a href="upload" target="main_workspace" class="">文件上传</a></li> -->
							<li><a href="showimgmgr.htm" target="main_workspace" class="">图片管理</a></li>
						</ul>
						<ul class="ulleft" style="display:none;" id="about_sparegoods">
							<div class="leftone">闲置相关</div>          
							<li><a href="javascript:void(0);" class="" id="sharegoodsclass_op" onclick="openURL('url','http://localhost:8080/admin/sparegoods_class_list.htm','main_workspace','sharegoodsclass_op')">闲置分类</a> </li>          
							<li><a href="javascript:void(0);" class="" id="share_goods_op" onclick="openURL('url','http://localhost:8080/admin/sparegoods_list.htm','main_workspace','share_goods_op')">闲置商品</a> </li>
							<li><a href="javascript:void(0);" class="" id="sparegoodsfloor_op" onclick="openURL('url','http://localhost:8080/admin/sparegoodsfloor_list.htm','main_workspace','sparegoodsfloor_op')">闲置楼层</a> </li>
						</ul>
						<ul class="ulleft" style="display:none;" id="about_store">
							<div class="leftone">店铺相关</div>
							<li><a href="javascript:void(0);" class="" id="store_base_op" onclick="openURL('url','http://localhost:8080/admin/store_base.htm','main_workspace','store_base_op')">卖家信用</a> </li>
							<li><a href="javascript:void(0);" id="store_manage_op" onclick="openURL('url','http://localhost:8080/admin/store_list.htm','main_workspace','store_manage_op')">店铺管理</a></li>
							<li><a href="javascript:void(0);" id="store_template_op" onclick="openURL('url','http://localhost:8080/admin/store_template.htm','main_workspace','store_template_op')">店铺模板</a></li>
							<li><a href="javascript:void(0);" id="store_grade_op" onclick="openURL('url','http://localhost:8080/admin/storegrade_list.htm','main_workspace','store_grade_op')">店铺等级</a></li>
							<li><a href="javascript:void(0);" id="store_class_op" onclick="openURL('url','http://localhost:8080/admin/storeclass_list.htm','main_workspace','store_class_op')">店铺分类</a></li>
						</ul>
						<ul class="ulleft" id="about_member">
							<div class="leftone">会员相关</div>
							<li><a href="goodsuserfindall.htm" target="main_workspace" class="">会员管理</a></li>
							<li style="display:none;"><a href="javascript:void(0);" class="" id="user_creditrule_op" onclick="openURL('url','http://localhost:8080/admin/user_creditrule.htm','main_workspace','user_creditrule_op')">会员信用</a> </li>
							<li style="display:none;"><a href="javascript:void(0);" id="user_msg_op" onclick="openURL('url','http://localhost:8080/admin/user_msg.htm','main_workspace','user_msg_op')">会员通知</a></li>
							<li style="display:none;"><a href="javascript:void(0);" id="user_integral_op" onclick="openURL('url','http://localhost:8080/admin/user_integral.htm','main_workspace','user_integral_op')">积分管理</a></li>
							<li style="display:none;"><a href="javascript:void(0);" id="integrallog_list_op" onclick="openURL('url','http://localhost:8080/admin/integrallog_list.htm','main_workspace','integrallog_list_op')">积分明细</a></li>
							<li style="display:none;"><a href="javascript:void(0);" id="predeposit_list_op" onclick="openURL('url','http://localhost:8080/admin/predeposit_list.htm','main_workspace','predeposit_list_op')">预存款管理</a></li>
							<li style="display:none;"><a href="javascript:void(0);" id="predepositlog_list_op" onclick="openURL('url','http://localhost:8080/admin/predepositlog_list.htm','main_workspace','predepositlog_list_op')">预存款明细</a></li>
							<li style="display:none;"><a href="javascript:void(0);" id="img_op" onclick="openURL('url','http://localhost:8080/admin/user_photo_list.htm','main_workspace','img_op')">图片管理</a></li> 
							<li style="display:none;"><a href="javascript:void(0);" id="complex_sns" suffix="sns_"><img id="sns_img" src="./品牌管理_files/contract.jpg" width="13" height="13">SNS管理</a> 
								<ul id="sns_info">
									<li><a id="user_sns_op" href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/sns_user.htm','main_workspace','user_sns_op')">会员动态</a></li>
									<li><a href="javascript:void(0);" id="store_sns_op" onclick="openURL('url','http://localhost:8080/admin/sns_store.htm','main_workspace','store_sns_op')">店铺动态</a></li>
								</ul>
							</li>
						</ul>
						<ul class="ulleft" style="display:none;" id="about_trade">
							<div class="leftone">交易管理</div>
							<li><a href="javascript:void(0);" id="order_manage_op" onclick="openURL('url','http://localhost:8080/admin/order_list.htm','main_workspace','order_manage_op')">订单管理</a> </li>
							<li><a href="javascript:void(0);" id="set_order_confirm_op" onclick="openURL('url','http://localhost:8080/admin/set_order_confirm.htm','main_workspace','set_order_confirm_op')">订单设置</a> </li>
							<li><a href="javascript:void(0);" id="consult_manage_op" onclick="openURL('url','http://localhost:8080/admin/consult_list.htm','main_workspace','consult_manage_op')">咨询管理</a></li>
							<li><a href="javascript:void(0);" id="report_manage_op" onclick="openURL('url','http://localhost:8080/admin/report_list.htm','main_workspace','report_manage_op')">举报管理</a></li>
							<li><a href="javascript:void(0);" id="evaluate_manage_op" onclick="openURL('url','http://localhost:8080/admin/evaluate_list.htm','main_workspace','evaluate_manage_op')">商品评价</a></li>
							<li><a href="javascript:void(0);" id="complaint_manage_op" onclick="openURL('url','http://localhost:8080/admin/complaint_list.htm','main_workspace','complaint_manage_op')">投诉管理</a></li>
						</ul>
						<ul class="ulleft" style="display:none;" id="about_website">
							<div class="leftone">网站相关</div>
							<li><a href="javascript:void(0);" class="" id="articleClass_op" onclick="openURL('url','http://localhost:8080/admin/articleclass_list.htm','main_workspace','articleClass_op');">文章分类</a> </li>
							<li><a href="javascript:void(0);" id="article_op" onclick="openURL('url','http://localhost:8080/admin/article_list.htm','main_workspace','article_op');">文章管理</a></li>
							<li><a href="javascript:void(0);" id="document_op" onclick="openURL('url','http://localhost:8080/admin/document_list.htm','main_workspace','document_op');">系统文章</a></li>
							<li><a href="javascript:void(0);" id="partner_op" onclick="openURL('url','http://localhost:8080/admin/partner_list.htm','main_workspace','partner_op');">合作伙伴</a></li>
							<li><a href="javascript:void(0);" id="nav_op" onclick="openURL('url','http://localhost:8080/admin/navigation_list.htm','main_workspace','nav_op');">页面导航</a></li>
						</ul>
						<ul class="ulleft" style="display:none;" id="business_operation">
							<div class="leftone">运营管理</div>
							<li><a href="javascript:void(0);" class="" id="operation_base_op" onclick="openURL('url','http://localhost:8080/admin/operation_base_set.htm','main_workspace','operation_base_op')">基本设置</a> </li>
							<li><a href="javascript:void(0);" id="gold_record_op" onclick="openURL('url','http://localhost:8080/admin/gold_record.htm','main_workspace','gold_record_op')">金币管理</a></li>
							<li><a href="javascript:void(0);" id="ztc_set" onclick="openURL('url','http://localhost:8080/admin/ztc_set.htm','main_workspace','ztc_set')">竞价直通车</a></li>
							<li><a href="javascript:void(0);" id="coupon_set_op" onclick="openURL('url','http://localhost:8080/admin/coupon_list.htm','main_workspace','coupon_set_op')">优惠券管理</a></li>
							<li><a href="javascript:void(0);" id="advert_set_op" onclick="openURL('url','http://localhost:8080/admin/advert_list.htm','main_workspace','advert_set_op')">广告管理</a></li>
							<li><a href="javascript:void(0);" id="group_op" onclick="openURL('url','http://localhost:8080/admin/group_list.htm','main_workspace','group_op')">团购管理</a></li>
							<li><a href="javascript:void(0);" id="complex_integral" suffix="integral_center_"><img id="integral_center_img" src="./品牌管理_files/contract.jpg" width="13" height="13">积分中心</a>
								<ul id="integral_center_info">
									<li><a href="javascript:void(0);" id="integral_rule_op" onclick="openURL('url','http://localhost:8080/admin/operation_integral_rule.htm','main_workspace','integral_rule_op')">积分规则</a></li>
									<li><a href="javascript:void(0);" id="integral_shop_op" onclick="openURL('url','http://localhost:8080/admin/integral_goods.htm','main_workspace','integral_shop_op')">积分商城</a></li>
								</ul>
							</li>
							<li><a href="javascript:void(0);" id="complex_sale" suffix="sale_promotion_"><img id="sale_promotion_img" src="./品牌管理_files/contract.jpg" width="13" height="13">促销管理</a> 
								<ul id="sale_promotion_info">
									<li><a href="javascript:void(0);" id="activity_set_op" onclick="openURL('url','http://localhost:8080/admin/activity_list.htm','main_workspace','activity_set_op')">活动管理</a></li>
									<li><a href="javascript:void(0);" id="bargain_set_op" onclick="openURL('url','http://localhost:8080/admin/set_bargain.htm','main_workspace','bargain_set_op')">天天特价</a></li>
									<li><a href="javascript:void(0);" id="delivery_set_op" onclick="openURL('url','http://localhost:8080/admin/set_delivery.htm','main_workspace','delivery_set_op')">买就送</a></li>
									<li><a href="javascript:void(0);" id="combin_set_op" onclick="openURL('url','http://localhost:8080/admin/set_combin.htm','main_workspace','combin_set_op')">组合销售</a></li>
								</ul>
							</li>
						</ul>
						<ul class="ulleft" style="display:none;" id="sys_tool">
							<div class="leftone">系统工具</div>
							<li><a href="javascript:void(0);" id="cache_list_op" onclick="openURL('url','http://localhost:8080/admin/cache_list.htm','main_workspace','cache_list_op')">缓存管理</a></li>
							<li><a href="javascript:void(0);" id="database_add_op" onclick="openURL('url','http://localhost:8080/admin/database_add.htm','main_workspace','database_add_op')">数据库管理</a></li>
							<li><a href="javascript:void(0);" id="lucene_op" onclick="openURL('url','http://localhost:8080/admin/lucene.htm','main_workspace','lucene_op')">全文检索</a></li>          
						</ul>
						<!-- <div class="statement" style="font-size:12px; font-family:Arial, Helvetica, sans-serif;">Powered By<a href="#" target="_blank"> <strong><span style="color:#FD7C20;">Shopping</span></strong></a> <sup>V2.0</sup>©2015 shopping Inc.</div> -->
					</div>
				</div>
				<div class="content" style="width: 90%; height: 621px;">
					<div class="navbar"><span class="webmap"><a href="javascript:void(0);">管理地图</a></span>
						<span class="webskin">
							<b>更换皮肤：</b>
							<em>
							<a href="javascript:void(0);" class="this">
								<i><img src="/img/skin_blue.gif" width="15" height="16" webcss="blue"></i>
							</a>
							<a href="javascript:void(0);">
								<i><img src="/img/skin_black.gif" width="15" height="16" webcss="black"></i>
							</a></em>
						</span>
						<div style="line-height:36px;">您的位置：控制台&gt;<span id="top_nav_info">品牌管理</span></div>
					</div>
					<iframe id="main_workspace" name="main_workspace" src="/welcome.html" style="overflow: auto; height: 519.011px; width: 1044px;" frameborder="0" width="100%" height="100%" scrolling="yes" onload="window.parent"></iframe>
				</div>
			</div>
		</div>
		<div class="webmap_box" style="display:none;">
			<h4><a href="javascript:void(0);" class="close_map"></a>管理中心导航</h4>
			<div class="webmap_list"> 
				<span class="weblist_sp">
					<h5>设置</h5>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/set_site.htm','main_workspace','set_site_op','base_set')">站点设置</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/set_image.htm','main_workspace','set_image_op','base_set')">上传设置</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/set_seo.htm','main_workspace','set_seo_op','base_set')">SEO设置</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/set_email.htm','main_workspace','set_email_op','base_set')">Email设置</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/set_second_domain.htm','main_workspace','set_second_domain_op','base_set')">二级域名</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/template_list.htm','main_workspace','template_list_op','base_set')">通知模板</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/admin_list.htm','main_workspace','admin_list_op','base_set')">管理员管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/area_list.htm','main_workspace','arealist_op','base_set')">常用地区</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/trans_area_list.htm','main_workspace','trans_area_op','base_set')">运费区域</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/payment_list.htm','main_workspace','payment_list_op','base_set')">支付方式</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/set_fenrun.htm','main_workspace','fenrun_list_op','base_set')">分润管理</a>
					<a href="javascript:void(0);" id="kaudi_set_op" onclick="openURL('url','http://localhost:8080/admin/set_kuaidi.htm','main_workspace','kaudi_set_op','base_set')">快递设置</a>
					<a href="javascript:void(0);" id="kaudi_company_op" onclick="openURL('url','http://localhost:8080/admin/express_company_list.htm','main_workspace','kaudi_company_op','base_set')">快递公司</a>
				</span> 
				<span class="weblist_sp">
					<h5>商品</h5>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/goods_class_list.htm','main_workspace','goods_class_op','about_goods')">分类管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/goods_brand_list.htm','main_workspace','goods_brand_op','about_goods')">品牌管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/goods_list.htm','main_workspace','goods_manage_op','about_goods')">商品管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/goods_type_list.htm','main_workspace','goods_type_op','about_goods')">类型管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/goods_spec_list.htm','main_workspace','goods_spec_op','about_goods')">规格管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/goods_floor_list.htm','main_workspace','goods_floor_op','about_goods')">首页楼层</a>
				</span> 
				<span class="weblist_sp">
					<h5>闲置</h5>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/sparegoods_class_list.htm','main_workspace','sharegoodsclass_op','about_sparegoods')">闲置分类</a>    <a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/sparegoods_list.htm','main_workspace','share_goods_op','about_sparegoods')">闲置商品</a> 
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/sparegoodsfloor_list.htm','main_workspace','sparegoodsfloor_op','about_sparegoods')">闲置楼层</a>
				</span>
				<span class="weblist_sp">
					<h5>店铺</h5>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/store_base.htm','main_workspace','store_base_op','about_store')">卖家信用</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/store_list.htm','main_workspace','store_manage_op','about_store')">店铺管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/store_template.htm','main_workspace','store_template_op','about_store')">店铺模板</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/storegrade_list.htm','main_workspace','store_grade_op','about_store')">店铺等级</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/storeclass_list.htm','main_workspace','store_class_op','about_store')">店铺分类</a>
				</span> 
				<span class="weblist_sp">
					<h5>会员</h5>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/user_list.htm','main_workspace','member_manage_op','about_member')">会员管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/user_creditrule.htm','main_workspace','user_creditrule_op','about_member')">会员信用</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/user_msg.htm','main_workspace','user_msg_op','about_member')">会员通知</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/user_integral.htm','main_workspace','user_integral_op','about_member')">积分管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/integrallog_list.htm','main_workspace','integrallog_list_op','about_member')">积分明细</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/predeposit_list.htm','main_workspace','predeposit_list_op','about_member')">预存款管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/predepositlog_list.htm','main_workspace','predepositlog_list_op','about_member')">预存款明细</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/user_photo_list.htm','main_workspace','img_op','about_member')">图片管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/sns_user.htm','main_workspace','user_sns_op','about_member')">会员动态</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/sns_store.htm','main_workspace','store_sns_op','about_member')">店铺动态</a>
				</span> 
				<span class="weblist_sp">
					<h5>交易</h5>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/order_list.htm','main_workspace','order_manage_op','about_trade')">订单管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/set_order_confirm.htm','main_workspace','set_order_confirm_op','about_trade')">订单设置</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/consult_list.htm','main_workspace','consult_manage_op','about_trade')">咨询管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/report_list.htm','main_workspace','report_manage_op','about_trade')">举报管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/evaluate_list.htm','main_workspace','evaluate_manage_op','about_trade')">商品评价</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/complaint_list.htm','main_workspace','complaint_manage_op','about_trade')">投诉管理</a>
				</span> 
				<span class="weblist_sp">
					<h5>网站</h5>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/articleclass_list.htm','main_workspace','articleClass_op','about_website');">文章分类</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/article_list.htm','main_workspace','article_op','about_website');">文章管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/document_list.htm','main_workspace','document_op','about_website');">系统文章</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/partner_list.htm','main_workspace','partner_op','about_website');">合作伙伴</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/navigation_list.htm','main_workspace','nav_op','about_website');">页面导航</a>
				</span> 
				<span class="weblist_sp">
					<h5>运营</h5>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/operation_base_set.htm','main_workspace','operation_base_op','business_operation')">基本设置</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/gold_record.htm','main_workspace','gold_record_op','business_operation')">金币管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/ztc_set.htm','main_workspace','ztc_set','business_operation')">竞价直通车</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/coupon_list.htm','main_workspace','coupon_set_op','business_operation')">优惠券管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/advert_list.htm','main_workspace','advert_set_op','business_operation')">广告管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/group_list.htm','main_workspace','group_op','business_operation')">团购管理</a>   
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/operation_integral_rule.htm','main_workspace','integral_rule_op','business_operation')">积分规则</a> 
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/integral_goods.htm','main_workspace','integral_shop_op','business_operation')">积分商城</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/activity_list.htm','main_workspace','activity_set_op','business_operation')">活动管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/set_bargain.htm','main_workspace','bargain_set_op','business_operation')">天天特价</a>   
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/set_delivery.htm','main_workspace','delivery_set_op','business_operation')">买就送</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/set_combin.htm','main_workspace','combin_set_op','business_operation')">组合销售</a>
				</span> 
				<span class="weblist_sp">
					<h5>工具</h5>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/cache_list.htm','main_workspace','cache_list_op','sys_tool');">缓存管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/database_add.htm','main_workspace','database_add_op','sys_tool');">数据库管理</a>
					<a href="javascript:void(0);" onclick="openURL('url','http://localhost:8080/admin/lucene.htm','main_workspace','lucene_op','sys_tool')">全文检索</a>
				</span> 
			</div>
		</div>
	</body>
</html>