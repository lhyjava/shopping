<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0048)http://localhost:8080/shangpinxiangqing.htm?id=2 -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>商品详情</title>
		<meta name="keywords" content="床铃" />
		<meta name="description" content="玩具 床铃" />
		<meta name="generator" content="shopping 2.0" />
		<meta name="author" content="www.shopping.com" />
		<meta name="copyright" content="shopping Inc. All Rights Reserved" />
		<link href="/css/public.css" type="text/css" rel="stylesheet" />
		<link href="/css/default.css" type="text/css" rel="stylesheet" />
		<link href="/css/overlay.css" type="text/css" rel="stylesheet" />
		<link href="/css/cssjquery.jqzoom.css" type="text/css" rel="stylesheet" />
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery-ui-1.8.21.js"></script>
		<script src="/js/jquery.shop.common.js"></script>
		<script src="/js./jquery.validate.min.js"></script>
		<script src="、js./jquery.jqzoom-core.js"></script>
		<script src="/js/jquery.lazyload.js"></script>
		<!-- angular js -->
		<script src="https://cdn.staticfile.org/angular.js/1.6.3/angular.min.js"></script>
		<script>
			//add by lhy 1202 begin
			
			/* 商品信息 */
			var app = angular.module('myApp1', []);
			var id = ${param.id };
			app.controller('siteCtrl1', function($scope, $http) {
				$http({
					method: 'post',
					url: 'commodityDetails.htm?id='+id
				}).then(function successCallback(response) {
					
					//前台返回的数据
					var obj = response.data;
					//商品
					$scope.goods = obj.goods;
					//规格名
					$scope.spec = obj.specList;
					//规格值
					$scope.specval = obj.specvalList;
					//商品描述
					var a = $scope.goods.details;
					
					var div = $(".selleddetails");
					div.append(a);
					
				}, function errorCallback(response) {
				});
			});
			
			//add by lhy 1202 end
			
			function img_switch(obj){
				jQuery(".photoimgul li").removeClass("this");
				jQuery(obj.parentNode.parentNode).addClass("this");
				var src=jQuery(obj).attr("big_img");
				jQuery("#main_img").attr("src",src);
			}
			var store_price=69.00;
			var goods_inventory=2994;

			var goods_price=99.00
			jQuery(document).ready(function(){
				jQuery('.jqzoom').jqzoom({
			    	zoomType: 'standard',
					zoomWidth:480,
					zoomHeight:300,
		            lens:true,
		            preloadImages: false,
		            alwaysOn:false,
					title:true,
					preloadText:'努力加载'
		        });
				//初始化数据
			  	var data='[]';
			  	if(data!=""){
					var properties=eval("("+data+")");
				    jQuery.each(properties,function(index,item){
				        jQuery(".goodsintro").append("<span>"+item.name+":"+item.val+"</span>");
				    });
				}
				jQuery(".selled li").click(function(){
			   		jQuery(".selled li").each(function(){
				   		var id=jQuery(this).attr("id")+"_tab";
				   		jQuery(this).removeClass("this");
			    	});
			    	jQuery(this).addClass("this");
					var uri=jQuery(this).attr("uri");
					jQuery(".selleddetails").empty();
					jQuery(".img_center_load").show();
					jQuery.post(uri,"",function(data){
						jQuery(".img_center_load").hide();						
				        jQuery(".selleddetails").append(data);
					},"text");
				}).mouseover(function(){
			  		jQuery(this).css("cursor","pointer");	
				});
				
				//add by lhy 1217 begin
				
				//超出库存验证
				$("#goods_count").keyup(function(){
					var goods_count=$(this).val();
					var mm = $("#goods_inventory").html();
					if(goods_count>(mm*1)){
						alert("超出店铺库存，请重新输入购买数量");
						$(this).val(mm);
					}
				});
				
				//add by lhy 1217 end
			  	jQuery(".twocoad").css("cursor","pointer").mouseover(function(){
			    	jQuery(".shop_botmhbox").fadeIn('fast'); 
			  	}).mouseleave(function(){
			    	jQuery(".shop_botmhbox").fadeOut('fast'); 
			  	});
			  	jQuery(".shop_report").css("cursor","pointer").mouseover(function(){
			    	jQuery(".shop_reul").fadeIn("normal");
					jQuery(".shop_rep_top").hide();
					jQuery(".shop_rep_botm").show();
			  	}).mouseleave(function(){
					jQuery(".shop_reul").fadeOut("normal");
					jQuery(".shop_rep_top").show();
					jQuery(".shop_rep_botm").hide();
			  	});;
				var switch_loaded = true;
				var goods_tab_loaded=true;
				var switch_top = jQuery("#switch_bar").offset().top;
				var goods_tab_top = jQuery("#goods_tab").offset().top;
				var switch_left = jQuery("#switch_bar").offset().left;
				
				jQuery(window).scroll(function(){
				  	var scrolla=jQuery(window).scrollTop();
				  	var switch_cha=parseInt(switch_top)-parseInt(scrolla);
				  	if(switch_loaded && switch_cha<=30){
					   	jQuery("#switch_bar").removeClass("switch_bar").css({"position":"fixed","top":"30px","z-index":"100"});	  
					   	switch_loaded=false;
				  	}
				  	if(!switch_loaded && switch_cha>30){
					   	switch_loaded=true;
					   	jQuery("#switch_bar").removeClass().addClass("switch_bar").css({"position":"absolute","top":"30px","z-index":"100"});
				  	}
				  	var goods_tab_cha=parseInt(goods_tab_top)-parseInt(scrolla);
				  	if(goods_tab_loaded && goods_tab_cha<=0){
					   	jQuery("#goods_tab").css({"position":"fixed","top":"0px","background":"#fff","border-bottom":"#ccc solid 1px","overflow":"hidden"});
					   	jQuery(".selled_kf").show();
					   	goods_tab_loaded=false;
				  	}
				  	if(!goods_tab_loaded && goods_tab_cha>0){
					   	goods_tab_loaded=true;
					   	jQuery(".selled_kf").hide();
					   	jQuery("#goods_tab").css({"position":"relative","border-bottom":"none","overflow":"visible"});
				  	}
				});
				jQuery(".sbar_close").attr("cursor","pointer").click(function(){
					jQuery(".shopindex_left").fadeOut("normal");
					jQuery(".sbar_open").show();
					jQuery(".sbar_close").hide();
					jQuery(".shopindex_right").css({"width":"100%"});
					jQuery(".regoods").css("width","100%");
					jQuery(".regoods h1").css("width","100%");
					jQuery(".regoods .smallgoods").css("width","100%");
					jQuery(".regoods .smallgoods ul").css("margin-right","40px");
				});
				jQuery(".sbar_open").attr("cursor","pointer").click(function(){
					jQuery(".shopindex_left").fadeIn("normal");
					jQuery(".sbar_close").show();
					jQuery(".sbar_open").hide();
					jQuery(".shopindex_right").css("width","797px");
					jQuery(".regoods h1").css("width","797px");
					jQuery(".regoods .smallgoods").css("width","797px");
					jQuery(".regoods .smallgoods ul").css("margin-right","4px");
				});
				jQuery(".smallgoods .goodsimgs img").lazyload({effect:"fadeIn",width:178,height:170});
				jQuery(".log_d>a").click(function(){
			   		jQuery(this).parent().parent().find(".goods_ct").show();
				});
				jQuery(".h3_r>a").click(function(){
					jQuery(".Cities").hide();									 
					jQuery(this).parent().parent().parent().hide();
				});
				jQuery(".item a").click(function(){
				   	jQuery(".Cities").hide();								 
				   	jQuery(this).parent().find(".Cities").show();
				});
				jQuery(".Cities>ul>li>a").click(function(){
					var city_name=jQuery(this).attr("city_name");	
					jQuery.ajax({type:'POST',url:'tianjiagouwuche',dataType:'json',data:{"city_name":city_name,"goods_id":"98595"},
						beforeSend:function(){
							jQuery("#current_city_info").html('<img style="padding-top:3px;" src="http://localhost:8080/resources/style/common/images/wait.gif" width="14" height="14" />');
								jQuery("#goods_mail_fee").html('<img style="padding-top:3px;" src="http://localhost:8080/resources/style/common/images/wait.gif" width="14" height="14" />');
								jQuery("#goods_express_fee").html('<img style="padding-top:3px;" src="http://localhost:8080/resources/style/common/images/wait.gif" width="14" height="14" />');
								jQuery("#goods_ems_fee").html('<img style="padding-top:3px;" src="http://localhost:8080/resources/style/common/images/wait.gif" width="14" height="14" />');				
							},
						   	success:function(json){
								jQuery("#current_city_info").html(json.current_city_info);
								jQuery("#goods_mail_fee").html('¥'+json.mail_fee);
								jQuery("#goods_express_fee").html('¥'+json.express_fee);
								jQuery("#goods_ems_fee").html('¥'+json.ems_fee);
							}
					});
					jQuery(".Cities").hide();	
					jQuery(".goods_ct").hide();
				});
				jQuery("#goods_spec_info_close>a").click(function(){
					jQuery("#goods_spec_info").removeClass().addClass("detailsbottom");  
					jQuery("#goods_spec_info_close").hide();
					jQuery("#goods_spec_chose").hide();
				});
				jQuery(".enjoy_btn").mouseover(function(){
			   		jQuery(".enjoy_box").show();
			 	}).mouseleave(function(){
			   		jQuery(".enjoy_box").hide();
			 	});
			});
			var time=0;
			var time_id;
			//加入购物车
			function spguige(obj){
				
				var m = $(obj).html();
				
				$("#guigeid").val(m);
			}
			/* function spguige2(obj){
				var n = $(obj).html();
				$("#guige2id").val(n);
			} */
			function add_cart(){
				
				var add=true;
				var count=jQuery("#goods_count").val();
				var spec=$("#guigehidden").val();
				if(count==0 || count<0){
					add=false;
					alert("至少购买一件商品!");
					return;
				}
				if(goods_inventory==0){
					add=false;
					alert("商品库存为0,不能购买!");
					return;
				}  
				if(spec== ""){
					add=false;
					alert("请选择商品属性！");
					return;
				}
				
				$("#tianjiagouwuche").submit();
			}
			function cart_fadeOut(){
				time++;
			  	if(time==3){
			    	jQuery(".goodscar").fadeOut();
					time=0;
					window.clearInterval(time_id);
			  	}
			}
			//立刻购买，点击后进入订单提交页
			function buy_goods(){
				var add=true
				var gsp="";
  				if(jQuery(".colordate").length==0){
    				add=true;
  				}else{
					jQuery(".colordate").each(function(){
	   					jQuery.each(jQuery(this).find("a[class=this]"),function(){
		  					gsp=jQuery(this).attr("gsp")+","+gsp; 
	   					});
       					if(jQuery(this).find("a[class=this]").length==0) add=false;
					});
  				}
				var count=jQuery("#goods_count").val();
				if(count==0){
					add=false;
					alert("至少购买一件商品!");
					return;
				}
				if(goods_inventory==0){
					add=false;
					alert("商品库存为0,不能购买!");
					return;
				}    
  				var buy_type=arguments[0];
				if(add){
					jQuery.post("http://localhost:8080/add_goods_cart.htm",{"id":"98595","count":count,"price":store_price,"gsp":gsp,"buy_type":buy_type},function(data){
	     			jQuery("#cart_goods_count").html(data.count);
		 			jQuery("#cart_goods_totalprice").html(data.total_price);
		 			window.location.href="http://localhost:8080/goods_cart1.htm";
					},"json");
  				}else{
					jQuery("#goods_spec_info").removeClass().addClass("detailsbottom detailsbottom_hover");  
					jQuery("#goods_spec_info_close").show();
					jQuery("#goods_spec_chose").show();
  				}
			}
			function ajaxPage(url,currentPage,obj){
  				jQuery.ajax({
  						type:'POST',
  						url:url,
  						data:{
  								"currentPage":currentPage,
  								"goods_id":"98595",
  								"id":"32816"
  						},
					  	beforeSend:function(){
					   	},
			  			success:function(data){
							jQuery(".selleddetails").empty();						
							jQuery(".selleddetails").append(data);
			  			}
				})
			}
		</script>
		<script src="/js/logger.js"></script>
		<link href="/css/bdsstyle.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<!-- <iframe frameborder="0" style="display: none;" src="./商品详情_files/saved_resource.html"></iframe><div id="bdshare_s" style="display: block;"><iframe id="bdsIfr" style="position:absolute;display:none;z-index:9999;" frameborder="0" src="./商品详情_files/saved_resource(1).html"></iframe><div id="bdshare_l" style="display: none;"><div id="bdshare_l_c"><h6>分享到</h6><ul><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_mshare mshare">一键分享</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_qzone qqkj">QQ空间</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_tsina xlwb">新浪微博</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_bdysc bdysc">百度云收藏</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_renren rrw">人人网</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_tqq txwb">腾讯微博</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_bdxc bdxc">百度相册</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_kaixin001 kxw">开心网</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_tqf txpy">腾讯朋友</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_tieba bdtb">百度贴吧</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_douban db">豆瓣网</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_tsohu shwb">搜狐微博</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_bdhome bdhome">百度新首页</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_sqq sqq">QQ好友</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_thx thx">和讯微博</a></li><li><a href="http://localhost:8080/goods_98595.htm#" class="bds_more">更多...</a></li></ul><p><a href="http://localhost:8080/goods_98595.htm#" class="goWebsite">百度分享</a></p></div></div></div> -->
		<!-- 页面最顶部的功能栏 -->
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
									jQuery.ajax({type:'POST',url:'http://localhost:8080/cart_menu_detail.htm',data:'',
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
							$(function(){
								var through = $(".through").html();
								var orange = $(".orange").html();
								var youhui = (through-orange);
								$(".greenp").html("(节省：<b id='rest' style='font-weight:normal;'>¥"+youhui+"</b>)");
							});
		   				</script>
						<li class="search menu-item menupx">
			  				<div class="menu" id="cart_menu">
				  				<a href="http://localhost:8080/showshoppingcar">
					  				<span class="menu-hd" id="cart_goods_top_menu"><s></s>购物车
						  				<!-- <span id="cart_goods_count_top" class="top_car">0</span> --><!-- 种商品 --><b></b><!-- </span></a> -->
										<!-- <div class="menu-bd" id="cart_goods_top_info">
										<div class="menu-bd-panel"><div style="text-align:center;"><img src="/image/loader.gif"></div></div></div> -->
					  				</span>
				  				</a>
				  			</div>
				  			<a href="http://localhost:8080/showshoppingcar"></a>
						</li>
						<a href="http://localhost:8080/showshoppingcar"></a>
						<li class="menupx">
							<a href="http://localhost:8080/showshoppingcar"></a>
							<a href="http://localhost:8080/buyer/message.htm">站内短信</a>
						</li>
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
						<li class="menupx" style="background:none;">
							<a href="http://localhost:8080/articlelist_help.htm">帮助中心</a>
						</li>
						<!-- 退出登录 -->
						<%-- <c:if test="${sessionScope.currentusername != null }">		
							<li class="menupx" style="background:none;">
								<a href="logout.htm">退出</a>
							</li>
						</c:if> --%>
						<!-- 退出登录end -->
					</ul>
    			</div>
    			<div class="pageleft">
    				<c:if test="${sessionScope.currentusername == null }">
	    				<span>亲，欢迎来到缘来小镇</span>
	    				<span class="pxlr">
	    					<a href="http://localhost:8080/user/login.htm" class="lightblue">登录</a>
	    				</span><span class="pxlr">或</span>
	    				<span class="pxlr">
	    					<a href="http://localhost:8080/register.htm" class="lightblue">注册</a>
	    				</span> 
    				</c:if>
    				<c:if test="${sessionScope.currentusername != null }">
    					<span>${sessionScope.currentusername },欢迎来到缘来小镇</span>
    				</c:if>
    			</div>
  			</div>
		</div>
 		<!-- 页面最顶部的功能栏end -->
		<div class="page_width">
  			<div class="main_top">
    			<div class="head">
					<!--logo图片-->
					<div class="logo"> 
		  				<a href="http://localhost:8080/index.htm">
							<!-- logo图片 -->
			  				<img src="/img/logozm.png" border="0" width="152" />
							<!-- logo图片 -->		  
		  				</a>
					</div>
					<!--logo图片end-->
    			</div>
			</div>
		</div>
		<script>
			jQuery(function(jQuery){
    			jQuery(".top_shop_seacher input[type=button]").click(function(){
				    var search_area=jQuery(this).attr("search_area");
					if(search_area=="site"){
						jQuery("#store_top_search_form").attr("action","http://localhost:8080/search.htm");
					}
					if(search_area=="store"){
						jQuery("#store_top_search_form").attr("action","http://localhost:8080/store_goods_search.htm");
					}
					jQuery("#store_top_search_form").submit();
	  			});
	  			jQuery(".top_nofilter").mouseover(function(){
					jQuery(".top_b").hide();								
				    jQuery(".top_b2").show();  
					jQuery(".top_sear_bom").fadeIn("normal");
	  			})
	  			jQuery(".top_search_left").css("cursor","pointer").mouseleave(function(){
					jQuery(".top_b").show();								
				    jQuery(".top_b2").hide();
					jQuery(".top_sear_bom").fadeOut("normal");
	  			});
			});
			$(function(){
				var through = $(".through").html();
				var orange = $(".orange").html();
				var youhui = (through-orange);
				$(".greenp").html("(节省：<b id='rest' style='font-weight:normal;'>¥"+youhui+"</b>)");
			});
		</script>
		<!-- 搜索栏下的图片 -->
    	<div class="banner_width">
			<div class="shopbanner" style="background:#000; color:#FFF">
				<img src="/img/balong.jpg" width="1002" />
			</div>
		</div>
		<!-- 搜索栏下的图片end -->
		<!-- 导航栏 -->
		<div class="nav_width">
	  		<div class="main">
				<div class="nav_bg">
		  			<div class="shopnav"> 
						<!-- 导航栏分类 -->
						<div class="shopnavul">
							<ul>
								<li id="store_index"> <a href="http://localhost:8080/store_32816.htm">首页</a></li>
								<li id="store_goods" class="this"><a href="http://localhost:8080/goods_98595.htm">商品详情</a></li>
								<li id="store_credit"> <a href="http://localhost:8080/store_credit_32816.htm">信用评价</a></li>
								<li id="store_info"><a href="http://localhost:8080/store_info_32816.htm">店铺详情</a></li>
							</ul>
						</div>
						<div class="shopnavs"></div>
		  			</div>
				</div>
	 		</div>
	  		<div class="navbotm"></div>
		</div>
		<!-- 导航栏end -->
		<!--商品-->
		<!-- 页面主体 -->
		<div class="main">
			<div class="shop" ng-app="myApp1" ng-controller="siteCtrl1">
				<!-- 商品详情 -->
				<div class="shop_index">
				<!-- 举报中心下的店铺信息 -->
				<div class="shop_repright">
					<div class="shop_report" style="cursor: pointer;"> <span class="shop_respan"><i>举报中心</i><b class="shop_rep_top"></b><b class="shop_rep_botm" style="display:none;"></b></span>
						<ul class="shop_reul" style="display:none">
							<li>
								<a href="javascript:void(0);" id="report_goods" dialog_uri="http://localhost:8080/user_dialog_login.htm" dialog_title="会员登录" dialog_width="450" dialog_height="100" dialog_id="user_login">举报此商品</a>
							</li>
					  	</ul>
					</div>
				</div>
				<form action="tianjiagouwuche.htm" id="tianjiagouwuche">
				<input name="userid" type="hidden" value="${sessionScope.currentuserid }" />		
				<input name="goodsid" type="hidden" value="{{goods.id }}" />
				<input name="name" type="hidden" value="{{goods.name}}" />
				<input name="img" type="hidden" value="{{goods.img }}" />
				<input name="opice" type="hidden" value="{{goods.opice }}"/>	
				<!-- 商品信息 -->
				<div class="productdeta">
					<h1>
						<strong class="tuang_h">{{ goods.name }}</strong> 
					</h1>
					<div class="photoproduct">
						<!-- 商品图片 -->
					  	<div class="photopro">              
							<a href="./商品详情_files/9f90d29c-c17a-4d6d-bb30-5d730ae3407e.jpg" class="jqzoom" rel="gal1" title="" style="outline-style: none; text-decoration: none;">
						   		<div class="zoomPad">
						   			<img ng-src="{{ goods.img }}" title="商品细节图" id="main_img" width="300" height="300" style="border: 1px solid rgb(102, 102, 102); opacity: 1;" />
						   			<div class="zoomPup" style="display: none;"></div>
						   			<div class="zoomWindow" style="position: absolute; display: none; z-index: 5001; left: 312px; top: 0px;">
						   				<div class="zoomWrapper" style="width: 480px;">
						   					<div class="zoomWrapperTitle" style="width: 100%; position: absolute; display: block;">商品细节图</div>
						   					<div class="zoomWrapperImage" style="width: 100%; height: 300px;"></div>
						   				</div>
						   			</div>
						   			<div class="zoomPreload" style="visibility: visible; top: 143px; left: -5px; position: absolute;">努力加载</div>
						   		</div> 
						  	</a>
						</div>
					  	<!-- 商品图片end -->
					  	<div class="productshop">
							<div class="detailstop">
						  		<ul>
									<li>
										<span class="detbt">商品原价：</span>
										<span class="through">{{ goods.pice }}</span>
									</li>
									<li>
										<span class="detbt">店铺价格：</span>
										<span class="pricedata">
											<strong class="orange" id="store_price">{{ goods.opice }}</strong>
										</span>
										<span class="greenp">(节省：<b id="rest" style="font-weight:normal;">¥{{ goods.pice-goods.opice }}</b>)</span>
									</li>
						  		</ul>
							</div>
							<script>
								/* 规格点击事件 */
								function goods_spec_set(obj){
									var thisclass = $(obj).attr("class");
									console.log(thisclass);
								 	$("."+thisclass).css("border", "0px");
								 	$(obj).css("border", "2px solid red");
								 	$(obj).parent().parent().parent().parent().parent().find("input[name='specvals']").val($(obj).attr("specvalname"));
								}
						  	</script>
							<div class="detail_solid"></div>
							<div class="detailsbottom_ps">
						  		<div class="detailsbottom" id="goods_spec_info">
									<ul>
							  			<li id="goods_spec_chose" class="detail_chose" style="display:none;">请选择商品属性</li>
										<li class="stockdate"><span class="datespan">数量：</span>
											<span class="stock">
												<input name="number" type="text" id="goodscount" value="1" />
											</span>                     
											<span class="stockparts">
												件（库存<b id="goods_inventory" style="font-weight:normal;">{{ goods.stock }}</b>件）
											</span>
										</li>
										<!-- 规格名 -->
                              			<li class="colordate" ng-repeat="x in spec">
											<span class="datespan">{{ x.name }}</span> 
											<!-- 规格值 -->
											<span class="chosecolor">
												<span ng-repeat="y in specval">
													<span ng-if="x.id == y.specid">
						                          		<b style="font-weight:lighter;">
						                          			<a specvalname="{{ y.value }}" class="{{ x.id }}" href="javascript:void(0);" onclick="goods_spec_set(this);" spec="32771" gsp="32798">
						                          				<span id="gui" onclick="spguige(this)">{{ y.value }}</span>
						                          			</a>
						                          		</b>
						                          	</span>
					                          	</span>  
	                             			</span>
	                             			<input type="hidden" name="specnames" value="{{ x.name }}" />
						                    <input type="hidden" name="specvals" id="guigehidden" class="specvals" />
                              			</li>
							  			<li>
							  				<span class="datespan">&nbsp;</span>
							  				<span class="addcar">
												<input name="input" type="button" value="添加到购物车" onclick="add_cart();" style="background-color: blue" />
											</span>
											<span class="atonce">
												<input name="input" type="button" value="立刻购买" onclick="buy_goods();" style="background-color: aqua" />
											</span>
											<div class="goodscar" style="display:none;z-index:999;">
								  				<div>
								  					<a href="javascript:void(0);" onclick="javascript:jQuery('.goodscar').hide();" class="closed"><img src="./商品详情_files/closed.jpg" width="12" height="12"></a>
								  				</div>
								  				<ul>
													<li>已成功添加到购物车！</li>
													<li>购物车共有<strong class="orange" id="cart_goods_count">0</strong> 种宝贝，合计：¥ <strong class="orange" id="cart_goods_totalprice">0.00</strong></li>
													<li><a href="javascript:if(confirm('您尚未登录，现在登录?'))window.location.href='http://localhost:8080/user/login.htm?url=http://localhost:8080/goods_cart1.htm'" class="go_cart">立刻结算</a></li>
								  				</ul>
											</div>
							  			</li>
									</ul>
						  		</div>
						  		<div class="Close" id="goods_spec_info_close" style="display:none;"><a href="javascript:void(0);">X</a></div>
							</div>
					 	</div>
					</div>
				</div>
			</form>
		</div>
		<div class="shop_index_box">
			<script>
				jQuery(function(jQuery){
					jQuery(".collection a").click(function(){
					});
					jQuery("span[id^=ugc_]").css("cursor","pointer").click(function(){
						var ugc_type=jQuery(this).attr("ugc_type");
						var ugc_id=jQuery(this).attr("ugc_id");
						if(ugc_type=="show"){
							jQuery(this).find("img").attr("src","http://localhost:8080/resources/style/shop/default/images/add.jpg");
							jQuery("#ugc_child_"+ugc_id).hide();
							jQuery(this).attr("ugc_type","hide");
						}else{
							jQuery(this).find("img").attr("src","http://localhost:8080/resources/style/shop/default/images/add2.jpg");
							jQuery("#ugc_child_"+ugc_id).show();
							jQuery(this).attr("ugc_type","show");
						}
					});
				});
			</script>
			<!-- 商品详情左侧部分的商品分类 -->
			<div class="shopindex_left"></div>
			<!-- 详情 -->
			<div class="shopindex_right">
				<div class="switch_bar" id="switch_bar" style="position: absolute; top: 30px; z-index: 100;">
					<span class="sbar_open" style="display:none" cursor="pointer">
						<a class="sbar_open_btn" href="javascript:void(0);"></a>
					</span>
					<span class="sbar_close" cursor="pointer">
						<a class="sbar_close_btn" href="javascript:void(0);"></a>
					</span>
				</div>
				<!-- 详情信息  -->
				<div class="shopselled" id="goods_anchor" name="goods_anchor">
					<div class="selled" id="goods_tab" style="position: relative; top: 0px; background: rgb(255, 255, 255); border-bottom: none; overflow: visible;">
						<ul class="selled_ul">
							<!-- 详情分类 种类 -->
						  	<li class="this" id="details" uri="http://localhost:8080/goods_detail.htm?goods_id=98595&amp;id=32816" style="cursor:pointer"><a href="http://localhost:8080/goods_98595.htm#goods_anchor">商品详情</a></li>
							<!--<li id="evaluation" uri="http://localhost:8080/goods_evaluation.htm?goods_id=98595&amp;id=32816"><a href="http://localhost:8080/goods_98595.htm#goods_anchor">评价详情</a></li>
							<li id="strike" uri="http://localhost:8080/goods_order.htm?goods_id=98595&amp;id=32816"><a href="http://localhost:8080/goods_98595.htm#goods_anchor">成交记录</a></li>
							<li id="advice" uri="http://localhost:8080/goods_consult.htm?goods_id=98595&amp;id=32816"><a href="http://localhost:8080/goods_98595.htm#goods_anchor">产品咨询</a></li>
							-->
						</ul>
						<span class="selled_kf" style="display: none;">
							<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=291515595&amp;Site=291515595&amp;Menu=yes"><img alt="点击这里给我发消息" src="./商品详情_files/pa"></a> 
						</span> 
					</div>
				  	<div class="img_center_load" style="display:none;text-align:center; padding-top:5px;"> 
						<img height="28" width="28" src="./商品详情_files/loader.gif" /> 
				  	</div>
					<div class="selleddetails">
						<!-- {{ goods.details }} -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--滚动条滚动事件-->
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
	<!--滚动条滚动事件end-->
	<!--返回最顶部-->
	<div class="back_box" style="width: 50px; height: 50px; position: fixed; bottom: 180px; right: 25px; display: none;">
		<div class="back_index"><a href="http://localhost:8080/index.htm" target="_blank" title="返回主页"></a></div>
		<div class="back_top"><a id="toTop" href="http://localhost:8080/goods_98595.htm#" bosszone="hometop" style="display: block;" onclick="window.scrollTo(0,0);return false" title="返回顶部" target="_self"></a></div>
	</div>
</div>
<img src="./商品详情_files/9f90d29c-c17a-4d6d-bb30-5d730ae3407e.jpg" style="position: absolute; border: 0px; display: none; left: -5000px; top: 0px;" />
</body>
</html>