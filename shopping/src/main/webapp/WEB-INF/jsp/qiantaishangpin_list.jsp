<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0048)http://localhost:8080/jfspliebiao?goodsclassid=5 -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>感官认知 - Powered by shopping</title>
		<meta name="keywords" content="感官认知">
		<meta name="description" content="感官认知">
		<meta name="generator" content="shopping 2.0">
		<meta name="author" content="www.shopping.com">
		<meta name="copyright" content="shopping Inc. All Rights Reserved">
		<link href="/css/public.css" type="text/css" rel="stylesheet">
		<link href="/css/index.css" type="text/css" rel="stylesheet">
		<link href="/css/goods.css" type="text/css" rel="stylesheet">
		<link href="/css/goodshidden.css" type="text/css" rel="stylesheet">
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.shop.common.js"></script>
		<script src="/js/jquery.lazyload.js"></script>
		<script>
			
		
		
			jQuery(document).ready(function(){	
				
				
				jQuery(".brandsort_show a").click(function(){								 
					var goods_view=jQuery(this).attr("goods_view");
					if(goods_view=="list"){
				   		jQuery(".goodstyletwo").show();
				   		jQuery(".smallgoods").hide();
				   		jQuery(this).addClass("brandsort_show_list2");
				   		jQuery("#thumb_view").removeClass().addClass("brandsort_show_big");
				 	}
				 	if(goods_view=="thumb"){
				   		jQuery(".smallgoods").show();
				   		jQuery(".goodstyletwo").hide();
				   		jQuery(this).addClass("brandsort_show_big2");
				   		jQuery("#list_view").removeClass().addClass("brandsort_show_list");	  
				 	}
				 	jQuery("#goods_view").val(goods_view);
				});
				jQuery(".smallgoods").show();
				jQuery(".goodstyletwo").hide();
				jQuery("#thumb_view").addClass("brandsort_show_big2");
				jQuery("#list_view").removeClass().addClass("brandsort_show_list");	 
			  	//排序
				jQuery(".brandsort_sort a").click(function(){
					var orderBy = jQuery(this).attr("orderBy");
				   	var orderType = jQuery(this).attr("orderType");
				   	jQuery("#orderBy").val(orderBy);
				   	jQuery("#orderType").val(orderType);
				   	jQuery("#ListForm").submit();
				});
				jQuery(".brandsort_sort a").removeClass("this");
				jQuery(".brandsort_sort a[orderBy='addTime']").addClass("this");
				jQuery(".smallgoods ul").hover(function(){
					jQuery(this).addClass("this");
					jQuery("li[class='goodshidden']").hide();
					jQuery(this).find("li[class='goodshidden']").show();
				},function(){
				  	jQuery(this).removeClass("this").find("li[class='goodshidden']").hide(); 
				});
			 	jQuery(".classia:gt(2)").hide();
			 	if(jQuery(".classia").length<=3){
			   		jQuery("#all_property_open").hide();
			   		jQuery("#all_property_close").hide();
			 	}
			 	jQuery("#all_property_open").mouseover(function(){
			    	jQuery(this).css("cursor","pointer");
			  	}).click(function(){
					jQuery("#all_property_status").val("open"); 
			    	jQuery(".classia").show();
					jQuery("#all_property_close").show();
					jQuery("#all_property_open").hide();
			 	});
			 	jQuery("#all_property_close").mouseover(function(){
			    	jQuery(this).css("cursor","pointer");
			  	}).click(function(){
					jQuery("#all_property_status").val("close"); 
			    	jQuery(".classia:gt(2)").hide();
					jQuery("#all_property_open").show();
					jQuery("#all_property_close").hide();
			 	});
			 	jQuery(".classia").each(function(){
			   		jQuery(this).find(".classb span:gt(12)").hide(); 
			 	});
			 	jQuery(".classmore a").each(function(){
			    	jQuery(this).click(function(){
					   	if(jQuery(this).index()==0){ 
					   		var mark = jQuery(this).attr("mark");
						 	jQuery("#detail_property_status").val(jQuery("#detail_property_status").val()+","+mark);					
					     	jQuery(this).parent().parent().find(".classb span").show();
					     	jQuery(this).hide();
					     	jQuery(this).parent().find("a:last").show();
					   	}
					   	if(jQuery(this).index()==1){ 
					     	jQuery(this).parent().parent().find(".classb span:gt(12)").hide();
						 	jQuery(this).hide();
					     	jQuery(this).parent().find("a:first").show();
					   	}
					});
				});
				jQuery(".goodsimgs img").lazyload({
					effect:"fadeIn",width:178,height:178
				});
				jQuery(".goodstwo img").lazyload({
					effect:"fadeIn",width:86,height:86
				});
				jQuery(".brandsort_sc_area").hover(function(){
					jQuery(".area_detail").css("display","block");
				},function(){
					jQuery(".area_detail").css("display","none");	
				});
				jQuery(".brandsort_fineprice").hover(function(){
					jQuery(".brandsort_price_bottom").css("display","block");	
				},function(){
					jQuery(".brandsort_price_bottom").css("display","none");	
				});			
				jQuery(".brandsort_price_bottom a").click(function(){
					var mark = jQuery(this).attr("mark");
					if(mark=="clear"){
						jQuery(".brandsort_price_top input").val("");	
					}
					jQuery("#ListForm").submit();						   
				});		
				jQuery("ul.areaul").find("a").click(function(){
					jQuery("#area_id").val(jQuery(this).attr("area_id"));
					jQuery("#ListForm").submit();
				});
				var search_bar_top=jQuery("#search_bar").offset().top;
				jQuery(window).scroll(function(){
					var top= jQuery("#search_bar").offset().top;
					var scrolla=jQuery(window).scrollTop();
					var i=top-scrolla;
					if(i<=0){
						jQuery("#search_bar").addClass("brandsort_screen_top");	  
					}
					if(scrolla<search_bar_top){
				   		jQuery("#search_bar").removeClass("brandsort_screen_top");
					}	
				});
			  //
			});
			function goods_property_remove(type,id){
				if(type=="brand"){
					var brand_ids=jQuery("#brand_ids").val();
				   	brand_ids=brand_ids.replace("|"+id,"");
				   	jQuery("#brand_ids").val(brand_ids);
				   	jQuery("#ListForm").submit();	  
				}
				if(type=="gs"){
			      	var gs_ids=jQuery("#gs_ids").val();
				   	gs_ids=gs_ids.replace("|"+id,"");
				   	jQuery("#gs_ids").val(gs_ids);
				   	jQuery("#ListForm").submit();	 
				}
				if(type=="properties"){
			     	var properties=jQuery("#properties").val();
				   	properties=properties.replace("|"+id,"");
				   	jQuery("#properties").val(properties);
				   	jQuery("#ListForm").submit();	 
				}	
			}
			function goods_property_generic(type,id,value){
			   	if(type=="brand"){
				  	var brand_ids=jQuery("#brand_ids").val();
				  	var s="|"+id+","+value;
				  	if(brand_ids.indexOf(s)<0){
				    	brand_ids=brand_ids+"|"+id+","+value;
				    	jQuery("#brand_ids").val(brand_ids);
						jQuery("#ListForm").submit();  
				  	} 
			   	}
			   	if(type=="gs"){
				  	var gs_ids=jQuery("#gs_ids").val();
				  	var s="|"+id+","+value;
				  	if(gs_ids.indexOf(s)<0){
				   		gs_ids=gs_ids+"|"+id+","+value;
				    	jQuery("#gs_ids").val(gs_ids);
						jQuery("#ListForm").submit();  
				  	}
			   	}
			   	if(type=="properties"){
				  	var properties=jQuery("#properties").val();
				  	var s="|"+id+","+value;
				  	if(properties.indexOf(s)<0){
				    	properties=properties+"|"+id+","+value;
				    	jQuery("#properties").val(properties);
						jQuery("#ListForm").submit();  
				  	}
			   	}   
			}
		</script>
		
	</head>
	<body>
		<div class="top" style="">
			<div class="top_page">
				<div class="pageright" id="site-nav">
					<ul class="quick-menu">
						<li class="mytaobao menu-item menupx">
							<div class="menu"> <a class="menu-hd" href="http://localhost:8080/buyer/index.htm" rel="nofollow">我的订单<b></b></a>
	            				<div class="menu-bd">
	              					<div class="menu-bd-panel">
										<div>
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
							<div class="menu" id="cart_menu">
								<span class="menu-hd" id="cart_goods_top_menu"><s></s>购物车<span id="cart_goods_count_top" class="top_car">0</span>种商品<b></b></span>
					            <div class="menu-bd" id="cart_goods_top_info">
						            <div class="menu-bd-panel">
						                <div style="text-align:center;"><img src="/img/loader.gif"></div>
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
        				<li class="menupx" style="background:none;"><a href="http://localhost:8080/articlelist_help.htm">帮助中心</a></li>
        			</ul>
    			</div>
    			<div class="pageleft">
    				<c:if test="${sessionScope.currentusername == null }">
	    				<span>亲，欢迎来到&nbsp;缘来小镇！</span>
	    				<span class="pxlr">
	    					<a href="http://localhost:8080/user/login.htm" class="lightblue">登录</a>
	    				</span><span class="pxlr">或</span>
	    				<span class="pxlr">
	    					<a href="http://localhost:8080/register.htm" class="lightblue">注册</a>
	    				</span> 
    				</c:if>
    				<c:if test="${sessionScope.currentusername != null }">
    					<span>${sessionScope.currentusername }&nbsp;欢迎来到&nbsp;缘来小镇！</span>
    				</c:if>
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
	    				jQuery("#type").val(type);
	  				}
	  				jQuery("#searchForm").submit();	
	  				jQuery("#keyword").val("");
				}
			</script>
			<div id="header_form">
		  		<script src="/js/jquery.cookie.js"></script>
		  		<div id="head_h" class="head_width">
			  		<div class="head clearFix">
			    		<div class="logo">  
			    			<a href="http://localhost:8080/index.htm"> 
			    				<img src="/img/logozm.png" border="0"> 
			    			</a>  
			    		</div>
			    		<div class="searchForm">
				    		<form action="http://localhost:8080/search.htm" method="post" target="_blank" id="searchForm">
					  			<input name="type" type="hidden" id="type" value="goods">
					    		<div class="toph_bigsearch">
					      			<div class="toph_sear">
					        			<ul class="toph_bgsear">
					          				<li class="this" type="goods"><a href="javascript:void(0);">宝贝<s></s></a></li>
					          				<li style="display:none" type="store"><a href="javascript:void(0);">店铺</a></li>
					        			</ul>
					        			<input name="keyword" type="text" id="keyword" placeholder="搜索其实真的很简单！" x-webkit-speech="" lang="zh-CN" onwebkitspeechchange="jQuery(';#searchForm';).submit()" class="toph_sear_txt">
					        			<input name="input" type="button" value="搜索" style="cursor:pointer;" onclick="search_form();" class="toph_sear_btn">
					      			</div>
					    		</div>
				    		</form>
			    		</div>
			  		</div>
		  		</div>
			</div>

	  ﻿		<script>
				jQuery(document).ready(function(){
	  				jQuery(".navul a").each(function(){
	    				var original_url=jQuery(this).attr("original_url");
						if("/store_goods_list.htm?gc_id=65753".indexOf(original_url)>=0){
		   					jQuery(this).addClass("this");	
						}
	  				});
	  				jQuery(".left_menu_dl").mouseover(function(){
		    			var child_count = jQuery(this).attr("child_count");
						var sc_id=jQuery(this).attr("id");
						var sc_color=jQuery(this).attr("sc_color");		
		    			var eq =jQuery(this).index();
						if(jQuery(".left_menu_dd[id=child_"+sc_id+"]").html()==null){
		   	  				jQuery.ajax({
		   	  					type:'POST',
		   	  					url:'http://b2b2c.iskyshop.com/nav_data.htm',
		   	  					data:{
		   	  						"sc_id":sc_id
		   	  					},
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
		      					}
		   	  				});
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
						}
	  				}).mouseleave(function(e){
		  				jQuery("dt[id^=dts_]").removeAttr("style");
		  				jQuery("div[id^=left_menu_con_]").removeAttr("style"); 
		  				var child_count = jQuery(this).attr("child_count");
						jQuery("dt[id^=dts_]").removeClass("left_menu_this").addClass("left_menu_dt");	  
		  				jQuery(".left_menu_dd[id^=child_]").hide();
	  				});
	  				jQuery(".nav_left").mouseover(function(){
		  				jQuery("#other_menu").show();
	   				});
	  				jQuery(".nav_left").mouseleave(function(){
		  				jQuery("#other_menu").hide();
	   				});	
				});
			</script>
			<div class="nav">
				<div class="nav_center">
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
	  		<div class="index">
	  		
	  		<!--商品列表开始-->
	    		<div class="index2">
	      			<form action="findbygoods.htm" method="post" id="ListForm">
	        			<div class="index2_list">
	          				<div class="opclass">  </div>
	          				<div class="allgoods">
	          				
	               			<!-- 筛选begin -->
	            				<div class="brandsort_screen" id="search_bar">
	              					<div class="brandsort_sort">
	               						<a href="javascript:void(0);" class="sort_a" orderby="goods_salenum" ordertype="desc"><i class="sort_a1">销量</i></a>
	               						<a id ="pice" href="javascript:void(0);" onclick="picegaodi();" class="sort_a" title="当前为价格默认排序" ><i class="sort_a1">价格</i></a>
	               					</div>
	              					<div class="brandsort_fineprice">
	                					<div class="brandsort_price_top">
	                  						<input placeholder="¥" name="store_price_begin" value="" type="text" title="按照价格区间筛选 最低价" class="brandsort_price_input">
	                  						<i>-</i>
	                  						<input placeholder="¥" name="store_price_end" value="" type="text" title="按照价格区间筛选 高价" class="brandsort_price_input">
	               	 					</div>
	                					<div class="brandsort_price_bottom" style="display: none;"> <a href="javascript:void(0);" mark="clear" class="brandsort_btn_clear">清空</a> <a href="javascript:void(0);" class="brandsort_btn_com">确定</a> </div>
	              					</div>
									<div class="brandsort_input">
	                					<input class="brandsort_input_txt" type="text" id="goods_name" name="goods_name" value="" placeholder="搜索关键字">
										<input type="submit" style="cursor:pointer;" value="确定" class="brandsort_input_btn">
									</div>
	            				</div>
	     					<!-- 筛选end -->
	     					       				
	        				<!-- 循环商品begin -->
						      	<div class="smallgoods">  
						           <%--  <c:forEach items="${requestScope.goodslist }" var="tmp">
								  		<ul class="this" id="1">
										  	<li class="goodsimgs">
											  	<span class="goods_sp_span">
												  	<p>
												  		<a href="?goodsid=${tmp.id }" target="_blank">
												  			<img src="${tmp.img }" width="120" height="120">
												  		</a>
												  	</p>
											  	</span>
										  	</li>
										    <li class="goodsnames"><a href="?goodsid=${tmp.id }" target="_blank">${tmp.name } </a></li>
										  	<li class="goodslook"><strong>商城价：¥${tmp.pice }</strong></li>
										  	<li class="goodslook"><span class="marketprice">市场价：¥${tmp.opice }</span></li>
										</ul>
									</c:forEach>  --%>
								<!-- 循环商品end -->
				
				
								<!-- 加分页begin -->
								
					    			<pg:pager url="/findallgoods.htm" maxPageItems="6" maxIndexPages="6"
										export="offset,currentPageNumber=pageNumber" isOffset="false"
										index="center">
										<c:set var="m" value="0"></c:set>
					    				<c:forEach items="${requestScope.goodslist }" var="tmp">
											<pg:item>
												<c:set var="m" value="${m+1 }"></c:set>
												<div>
										  			<ul class="this" id="1">
												  		<li class="goodsimgs">
														  	<span class="goods_sp_span">
															  	<p>
															  		<a href="?goodsid=${tmp.id }" target="_blank">
														  				<img src="${tmp.img }" width="120" height="120">
														  			</a>
														 	 	</p>
													  		</span>
												  		</li>
												    	<li class="goodsnames"><a href="?goodsid=${tmp.id }" target="_blank">${tmp.name } </a></li>
												  		<li class="goodslook"><strong>商城价：¥${tmp.pice }</strong></li>
												  		<li class="goodslook"><span class="marketprice">市场价：¥${tmp.opice }</span></li>
													</ul>
												</div>
												<c:if test="${m%5==0 }">
													<br>
												</c:if>
											</pg:item>
										</c:forEach>
										<div style="clear: both;"></div>
										<center>
						    				<pg:index>
												<pg:first>
													<a class="pageindex" href="${pageUrl}&level=${sessionScope.level }&goodsclassid=${sessionScope.goodsclassid }">首页</a>
												</pg:first>
												<pg:prev>
													<a class="pageindex" href="${pageUrl }&level=${sessionScope.level }&goodsclassid=${sessionScope.goodsclassid }">上一页</a>
												</pg:prev>
												<pg:pages>
													<c:choose>
													
													<%--当循环页码是当前页码，则该页码不可以导航，并显示为红色--%>
													
														<c:when test="${currentPageNumber eq pageNumber}">
															<font color="red">[${pageNumber }]</font>
														</c:when>
								
													<%-- 当循环页码不是当前页码，则该页码可以导航 --%>
													
														<c:otherwise>
															<a class="pageindex" href="${pageUrl }&level=${sessionScope.level }&goodsclassid=${sessionScope.goodsclassid }">[${pageNumber }]</a>
														</c:otherwise>
													</c:choose>
												</pg:pages>
												<pg:next>
													<a class="pageindex" href="${pageUrl }&level=${sessionScope.level }&goodsclassid=${sessionScope.goodsclassid }">下一页</a>
												</pg:next>
												<pg:last>
													<a class="pageindex" href="${pageUrl }&level=${sessionScope.level }&goodsclassid=${sessionScope.goodsclassid }">尾页</a>
												</pg:last>
											</pg:index>
										</center>
					    			</pg:pager>
					    			
					    			<!-- 加分页end -->
					    			
			    				</div>
			    			</div>
			    		</div>
	      			</form>
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
				         		<a href="http://localhost:8080/index.htm" target="_blank">首页</a>|                 
				         		<a href="http://localhost:8080/article_join.htm" target="_blank">招聘英才</a>|                 
				         		<a href="http://localhost:8080/article_adver.htm" target="_blank">广告合作</a>|                 
				         		<a href="http://localhost:8080/article_contact.htm" target="_blank">联系我们</a>|                 
				         		<a href="http://localhost:8080/articlelist_163842.htm" target="_blank">关于shopping</a>        
				         	</li>
				    		<li class="hui2">Copyright 2011-2015 shopping Inc. All rights reserved</li>
				    		<li class="hui2">Powered by shopping V2.0</li>
				  		</ul>
					</div>
				</div>
	
	
				<!--返回最顶部-->
				<div class="back_box" style="width: 50px; height: 50px; position: fixed; bottom: 180px; right: 25px; display: block;">
				    <div class="back_index">
				    	<a href="http://localhost:8080/index.htm" target="_blank" title="返回主页"></a>
				    </div>
				    <div class="back_top">
				    	<a id="toTop" href="http://localhost:8080/store_goods_list_65753.htm#" bosszone="hometop" style="display: block;" onclick="window.scrollTo(0,0);return false" title="返回顶部" target="_self"></a>
				    </div>
				</div> 
			</div>
		</div>
	</body>
</html>