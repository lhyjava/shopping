<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0039)http://localhost:8080/querendingdan.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>订单确认</title>
		<meta name="keywords" content="shopping1,shopping2" />
		<meta name="description" content="shopping1,shopping2" />
		<meta name="generator" content="shopping 2.0" />
		<meta name="author" content="www.shopping.com" />
		<meta name="copyright" content="shopping Inc. All Rights Reserved" />
		<link href="/css/public.css" type="text/css" rel="stylesheet" />
		<link href="/css/goods.css" type="text/css" rel="stylesheet" />
		<link href="/css/jquery-ui-1.8.22.custom.css" type="text/css" rel="stylesheet" />
		<link href="/css/overlay.css" type="text/css" rel="stylesheet" />
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery-ui-1.8.21.js"></script>
		<script src="/js/jquery.validate.min.js"></script>
		<script src="/js/jquery.shop.common.js"></script>
		<script>
			jQuery(document).ready(function(){
				jQuery(":radio[id=invoiceType]").click(function(){
					var val=jQuery(this).val();
					if(val=="1"){
						jQuery("#invoice_info").show();
					}else{
						jQuery("#invoice_info").hide();
					}
				});
				//配送地址变更事件
				jQuery(":radio[id=addr_id]").click(function(){
					var addr=jQuery(this).parent().parent().find("#address").html();
					var person=jQuery(this).parent().parent().find("#person").html()+" "+jQuery(this).parent().parent().find("#mobile").html();
					jQuery("#order_address_info").html("寄送至:"+addr);
					jQuery("#order_person_info").html("收货人:"+person);
				});
  				jQuery("#coupon_id").change(function(){
					var coupon_amount=parseFloat(jQuery(this).find("option:selected").attr("coupon_amount"));
					if(isNaN(coupon_amount)){
						coupon_amount=0;
					}
					var goods_amount=parseFloat(jQuery("#goods_amount").val());
					jQuery("#order_coupon_div").show();
					var coupon_info="-¥"+coupon_amount;
					jQuery("#order_coupon").html(coupon_info);
					var ship_price=parseFloat(jQuery("#ship_price").val());
					if(isNaN(ship_price)){
						ship_price=0; 
					}
					var order_fee=goods_amount-coupon_amount+ship_price;
					jQuery("#order_store_amount").html("¥"+order_fee);
					jQuery("#order_pay_fee").html("¥"+order_fee);
					if(coupon_amount==0){
						jQuery("#order_coupon_div").hide();
					}
				});
				jQuery(":radio[id^=addr_id]").click(function(){											   
       				var addr_id=jQuery(this).val();
	   				jQuery.ajax({
	   					type:'POST',
		   				url:'http://localhost:8080/order_address.htm',
			   			data:{'addr_id':addr_id,"store_id":"32816"},
			   			dataType:'json',
				  		beforeSend:function(){
							/*   提交订单并支付 */
						    jQuery("#order_save").attr("disabled",true);
					  	}, 
						/*   可用配送方式 */
				  		success:function(data){
							jQuery("#ship_price").empty();
							jQuery(data).each(function(index,item){
								jQuery("#ship_price").append("<option value='"+item.value+"'>"+item.key+"</option>");
							});
							var ship_price=parseFloat(jQuery("#ship_price").val());
							if(isNaN(ship_price)){
								ship_price=0; 
							}
							var coupon_amount=parseFloat(jQuery("#coupon_id").find("option:selected").attr("coupon_amount"));
							if(isNaN(coupon_amount)){
								coupon_amount=0;
							}
							var goods_amount=parseFloat(jQuery("#goods_amount").val());
							var order_fee=goods_amount-coupon_amount+ship_price;
							jQuery("#order_store_amount").html("¥"+order_fee);
							jQuery("#order_pay_fee").html("¥"+order_fee); 
							jQuery("#order_save").attr("disabled",false);
						}
	   				});
  				});
				jQuery("#ship_price").change(function(){
					var ship_price=parseFloat(jQuery(this).val());
					if(isNaN(ship_price)){
						ship_price=0; 
					}
					var coupon_amount=parseFloat(jQuery("#coupon_id").find("option:selected").attr("coupon_amount"));
					if(isNaN(coupon_amount)){
						coupon_amount=0;
					}
					var goods_amount=parseFloat(jQuery("#goods_amount").val());
					var order_fee=goods_amount-coupon_amount+ship_price;
					jQuery("#order_store_amount").html("¥"+order_fee);
					jQuery("#order_pay_fee").html("¥"+order_fee); 
					var text=jQuery(this).find("option:selected").text();
					var transport=text.substring(0,text.indexOf("["));
					jQuery("#transport").val(transport);
				});
				jQuery(".baby_gp>a").mouseover(function(){
					jQuery(this).parent().find(".arrow").show();									  
					jQuery(this).parent().find(".baby_group").show();
				});
				jQuery(".baby_gp").mouseleave(function(){
					jQuery(this).parent().find(".arrow").hide();									  
					jQuery(this).parent().find(".baby_group").hide();
				});
				jQuery("#coupon_id").val("0");
				jQuery("#ship_price").find("option:first").attr("selected",true);
				jQuery(":radio[id^=addr_id]:first").attr("checked",true);
			});
			function save_order(){
				jQuery("#cart_form").submit();
			}
		</script>
	</head>
	<body>
		<div class="top" style="">
			<div class="top_page">
				<div class="pageright" id="site-nav">
					<ul class="quick-menu">
		      			<!-- 我的订单 -->
		        		<!-- <li class="mytaobao menu-item menupx">
		          			<div class="menu"> 
		          				<a class="menu-hd" href="http://localhost:8080/buyer/index.htm" rel="nofollow">我的订单<b></b></a>
		            			<div class="menu-bd">
		              				<div class="menu-bd-panel">
		                				<div>
							                <a href="http://localhost:8080/buyer/order.htm" rel="nofollow">已买到的宝贝</a>
							                <a href="http://localhost:8080/buyer/index.htm?type=4"  rel="nofollow">店铺动态</a>
							                <a href="http://localhost:8080/buyer/index.htm?type=2"  rel="nofollow">好友动态</a>
											<a href="http://localhost:8080/buyer/order.htm?order_status=order_submit" rel="nofollow">待支付</a>
											<a href="http://localhost:8080/buyer/order.htm?order_status=order_shipping" rel="nofollow">待收货</a>
											<a href="http://localhost:8080/buyer/order.htm?order_status=order_receive" rel="nofollow">待评价</a>
		               					</div>
		              				</div>
		            			</div>
		          			</div> 
		          		</li>-->
						<!-- 我的订单 end -->
						<!-- 商家支持 -->
						<!-- <li class="mytaobao menu-item menupx">
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
				        </li> -->
				        <!--  商家支持  end -->
			        	<script>
							var goods_count=1;
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
					 		//购物车
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
					 		//购物车
				   		</script>
						<!-- 购物车 -->
			        	<li class="search menu-item menupx">
			          		<div class="menu" id="cart_menu">
			          			<!-- <span class="menu-hd" id="cart_goods_top_menu"><s></s>购物车<span id="cart_goods_count_top" class="top_car">1</span>种商品<b></b></span> -->
			            		<a href="http://localhost:8080/order_conf#">购物车</a>
			            		<!-- 加载图片 -->
			           			<!-- <div class="menu-bd" id="cart_goods_top_info">
			             			<div class="menu-bd-panel">
			                			<div style="text-align:center;"><img src="/image/loader.gif"></div>
			             			</div>
			            		</div> -->
			            		<!-- 加载图片  end-->
			          		</div>
			        	</li>
			        	<!-- 购物车 end  -->
			        	<!-- 站内信息 -->
				        <!-- <li class="menupx"><a href="http://localhost:8080/buyer/message.htm">站内短信(<span style="color:#FF3300;">2</span>)</a></li> -->
						<!-- 站内信息 end  -->
						<!-- 收藏夹 -->
						<!-- <li class="mytaobao menu-item menupx">
			          		<div class="menu"> 
			          			<a class="menu-hd" href="http://localhost:8080/buyer/favorite_goods.htm" rel="nofollow">收藏夹<b></b></a>
			            		<div class="menu-bd">
				              		<div class="menu-bd-panel"><div> 
					                <a href="http://localhost:8080/buyer/favorite_goods.htm" rel="nofollow">收藏商品</a>
					                <a href="http://localhost:8080/buyer/favorite_store.htm" rel="nofollow">收藏店铺</a> 
				                </div>
							</div>
			        	</li> -->
						<!-- 收藏夹  -->
						<!-- 帮助中心 -->
						<!-- <li class="menupx" style="background:none;">
							<a href="http://localhost:8080/articlelist_help.htm">帮助中心</a>
						</li> -->
						<!-- 帮助中心 -->
					</ul>
				</div>
    			<div class="pageleft"><span>welcome  to  xxx的店</span>
  		  			<a href="http://localhost:8080/order_conf#" class="lightblue">[退出]</a> 
     			</div>
  			</div>
		</div>
		<div class="main">
			<script>
				jQuery(document).ready(function(){
  					jQuery(".toph_bgsear li").mouseover(function(){
      					jQuery(".toph_bgsear>li").show();
  					}).mouseleave(function(){
       					jQuery(".toph_bgsear>li").last().hide();
  					}).click(function(){
	 					var index=jQuery(this).index();
	 					if(index==1){
							var f_text=jQuery(".toph_bgsear li").find("a").first().text();
							var f_type= jQuery(".toph_bgsear li").first().attr("type");
							jQuery(".toph_bgsear li").find("a").first().html(jQuery(this).find("a").text()+"<s></s>");
							jQuery(".toph_bgsear li").find("a").last().text(f_text);
							jQuery("#type").val(jQuery(this).attr("type"));
							jQuery(".toph_bgsear li").first().attr("type",jQuery(this).attr("type"));
							jQuery(".toph_bgsear li").last().attr("type",f_type);
							jQuery(".toph_bgsear>li").last().hide();
	 					}
  					});
  					jQuery(".two_code_a").click(function(){
	  					jQuery(this).parent().remove();
	  				});
				});
				function search_form(){
					var keyword=arguments[0];
					var type=arguments[1];
					if(keyword!=""&&keyword!=undefined){
						jQuery("#keyword").val(keyword);
					}
					if(type!=""&&type!=undefined){
						Query("#type").val(type);
					}
					jQuery("#searchForm").submit();	
					jQuery("#keyword").val("");
				}
			</script>
			<!-- <div class="top_banner clearFix">
				<img src="http://localhost:8080/upload/advert/topbanner.jpg">
			</div> -->
			<!-- [if lt IE 9]>
				<script src="http://localhost:8080/resources/js/css3-mediaqueries.js"></script>
			<![endif] -->
			<!-- 开头搜索div -->
			<div id="header_form">
  				<script src="/js/jquery.cookie.js"></script>
  				<div id="head_h" class="head_width">
		  			<div class="head clearFix">
		  				<!-- logo图片 -->
		    			<div class="logo"> 
		     				<a href="http://localhost:8080/index.htm"> 
		     					<img src="/img/logozm.png" border="0" />
		     				</a> 
		    			</div>
		     			<!-- logo图片 end -->
		     			<!-- 搜索区域 -->
		    			<div class="searchForm">
		    				<!-- 搜索框隐藏表单 -->
			 	   			<form action="http://localhost:8080/order_conf#" method="post" target="_blank" id="searchForm">
				  				<input name="type" type="hidden" id="type" value="goods" />
								<!-- 搜索条 -->
				    			<div class="toph_bigsearch">
				      				<div class="toph_sear">
				        				<ul class="toph_bgsear">
				          					<li class="this" type="goods">
				          						<a href="javascript:void(0);">宝贝<s></s></a>
											</li>
											<li style="display:none" type="store">、
												<a href="javascript:void(0);">店铺</a>
											</li>
				        				</ul>
								        <input name="keyword" type="text" id="keyword" placeholder="搜索其实真的很简单！" x-webkit-speech="" lang="zh-CN" onwebkitspeechchange="jQuery('#searchForm').submit()" class="toph_sear_txt" />
								        <input name="input" type="button" value="搜索" style="cursor:pointer;" onclick="search_form();" class="toph_sear_btn" />
				      				</div>
									<!-- ?区域 -->
									<!-- <div class="keyword">  
										<a href="javascript:void(0);" onclick="search_form('??','goods');">??</a>
										<a href="javascript:void(0);" onclick="search_form('??','goods');">??</a>  
										<a href="javascript:void(0);" onclick="search_form('??','goods');">??</a> 
										<a href="javascript:void(0);" onclick="search_form('??','goods');">??</a> 
										<a href="javascript:void(0);" onclick="search_form('??','goods');">??</a>  
										<a href="javascript:void(0);" onclick="search_form('??','goods');">??</a>  
										<a href="javascript:void(0);" onclick="search_form('??','goods');">??</a>
									</div> -->
									<!--  ?区域    end-->
				    			</div>
				 				<!-- 搜索条  -->
			    			</form>
			    			<!-- 搜索框隐藏表单  -->
		    			</div>
		    			<!-- 搜索区域   end-->
		  			</div>
  				</div>
			</div>
			<!-- 开头搜索div end -->
  			<div class="Steps_box">
				<!-- 进度栏 -->
    			<div class="Steps">
      				<ul>
				        <li class="done prev">1.查看购物车</li>
				        <li class="this">2.确认订单信息</li>
				        <li>3.付款到卖家</li>
				        <li>4.确认收货</li>
				        <li class="last">5.评价</li>
      				</ul>
    			</div>
				<!-- 进度栏  end -->
				<!-- 表单 -->
    			<form action="ordersubmit.htm" method="post" id="cart_form">
    				<!-- 店铺名称 -->
     				<!-- <div class="h1"> 
      					<span class="h1_l">店铺名称：
	      					<a href="http://localhost:8080/store_32816.htm" target="_blank">高家的小铺</a>
	        				<input name="store_id" type="hidden" id="store_id" value="32816">
      					</span> 
      				</div> -->
    				<!-- 店铺名称 end -->
     				<!-- 商品区域 -->
      				<div class="table">
        				<table width="100%" cellpadding="0" cellspacing="0" border="0">
          					<tbody>
        						<!-- 商品导航 -->
					          	<tr>
						            <td width="57%" align="center" class="title">店铺商品</td>
						            <td width="10%" align="center" class="title">单价</td>
						            <td width="11%" align="center" class="title">数量</td>
						            <td width="11%" align="center" class="title">小计</td>
					           	</tr>
         						<!-- 商品导航  end -->
								<!-- 商品列表循环 点击商品名或商品图片进入商品详情 -->
								<c:forEach items="${requestScope.shoppingcarList }" var="tmp">
									<tr>
										<td class="baby">
											<a href="http://localhost:8080/shangpinxiangqing.htm?id=2">
												<img src="${tmp.image }" width="65" height="65" />
											</a>
											<p>
												<!-- 商品名 -->
												<a href="http://localhost:8080/shangpinxiangqing.htm?id=2">${tmp.name }</a> 
												<br />
												<c:set value="${fn:split(tmp.spec, ',') }" var="arr" />
												<c:forEach items="${arr }" var="s">
													<span class="color">${s }</span>
													<br />
												</c:forEach>
											</p>
										</td>
										<!-- 单价 -->
										<td align="center">${tmp.price }</td>
										<!-- 数量 -->
										<td align="center">${tmp.number }</td>
										<!-- 小计 -->
										<td align="center"><strong class="orange">${tmp.price*tmp.number }</strong></td>
										<!-- 表单提交数据 -->
										<input type="hidden" name="goodsid" value="${tmp.id }" />
										<input type="hidden" name="img" value="${tmp.image }" />
										<input type="hidden" name="name" value="${tmp.name }" />
										<input type="hidden" name="specmessage" value="${tmp.spec }" />
										<input type="hidden" name="price" value="${tmp.price }" />
										<input type="hidden" name="number" value="${tmp.number }" />
									</tr>
								</c:forEach>
								<!-- 商品列表循环 end -->
             				</tbody>
            			</table>
      				</div>
      				<!-- 商品区域  end-->
      				<div class="sendadress">
      					<!-- 收货人地址管理 -->
        				<h1>
          					<div class="sendhright">	
          	 					<span class="sendperbtn">
          	 						<a href="http://localhost:8080/showaddressmgr.htm" target="_self">管理收货地址</a>
          	 					</span>
		  					</div>
         	 				<span class="sendperadr">收货人地址</span> 
         				</h1>
       					<!-- 收货人地址管理 -->
      					<!-- 收货人地址 -->
        				<div class="writeok">
          					<ul>
								<!-- 配送地址循环 -->
								<c:forEach items="${requestScope.addressList }" var="tmp">
									<li>
										<strong>
											<img src="/img/Steps_02.gif" width="14" height="23" />
										</strong>
										<label> 
											<strong>
												<input type="radio" name="consignee" id="addr_id" value="${tmp.receiptnregionsheng }${tmp.receiptnregionshi }${tmp.receiptnregionqu }${tmp.receiptnstreet }" checked="checked" />
											</strong>
											<!-- 地址 -->
											<span id="address">${tmp.receiptnregionsheng }${tmp.receiptnregionshi }${tmp.receiptnregionqu }${tmp.receiptnstreet }</span>
											<!-- 收货人 -->
											<span id="person">${tmp.receiptname }</span>
											<!-- 电话号码 -->
											<span id="mobile">${tmp.receiptphone }</span> 
										</label>
									</li>
								</c:forEach>
								<!-- 配送地址循环end -->
           					</ul>
        				</div>
				        <!-- 收货人地址  end -->
				        <!-- 发票信息 -->
				        <h1>
				        	<span class="sendperadr margin10">发票信息</span>
				        </h1>
        				<div class="sendmethod">
          					<ul>
            					<li>
									<label>
										<input name=Invoice type="radio" id="invoiceType" value="个人" checked="checked" />个人
									</label>
									<label>
										<input name="Invoice" id="invoiceType" type="radio" value="单位" />单位
									</label>
            					</li>
            					<li id="invoice_info" style="display:none;"><span style="margin-bottom:5px;">发票抬头：</span>
              						<input name="invoice" type="text" id="invoice" size="40" style="height:20px;" />
           	    				</li>
          					</ul>
        				</div>
				        <!-- 发票信息   end -->
				        <!-- 配送方式 -->
             	 		<h1>
             	 			<span class="sendperadr margin10">配送方式</span>
             	 		</h1>
        				<div class="sendmethod">
          					<ul>
            					<li>
	            					<span style="margin-bottom:5px;">可用配送方式：</span>
	            					<select name="delivery" style="width:110px;" id="ship_price">
						                <option value="卖家承担" selected="selected">卖家承担</option>
						                <option value="货到付款" selected="selected">货到付款</option>
	            					</select>
            						<input name="transport" type="hidden" id="transport" value="平邮" />
            					</li>
          					</ul>
       					</div>   
				        <!-- 配送方式 end -->   
				        <!-- 买家附言 --> 
						<h1>
							<span class="sendperadr margin10">买家附言</span>
						</h1>
        				<div class="sendmeg">
         	 				<textarea name="message" cols="" rows="" id="msg"></textarea>
        				</div>
        				<!-- 买家附言 end -->
        				<div class="paysend" id="order_coupon_div" style="display:none;">
        					优惠券抵消：<strong class="red" style=" font-size:24px;" id="order_coupon"></strong>
        				</div>
        				<div class="paysend"></div>
        				<!-- 右下角信息 -->
        				<div class="paysend">
          					<div class="paysd">
            					<div class="paysd_box">
            						<span>实付款：<strong></strong><b id="order_pay_fee"> ¥${requestScope.totalPrice }</b></span>
            						<input type="hidden" name="totalPrice" value="${requestScope.totalPrice }" />
              						<ul>
						                <li><span id="order_address_info">寄送至:</span></li>
						                <li><span id="order_person_info">收货人: </span></li>
              						</ul>
            					</div>
          					</div>
        				</div>
				        <!-- 右下角信息  end -->
				       	<!-- 提交订单并支付 -->
        				<div class="paybtn">
				        	<input type="hidden" name="userid" value="${param.userid }" />
				          	<input type="submit" value="提交订单并支付" style="cursor:pointer;background-color:indigo;" />
        				</div>
        				<!-- 提交订单并支付  end -->
      				</div>
    			</form>
 			</div>
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
			</script>
			<!-- 脚本 -->
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
						<li class="hui2">Copyright 2011-2030 shopping Inc. All rights reserved</li>
						<li class="hui2">Powered by shopping V2.0</li>
	  				</ul>
				</div>
			</div>
			<!-- 脚本 end -->
			<!-- 返回最顶部 -->
			<div class="back_box" style="width: 50px; height: 50px; position: fixed; bottom: 180px; right: 25px; display: none;">
		    	<div class="back_index"><a href="http://localhost:8080/index.htm" target="_blank" title="返回主页"></a></div>
		    	<div class="back_top"><a id="toTop" href="http://localhost:8080/goods_cart2.htm#" bosszone="hometop" style="display: block;" onclick="window.scrollTo(0,0);return false" title="返回顶部" target="_self"></a></div>
			</div>
 		</div>
	</body>
</html>