<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0139)http://localhost:8080/tianjiagouwuche.htm?id=2&name=%E9%95%BF%E8%99%B965D2P&img=changhong.jpg&pice=333&goodscount=1&guigenames=&guigenames= -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>我的购物车 - Powered by shopping</title>
<meta name="keywords" content="shopping1,shopping2">
<meta name="description" content="shopping1,shopping2">
<meta name="generator" content="shopping 2.0">
<meta name="author" content="www.shopping.com">
<meta name="copyright" content="shopping Inc. All Rights Reserved">
<link href="/css/public.css" type="text/css" rel="stylesheet">
<link href="/css/goods.css" type="text/css" rel="stylesheet">
<link href="/css/overlay.css" type="text/css" rel="stylesheet">
<script src="/js/jquery-1.6.2.js"></script>
<script src="/js/jquery-ui-1.8.21.js"></script>
<script src="/js/jquery.shop.common.js"></script>
<script>

	
  function confirm_cart(sc_id){
    jQuery("#cart_"+sc_id).hide();
	jQuery("#cart_"+sc_id).attr("status","submit");
	if(jQuery("form[id^=cart_][status=no_submit]").length==0){
	   jQuery("#cart_"+sc_id).attr("target","_self");
	}
	jQuery("#cart_"+sc_id).submit();
  }  
  

  
jQuery(document).ready(function(){
  jQuery("a[id^=favorite_]").click(function(){
      	  var id=jQuery(this).attr("id").substring(9);
	  jQuery.post("http://localhost:8080/add_goods_favorite.htm",{"id":id},function(data){
		 if(data==0){
		    alert("收藏成功!");
		 }
		 if(data==1){
		    alert("您已经收藏过该商品!");
		 }
	  },"text");
	    });

  jQuery("input[id^=goods_count_]").keyup(function(){
  	var cart_id=jQuery(this).attr("cart_id");
	var count=jQuery("#goods_count_"+cart_id).val().replace(/\D/g,'');
	if(count==""){
       count=1;
	}
	var store_id=jQuery(this).attr("store_id");
	if(count>0){
	  goods_count_adjust(cart_id,store_id,count);
	}	
  });
  //
  jQuery(".baby_gp>a").mouseover(function(){
	jQuery(this).parent().find(".arrow").show();									  
    jQuery(this).parent().find(".baby_group").show();
  });
  jQuery(".baby_gp").mouseleave(function(){
    jQuery(this).parent().find(".arrow").hide();									  
    jQuery(this).parent().find(".baby_group").hide();
  });
  //
});
</script>

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

</head><body>

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
		 var goods_count=2;
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
	   </script>
        <li class="search menu-item menupx">
          <div class="menu" id="cart_menu"><span class="menu-hd" id="cart_goods_top_menu"><s></s>购物车<span id="cart_goods_count_top" class="top_car">2</span>种商品<b></b></span>
            <div class="menu-bd" id="cart_goods_top_info">
             <div class="menu-bd-panel">
                <div style="text-align:center;"><img src="./我的购物车 - Powered by shopping_files/loader.gif"></div>
             </div>
              
            </div>
          </div>
        </li>
        <li class="menupx"><a href="http://localhost:8080/buyer/message.htm">站内短信(<span style="color:#FF3300;">2</span>)</a></li>
		
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
		
        		        <li class="menupx" style="background:none;"><a href="http://localhost:8080/articlelist_help.htm">帮助中心</a></li>
        		      </ul>
    </div>
    <div class="pageleft"><span>${sessionScope.currentusername },欢迎来到缘来小镇！</span><a href="http://localhost:8080/shopping_logout.htm" class="lightblue">[退出]</a>  </div>
  </div>
</div>

<div class="main"> <script>
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
/* function search_form(){
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
} */


//add by xdx 12.09 begin


function changenumber(obj){
		var zongjia=0;
		var n = $(obj).val();
		var dj = $(obj).parent().prev().html();
		var xj =n*dj; 
		var xjint = parseInt(xj);
		$(obj).parent().parent().next().children().html(xjint);
		var arr = $(".xj");
		for(var i=0;i<arr.length;i++){
			var b = $(arr[i]).html();
			var xx = parseInt(b);
			zongjia = zongjia + xx;				
		}
		$("#total_price").html(zongjia);
	}


function jia(obj) {
	var cid = $("#cb").val();
	var n = $(obj).parent().next().val();
	var val = parseInt(n);
	var num = val+1; 
	$(obj).parent().next().val(num);
	$.ajax({
		url:'numberupdate.htm',
		type:'post',
		data:{
			id:cid,
			number:num
		},
		success:function(data){
			if(data=="success"){
				var danjia = $(obj).parent().parent().prev().html();		
				var sum = num*danjia;
				$(obj).parent().parent().next().children().html(sum);
				var tp = $("#total_price").html();
				var tpint = parseInt(tp);
				var dj = parseInt(danjia);
				var tj = parseInt(tpint+dj);
				$("#total_price").html(tj);
			}
		}
	});
	$(".but").attr("disabled",false);
}


function jian(obj) {
	var cid = $("#cb").val();
	var n = $(obj).parent().prev().val();
	var val = parseInt(n);
	var num = val-1; 
	$(obj).parent().prev().val(num);
	$.ajax({
		url:'numberupdate.htm',
		type:'post',
		data:{
			id:cid,
			number:num
		},
		success:function(data){
			if(data=="success"){
				var danjia = $(obj).parent().parent().prev().html();		
				var sum = num*danjia;
				$(obj).parent().parent().next().children().html(sum);
				var tp = $("#total_price").html();
				var tpint = parseInt(tp);
				var dj = parseInt(danjia);
				var tj = parseInt(tpint-dj);
				$("#total_price").html(tj);					
			}
		}
	});
	
	if($(obj).parent().prev().val() == 1){
		$(obj).attr("disabled",true);
	}else{
		$(".but").attr("disabled",false);
	}
}


function goodsshop(obj){
	var zj = $("#total_price").html();
	var check = $(obj).attr("checked");		
	if(check == "checked"){
		var xj = $(obj).parent().next().next().next().next().children().html();		
		var zjint = parseInt(zj);
		var xjint = parseInt(xj);
		var zongjia = (zjint)+(xjint);
		$("#total_price").html(zongjia);
	}else{
		var xj = $(obj).parent().next().next().next().next().children().html();
		var zjint = parseInt(zj);
		var xjint = parseInt(xj);
		var zongjia = (zjint)-(xjint);
		$("#total_price").html(zongjia);
		
	}
} 


//add by xdx 12.09 end
</script>

<!--   
  <div class="top_banner clearFix">
  	<img src="http://localhost:8080/upload/advert/topbanner.jpg">
  </div>
 -->
<!--[if lt IE 9]>
    <script src="http://localhost:8080/resources/js/css3-mediaqueries.js"></script>
<![endif]--> 
<div id="header_form">
  <script src="./我的购物车 - Powered by shopping_files/jquery.cookie.js.下载"></script>
  <div id="head_h" class="head_width">
	  <div class="head clearFix">
	    <div class="logo">  <a href="http://localhost:8080/index.htm"> <img src="./我的购物车 - Powered by shopping_files/ff2232cb-7a55-47b2-b0b4-cd90793e5ea1.jpg" border="0"> </a>  </div>
	    <div class="searchForm">
		    <form action="searchshoppingcar.htm" method="post" >			  	
			    <div class="toph_bigsearch">
			      <div class="toph_sear">
			        <ul class="toph_bgsear">
			          <li class="this" type="goods"><a href="javascript:void(0);">宝贝<s></s></a></li>
			          <li style="display:none" type="store"><a href="javascript:void(0);">店铺</a></li>
			        </ul>
			        <input name="keyword" type="text" id="keyword" placeholder="搜索其实真的很简单！"  class="toph_sear_txt">
			        <input  type="submit" value="搜索" style="cursor:pointer;" class="toph_sear_btn">
			      </div>
			      <div class="keyword">  </div>
			    </div>
		    </form>
	    </div>
	  </div>
  </div>
</div>

  <div class="Steps_box">
    <div class="Steps">
      <ul>
        <li class="this">1.查看购物车</li>
        <li>2.确认订单信息</li>
        <li>3.付款到卖家</li>
        <li>4.确认收货</li>
        <li class="last">5.评价</li>
      </ul>
    </div>
    <form status="no_submit" method="post" name="cart_32816" target="_blank" id="cart_32816" action="http://localhost:8080/goods_cart2.htm">
      <input name="userid" type="hidden" id="type" value="${sessionScope.currentuserid }">
      <div class="table">
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
          <tbody><tr>
          	<td width="15%" align="center" class="title"></td>
            <td width="40%" align="center" class="title">店铺商品</td>
            <td width="8%" align="center" class="title">单价</td>
            <td width="20%" align="center" class="title">数量</td>
            <td width="10%" align="center" class="title">小计（元）</td>
            <td width="10%" align="center" class="title">操作</td>
          </tr>
          <c:forEach items="${requestScope.shoppingcarlist }" var="tmp">
            <tr goods_list="goods_info_231914" id="231914">
            <td>
            	<input onclick="goodsshop(this);" type="checkbox" value="${tmp.id }" class="ck" id="cb" checked="checked"/>
            </td>
            <td class="baby"> 
              <img src="/img/${tmp.image }" width="65" height="65">
              <p><a href="http://localhost:8080/showdetails?id=4" target="_blank">${tmp.name }</a>                  
              <span style="color:#F00">(特价)</span> <br>

           		<c:set value="${fn:split(tmp.spec, ',') }" var="arr" />
            	<c:forEach items="${arr }" var="s">
             		<span class="color">${s }</span>
             		<br />
           		 </c:forEach>
           		
              <!-- <span class="color">参考身高: 85cm</span><br> -->
              </p></td>
            <td id="danjia" align="center">${tmp.price }</td>
            <td class="input" align="center">
            	<span>
	        		<button type="button" onclick="jia(this);" href="javascript:void(0);" id="count_down_65" cart_id="65" store_id="32816">
					<img src="/img/jian.jpg" width="12" height="12"></button>
            	</span>
        			<input name="goods_count_65" type="text" value="${tmp.number }"  onchange="changenumber(this);" id="number" cart_id="231914" store_id="32816" goods_count="2">
              	<span>
        			<button type="button" class="but" onclick="jian(this);" href="javascript:void(0);" id="count_up_65" cart_id="65" store_id="32816">
					<img src="/img/add.jpg"  width="12" height="12"></button>
              	</span>
             </td>
            <td id="gp" align="center"><strong class="xj" id="goodsprice">${tmp.price*tmp.number }</strong></td>
            <td align="center"> <a href="http://localhost:8080/gouwucheshanchu.htm?id=65" class="cart_common">删除</a></td>
          </tr>
          </c:forEach>
        </tbody></table>
      </div>
      <div class="h2"> <span class="h2_r"><em>商品总价(不含运费)：</em><b>¥<strong class="orange" id="total_price">${requestScope.zongjia }</strong></b>
        <input name="store_id" type="hidden" id="store_id" value="32816">
        <a href="http://localhost:8080/querendingdan.htm" style="background-color:indigo;">结算</a></span> </div>
    </form>
        <div class="car_nogoods" style="display:none;">
      <div class="shopcar">
        <dl>
          <dt><img src="/img/shopping_cart.jpg" width="130" height="118"></dt>
          <dd>
            <h1>您的购物车还没有商品</h1>
            <span><a href="http://localhost:8080/index.htm">马上去购物&gt;&gt;</a></span><span><a href="http://localhost:8080/buyer/order.htm">查看自己的订单&gt;&gt;</a></span></dd>
        </dl>
      </div>
    </div>
 
  </div>
  ﻿

<div class="footer">
<div class="footerArea">
  <ul>
    <li>
        <a href="http://localhost:8080/index.htm" target="_blank">首页</a>|                 
        <a href="http://localhost:8080/article_join.htm" target="_blank">招聘英才</a>|                 <a href="http://localhost:8080/article_adver.htm" target="_blank">广告合作</a>|                 <a href="http://localhost:8080/article_contact.htm" target="_blank">联系我们</a>|                 <a href="http://localhost:8080/articlelist_163842.htm" target="_blank">关于shopping</a>        </li>
    <li class="hui2">Copyright 2011-2015 shopping Inc. All rights reserved</li>
    <li class="hui2">Powered by shopping V2.0</li>
    <li></li>
  </ul>
</div>
</div>


<!--返回最顶部-->
<div class="back_box" style="width: 50px; height: 50px; position: fixed; bottom: 180px; right: 25px; display: none;">
    <div class="back_index"><a href="http://localhost:8080/index.htm" target="_blank" title="返回主页"></a></div>
    <div class="back_top"><a id="toTop" href="http://localhost:8080/goods_cart1.htm#" bosszone="hometop" style="display: block;" onclick="window.scrollTo(0,0);return false" title="返回顶部" target="_self"></a></div>
</div> </div>


</body></html>