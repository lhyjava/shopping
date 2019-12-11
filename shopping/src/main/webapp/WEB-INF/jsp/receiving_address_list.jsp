<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0040)http://localhost:8080/showaddressmgr.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>收货地址-购物网站-Powered by shopping</title>
		<meta name="keywords" content="shopping1,shopping2">
		<meta name="description" content="shopping1,shopping2">
		<meta name="generator" content="shopping 2.0">
		<meta name="author" content="www.shopping.com">
		<meta name="copyright" content="shopping Inc. All Rights Reserved">
		<link href="/css/public.css" type="text/css" rel="stylesheet">
		<link href="/css/user.css" type="text/css" rel="stylesheet">
		<link href="/css/jquery-ui-1.8.22.custom.css" type="text/css" rel="stylesheet">
		<link href="/css/overlay.css" type="text/css" rel="stylesheet">
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery-ui-1.8.21.js"></script>
		<script src="/js/jquery.poshytip.min.js"></script>
		<script src="/js/jquery.shop.common.js"></script>
		<script src="/js/jquery.validate.min.js"></script>
		
		<script>
				
			$(function(){
				//alert(currreceiptyoubian);
				/* add by zhaoyu 新增地址表单验证 begin  */
				$("#addreceiptaddresform").validate({
					rules:{
						receiptname:"required",
						receiptnregionsheng:"required",
						receiptnregionshi:"required",
						receiptnregionqu:"required",
						receiptnstreet:"required",
						receiptyoubian:{
							required:true,
							maxlength:6,
							minlength:6,
							digits:true
						},
						receiptphone:{
							required:true,
							maxlength:8,
							digits:true
						},
						receiptnumber:"required"
					},
					messages:{
						receiptname:"请填写收货人所在省份",
						receiptnregionsheng:"请填写所在省份",
						receiptnregionshi:"请填写所在市",
						receiptnregionqu:"请填写所在区",
						receiptnstreet:"请填写收获人详细地址",
						receiptyoubian:"请填写有政编码",
						receiptyoubian:{
							required:"请填写邮政编码",
							maxlength:"请输入6位邮编",
							minlength:"请输入6位邮编",
							digits:"请输入6位邮编"
						},
						receiptphone:{
							required:"请填写联系电话",
							maxlength:"请填写正确的座机电话",
							digits:"请填写正确的座机电话"
						},
						receiptnumber:"请填写手机号码"
					}
				});
				
				/* add by zhaoyu 新增地址表单验证end  */
			});
			/* add by zhaoyu 单行删除 begin */
			
			function deletecurr(obj,id){
				if(confirm("删除后不可恢复，是否继续?")){
					$.ajax({
						url:"deletecurr.htm",
						type:"post",
						data:{
							id:id
						},
						success:function(data){
							if(data != 0){
								$(obj).parent().parent().parent().remove();
							}else{
								alert("删除失败！");
							}
						}
					})
				}
			}
			
			/* add by zhaoyu 单行删除 end */
			
		</script>

		<style id="poshytip-css-tip-skyblue" type="text/css">div.tip-skyblue{visibility:hidden;position:absolute;top:0;left:0;}div.tip-skyblue table, div.tip-skyblue td{margin:0;font-family:inherit;font-size:inherit;font-weight:inherit;font-style:inherit;font-variant:inherit;}div.tip-skyblue td.tip-bg-image span{display:block;font:1px/1px sans-serif;height:10px;width:10px;overflow:hidden;}div.tip-skyblue td.tip-right{background-position:100% 0;}div.tip-skyblue td.tip-bottom{background-position:100% 100%;}div.tip-skyblue td.tip-left{background-position:0 100%;}div.tip-skyblue div.tip-inner{background-position:-10px -10px;}div.tip-skyblue div.tip-arrow{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;}</style>
	</head>
	<body>
		<div class="top" style="">
  			<div class="top_page">
    			<div class="pageright" id="site-nav">
      				<ul class="quick-menu">
        				<li class="mytaobao menu-item menupx">
          					<div class="menu"> 
          						<a class="menu-hd" href="http://localhost:8080/buyer/index.htm" rel="nofollow">我的订单<b></b></a>
            					<div class="menu-bd">
              						<div class="menu-bd-panel">
                						<div>
							                <!-- <a href="http://localhost:8080/buyer/order.htm" rel="nofollow">已买到的宝贝</a>
							                <a href="http://localhost:8080/buyer/index.htm?type=4"  rel="nofollow">店铺动态</a>
							                <a href="http://localhost:8080/buyer/index.htm?type=2"  rel="nofollow">好友动态</a> -->
						                  	<a href="http://localhost:8080/buyer/order.htm?order_status=order_submit" rel="nofollow">待支付</a>
								          	<a href="http://localhost:8080/buyer/order.htm?order_status=order_shipping" rel="nofollow">待收货</a>
								          	<a href="http://localhost:8080/buyer/order.htm?order_status=order_receive" rel="nofollow">待评价</a>
						                </div>
              						</div>
            					</div>
          					</div>
        				</li>
						<li class="mytaobao menu-item menupx">
          					<div class="menu"> 
          						<a class="menu-hd" href="http://localhost:8080/seller/index.htm" rel="nofollow">商家支持<b></b></a>
            					<div class="menu-bd">
              						<div class="menu-bd-panel">
                						<div> 
							                <a href="http://localhost:8080/seller/index.htm" rel="nofollow">商家中心</a>
							                <a href="http://localhost:8080/seller/order.htm" rel="nofollow">商家订单</a> 
							                <a href="http://localhost:8080/seller/goods.htm" rel="nofollow">商家商品</a>
							            	<a href="http://localhost:8080/seller/store_create_first.htm" rel="nofollow">商家入驻</a>
                                 		</div>
              						</div>
            					</div>
          					</div>
        				</li>
				        <script>
						 	var goods_count=0;
						 	var total_price=0;
						 	function cart_remove(id,store_id){
					           	jQuery.post('http://localhost:8080/remove_goods_cart.htm',{"id":id,"store_id":store_id},function(data){
					           	jQuery("div[class=table] tr[id="+id+"]").remove();
							   	jQuery(".shopping[id="+id+"]").remove();
							   	jQuery(".shopp_ingtop[id="+id+"]").remove();
					           	jQuery("#cart_goods_count_top").html(data.count);
					           	jQuery("#cart_goods_price_top").html(data.total_price);
							   	jQuery("#top_total_price_"+store_id).html(data.total_price);
					           	if(store_id!=""){
					              	jQuery("#total_price_"+store_id).html(data.sc_total_price);
					           	}
							   	if( jQuery("form[id=cart_"+store_id+"]").find("tr[goods_list^=goods_info]").length==0){
							  	 	jQuery("form[id=cart_"+store_id+"]").remove();
							   	}
					           	if(jQuery("tr[goods_list^=goods_info]").length==0){
					              	jQuery(".car_nogoods").show();
					           	}
					         	},"json");
				       		}
					    	jQuery(document).ready(function(){
						   		jQuery("#cart_goods_top_menu").mouseover(function(){
							  		jQuery.ajax({
							  			type:'POST',
							  			url:'http://localhost:8080/cart_menu_detail.htm',
							  			data:'',
										beforeSend:function(){
											jQuery("#cart_goods_top_info").empty().html('<div class="menu-bd-panel"><div style="text-align:center;"><img src="http://localhost:8080/resources/style/common/images/loader.gif" /></div></div>');
											jQuery("#cart_goods_top_info").show();
										},
										success:function(data){
											jQuery("#cart_goods_top_info").empty();
											jQuery("#cart_goods_top_info").html(data);
										}
									});
						   		});
						   		jQuery("#cart_menu").mouseleave(function(){
							  		jQuery("#cart_goods_top_info").hide();
						   		});
							});
					   	</script>
				        <li class="search menu-item menupx">
				          	<div class="menu" id="cart_menu"><span class="menu-hd" id="cart_goods_top_menu"><s></s>购物车<span id="cart_goods_count_top" class="top_car">0</span>种商品<b></b></span>
				            	<div class="menu-bd" id="cart_goods_top_info">
				             		<div class="menu-bd-panel">
				                		<div style="text-align:center;">
				                			<img src="/css/loader.gif">
				                		</div>
				             		</div>
				            	</div>
				          	</div>
				        </li>
        				<li class="menupx"><a href="http://localhost:8080/buyer/message.htm">站内短信(<span style="color:#FF3300;">2</span>)</a></li>
						<li class="mytaobao menu-item menupx">
          					<div class="menu"> 
          						<a class="menu-hd" href="http://localhost:8080/buyer/favorite_goods.htm" rel="nofollow">收藏夹<b></b></a>
            					<div class="menu-bd">
              						<div class="menu-bd-panel">
                						<div> 
							                <a href="http://localhost:8080/buyer/favorite_goods.htm" rel="nofollow">收藏商品</a>
							                <a href="http://localhost:8080/buyer/favorite_store.htm" rel="nofollow">收藏店铺</a> 
							                
                 						</div>
              						</div>
            					</div>
          					</div>
        				</li>
						<li class="menupx" style="background:none;"><a href="http://localhost:8080/articlelist_help.htm">帮助中心</a></li>
					</ul>
    			</div>
    			<div class="pageleft">
    				<span>yy1您好,欢迎来到瞎买网！</span>
    				<a href="http://localhost:8080/shopping_logout.htm" class="lightblue">[退出]</a>  
    			</div>
  			</div>
		</div>
		<div class="main">
  ﻿			<script>
				jQuery(document).ready(function(){
  					jQuery(".users_menu>li>em>a").mouseover(function(){
    					jQuery(".users_menu>li").removeClass();												
						jQuery(this).parent().parent().addClass("hover_use");	
						jQuery("div[class=users_navh]").hide();	
    					jQuery(this).parent().parent().find("div[class=users_navh]").show(); 
  					});
  					jQuery(".users_menu>li").mouseleave(function(){
    					jQuery("div[class=users_navh]").hide();																	 
	 					jQuery(".users_menu>li").removeClass();
  					});
  					jQuery("#search_type").mouseover(function(){
    					var clz=jQuery(this).attr("class");
						if(clz=="sear_type"){
	  						jQuery(this).attr("class","sear_type active");
						}
						jQuery(this).find("ul li").show();	
  					}).mouseleave(function(){
     					jQuery(this).attr("class","sear_type");
	 					jQuery(this).find("ul li").hide();
	  					jQuery(this).find("ul li:first").show();
  					});

  					jQuery(".sear_type").find("ul li").click(function(){
						var type =jQuery(this).attr("type");
						jQuery("#type").val(type);
						var ht =jQuery(this).find("a").html();
						jQuery(this).parent().find("li:first").html(ht);
						jQuery(this).parent().find("li").hide();
						jQuery(this).parent().find("li:first").show();
					});
  
				  	jQuery(".user_ser_btn").click(function(){
						var type =jQuery("#type").val();
						if(type==""){
							jQuery("#type").val("goods");
						}
						jQuery("#SearchForm").submit();													   
					});
				});
			</script>
			<form action="http://localhost:8080/search.htm" method="post" id="SearchForm">
				<input name="type" type="hidden" id="type" value="goods">
				<div class="head">
  					<div class="logo">  
  						<a href="http://localhost:8080/index.htm">
  							<img src="/css/newMessage.gif" border="0">
  						</a>  
  					</div>
  					<div class="usersearch">
    					<ul class="users_menu">
      						<li class="">
      							<em>
      								<a href="http://localhost:8080/buyer/index.htm">买家首页</a>
      							</em>
      						</li>
      						<li class="">
      							<em>
      								<a href="http://localhost:8080/buyer/homepage.htm" target="_blank">个人主页</a>
      							</em>
      						</li>
      						
      						<!--hover_use经过下拉样式class="hover_use"-->
      						
      						<li class="">
      							<em>
      								<a href="http://localhost:8080/buyer/friend.htm">好友<s></s></a>
      							</em>
        						<div class="users_navh" style="display: none;">
          							<div class="users_navh_box">
          								<span>
           									<a href="http://localhost:8080/buyer/friend_add.htm" target="_blank">找人</a>
          								</span>
          								<span>
          									<a href="http://localhost:8080/buyer/homepage/myattention.htm" target="_blank">关注</a>
          								</span>
          								<span>
          									<a href="http://localhost:8080/buyer/homepage/myfans.htm" target="_blank">粉丝</a>
          								</span>
          							</div>
        						</div>
      						</li>
      						<li>
      							<em><a href="javascript:void(0);">交易<s></s></a></em>
        						<div class="users_navh" style="display:none">
          							<div class="users_navh_box">
          								<span>
          									<a href="http://localhost:8080/goods_cart1.htm">我的购物车</a>
          								</span> 
          								<span>
          									<a href="http://localhost:8080/buyer/order.htm">已买到的商品</a>
          								</span> 
          								<span>
          									<a href="http://localhost:8080/buyer/favorite_goods.htm">我的收藏</a>
          								</span> 
          								<span>
          									<a href="http://localhost:8080/buyer/complaint.htm">投诉管理</a>
          								</span>
          							</div>
        						</div>
      						</li>
      						<li>
      							<em><a href="javascript:void(0);">设置<s></s></a></em>
        						<div class="users_navh" style="display:none">
          							<div class="users_navh_box">
	          							<span>
	          								<a href="http://localhost:8080/buyer/account.htm">个人资料</a>
	          							</span> 
	          							<span>
	          								<a href="http://localhost:8080/buyer/address.htm">收货地址</a>
	          							</span> 
	          						</div>
        						</div>
      						</li>
      						<li>
      							<em><a href="javascript:void(0);">消息<s></s></a></em>
        						<div class="users_navh" style="display:none">
          							<div class="users_navh_box"> 
	          							<span>
	          								<a href="http://localhost:8080/buyer/message.htm?type=0">系统消息</a>
	          							</span>
	          							<span>
	          								<a href="http://localhost:8080/buyer/message.htm">站内私信</a>
	          							</span>
          							</div>
       	 						</div>
      						</li>
    					</ul>
    					<div class="user_ser">
    					
      					<!--展开时加active-->
      
      						<div class="sear_type" id="search_type">
        						<ul>
						          	<li><a href="javascript:void(0);">商品</a></li>
						          	<li type="goods" style="display:none"><a href="javascript:void(0);">商品</a></li>
						          	<li type="store" style="display:none"><a href="javascript:void(0);">店铺</a></li>
						        </ul>
        					</div>
        
					      	<div class="user_ser_box">
					        	<input name="keyword" type="text" class="user_ser_txt" placeholder=" 搜索真的很简单！" id="keyword" x-webkit-speech="" lang="zh-CN" onwebkitspeechchange="jQuery('#SearchForm').submit()">
					        	<input name="" type="button" class="user_ser_btn" style="cursor:pointer;">
					      	</div>
    					</div>
  					</div>
				</div>
			</form>

  			<div class="user_center">
    			<link href="/css/overlay(1).css" type="text/css" rel="stylesheet">
    			<div class="chat_box">
  					<div class="chat_box_l" style="display:none">
    					<h1>
    						<span class="lf">与 <b id="dialog_user_name"></b> 对话中</span>
    						<span class="rg">
    							<a href="javascript:void(0);" id="talk_table_close">×</a>
    							<a href="javascript:void(0);" id="table1_hide">-</a>
    						</span>
    					</h1>
    					<div class="chat_box_l_ul"> 
    						<span class="tp">
    							<a href="javascript:void(0);" mark="t" id="user_slide_t"><b>︿</b></a>
    						</span>
    						
      						<!--用户列表-->
      						
      						
      						<span class="bt">
      							<a href="javascript:void(0);" id="user_slide_x" mark="x"><b>﹀</b></a>
      						</span> 
      					</div>
					    <div class="chat_box_sr">
					    
					     	<!--聊天信息-->
					     	
					      	<div class="chat_box_y"></div>
					      	
					      	<!--聊天记录-->
					      	
					      	<div class="chat_box_y" id="chatting_history_loading" style="display:none">
					      		<strong>消息记录加载中...</strong>
					      	</div>
					    </div>
    					<div class="chat_box_face"> 
    						<i>
    							<a href="javascript:void(0);" id="show_emos">
    								<img src="/css/pic_4.jpg" width="14" height="14">
    							</a>
    						</i> 
    						<span id="show_emos1" style="cursor:pointer;">表情</span>
      						<div class="chat_history">
      							<a href="javascript:void(0);" id="Showhistory">消息记录</a>
      						</div>
    					</div>
									    <!--表情-->
									    <!-- <div class="chatting_Container" style="display:none">
									      <div class="chatting_Container_content">
									        <div class="chatting_Container_content_QQ">
									          <ul>
									                                    <li><img src="/css/1.gif" emonum="1" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/2.gif" emonum="2" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/3.gif" emonum="3" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/4.gif" emonum="4" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/5.gif" emonum="5" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/6.gif" emonum="6" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/7.gif" emonum="7" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/8.gif" emonum="8" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/9.gif" emonum="9" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/10.gif" emonum="10" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/11.gif" emonum="11" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/12.gif" emonum="12" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/13.gif" emonum="13" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/14.gif" emonum="14" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/15.gif" emonum="15" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/16.gif" emonum="16" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/17.gif" emonum="17" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/18.gif" emonum="18" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/19.gif" emonum="19" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/20.gif" emonum="20" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/21.gif" emonum="21" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/22.gif" emonum="22" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/23.gif" emonum="23" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/24.gif" emonum="24" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/25.gif" emonum="25" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/26.gif" emonum="26" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/27.gif" emonum="27" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/28.gif" emonum="28" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/29.gif" emonum="29" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/30.gif" emonum="30" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/31.gif" emonum="31" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/32.gif" emonum="32" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/33.gif" emonum="33" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/34.gif" emonum="34" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/35.gif" emonum="35" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/36.gif" emonum="36" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/37.gif" emonum="37" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/38.gif" emonum="38" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/39.gif" emonum="39" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/40.gif" emonum="40" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/41.gif" emonum="41" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/42.gif" emonum="42" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/43.gif" emonum="43" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/44.gif" emonum="44" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/45.gif" emonum="45" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/46.gif" emonum="46" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/47.gif" emonum="47" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/48.gif" emonum="48" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/49.gif" emonum="49" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/50.gif" emonum="50" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/51.gif" emonum="51" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/52.gif" emonum="52" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/53.gif" emonum="53" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/54.gif" emonum="54" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/55.gif" emonum="55" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/56.gif" emonum="56" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/57.gif" emonum="57" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/58.gif" emonum="58" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/59.gif" emonum="59" width="20" height="20" style="cursor:pointer"></li>
									                        <li><img src="/css/60.gif" emonum="60" width="20" height="20" style="cursor:pointer"></li>
									                      </ul>
									        </div>
									      </div>
									      <div class="chatting_Container_top"><img src="/css/top_bt.png" width="7" height="4"></div>
									    </div> -->
									    <!--表情-->
    					<div class="chat_box_tx">
      						<textarea id="chatting_content" name="chatting_content"></textarea>
    					</div>
    					<div class="chat_box_send">
      						<input id="user_id" name="user_id" type="hidden" value="">
      						<input id="ids" name="ids" type="hidden" value="">
      						<span id="chatting_show_error" style=" color:#F00; float:left;"></span> 
      						<span style="color:#999;">按Enter键发送消息</span>
      						<input type="button" value="发送" id="sendMessage" style="cursor:pointer">
    					</div>
    					<script>
    						jQuery(document).keyup(function(e){
        						var key =  e.which;
								if(key==13){
									sendMessage();
								}
    						});
							jQuery("#chatting_content").keydown(function(){
								jQuery("#chatting_show_error").html("");
							});
						</script>
  					</div>
  					<div class="chat_box_r" style="display:none">
    					<h1>
    						<span class="rl">在线好友(<b> 0 </b>)</span> 
    						<span class="rr" id="talbe2_hide" style="cursor:pointer">－</span>
    					</h1>
    					<div class="chat_box_r_tab">
					      	<ul>
					       	 	<li class="this"><a href="javascript:void(0);" mark="online">我的好友</a></li>
					        	<li><a href="javascript:void(0);" mark="last">最近联系人</a></li>
					      	</ul>
    					</div>
    					<div class="chat_box_r_ul">
     						<ul id="last_ul" style="display:none">
                            	<li id="show_home_li_contact_32896">            
                            		<i>
                            			<a href="javascript:void(0);" user_id="32896" id="userDialog_img_contact_32896" user_name="jiajia"> 
                            				<img src="/img/member.jpg" width="30" height="30"> 
                            			</a>
                            		</i> 
                            		<span>
                            			<b><img src="/css/pic_2.jpg" width="9" height="9"></b> 
                            			<a href="javascript:void(0);" user_id="32896" id="userDialog_contact_32896" user_name="jiajia">jiajia</a>
	           						</span>  
	           					</li>
                                <li id="show_home_li_contact_32873">            
                                	<i>
                                		<a href="javascript:void(0);" user_id="32873" id="userDialog_img_contact_32873" user_name="tongzhen"> 
                                			<img src="/css/member.jpg" width="30" height="30"> 
                                		</a>
                                	</i> 
                                	<span>
                                		<b><img src="/css/pic_2.jpg" width="9" height="9"></b> 
                                		<a href="javascript:void(0);" user_id="32873" id="userDialog_contact_32873" user_name="tongzhen">tongzhen</a>
         							</span>  
         						</li>
                               	<li id="show_home_li_contact_32880">                      
                               		<i>
                               			<a href="javascript:void(0);" user_id="32880" id="userDialog_img_contact_32880" user_name="gs123"> 
                               				<img src="/css/2edf0ee1-8b80-4d7e-ac4a-a678960fcb1b.jpg" width="30" height="30"> 
                               			</a>
                               		</i> 
                                	<span>
                                		<b><img src="/css/pic_2.jpg" width="9" height="9"></b> 
                                		<a href="javascript:void(0);" user_id="32880" id="userDialog_contact_32880" user_name="gs123">gs123 </a>
           							</span>  
         						</li>
              				</ul>
    					</div>
  					</div>
				</div>
			<div class="chat_bottom">
  				<div class="chat_bottom_l" style="cursor:pointer; display:none; " id="Contacting"></div>
  				<div class="chat_bottom_r" style="cursor:pointer" id="Online"> 
  					<span id="friends" style="display: inline;"> 在线好友( 0 )</span> 
  					<span id="msg_img" style="display:none"><img src="/css/newMessage.gif"></span>
   				</div>
			</div>
			<table width="1000" border="0" cellspacing="0" cellpadding="0" class="user_table">
      			<tbody>
      				<tr>
         				<script>
        	 				function tankuanghide(){
        	 					$("#buyer_address").hide();
         					}
							jQuery(document).ready(function(){
								jQuery(".sellul>li>a").click(function(){
	  								var child_show=jQuery(this).attr("child_show");
	  								if(child_show=="true"){
	    								jQuery(this).parent().find("img").attr("src","http://localhost:8080/resources/style/system/front/default/images/usercenter/menucontract.jpg");
	    								jQuery(this).parent().find("ul").slideUp('normal');
	    								jQuery(this).attr("child_show","false");
	 	 							}else{
	    								jQuery(this).parent().find("img").attr("src","/img/menuspread.jpg");
	    								jQuery(this).parent().find("ul").slideDown('normal');
	    								jQuery(this).attr("child_show","true");
	  								}
								});
								jQuery(".sellul>ul>li").removeClass("this");
								jQuery("li[op=address]").addClass("this");
							});
						</script>
							<td width="177" id="userbg" valign="top">
								<div class="user_photo">
    								<dl>
        								<dt><img src="/css/member.jpg" width="120" height="120"></dt>
      									<dd>
      										<span>
      											<a href="http://localhost:8080/buyer/account.htm">编辑资料</a>
      										</span>
      									</dd>
    								</dl>
  								</div>
  								<div class="seller">
  								
    							<!--店铺设置-->
    							
	    							<div class="product_manage2">
	      								<ul class="sellul">
	        								<li>
	        									<a href="javascript:void(0);" child_show="true">
	        										<b><img src="/css/menuspread.jpg" width="10" height="10"></b>我的账户
	        									</a>
	          									<ul>
	            									<li op="account">
	            										<a href="http://localhost:8080/buyer/account.htm">个人资料</a>
	            									</li>
	            									<li op="address" class="this">
	            										<a href="http://localhost:8080/buyer/address.htm">收货地址</a>
	            									</li>
	            									<li op="friend">
	            										<a href="http://localhost:8080/buyer/friend.htm">我的好友</a>
	            									</li>
	           	 									<li op="message">
	           	 										<a href="http://localhost:8080/buyer/message.htm">站内短信</a>
	           	 									</li>
	            									<li op="bind">
	            										<a href="http://localhost:8080/buyer/account_bind.htm">账号绑定</a>
	            									</li>
	                        						<li op="predeposit">
	                        							<a href="http://localhost:8080/buyer/predeposit.htm">充值管理</a>
	                        						</li>
	            									<li op="buyer_cash">
	            										<a href="http://localhost:8080/buyer/buyer_cash.htm">提现管理</a>
	            									</li>
	            									<li op="predeposit_log">
	            										<a href="http://localhost:8080/buyer/predeposit_log.htm">收支明细</a>
	            									</li>
	                      						</ul>
	        								</li>
	      								</ul>
	    							</div>
    						<!--店铺设置-->
  								</div>
							</td>
						<script>
 							jQuery(document).ready(function(){							 
								var s = jQuery("#ul_user_list").find("li").length;	
								if(s==0){
									jQuery("#ids").val("")
									jQuery("#user_id").val("");
									jQuery("#chatting_content").val("");
								}							 
						//点击在线好友
							jQuery("#Online").click(function(){
									jQuery(this).hide();
									jQuery("div.chat_box_r").css("display","block");
									jQuery("#msg_img").hide();
									jQuery("#friends").show();
							});
						//点击正在联系好友
							jQuery("#Contacting").click(function(){
								jQuery("div.chat_box_l").show();
								jQuery(this).hide();
							});
						//点击在线好友列表最小化
						jQuery("#talbe2_hide").click(function(){
							jQuery("div.chat_box_r").hide(500);
							jQuery("#Online").show();
						});
						//点击正在联系好友列表最小化
						jQuery("#table1_hide").click(function(){
							var user_name =	jQuery("#dialog_user_name").html();
							jQuery("div.chat_bottom_l").html(user_name+"...");
							jQuery("div.chat_box_l").hide(800);
							jQuery("#Contacting").show();
						});
						//点击好友列表中我的好友和最近联系人切换
						jQuery("div.chat_box_r_tab ul li a").click(function(){
							var mark = jQuery(this).attr("mark");
							jQuery("#"+mark+"_ul").parent().find("ul").hide();
							jQuery("#"+mark+"_ul").show();
							jQuery(this).parent().parent().find("li").removeAttr("class");
							jQuery(this).parent().addClass("this")
						});
						//点击正在联系人关闭按钮
						jQuery("#talk_table_close").click(function(){
							showDialog("close_table","系统提示","即将关闭所有人的聊天窗口，是否继续？",1,"question","",closeTable);																		
						});
						//删除临时对话用户列表
						jQuery("a[id^=remove_user_]").live("click",function(){
							if(jQuery("#ul_user_list li:visible").length==1){
								closeTable();
							}else{
								jQuery(this).parent().slideUp();
								jQuery("#logs_ul_"+user_id).css("display","none");	
							}
						});
	
						//点击用户生成对话框
						jQuery("a[id^=userDialog_]").click(function(){
							jQuery(this).parent().parent().find("em").hide();
							jQuery(".chat_box_y").css("display","block");
							jQuery("#chatting_history_loading").css("display","none");
							jQuery(".chatting_history").remove();
							jQuery(".history_fenye").remove();										   
							jQuery("#Showhistory").parent().removeAttr("style");											
							var user_id = jQuery(this).attr("user_id");
							var old_user_id = jQuery("#user_id").val();
							if(user_id!=old_user_id){							
								window.setInterval(refresh_chat,5000);											
								var src = jQuery(this).parent().parent().find("b").find("img").attr("src");
								jQuery("#user_id").val(user_id);
								var user_name =  jQuery(this).attr("user_name");
								var ids = jQuery("#ids").val();
							 	var str = ids.split(",");
								var tempMark =0;
								for(var i=0;i<=str.length;i++){
									if(user_id==str[i]){
										tempMark++;
									}
								}
								if(tempMark==0){//点击联系人列表，添加新用户会话窗口
									jQuery("#ids").val(jQuery("#ids").val()+","+user_id);
									jQuery("#dialog_user_name").html(user_name);
									jQuery(".chat_box_y ul").css("display","none");	
									jQuery(".chat_box_y ul:last").after("<ul id='logs_ul_"+user_id+"'><li></li></ul>");	
									addUserList(user_id,user_name,src);
								}else{//临时会话列表中已经存在该用户，直接打开窗口，
									jQuery("#dialog_user_name").html(user_name);
									jQuery("#user_list_"+user_id).parent().find("li").removeClass("this");
									jQuery("#user_list_"+user_id).css("display","block").addClass("this");
									jQuery(".chat_box_y ul").css("display","none");
									jQuery("#logs_ul_"+user_id).css("display","block");
								}
							}
							jQuery("div.chat_box_l").show();
							if(jQuery("div.chat_box_l").css("display")=="block"){	
								jQuery("#Contacting").hide();
							}
							refresh_chat();
						});
	//点击userlist列表切换会话用户
						jQuery("a[id^=swith_user_]").live("click",function(){
							jQuery(".chat_box_y").css("display","block");
							jQuery("#chatting_history_loading").css("display","none");
							jQuery(".chatting_history").remove();
							jQuery(".history_fenye").remove();										   
							jQuery("#Showhistory").parent().removeAttr("style");
							jQuery(this).parent().parent().find("li").removeClass("this");
							var user_id = jQuery(this).parent().addClass("this").attr("user_id");
							var old_user_id =jQuery("#user_id").val();	
							if(user_id!=old_user_id){
								jQuery(".chat_box_y ul").css("display","none");
								jQuery("#logs_ul_"+user_id).css("display","block");
								jQuery("#user_id").val(user_id);
								jQuery("#dialog_user_name").html(jQuery(this).attr("user_name"));
								jQuery(".chat_box_y ul").css("display","none");
								jQuery("#logs_ul_"+user_id).css("display","block");
							}
						});
						//发送消息
						jQuery("#sendMessage").click(function(){
							sendMessage();	
						});
						//鼠标移动显示进入主页入口
						jQuery("li[id^=show_home_li_]").mouseover(function(){
							jQuery("a[id^=a_home_]").css("display","none");
							jQuery(this).find("a:last").css("display","block");
						});
						//展开表情窗口
						jQuery("#show_emos,#show_emos1").click(function(){
							var dis = jQuery(".chatting_Container").css("display");
							if(dis=="none"){
								jQuery(".chatting_Container").css("display","block");
							}else{
								jQuery(".chatting_Container").css("display","none");	
							}
						});
						//鼠标点击表情事件
						jQuery(".chatting_Container_content_QQ ul li img").click(function(){
							var emoNum = jQuery(this).attr("emoNum");
					    	var count =	jQuery("#chatting_content").val();
							jQuery("#chatting_content").val(count+"[em_"+emoNum+"]");
						});
						//表情框鼠标离开
						jQuery(".chatting_Container").mouseleave(function(){
							jQuery(".chatting_Container").css("display","none");										  
						});
	
						//临时会话用户列切换表
						var tempLengths = 0; //临时变量,当前移动的长度
						jQuery("a[id^=user_slide_]").click(function(){
							var viewNums = 8; //设置每次显示图片的个数量
							var moveNums = 1; //每次移动的数量
							var moveTimes = 300; //移动速度,毫秒
							var scrollDivs = jQuery("#ul_user_list"); //进行移动动画的容器
							var scrollItemss = jQuery("#ul_user_list li"); //移动容器里的集合
							var moveLengths = scrollItemss.eq(0).height() * moveNums; //计算每次移动的长度
							var countLengths = (scrollItemss.length - viewNums) * scrollItemss.eq(0).height(); //计算总长度,总个数*单个长度
							var mark = jQuery(this).attr("mark");
						//向下按钮
							if(mark=="x"){
								if(tempLengths < countLengths){
									if((countLengths - tempLengths) > moveLengths){
										scrollDivs.animate({top:"-=" + moveLengths + "px"}, moveTimes);
										tempLengths += moveLengths;
									}else{
										scrollDivs.animate({top:"-=" + (countLengths - tempLengths) + "px"}, moveTimes);
										tempLengths += (countLengths - tempLengths);
									}
								}
							}
							//向上按钮
							if(mark=="t"){
								if(tempLengths > 0){
									if(tempLengths > moveLengths){
										scrollDivs.animate({top: "+=" + moveLengths + "px"}, moveTimes);
										tempLengths -= moveLengths;
									}else{
										scrollDivs.animate({top: "+=" + tempLengths + "px"}, moveTimes);
										tempLengths = 0;
									}
								}
							}
						});
						//查看聊天记录
						jQuery("#Showhistory").click(function(){
						var user_id = jQuery("#user_id").val();							  
			var style = jQuery(this).parent().css("background-color");
			if(style=="rgb(204, 204, 204)" || style=="#ccc" || style=="#CCC"){
				jQuery(this).parent().removeAttr("style");		
				jQuery(".chat_box_y").css("display","block");
				jQuery(".chatting_history").hide();
				jQuery(".history_fenye").hide();
				jQuery("#chatting_history_loading").css("display","none");
			}else{
				jQuery(this).parent().attr("style","background-color:#CCC;");						   
				jQuery(".chat_box_y").css("display","none");
				jQuery("#chatting_history_loading").css("display","block");
				jQuery.post("http://localhost:8080/chatting_ShowHistory.htm",{
						"user_id":user_id,
						"pageCount":""
						},function(data){
							var data = jQuery.trim(data);
							if(data!=""){
								jQuery("#chatting_history_loading").css("display","none");
								jQuery(".chat_box_sr").append(data);
								}
							else{
								jQuery("#chatting_history_loading").find("strong").html("消息记录不存在！");
								}	
							},"text");		
			 }
		});

});
 
 //发送信息
 function sendMessage(){
	 	var curren_user =jQuery("#ul_user_list").find("li:visible.this").length;
	 	var user_id = jQuery("#user_id").val();
				var chatting_content = jQuery.trim(jQuery("#chatting_content").val());
				if(user_id=="" || curren_user==0){
					jQuery("#chatting_show_error").html("请选择一个用户！");
				}else{	
				if(chatting_content.length==""){
					jQuery("#chatting_show_error").html("发送内容不能为空，请重新输入！");
				}else{	
	     			jQuery.post("http://localhost:8080/chatting_save.htm",
						{
						"user_id":user_id,
						"content":replace_em(chatting_content)
						},
						function(data){
						  if(data){
							jQuery("#logs_ul_"+user_id+" li:last").after(data);
							jQuery("div.chat_box_y").scrollTop(jQuery("div.chat_box_y").scrollTop()*5);
							jQuery("#chatting_content").val("");
							}else{
								alert("系统繁忙！");
								}
							},"text");
						}
				}	
	 };
 
 //关闭会话窗口
 function closeTable(){
		jQuery("div.chat_box_l").hide(500);
		jQuery("#ul_user_list").html("");
		jQuery("#user_id").val("");
		jQuery("#ids").val("");
	};
//添加临时会话用户列表	
function addUserList(user_id,user_name,src){
	jQuery("#ul_user_list").find("li").removeClass("this");
	jQuery("#ul_user_list").prepend("<li class='this' user_id='"+user_id+"' user_name="+user_name+" id='user_list_"+user_id+"'><b><img src='"+src+"' width='9' height='9' /> </b><a href='javascript:void(0);' id='swith_user_"+user_id+"' user_name='"+user_name+"'>"+user_name+"</a>  <a href='javascript:void(0);' id='remove_user_"+user_id+"'>×</a></li>");	
	};
//刷新聊天记录
function refresh_chat(){
	var user_id = jQuery("#user_id").val();
	jQuery.post("http://localhost:8080/chatting_refresh.htm",
				{
				"user_id":user_id
				},
				function(data){
					if(data){
						jQuery("#logs_ul_"+user_id+" li:last").after(data);
						jQuery("div.chat_box_y").scrollTop(jQuery("div.chat_box_y").scrollTop()*2);
						}
					},"text");
}
//表情过滤
function replace_em(str){
	str = str.replace(/\</g,'&lt;');
	str = str.replace(/\>/g,'&gt;');
	str = str.replace(/\n/g,'<br/>');
	str = str.replace(/\[em_([0-9]*)\]/g,'<img src="http://localhost:8080/resources/editor/plugins/emoticons/images/$1.gif" border="0" />');
	return str;
}

//消息记录Ajax分页
function ajaxPage(url,page,obj){
	var user_id =jQuery("#user_id").val();
 		 jQuery.ajax({type:'POST',url:url,
			 data:{
				 "currentPage":page,
			 	"user_id":user_id	
			 		},
			  success:function(data){
				 if(data){
					 jQuery(".chatting_history").remove();
					 jQuery(".history_fenye").remove();
					 jQuery(".chat_box_sr").append(data);
					 }																										               }																																		    });
}


						</script>
						<style>
						
						/*微信对话框里面*/
							.chat_box_y{ position:relative;}
							.wx_dialog{  padding:5px; overflow:hidden; padding-bottom:10px;}
							.you_dialog{ width:85%; float:left; margin-top:10px; }
							.you_dialog span{ float:left; width:15%}
							.you_dialog b{ display:block; text-align:center;  line-height:15px;  float:left; font-size:11px; font-weight:lighter }
							.you_dialog span img{  border:1px solid #ddd;width:35px; height:35px; border-radius:5px; float:left} 
							.you_dialog_con{ float:left; width:75%; position:relative; left:5px; top:4px;}
							.you_dialog_con i{ background:url(http://localhost:8080/resources/style/system/front/default/images/usercenter/wx_i.jpg) no-repeat; width:10px; height:15px; display:block; float:left; position:absolute;  left:-10px; top:6px; overflow:hidden; _position:relative;}
							.you_dialog_con p{ padding-left:5px; padding-right:5px; border-radius:5px; overflow:hidden; background:#afef52; float:left; box-shadow:1px 1px 2px #ccc;  line-height:20px; color:#000; font-family:"宋体"; padding-bottom:3px; padding-top:3px;position:relative; left:0px;_left:-10px;}
						
							.me_dialog{ width:85%; float:right; margin-top:10px;  }
							.me_dialog span{ float:right; width:15%;}
							.me_dialog b{ display:block; text-align:center; float:right;  line-height:15px;font-size:11px; font-weight:lighter }
							.me_dialog span img{  border:1px solid #ddd;width:35px; height:35px; border-radius:5px; float:right;} 
							.me_dialog_con{ float:right; width:75%; position:relative; right:5px;top:4px;}
							.me_dialog i{ background:url(http://localhost:8080/resources/style/system/front/default/images/usercenter/wx_i_r.jpg) no-repeat; width:10px; height:15px; display:block; float:right; position:absolute; right:-10px; top:6px; z-index:2; overflow:hidden; _position:relative;}
							.me_dialog p{ padding-left:5px; padding-right:5px; border-radius:5px; background:#ededed; overflow:hidden; border:1px solid #dadada;  box-shadow:1px 1px 2px #ccc; line-height:20px; color:#000; font-family:"宋体"; float:right; position:relative; z-index:1;right:-1px; _padding-bottom:3px; padding-top:3px; _right:-11px; }
						</style>
 
<!--聊天框面板-->

<!--聊天框最小化-->
						<script>
							jQuery(document).ready(function(){
							var online_un = jQuery("#online_un").val();
							var contact_un = jQuery("#contact_un").val();
							var allCount = online_un + contact_un ;
							jQuery(".chat_bottom_r").find("span").hide();
							if(allCount>0){
								jQuery(".chat_bottom_r").find("span").last().show();	
								}
								else{
								jQuery(".chat_bottom_r").find("span").first().show();
									}		
							jQuery("#online_un").val("");
							jQuery("#contact_un").val("");		
							});
						
						<!--新增-->
						
						/* add by zhaoyu 1210 end */
						
						function newaddress(obj){
							$("#buyer_address").show();
							$("#xiugai").html("新增地址444");
							$("input[id='puanduan']").val("");
							$("input[id='receiptname']").val("");
							$("input[id='receiptnstreet']").val("");
							$("input[id='receiptyoubian']").val("");
							$("input[id='receiptphone']").val("");
							$("input[id='receiptnumber']").val("");
							$("#panduan").val("");
							
							$("#sheng option:first-child").attr("selected",true);
							$("#sheng").change(function(){
								$("#shi option:first-child").attr("selected",true);
								$("#qu").hide();
								$("#shi").show();
								var sheng = $("#sheng").val();
								var shi = $("option[shengvalue="+sheng+"]");
								$("option[shengvalue]").hide();
								for (var i = 0; i < shi.length; i++) {
									$(shi[i]).show();
								};
							})
							$("#shi").hide();
							$("#qu").hide();
							$("#shi").change(function(){
								$("#qu option:first-child").attr("selected",true);
								$("#qu").show();
								var shi = $("#shi").val();
								var qu = $("option[quvalue="+shi+"]");
								$("option[quvalue]").hide();
								for (var i = 0; i < qu.length; i++) {
									$(qu[i]).show();
								};
							});
						}
						
						function bianji(obj,id){
							$("#buyer_address").show();
							$("#xiugai").html("编辑地址");
							var receiptname = $(obj).parent().parent().prev().prev().prev().prev().prev().html();
							var shengshiqu = $(obj).parent().parent().prev().prev().prev().prev().html();
							var addarr = shengshiqu.split("&nbsp;");
							var province = addarr[0];
							var city = addarr[1];
							var country = addarr[2];
							var provincecode = null;
							var citycode = null;
							var countrycode = null;
							var currreceiptyoubian = $(obj).next().val();
							
							var receiptnstreet = $(obj).parent().parent().prev().prev().prev().html();
							var receiptnumber = $(obj).parent().parent().prev().prev().html();
							var receiptphone = $(obj).parent().parent().prev().html();
							
							var allprovince = $("#sheng").children();
							for (var i = 0; i < allprovince.length; i++) {
								if($(allprovince[i]).html() == province){
									$(allprovince[i]).attr("selected",true);
									provincecode = $(allprovince[i]).val();
								}
							} 
							
							$("#shi").show();
							var allcity = $("#shi").children();
							for (var i = 0; i < allcity.length; i++) {
								if($(allcity[i]).attr("shengvalue") == provincecode){
									$(allcity[i]).show();
									if($(allcity[i]).html() == city){
										$(allcity[i]).attr("selected",true);
										citycode = $(allcity[i]).val();
									}
								}
							}
							$("#qu").show();
							var allqu = $("#qu").children();
							for (var i = 0; i < allqu.length; i++) {
								if($(allqu[i]).attr("quvalue") == citycode){
									$(allqu[i]).show();
									if($(allqu[i]).html() == country){
										$(allqu[i]).attr("selected",true);
									}
								}
								
							}
							$("#panduan").attr("value","1");
							$("#receiptname").val(receiptname);
							$("#receiptnstreet").val(receiptnstreet);
							$("#receiptyoubian").val();
							$("#receiptphone").val(receiptphone);
							$("#receiptnumber").val(receiptnumber);
							$("#receiptyoubian").val(currreceiptyoubian);
							$("#panduan").val("1");
							
							$("#currreciptid").val(id);
							
							$("#sheng").change(function(){
								$("#shi option:first-child").attr("selected",true);
								$("#qu").hide();
								$("#shi").show();
								var sheng = $("#sheng").val();
								var shi = $("option[shengvalue="+sheng+"]");
								$("option[shengvalue]").hide();
								for (var i = 0; i < shi.length; i++) {
									$(shi[i]).show();
								};
							});
							$("#shi").change(function(){
								$("#qu option:first-child").attr("selected",true);
								$("#qu").show();
								var shi = $("#shi").val();
								var qu = $("option[quvalue="+shi+"]");
								$("option[quvalue]").hide();
								for (var i = 0; i < qu.length; i++) {
									$(qu[i]).show();
								};
							});
							
							/* add by zhaoyu 1210 end */
							
						}
						</script>

							<input id="online_un" name="online_un" type="hidden" value="">
							<input id="contact_un" name="contact_un" type="hidden" value="">
	
	       	 				<td id="centerbg" valign="top">
	        					<div class="buyer_position">
	        						<div class="buyer_p_box">
	        							<a href="http://localhost:8080/RessController_showorder">我的账户</a> &gt; 
	        							<span>收货地址</span>
	        						</div>
	        					</div>
	        					<div class="productmain">
	            					<div class="pdctitle blue2">地址列表</div>
	            					<div class="alldel">
	              						<div class="right">
	               							<a href="javascript:void(0);" dialog_title="新增地址22" dialog_width="500" dialog_height="100" dialog_id="buyer_address" class="button_common" onclick="newaddress(this)">新增地址33</a>
	              						</div>
	            					</div>
	            					<div class="operation">
	              						<table width="942" border="0" cellspacing="0" cellpadding="0" id="opertable">
	                						<tbody>
	                							<tr id="opertitle">
	                  								<td width="115">收货人姓名</td>
	                  								<td width="162">所在地区</td>
	                  								<td width="111">详细地址</td>
	                  								<td width="111">联系电话</td>
	                  								<td width="88">手机号码</td>
	                  								<td width="211" align="left">操作</td>
	                							</tr>
	                
								            	<!-- 循环开始 --> 
								             	<c:forEach items="${requestScope.curruseradds }" var="tmp">
									                <tr class="opertr" id="1"> 
														<td width="115">${tmp.receiptname }</td>
									 					<td width="162" area_info_id="32889">${tmp.receiptnregionsheng }&nbsp;${tmp.receiptnregionshi}&nbsp;${tmp.receiptnregionqu }</td>
														<td width="111">${tmp.receiptnstreet } </td>
														<td width="111">${tmp.receiptphone }</td>
														<td width="88">${tmp.receiptnumber }</td>
														<td align="left">
										                  	<span class="edit"> 
										                  		<a href="javascript:void(0);" onclick="bianji(this,${tmp.id})">编辑</a>
										                  		<input style="display:none;" value="${tmp.receiptyoubian }"></input>
										                  	</span>
										                  	<span class="del">
										                  		<a href="javascript:void(0);" onclick="deletecurr(this,${tmp.id});">删除</a>
										                  	</span>
									                  </td>
									                </tr>
									            </c:forEach>
								                <!-- 循环结束 -->
	           								</tbody>
	          							</table>
	            					</div>
	            					<div class="alldel">
	              						<div class="userfenye">
	              							<a href="http://localhost:8080/buyer/address.htm?currentPage=1">首页</a> 第　
	              							<a class="this" href="http://localhost:8080/buyer/address.htm?currentPage=1">1</a> 页　
	              							<a href="http://localhost:8080/buyer/address.htm?currentPage=1">末页</a> 
	              						</div>
	            					</div>
	          					</div>				
	          				</td>
	      				</tr>
	    			</tbody>
	    		</table>
	  		</div>
  ﻿
			<script>
				jQuery(document).ready(function(){
							//滚动条滚动事件
					jQuery(window).scroll(function(){
					var top = jQuery(document).scrollTop();
					if(top==0){
						jQuery(".back_box").hide();
						}else{
						jQuery(".back_box").show();	
							}
					});						
				});
				$(function(){
					$("#buyer_address").hide();
				});
			
			</script>
			<div class="footer">
				<div class="footerArea">
	  				<ul>
	    				<li>
	    					<a href="http://localhost:8080/index.htm" target="_blank">首页</a>|                 
	    					<a href="http://localhost:8080/article_join.htm" target="_blank">招聘英才</a>|                 
	    					<a href="http://localhost:8080/article_adver.htm" target="_blank">广告合作</a>|                 
	    					<a href="http://localhost:8080/article_contact.htm" target="_blank">联系我们</a>|                 
	    					<a href="http://localhost:8080/articlelist_163842.htm" target="_blank">关于shopping</a>        
	    				</li>
	    				<li class="hui2">Copyright 2011-2015 shopping Inc. All rights reserved</li>
	    				<li class="hui2">Powered by shopping V2.0</li>
	    				<li></li>
  					</ul>
				</div>
			</div>


<!--返回最顶部-->
			<div class="back_box" style="width: 50px; height: 50px; position: fixed; bottom: 180px; right: 25px; display: block;">
			    <div class="back_index"><a href="http://localhost:8080/index.htm" target="_blank" title="返回主页"></a></div>
			    <div class="back_top"><a id="toTop" href="http://localhost:8080/buyer/address.htm#" bosszone="hometop" style="display: block;" onclick="window.scrollTo(0,0);return false" title="返回顶部" target="_self"></a></div>
			</div>
		</div>

		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>
		<div class="tip-skyblue">
			<div class="tip-inner tip-bg-image"></div>
			<div class="tip-arrow"></div>
		</div>

		<!-- 弹框 -->

		<div id="buyer_address" style="">


			<!-- 新增地址 -->

			<div class="white_content ui-draggable" style="position: absolute; top: 199px; left: 363px; width: 500px;"> 
				<a href="javascript:void(0);" dialog_uri="undefined" class="white_close" onclick="tankuanghide();">X</a>
				<div class="white_box">
					<h1 id="xiugai" style="cursor: move;">新增地址444</h1>
					<link href="/css/window.css" type="text/css" rel="stylesheet">

					<!-- 弹框 -->
					<form action="addreceiptaddres.htm" method="post" id="addreceiptaddresform">
  						<table style="float:left;" width="100%" border="0" cellspacing="0" cellpadding="0" class="box_table">
    						<tbody>
    							<tr>
      								<td width="100" align="right" valign="top">
      									<span class="hui_table">收货人姓名</span>：
        								<input name="panduan" type="hidden" id="panduan" value="">
        								<input name="currreciptid" type="hidden" id="currreciptid" value="">
      								</td>
      								<td align="left">
		      							<span class="dia_txt">
		        							<input name="receiptname" type="text" id="receiptname" value="" size="35">
		      							</span>
		      						</td>
		    					</tr>
		    					<tr>
		      						<td align="right" valign="top"><span class="hui_table">所在区域：</span></td>
		      						<td align="left">
		      							<span id="area_area_info">  </span>
        						
	        							<!-- 省市区 begin -->
		        						<select name="receiptnregionshengcode" id="sheng"  style="width:100px;">
		        							<option value="" selected="selected">请选择</option>
		        							<c:forEach items="${requestScope.shenglist }" var="sheng">
		        								<option value="${sheng.code }">${sheng.name }</option>
		        							</c:forEach>
		        						</select>
                  				
		                  				<select name="receiptnregionshicode" id="shi" style="display:none;width:60px;">
		                  					<option value="" selected="selected">请选择</option>
		                  					<c:forEach items="${requestScope.shilist }" var="shi">
		                  						<option value="${shi.code }" shengvalue="${shi.provincecode }" style="display:none;">${shi.name }</option>
		                  					</c:forEach>
		                  				</select>
                				
			                			<select name="receiptnregionqucode" id="qu" style="display:none;width:60px;" >
			                				<option value="" selected="selected">请选择</option>
			                				<c:forEach items="${requestScope.qulist }" var="qu">
			                					<option value="${qu.code }" quvalue="${qu.citycode }" style="display:none;">${qu.name }</option>
			                				</c:forEach>
			                			</select>
      									<!-- 省市区 end -->
      							
      								</td>
   			 					</tr>
    							<tr>
		      						<td align="right" valign="top"><span class="hui_table">详细地址</span>：</td>
		      						<td align="left">
		      							<span class="dia_txt">
							        		<input name="receiptnstreet" type="text" id="receiptnstreet" value="" size="35">
							      		</span>
							      	</td>
		    					</tr>
							    <tr id="youbian">
							      	<td align="right" valign="top"><span class="hui_table">邮政编码</span>：</td>
							      	<td align="left">
							      		<span class="dia_txt">
							        		<input name="receiptyoubian" type="text" id="receiptyoubian" value="" size="35">
							      		</span>
							      	</td>
							    </tr>
							    <tr>
							      	<td align="right" valign="top"><span class="hui_table">联系电话</span>：</td>
							      	<td align="left" id="other_reason2">
							      		<span class="dia_txt">
							        		<input name="receiptnumber" type="text" id="receiptnumber" value="" size="35">
							      		</span>
							      	</td>
							    </tr>
							    <tr>
							      	<td align="right" valign="top">	<span class="hui_table">手机号码</span>：</td>
							      	<td align="left">
							      		<span class="dia_txt">
							        		<input name="receiptphone" type="text" id="receiptphone" value="" size="35">
							      		</span>
							      	</td>
							    </tr>
							    <tr>
							      	<td colspan="2" align="center">
							      		<span class="inputbtn">
							        		<input name="" type="submit" id="bubu" value="提交" style="cursor:pointer;">
							        		<input name="currentPage" type="hidden" id="currentPage" value="1">
							      		</span>
							      	</td>
							    </tr>
  						</tbody>
  					</table>
				</form>
			</div>
		</div>
		<div class="black_overlay" style="height: 682px;"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div>
	</body>
</html>