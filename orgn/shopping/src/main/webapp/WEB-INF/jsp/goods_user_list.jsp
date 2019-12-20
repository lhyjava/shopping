<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0041)http://localhost:8080/admin/user_list.htm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<link href="/css/template.css" rel="stylesheet" type="text/css">
<script src="/js/jquery-1.6.2.js"></script>
<script src="/js/jquery.shop.common.js"></script>
<script src="/js/jquery.poshytip.min.js"></script>
<script>
jQuery(document).ready(function(){
  jQuery(".memimg").mouseover(function(){
     jQuery(this).css("cursor","pointer");
	 jQuery(".mem_detail[id^=user_detail_]").hide();
     var id=jQuery(this).attr("id");
	 jQuery("#user_detail_"+id).show();
  });
  jQuery(".mem_detail[id^=user_detail_]").mouseleave(function(){
    jQuery(this).hide();
  });
});
</script><style id="poshytip-css-tip-skyblue" type="text/css">div.tip-skyblue{visibility:hidden;position:absolute;top:0;left:0;}div.tip-skyblue table, div.tip-skyblue td{margin:0;font-family:inherit;font-size:inherit;font-weight:inherit;font-style:inherit;font-variant:inherit;}div.tip-skyblue td.tip-bg-image span{display:block;font:1px/1px sans-serif;height:10px;width:10px;overflow:hidden;}div.tip-skyblue td.tip-right{background-position:100% 0;}div.tip-skyblue td.tip-bottom{background-position:100% 100%;}div.tip-skyblue td.tip-left{background-position:0 100%;}div.tip-skyblue div.tip-inner{background-position:-10px -10px;}div.tip-skyblue div.tip-arrow{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;}</style></head>





<body>
  <div class="cont">
    <h1 class="seth1">会员管理</h1>
    <div class="settab"><span class="tab-one"></span> <span class="tabs"> <a href="http://localhost:8080/admin/user_list.htm" class="this">管理</a> | <a href="goodsuseradd.htm">新增</a> </span> <span class="tab-two"></span></div>
    <div class="allmem_search">
      <ul>
        <li> 
        <form action="aa" method="post">
        	<span>
          	<select name="condition" id="condition">
	            <option value="1">会员名</option>
	            <option value="2">注册邮箱</option>
	            <option value="3">真实姓名</option>
          	</select>         
         	</span>           
	        <span class="allmen size4">
	          <input name="value" type="text" id="value">
	          </span><span class="btn_search">
	          <input  type="submit" value="搜索" style="cursor:pointer;" title="搜索会员">
	        </span>
         </form> 
          </li>
      </ul>
    </div>
    <div class="operation">
      <h3>友情提示</h3>
      <ul>
        <li>可用金额，买家会员可以用来支付订单、提现，卖家可以用来支付商城收费服务</li>
        <li>冻结金额，当会员进行提现操作后，提现金额变为冻结金额等待管理员审核操作。当会员使用预存款支付购买时，在订单支付后且未收货之前，
          可用金额减少，支付的金额变为冻结金额，直到确认收货后，冻结金额减少，卖家可用金额增加。冻结金额不能用来支付或提现</li>
      </ul>
    </div>
	<form name="ListForm" id="ListForm" action="http://localhost:8080/admin/user_list.htm" method="post">
    <div class="allmem_table">
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tbody><tr style="background:  #2A7AD2       ; height:30px; color:#FFF">
          <td width="8%" align="left">&nbsp;</td>
          <td width="25%" align="left">会员名</td>
          <td width="6%" align="center">会员积分</td>
          <td width="6%" align="center">会员金币</td>
          <td width="6%" align="center">登录次数</td>
          <td width="15%" align="center">最后登录</td>
          <td width="6%" align="center">预存款</td>
          <!-- <td width="15%" align="center">店铺</td> -->
          <td align="center">操作</td>
        </tr>
        <c:forEach items="${requestScope.goodsuserlist }" var="tmp">
        <tr>
          <td align="left"><input name="id" type="checkbox" id="id" style="width:16px; border:none;" value="32905"></td>
          <td align="left"><span class="memimg"><img src="/img/default_user_photo.gif" width="45" height="49"></span> <span class="mem_detail">
            <ul>
              <li class="mem_font">${tmp.username }<i>(真实姓名：${tmp.name })</i></li>
              <li>注册时间：<fmt:formatDate type="both" value="${tmp.addtime }"/></li>
              <li class="open"><span class="email"><a href="mailto:17889843751@163.com" title="用户邮箱:${tmp.mail }"><img src="/img/mail.jpg" width="15" height="11"></a></span> <span><a href="javascr0ipt:void(0);" title="${tmp.qq }"><img src="/img/qq.jpg" width="19" height="20"></a></span> <span><a href="javascript:void(0);" title=" ${tmp.wangwang }"><img src="/img/ww.jpg" width="17" height="17" border="0"></a></span> <span><a href="javascript:void(0);" title=" ${tmp.msn } "><img src="/img/hotm.jpg" width="20" height="17" border="0"></a></span> </li>
            </ul>
            </span></td>
          <td align="center">${tmp.vippoints }</td>
          <td class="lightred">${tmp.vipcoins }</td>
          <td class="lightred">${tmp.logintimes }</td>
          <td class="lightred"><ul>
              <li></li>
              <li></li>
            </ul></td>
          <td class="lightred"><ul>
              <li>可用：<strong> ${tmp.money } 元</strong></li>
              <li>冻结：<strong> ${tmp.moneyfreeze } 元</strong></li>
            </ul></td>
          <!-- <td class="blue" align="center"> -->
          <%-- <c:if test="${tmp.power } == 0"> 
          	<span style="color:#F00">未开店</span></td>
          </c:if>
          <c:if test="${tmp.power } == 1"> 
          	<span style="color:#F00">开店</span></td>
          </c:if> --%>
          <td align="center" class="blue xiahua"><a href="http://localhost:8080/admin/user_edit.htm?id=32905">编辑</a>&nbsp;&nbsp;|&nbsp;&nbsp;
          <a href="javascript:void(0);" onclick="if(confirm('删除会员会同步删除删除该会员所有信息，且不可恢复，是否继续？'))window.location.href='http://localhost:8080/admin/user_del.htm?mulitId=32905&amp;currentPage=1'">删除</a></td>
        </tr>
        </c:forEach>
            
        <tr style="background:#F2F2F2; height:30px;">
          <td colspan="9"><div class="shopbtn shopfx">
              <input name="all" type="checkbox" id="all" onclick="selectAll(this)" value="">
              &nbsp;&nbsp;全部</div>
            <div class="shop_btn_del shopbtn">
              <input name="" type="button" value="删除" style="cursor:pointer;" onclick="cmd('http://localhost:8080/admin/user_del.htm')">
            </div></td>
        </tr>
      </tbody></table>
    </div>
    <div class="fenye">
      <input name="userRole" type="hidden" id="userRole" value="BUYER">
      <input type="hidden" name="currentPage" id="currentPage" value="1">
      <input name="mulitId" type="hidden" id="mulitId">
      <a href="http://localhost:8080/admin/user_list.htm?currentPage=1">首页</a> 第　<a class="this" href="http://localhost:8080/admin/user_list.htm?currentPage=1">1</a> <a href="http://localhost:8080/admin/user_list.htm?currentPage=2">2</a> 页　<a href="http://localhost:8080/admin/user_list.htm?currentPage=2">下一页</a> <a href="http://localhost:8080/admin/user_list.htm?currentPage=2">末页</a> 
	</div>
	</form>
  </div>


<div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div><div class="tip-skyblue"><div class="tip-inner tip-bg-image"></div><div class="tip-arrow"></div></div></body></html>