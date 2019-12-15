<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0075)http://localhost:8080/showfloot;jsessionid=D8B3A0D9B7F8180C8B187945123F755F -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Powered by shopping</title>
<meta name="keywords" content="shopping1,shopping2">
<meta name="description" content="shopping1,shopping2">
<meta name="generator" content="shopping 2.0">
<meta name="author" content="www.shopping.com">
<meta name="copyright" content="shopping Inc. All Rights Reserved">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta property="wb:webmaster" content="3c0d2bedd819ab1c">
<link href="/css/public.css" type="text/css" rel="stylesheet">
<link href="/css/public_auto.css" type="text/css" rel="stylesheet">
<link href="/css/index.css" type="text/css" rel="stylesheet">
<script src="/js/jquery-1.6.2.js"></script>
<script src="/js/DataLazyLoad.min.js"></script>
<script src="/js/jquery.lazyload.js"></script>
<script src="/js/jquery.SuperSlide.2.1.1.js"></script>
<script src="/js/jquery.shop.common.js"></script>
<script src="/js/jquery.validate.min.js"></script>
<script src="/js/jquery-ui-1.8.21.js"></script>
<script src="/js/jquery.shop.validate.js"></script>
<script src="/js/jquery.KinSlideshow.min.js"></script>
<script>
jQuery(document).ready(function(){
	jQuery(".sale_two_img img").lazyload({effect:"fadeIn",width:150,height:150});
  	//鼠标经过推荐商品tab
 	jQuery("#index_sale_tab ul li").mouseover(function(){								 
		jQuery(this).siblings().removeClass("this");
		jQuery(this).addClass("this");
		var i = jQuery(this).index();
		jQuery("#index_sale_tab").siblings().hide();
		jQuery("#index_sale_tab").siblings().eq(i).show();
		jQuery("#sale_change").attr("mark",jQuery(this).attr("id").replace("goodscase",""));	
	});
  
  /* jQuery(".shop_left_btn_con li").mouseover(function(){
	var child_count = jQuery(this).attr("child_count");
	if(child_count>0){
	 var id=jQuery(this).attr("id");
     jQuery("#child_"+id).show();			
	}
  }).mouseleave(function(){
	 var child_count = jQuery(this).attr("child_count");
	if(child_count>0){ 
     var id=jQuery(this).attr("id");
     jQuery("#child_"+id).hide();
	}
  });
  jQuery(".specialde li").mouseover(function(){
     jQuery(this).find("i").show();
  }).mouseleave(function(){
     jQuery(this).find("i").hide();
  });
  jQuery(".productone ul").mouseover(function(){
    jQuery(".productone ul").removeClass("this");
	jQuery(this).addClass("this");
  }).mouseleave(function(){
    jQuery(".productone ul").removeClass("this");
  }); */
  
  //广告图片懒加载
  /* jQuery(".flr_advertisment img").lazyload({effect:"fadeIn",width:156,height:156});
  jQuery(".rank_advertisment img").lazyload({effect:"fadeIn",width:205,height:205});
  jQuery(".brand_bottom_adv img").lazyload({effect:"fadeIn",width:288,height:127});
  jQuery(".floor_brand img").lazyload({effect:"fadeIn",width:98,height:35}); */
  //团购图片轮播懒加载
	jQuery(".goods_tab img").lazyload({effect:"fadeIn",width:210,height:210});
  //楼层懒加载
	jQuery(".floor_main img").lazyload({effect:"fadeIn",width:147,height:147});
  
 //
	jQuery(".index_sales_left>h3>ul>li").mouseover(function(){
    jQuery(".index_sales_left>h3>ul>li").removeClass("this");
	jQuery(this).addClass("this");
	jQuery(".index_sales_box>[class^=index_sales_]").hide();
	var div_index=jQuery(this).attr("div_index");
	jQuery(".index_sales_"+div_index).show();
	});

  //
	var size="4";
	if(size>0){
	jQuery("html").scrollTop(0);	//刷新页面返回顶部	
	//Call DataLazyLoad
	jQuery("#floors .floor_main").DataLazyLoad({load : function(page, unLocked) {
		var html = '';
		var max = 4+1;
		var count = page-1;
		var id =jQuery(".floor_main[count="+count+"]").attr("id");
		var load_url =jQuery(".floor_main[count="+count+"]").attr("load_url");
		//Generate the data
		jQuery.get("http://localhost:8080/"+load_url,{"id":id,"count":count},function(data){
					html += data;
					jQuery(html).appendTo('#floors .floor_main[count='+count+']');
					/* jQuery(".floorclass img").lazyload({effect:"fadeIn",width:147,height:147});
					jQuery(".ranking img").lazyload({effect:"fadeIn",width:73,height:73}); */
					//鼠标经过楼层tab时
					jQuery(".floorul li").mouseover(function(){
						var store_gc=jQuery(this).attr("store_gc");
					    jQuery(".floorul li[store_gc="+store_gc+"]").css("cursor","pointer").removeClass("this");
						jQuery(this).addClass("this");
					    var id=jQuery(this).attr("id");
						jQuery(".ftab[store_gc="+store_gc+"]").hide();
						jQuery(".ftab[store_gc="+store_gc+"][id="+id+"]").show();
					});
					//Check whether to end
					page = page >= max ? 0 : page + 1;
					//To prevent repeated load, The first parameter to the next page, No page is 0
					unLocked(page);
			},"text");
	  }});
  }else{
	//jQuery("#toolbar").load("toolbar.htm");	 
  }
  
  jQuery(window).scroll(function(){
	var top = jQuery(document).scrollTop();
	//楼层导航跟随
	jQuery(".back_floor").css("display","none");
	jQuery("li[floor_id^=floor_] b").css("display","block");
	jQuery("div[id^=floor_]").each(function(){//循环每一个楼层
	    var floor_top=jQuery(this).offset().top-top;
		 if(floor_top<=580&&floor_top>=0){//如果到达一个位置
			  var floor_id=jQuery(this).attr("id");
			  if(jQuery("li[floor_id="+floor_id+"] b").css("display","none"))
			  {
				jQuery(".back_floor").css("display","block");  
			  }
	 }
	});
  });	
  
  //back_floor
  jQuery(".back_floor>ul>li").click(function(){
  	 var id=jQuery(this).attr("floor_id");
     var top = jQuery("#"+id).offset().top-80;
     jQuery('body,html').animate({scrollTop:top},1000);
  });
  
  var l=jQuery(".main").offset().left;
  jQuery(".back_box_x").css("left",l-43+"px");
  
});

jQuery(window).resize(function() {
   var l=jQuery(".main").offset().left;
   jQuery(".back_box_x").css("left",l-43+"px");
});

/* var recommend_goods_random=1;//随机次数
function switch_recommend_goods(){
  jQuery.ajax({type:'POST',url:'http://localhost:8080/switch_recommend_goods.htm',data:{"recommend_goods_random":recommend_goods_random},
			  beforeSend:function(){
				     jQuery(".limishop_hidden").empty();
					 jQuery("#store_reommend_goods").html("<div style='width:100%;height:301px;text-align:center;'><img src='http://localhost:8080/resources/style/common/images/loader.gif' style='margin-top:145px;' /></div>");
				  },
			  success:function(html){
	                      jQuery("#store_reommend_goods").html(html);
	                      recommend_goods_random++;
	                      if(recommend_goods_random>2.0){
                              recommend_goods_random=1;
	                       }
					  }
			 });
} */

</script>
</head>
<body>
<!--低版本提示-->
<!--[if IE 6]>
<div class="top_tipe">
	<div class="top_tipe_center">
    	<em><img src="http://localhost:8080/resources/style/system/front/default/images/ie6_warning.png" style="height:16px; width:16px;"/></em><b>温馨提示：您当前使用的浏览器版本过低，兼容性和安全性较差，建议您升级：</b><em><img src="http://localhost:8080/resources/style/system/front/default/images/ie_b.png"/></em><b><a href="http://windows.microsoft.com/zh-cn/internet-explorer/download-ie?tp=1.0.0.0.0.KdMt0Yu">IE8浏览器</a>或</b><em><img src="http://localhost:8080/resources/style/system/front/default/images/google_b.png" /></em><b><a href="http://www.google.cn/intl/zh-CN/chrome/">谷歌浏览器</a></b>
        <span><a href="javascript:void(0);" onclick="javascript:jQuery('.top_tipe').hide();">x</a></span>
    </div>
</div>
<![endif]-->

<div class="top" style="">
  <div class="top_page">
    <div class="pageright" id="site-nav">
      <ul class="quick-menu">
        <li class="mytaobao menu-item menupx">
          <div class="menu"> <a class="menu-hd" href="http://localhost:8080/buyer/index.htm" rel="nofollow">我的订单<b></b></a>
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
          <div class="menu"> <a class="menu-hd" href="http://localhost:8080/seller/index.htm" rel="nofollow">商家支持<b></b></a>
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
							     jQuery("#cart_goods_top_info").empty().html('<div class="menu-bd-panel"><div style="text-align:center;"><img src="/img/loader.gif" /></div></div>');
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
	          	<div class="menu-bd" id="cart_goods_top_info" style="display: none;">
	            	<div class="menu-bd-panel">
	            		<div style="text-align:center;"><img src="/img/loader.gif">
	            		</div>
	            	</div>
	            </div>
	          </div>
	        </li>
	        <li class="menupx"><a href="http://localhost:8080/buyer/message.htm">站内短信</a></li>	
			<li class="mytaobao menu-item menupx">
	          <div class="menu"> <a class="menu-hd" href="http://localhost:8080/buyer/favorite_goods.htm" rel="nofollow">收藏夹<b></b></a>
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
    <span>
		<c:if test="${sessionScope.currentusername != null }">
			${sessionScope.currentusername }		
		</c:if>
		<c:if test="${sessionScope.currentusername == null }">
			亲
		</c:if>
		，欢迎来到缘来小镇商城！
	</span>

	<c:if test="${sessionScope.currentusername == null }">
		<span class="pxlr"><a href="/denglu.jsp" class="lightblue">登录</a></span><span class="pxlr">或</span><span class="pxlr"><a href="http://localhost:8080/register.htm" class="lightblue">注册</a></span> </div>
	</c:if>



  </div>
  </div>
</div>

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
    jQuery("#type").val(type);
  }
  jQuery("#searchForm").submit();	
  jQuery("#keyword").val("");
}
</script>

<!--   
  <div class="top_banner clearFix">
  	<img src="http://localhost:8080/upload/advert/topbanner.jpg">
  </div>
 -->
<!--[if lt IE 9]>
    <script src="http://localhost:8080/resources/js/css3-mediaqueries.js"></script>
<![endif]-->

<!-- 搜索框 -->
<div id="header_form">
  <script src="/js/jquery.cookie.js"></script>
  <div id="head_h" class="head_width">
	  <div class="head clearFix">
	    <div class="logo"> 
	     <a href="http://localhost:8080/index.htm"> 
	     <img width="200" height="90" src="/img/阿里巴巴.jpg" border="0"> 
	     </a>  
	     </div>
		 <div class="searchForm">
		    <form action="goodsfirstpage.htm" method="post" id="searchForm">
			  	<input name="type" type="hidden" id="type" value="goods">
			    <div class="toph_bigsearch">
					<div class="toph_sear">
						<ul class="toph_bgsear">
							<li class="this" type="goods"><a href="javascript:void(0);">宝贝<s></s></a></li>
							<li style="display: none;" type="store"><a href="javascript:void(0);">店铺</a></li>
						</ul>
						<input name="keyword" type="text" id="keyword" placeholder="搜索其实真的很简单！" x-webkit-speech="" lang="zh-CN" onwebkitspeechchange="jQuery('#searchForm').submit()" class="toph_sear_txt">
						<input type="submit" value="搜索" style="cursor:pointer;" class="toph_sear_btn">					
					</div>
			    </div>
		    </form>
	    </div>
	  </div>
  </div>
</div>
<!-- 搜索框 end  -->
<div id="nav">
<script>
jQuery(document).ready(function(){
  jQuery("#navul li").each(function(){
    var original_url=jQuery(this).attr("original_url");
	if("/index.htm".indexOf(original_url)>=0){
	   jQuery(this).addClass("this");
	}
  });
  //
  jQuery(".left_menu_dl").live("mouseover",function(){
    var sc_id=jQuery(this).attr("id");
	var sc_color=jQuery(this).attr("sc_color");
	var child_count = jQuery(this).attr("child_count");
	var eq =jQuery(this).index();
	/*if(jQuery(".left_menu_dd[id=child_"+sc_id+"]").html()==null){
	  jQuery.ajax({type:'POST',url:'http://localhost:8080/nav_data.htm',data:{"sc_id":sc_id},
	  	  success:function(data){
			if(jQuery(".left_menu_dd[id=child_"+sc_id+"]").html()==null){																						
	      	  jQuery(".left_menu_dt[id=dts_"+sc_id+"]").after(data);
			}
		    if(child_count>0){
			  jQuery("#dts_"+sc_id).addClass("left_menu_this").removeClass("left_menu_dt");
			  jQuery("#child_"+sc_id).show();			
			}
			jQuery("#left_menu_con_"+sc_id).attr("style","border:1px solid "+sc_color+"; border-left:1px solid "+sc_color+";").find(".menu_con_right_top").css("background-color",sc_color);
		    var z = -35;
	    	var x = eq*z;
		    jQuery("#left_menu_con_"+sc_id).css('margin-top',x+'px');
			jQuery(".left_menu_dd[id=child_"+sc_id+"]").show();
		 }});
	}else{
	   if(child_count>0){
		  jQuery("#dts_"+sc_id).addClass("left_menu_this").removeClass("left_menu_dt");
		  jQuery("#child_"+sc_id).show();			
		}
		jQuery("#left_menu_con_"+sc_id).attr("style","border:1px solid "+sc_color+"; border-left:1px solid "+sc_color+";").find(".menu_con_right_top").css("background-color",sc_color);
	    var z = -35;
    	var x = eq*z;
	    jQuery("#left_menu_con_"+sc_id).css('margin-top',x+'px');
		jQuery(".left_menu_dd[id=child_"+sc_id+"]").show();
	} */
	if(child_count>0){
	  jQuery("#dts_"+sc_id).addClass("left_menu_this").removeClass("left_menu_dt");
	  jQuery("#child_"+sc_id).show();			
	}
	jQuery("#left_menu_con_"+sc_id).attr("style","border:1px solid "+sc_color+"; border-left:1px solid "+sc_color+";").find(".menu_con_right_top").css("background-color",sc_color);
    var z = -35;
   	var x = eq*z;
    jQuery("#left_menu_con_"+sc_id).css('margin-top',x+'px');
	jQuery(".left_menu_dd[id=child_"+sc_id+"]").show();
	
  }).live("mouseleave",function(){
      jQuery("dt[id^=dts_]").removeAttr("style");
	  jQuery("div[id^=left_menu_con_]").removeAttr("style"); 
	  var child_count = jQuery(this).attr("child_count");
	  jQuery("dt[id^=dts_]").removeClass("left_menu_this").addClass("left_menu_dt");	  
	  jQuery(".left_menu_dd[id^=child_]").hide();
  }); 
  //
});

</script>
	<div class="nav">
		<div class="nav_center">
		
		
		<!-- 三级联动 begin -->
	
    <div class="nav_left">
    
      <h2><a href="http://localhost:8080/goods_class.htm"><span>全部分类<em><img src="/img/nav_left.png"></em></span></a></h2>
   
      <div class="index_topleft">
   
        <div id="left_menu" class="left_menu">     
        
        <!-- 一 级菜单 -->     
        <c:forEach items="${requestScope.classforfirstpage }" var="tmp">	
			<dl sc_color="#E60012" style="position:relative;" id="${tmp.id }" child_count="5" class="left_menu_dl">
				 <!-- 标题 -->
	            <dt id="dts_${tmp.id }" class="left_menu_dt">
		            <i class="left_menu_i"><img width="16" height="16" src="/img/icon_6.png"></i>
		            <strong class="left_menu_str">
		            	<a href="findallgoods.htm?level=0&goodsclassid=${tmp.id }">${tmp.name }</a>
		            </strong> 
	            </dt>
	            <!-- 内容 -->
				<dd id="child_${tmp.id }" style="display: none;" class="left_menu_dd">
				    <div id="left_menu_con_15" class="left_menu_con this "> 
						<span class="left_menu_sp">
							<div class="left_menu_con_center">
							
								<div class="menu_con_right_top" style="background-color: rgb(230, 0, 18);">
									<dl>		
									  <dt>	
									  		<!-- 二级横向 -->				  
										<c:forEach items="${tmp.list }" var="tmp1">
											<span>
											<a href="findallgoods.htm?level=1&goodsclassid=${tmp1.id }">${tmp1.name }</a>
											</span>  
										</c:forEach>
										 	<!-- 二级横向结束 -->				  				  	 							   			
									</dt>						
									</dl>
								</div>
								<div class="left_menu_con_center_left">
									<!-- 二级竖向 -->
									<c:forEach items="${tmp.list }" var="tmp1">
										<dl>
											  <dt>
											  <b> &gt; </b>
											  <a href="findallgoods.htm?level=1&goodsclassid=${tmp1.id }">${tmp1.name }</a>
											  </dt>
												<dd>
													<!-- 三级开始 -->
													<c:forEach items="${tmp1.list }" var="tmp2">
														<a href="findallgoods.htm?level=2&goodsclassid=${tmp2.id }">${tmp2.name }</a>
													</c:forEach>
													<!-- 三级结束 -->	
												</dd>
										</dl>
									</c:forEach>
									<!--二级竖向结束 -->	
								</div>
							</div>
						</span>
				  	</div>
				</dd>
			        </dl>	
			 </c:forEach>
			 <!-- 一级菜单结束 -->
			 </div>       			        			        	
		</div>
      </div>
    </div>
	<!-- 三级联动 end -->
	  
		<!-- 导航栏 -->
	    <ul id="navul">
	    	<li><a id="65537" target="_blank" original_url="index.htm" href="http://localhost:8080/index.htm"><span>首页</span></a></li>
	  	    <li><a id="65538" target="_blank" original_url="brand.htm" href="http://localhost:8080/brand.htm"><span>品牌</span></a></li>
	  	    <li><a id="229389" target="_blank" original_url="integral.htm" href="http://localhost:8080/integral.htm"><span>积分商城</span></a></li>
	  	    <li><a id="229385" target="_blank" original_url="group.htm" href="http://localhost:8080/group.htm"><span>团购</span></a></li>
	  	    <li><a id="229387" target="_blank" original_url="delivery.htm" href="http://localhost:8080/delivery.htm"><span>买就送</span></a></li>
	  	    <li><a id="229380" target="_blank" original_url="sparegoods.htm" href="http://localhost:8080/sparegoods.htm"><span>闲置</span></a></li>
	
	    </ul> 
	</div>
</div>
<!-- 轮播图 -->
<script src="/firstpage.htm">
</script>
<script>jQuery('document').ready(function()
		{
			//window.location.href = "firstpage.htm";
			jQuery('.top_mid_slide').slide({mainCell:'.top_mid_slider_ul',titCell:'.banner_top li',titOnClassName:'this',trigger:'mouseover',autoPlay:true});
		
		});
</script>
<div class="top_mid_slide">
	<!-- 轮播图的图  -->
	<ul class="top_mid_slider_ul">
	<c:forEach items="${requestScope.advlist }" var="tmp"> 
		<li class="top_mid_slider_ul_li" style="background: url(/img1/${tmp.img }) 50% 0% no-repeat red; width: 100%; height: 490px; display: list-item;">
			<a style="display:block;height:420px; width:100%;" href="/advimgurl.htm?img=${tmp.img }";id=65536">
			</a>
		</li>
	</c:forEach>
	</ul>
	<!-- 轮播图的图  -->
	
	<!-- 轮播图5个点 -->
	<div class="banner_top">
		<ul>
			<li class="this" style="cursor:pointer;">
			</li>
			<li style="cursor:pointer;" class="">
			</li>
			<li style="cursor:pointer;" class="">
			</li>
			<li style="cursor:pointer;" class="">
			</li>
			<li style="cursor:pointer;" class="">
			</li>
		</ul>
	</div>
	<!-- 轮播图5个点  -->
</div> 
<div class="main">
  <div class="index">
  	<div class="top_index">
	    <div class="top_mid">
	      <div class="top_mid">
	        <div class="banner_nothing">
	        </div>        
	      </div>
	    </div>
	    <div class="top_mid_right">
	      	<style>
	      	.phone_txt.error{width: 120px;
							height: 20px;
							line-height: 20px;
							border: 1px solid #f00;}
			</style>
		      <script>
			  jQuery(function(){ 
			     
				 jQuery(".top_mid_nav div").css("cursor","pointer").mouseover(function(){
				    var target_tab_id=jQuery(this).attr("target_tab_id");
					jQuery(".top_mid_nav div").removeClass("this");
					jQuery(this).addClass("this");
					jQuery("#news_tab").hide();
					jQuery("#group_tab").hide();
					jQuery("#"+target_tab_id).show();
				 });
				 //
				 jQuery(".group_tab").slide({mainCell:".top_regiment ul",autoPlay:true,interTime:3000,prevCell:".top_mid_regiment_img_left",nextCell:".top_mid_regiment_img_right"});
				 jQuery(".goods_tab").slide({mainCell:".top_regiment ul",autoPlay:true,interTime:3000,prevCell:".top_mid_regiment_img_left",nextCell:".top_mid_regiment_img_right"});
				 //
				 jQuery(".top_regiment").mouseenter(function(){
				    jQuery(".top_mid_regiment_img_left").show();
					jQuery(".top_mid_regiment_img_right").show();
				 }).mouseleave(function(){
			        jQuery(".top_mid_regiment_img_left").hide();
					jQuery(".top_mid_regiment_img_right").hide();
				 });
			  })
			  </script>
			 
		       <!-- top_mid_phone end -->
	      
	    </div>
	    <!-- top_mid_right end -->
    
  </div>
  <!-- top_index end -->
  

    <!-- 中间广告 -->
    <!-- <script src="http://localhost:8080/advert_invoke.htm?id=4"></script> -->
    
    <!-- 楼层 -->
    
<div id="floors">

		<div load_url="floor_ajax.htm" id="131090" count="1" class="floor_main">
		<div class="floor floor_orange">
		<div class="floor_box" id="floor_1">
			<div class="floor_menu">
				<div class="title">
					<!-- 楼层名 -->
					<div class="txt-type">
						<span>1</span>
						<h2 title="????">膨化食品</h2>
					</div>
					<!-- 楼层名end -->
				</div>
				<!--  楼层左 -->
				<div class="flr_m_details">
				   <!-- 楼层文字 -->
					<!--<ul class="flr_m_du">
						<li>
							<h4>
								<a href="http://localhost:8080/store_goods_list_65686.htm">?? ??</a>
							</h4>
							<p>
								<span>
									<a href="http://localhost:8080/store_goods_list_65696.htm" target="_blank">奶粉系列</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65697.htm" target="_blank">辅食系列</a>
								</span>
							</p>
						</li>
						<li>
							<h4>
								<a href="http://localhost:8080/store_goods_list_65714.htm">哺育用品</a>
							</h4>
							<p>
								<span>
									<a href="http://localhost:8080/store_goods_list_65722.htm" target="_blank">奶瓶/奶嘴</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65723.htm" target="_blank">调理用具</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65724.htm" target="_blank">安抚奶嘴/牙胶</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65725.htm" target="_blank">奶刷/奶夹</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65726.htm" target="_blank">吸奶器</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65727.htm" target="_blank">清洁消毒</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65728.htm" target="_blank">保温器具</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65729.htm" target="_blank">婴儿用品收纳</a>
								</span>
							</p>
						</li>
						<li>
							<h4>
								<a href="http://localhost:8080/store_goods_list_65753.htm">感官认知</a>
							</h4>
							<p>
								<span>
								<a href="http://localhost:8080/store_goods_list_65759.htm" target="_blank">床铃</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65760.htm" target="_blank">摇铃</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65761.htm" target="_blank">布书布玩</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65762.htm" target="_blank">波浪鼓</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65763.htm" target="_blank">手偶/安抚玩偶</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65764.htm" target="_blank">爬行/游戏垫</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65765.htm" target="_blank">健身架</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65766.htm" target="_blank">手推学步</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65767.htm" target="_blank">拖拉学步</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65768.htm" target="_blank">游戏毯</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65769.htm" target="_blank">幼儿学爬</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65770.htm" target="_blank">叠叠乐/不倒翁/手抓球</a>
								</span>
							</p>
						</li>
						<li>
							<h4>
								<a href="http://localhost:8080/store_goods_list_65713.htm">防尿用品</a>
							</h4>
							<p>
								<span>
								<a href="http://localhost:8080/store_goods_list_65717.htm" target="_blank">纸尿裤</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65718.htm" target="_blank">尿布/尿垫</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65719.htm" target="_blank">婴儿湿巾</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65720.htm" target="_blank">成人纸尿裤</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65721.htm" target="_blank">婴儿纸巾</a>
								</span>
							</p>
						</li>
					</ul>-->
					<div class="flr_advertisment">
					<!-- 楼层图片 -->
						<div style="float:left;overflow:hidden;">
							<a href="http://localhost:8080/www.baidu.com" target="_blank">
								<img width="200" height="200" src="/img/pp.png" url="www.baidu.com">
							</a>
						</div>
					</div>
				</div>
				<!--  楼层左 end -->
			</div>		
		<div class="floorclass">
		
			<ul class="floorul">
				<li class="this" style="cursor:pointer;" id="131091" store_gc="131090">儿童
				<s></s>
				
				
				<!--</li>
				<li style="cursor:pointer;" id="131092" store_gc="131090">衣服鞋帽
				<s></s>
				</li>
				<!--<li style="cursor:pointer;" id="131093" store_gc="131090">玩具
				<s></s>
				</li>-->
			
			</li></ul>
			
			<!-- 楼中-儿童 -->
			
			<div id="131091" store_gc="131090" class="ftab">
				<div class="ftabone">
					<div class="classpro">
					 
						<div class="productone">
							<ul class="this">
								<li>
									<span class="center_span">
										<p>
											<a href="https://item.taobao.com/item.htm?spm=a230r.1.14.183.294a1efczRnn8C&amp;id=536924503874&amp;ns=1&amp;abbucket=11#detail" target="_blank">
												<img width="235" height="235" src="/img/chocolate.png">								
											</a>
										</p>
									</span>
								</li>
								<li class="pronames">
								<a href="https://item.taobao.com/item.htm?spm=a230r.1.14.183.294a1efczRnn8C&amp;id=536924503874&amp;ns=1&amp;abbucket=11#detail" target="_blank">巧克力</a>
								</li>
								<li>
								<span class="hui2">市场价：</span>
								<span class="through hui">¥50</span>
								</li>
								<li>
								<span class="hui2">商城价：</span>
								<strong class="red">¥10</strong>
								</li>
							</ul>
							</div>
					 
						<div class="productone">
							<ul class="this">
								<li>
									<span class="center_span">
										<p>
											<a href="https://item.taobao.com/item.htm?spm=a230r.1.14.57.27dd2a9d2WFOKG&amp;id=541758726100&amp;ns=1&amp;abbucket=11#detail" target="_blank">
												<img width="235" height="235" src="/img/lsf.png">								
											</a>
										</p>
									</span>
								</li>
								<li class="pronames">
								<a href="https://item.taobao.com/item.htm?spm=a230r.1.14.57.27dd2a9d2WFOKG&amp;id=541758726100&amp;ns=1&amp;abbucket=11#detail" target="_blank">螺蛳粉</a>
								</li>
								<li>
								<span class="hui2">市场价：</span>
								<span class="through hui">¥23</span>
								</li>
								<li>
								<span class="hui2">商城价：</span>
								<strong class="red">¥18</strong>
								</li>
							</ul>
							</div>
					 
						<div class="productone">
							<ul class="this">
								<li>
									<span class="center_span">
										<p>
											<a href="https://detail.tmall.com/item.htm?spm=a230r.1.14.119.356336detgZnTF&amp;id=546034617098&amp;ns=1&amp;abbucket=11" target="_blank">
												<img width="235" height="235" src="/img/xlx.png">								
											</a>
										</p>
									</span>
								</li>
								<li class="pronames">
								<a href="https://detail.tmall.com/item.htm?spm=a230r.1.14.119.356336detgZnTF&amp;id=546034617098&amp;ns=1&amp;abbucket=11" target="_blank">小龙虾</a>
								</li>
								<li>
								<span class="hui2">市场价：</span>
								<span class="through hui">¥500</span>
								</li>
								<li>
								<span class="hui2">商城价：</span>
								<strong class="red">¥200</strong>
								</li>
							</ul>
							</div>
					 
						<div class="productone">
							<ul class="this">
								<li>
									<span class="center_span">
										<p>
											<a href="https://item.taobao.com/item.htm?spm=a230r.1.14.48.140834a60lTKkS&amp;id=583629254853&amp;ns=1&amp;abbucket=11#detail" target="_blank">
												<img width="235" height="235" src="/img/dafu.png">								
											</a>
										</p>
									</span>
								</li>
								<li class="pronames">
								<a href="https://item.taobao.com/item.htm?spm=a230r.1.14.48.140834a60lTKkS&amp;id=583629254853&amp;ns=1&amp;abbucket=11#detail" target="_blank">大福</a>
								</li>
								<li>
								<span class="hui2">市场价：</span>
								<span class="through hui">¥20</span>
								</li>
								<li>
								<span class="hui2">商城价：</span>
								<strong class="red">¥10</strong>
								</li>
							</ul>
							</div>
					 
						<div class="productone">
							<ul class="this">
								<li>
									<span class="center_span">
										<p>
											<a href="https://detail.tmall.com/item.htm?spm=a230r.1.14.13.4f138a3eOdSBqe&amp;id=576082846608&amp;cm_id=140105335569ed55e27b&amp;abbucket=11" target="_blank">
												<img width="235" height="235" src="/img/swy.png">								
											</a>
										</p>
									</span>
								</li>
								<li class="pronames">
								<a href="https://detail.tmall.com/item.htm?spm=a230r.1.14.13.4f138a3eOdSBqe&amp;id=576082846608&amp;cm_id=140105335569ed55e27b&amp;abbucket=11" target="_blank">三文鱼</a>
								</li>
								<li>
								<span class="hui2">市场价：</span>
								<span class="through hui">¥1000</span>
								</li>
								<li>
								<span class="hui2">商城价：</span>
								<strong class="red">¥100</strong>
								</li>
							</ul>
							</div>
					
						</div>
					</div>
				</div>
				
			</div>
			<!-- 楼中-儿童 end -->	
		</div>
		</div>
		</div>
		
		<div load_url="floor_ajax.htm" id="131090" count="1" class="floor_main">
		<div class="floor floor_orange">
		<div class="floor_box" id="floor_1">
			<div class="floor_menu">
				<div class="title">
					<!-- 楼层名 -->
					<div class="txt-type">
						<span>2</span>
						<h2 title="????">化妆品</h2>
					</div>
					<!-- 楼层名end -->
				</div>
				<!--  楼层左 -->
				<div class="flr_m_details">
				   <!-- 楼层文字 -->
					<!--<ul class="flr_m_du">
						<li>
							<h4>
								<a href="http://localhost:8080/store_goods_list_65686.htm">?? ??</a>
							</h4>
							<p>
								<span>
									<a href="http://localhost:8080/store_goods_list_65696.htm" target="_blank">奶粉系列</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65697.htm" target="_blank">辅食系列</a>
								</span>
							</p>
						</li>
						<li>
							<h4>
								<a href="http://localhost:8080/store_goods_list_65714.htm">哺育用品</a>
							</h4>
							<p>
								<span>
									<a href="http://localhost:8080/store_goods_list_65722.htm" target="_blank">奶瓶/奶嘴</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65723.htm" target="_blank">调理用具</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65724.htm" target="_blank">安抚奶嘴/牙胶</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65725.htm" target="_blank">奶刷/奶夹</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65726.htm" target="_blank">吸奶器</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65727.htm" target="_blank">清洁消毒</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65728.htm" target="_blank">保温器具</a>
								</span>
								<span>
									<a href="http://localhost:8080/store_goods_list_65729.htm" target="_blank">婴儿用品收纳</a>
								</span>
							</p>
						</li>
						<li>
							<h4>
								<a href="http://localhost:8080/store_goods_list_65753.htm">感官认知</a>
							</h4>
							<p>
								<span>
								<a href="http://localhost:8080/store_goods_list_65759.htm" target="_blank">床铃</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65760.htm" target="_blank">摇铃</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65761.htm" target="_blank">布书布玩</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65762.htm" target="_blank">波浪鼓</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65763.htm" target="_blank">手偶/安抚玩偶</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65764.htm" target="_blank">爬行/游戏垫</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65765.htm" target="_blank">健身架</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65766.htm" target="_blank">手推学步</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65767.htm" target="_blank">拖拉学步</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65768.htm" target="_blank">游戏毯</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65769.htm" target="_blank">幼儿学爬</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65770.htm" target="_blank">叠叠乐/不倒翁/手抓球</a>
								</span>
							</p>
						</li>
						<li>
							<h4>
								<a href="http://localhost:8080/store_goods_list_65713.htm">防尿用品</a>
							</h4>
							<p>
								<span>
								<a href="http://localhost:8080/store_goods_list_65717.htm" target="_blank">纸尿裤</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65718.htm" target="_blank">尿布/尿垫</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65719.htm" target="_blank">婴儿湿巾</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65720.htm" target="_blank">成人纸尿裤</a>
								</span>
								<span>
								<a href="http://localhost:8080/store_goods_list_65721.htm" target="_blank">婴儿纸巾</a>
								</span>
							</p>
						</li>
					</ul>-->
					<div class="flr_advertisment">
					<!-- 楼层图片 -->
						<div style="float:left;overflow:hidden;">
							<a href="http://localhost:8080/www" target="_blank">
								<img width="200" height="200" src="/img/pp.png" url="www">
							</a>
						</div>
					</div>
				</div>
				<!--  楼层左 end -->
			</div>		
		<div class="floorclass">
		
			<ul class="floorul">
				<li class="this" style="cursor:pointer;" id="131091" store_gc="131090">儿童
				<s></s>
				
				
				<!--</li>
				<li style="cursor:pointer;" id="131092" store_gc="131090">衣服鞋帽
				<s></s>
				</li>
				<!--<li style="cursor:pointer;" id="131093" store_gc="131090">玩具
				<s></s>
				</li>-->
			
			</li></ul>
			
			<!-- 楼中-儿童 -->
			
			<div id="131091" store_gc="131090" class="ftab">
				<div class="ftabone">
					<div class="classpro">
					
						</div>
					</div>
				</div>
				
			</div>
			<!-- 楼中-儿童 end -->	
		</div>
		</div>
		</div>
		
		</div>
	<!--楼层1 end-->


	</div> 

    <script src="/lys/advert_invoke(2).htm"></script>
    <!-- 合作伙伴 -->
    <div class="friendlink">
      <h1>合作伙伴</h1>
     <ul class="linkimg">
        
                <li> <img src="/img/苏宁.jpg" width="92" height="35"></li>
                <li> <img src="/img/淘宝.jpg" width="92" height="35"></li>
                <li> <img src="/img/亚马逊.jpg" width="92" height="35"></li>
                <li> <img src="/img/一号店.jpg" width="92" height="35"></li>
                <li> <img src="/img/timg.jpg" width="92" height="35"></li>
                <li> <img src="/img/u=3225882306,2894408096&amp;fm=26&amp;gp=0.jpg" width="92" height="35"></li>
                <li> <img src="/img/wanda.jpg" width="92" height="35"></li>
                <li> <img src="/img/weipinhui.jpg" width="92" height="35"></li>
                <li> <img src="/img/阿里巴巴.jpg" width="92" height="35"></li>
                <li> <img src="/img/京东logo.jpg" width="92" height="35"></li> 
               
              </ul>
      <div class="linka">  </div>
    </div>
    <!-- 脚页 -->
    <div class="shopping"> 
            <div class="shopone">
        <h1>新手上路</h1>
        <ul>
                 <li><a href="http://localhost:8080/showfloot;jsessionid=D8B3A0D9B7F8180C8B187945123F755F#" target="_blank">新手路上</a></li>
                  </ul>
      </div>
            <div class="shopone">
        <h1>帮助中心 </h1>
        <ul>
                  <li><a href="http://localhost:8080/showfloot;jsessionid=D8B3A0D9B7F8180C8B187945123F755F#" target="_blank">帮助你</a></li>
                  </ul>
      </div>
            <div class="shopone">
        <h1>店主之家</h1>
        <ul>
                    <li><a href="http://localhost:8080/showfloot;jsessionid=D8B3A0D9B7F8180C8B187945123F755F#" target="_blank">开店啦</a></li>
                  </ul>
      </div>
            <div class="shopone">
        <h1>支付方式</h1>
        <ul>
                   <li><a href="http://localhost:8080/showfloot;jsessionid=D8B3A0D9B7F8180C8B187945123F755F#" target="_blank">买东西</a></li>
                  </ul>
      </div>
            <div class="shopone">
        <h1>售后服务 </h1>
        <ul>
                    <li><a href="http://localhost:8080/showfloot;jsessionid=D8B3A0D9B7F8180C8B187945123F755F#" target="_blank">收好</a></li>
                  </ul>
      </div>
            <div class="shopone">
        <h1>客服中心</h1>
        <ul>
            		<li><a href="http://localhost:8080/showfloot;jsessionid=D8B3A0D9B7F8180C8B187945123F755F#" target="_blank">客服电话</a></li>
                    <li><a href="http://localhost:8080/showfloot;jsessionid=D8B3A0D9B7F8180C8B187945123F755F#" target="_blank">卖家公告</a></li>
                  </ul>
      </div>
            <div class="shopone">
        <h1>特色服务</h1>
        <ul>
             		  <li><a href="http://localhost:8080/showfloot;jsessionid=D8B3A0D9B7F8180C8B187945123F755F#" target="_blank">一些特色</a></li>
                  </ul>
      </div>
            <div class="shopone">
        <h1>关于我们</h1>
        <ul>
            		<li><a href="http://localhost:8080/showfloot;jsessionid=D8B3A0D9B7F8180C8B187945123F755F#" target="_blank">网站介绍</a></li>
                  </ul>
      </div>
          </div>
    
    <script>jQuery(document).ready(function(){	jQuery(window).scroll(function(){	var top = jQuery(document).scrollTop();	if(top==0){		  jQuery("#back_box").hide();		  jQuery(".back_box_x").hide();		}else{		  jQuery("#back_box").show();		      jQuery(".back_box_x").show();		}	});		jQuery("#toTop").click(function(){       jQuery('body,html').animate({scrollTop:0},1000);       return false;    });});</script>
    
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
</script>
<div class="footer">
<div class="footerArea">
  <ul>
    <li>
           <a href="http://localhost:8080/index.htm" target="_blank">首页</a>|                 <a href="http://localhost:8080/article_join.htm" target="_blank">招聘英才</a>|                 <a href="http://localhost:8080/article_adver.htm" target="_blank">广告合作</a>|                 <a href="http://localhost:8080/article_contact.htm" target="_blank">联系我们</a>|                 <a href="http://localhost:8080/articlelist_163842.htm" target="_blank">关于shopping</a>        </li>
    <li class="hui2">Copyright 2011-2015 shopping Inc. All rights reserved</li>
    <li class="hui2">Powered by shopping V2.0</li>
    <li></li>
  </ul>
</div>
</div>


<!--返回最顶部-->
<div class="back_box" style="width: 50px; height: 50px; position: fixed; bottom: 180px; right: 25px; display: none;">
    <div class="back_index"><a href="http://localhost:8080/index.htm" target="_blank" title="返回主页"></a></div>
    <div class="back_top"><a id="toTop" href="http://localhost:8080/index.htm#" bosszone="hometop" style="display: block;" onclick="window.scrollTo(0,0);return false" title="返回顶部" target="_self"></a></div>
</div> 


</body></html>