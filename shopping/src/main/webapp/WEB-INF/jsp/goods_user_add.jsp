<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0040)http://localhost:8080/admin/user_add.htm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<link href="/css/template.css" rel="stylesheet" type="text/css">
<script src="/js/jquery-1.6.2.js"></script>
<script src="/js/jquery.poshytip.min.js"></script>
<script src="/js/jquery.shop.common.js"></script>
<script src="/js/jquery.validate.min.js"></script><script>
jQuery(document).ready(function(){
 jQuery.validator.addMethod("verify",function(value,element){
	  var re = /^[0-9a-zA-Z]*$/;
        if(re.test(jQuery("#userName").val())){			
			return true;
		  } 
		  else {
		    return false;
			  }		  
});								
  /* jQuery("#theForm").validate({
    rules:{
	  userName:{
	    required :true,
		verify:true,
	     remote:{
		    url: "http://localhost:8080/verify_username.htm",     //后台处理程序
            type: "post",               //数据发送方式
            dataType: "json",           //接受数据格式   
            data: {                     //要传递的数据
                  "userName": function(){return jQuery("#userName").val();},
				  "id":function(){return jQuery("#id").val()}
		     }
			}
	  },
	  email:{
	    required :true,
		email:true,
		remote:{
		    url: "http://localhost:8080/verify_email.htm",     //后台处理程序
            type: "post",               //数据发送方式
            dataType: "json",           //接受数据格式   
            data: {                     //要传递的数据
                  "mail": function(){return jQuery("#userName").val();},
				  "id":function(){return jQuery("#id").val()}
		     }
			}
	  },
	  password:{
	    required:true,
		minlength:6,
		maxlength:20
	  }
	  	 },
	messages:{
	  userName:{required:"用户名不能为空",remote:"该用户名已经存在",verify:"不可输入特殊符号"},
	  email:{required:"电子邮箱不能为空",email:"邮箱格式不对",remote:"该邮箱已被使用"},
	  password:{required:"密码不能为空",minlength:"密码不能少于{0}位",maxlength:"密码不能大于{0}位"}	}
  });	 */
  jQuery(":radio[id=sex]").each(function(){
    if(jQuery(this).val()=="")jQuery(this).attr("checked",true);
  });
  jQuery(":radio[id=report][value=]").attr("checked",true);
});

function saveForm(){
   jQuery("#theForm").submit();
}


</script><style id="poshytip-css-tip-skyblue" type="text/css">div.tip-skyblue{visibility:hidden;position:absolute;top:0;left:0;}div.tip-skyblue table, div.tip-skyblue td{margin:0;font-family:inherit;font-size:inherit;font-weight:inherit;font-style:inherit;font-variant:inherit;}div.tip-skyblue td.tip-bg-image span{display:block;font:1px/1px sans-serif;height:10px;width:10px;overflow:hidden;}div.tip-skyblue td.tip-right{background-position:100% 0;}div.tip-skyblue td.tip-bottom{background-position:100% 100%;}div.tip-skyblue td.tip-left{background-position:0 100%;}div.tip-skyblue div.tip-inner{background-position:-10px -10px;}div.tip-skyblue div.tip-arrow{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;}</style></head>

<body>
<div class="cont">
  <h1 class="seth1">会员管理</h1>
  <div class="settab"><span class="tab-one"></span>
      <span class="tabs">
       <a href="http://localhost:8080/admin/user_list.htm">管理</a> |
       <a href="http://localhost:8080/admin/user_add.htm" class="this">新增</a>
	   	  </span>
      
      <span class="tab-two"></span></div>
 <form id="theForm" action="goodsuseraddsubmit.htm" method="post" >
 <input name="id" type="hidden" id="id" value="">
  <input name="currentPage" type="hidden" id="currentPage" value="">
  <input name="list_url" type="hidden" id="list_url" value="http://localhost:8080/admin/user_list.htm">
  <input name="add_url" type="hidden" id="add_url" value="http://localhost:8080/admin/user_add.htm">
  <div class="setcont">
    <!--鼠标经过样式-->
    <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>用户名</li>
      <li><span class="webname">
        <input name="username" type="text" id="userName" value="" size="40">      </span></li>
    </ul>
      <ul class="set1">
      <li>密码</li>
      <li><span class="webname">
        <input name="password" type="password" id="password" size="40" autocomplete="off">
      </span><span id="nothis"><strong class="q"></strong><strong class="w">修改用户时候，密码留空表示不修改</strong><strong class="c"></strong></span></li>
    </ul>
    <ul class="set1">
      <li>真实姓名</li>
      <li><span class="webname">
        <input name="name" type="text" id="trueName" value="" size="40">
      </span></li>
    </ul>
	<ul class="set1">
      <li><strong class="orange fontsize20">*</strong>电子邮箱</li>
      <li><span class="webname">
        <input name="mail" type="text" id="email" value="" size="40">
      </span></li>
	</ul>
	
	<ul class="set1">
      <li><strong class="orange fontsize20">*</strong>会员等级</li>
      <li><span class="webname">
        <input name="power" type="text" id="power" value="" size="40">
      </span></li>
	</ul>
	
	<ul class="set1">
      <li><strong class="orange fontsize20">*</strong>会员积分</li>
      <li><span class="webname">
        <input name="vippoints" type="text" id="vippoints" value="" size="40">
      </span></li>
	</ul>
	
	<ul class="set1">
      <li><strong class="orange fontsize20">*</strong>会员金币</li>
      <li><span class="webname">
        <input name="vipcoins" type="text" id="vipcoins" value="" size="40">
      </span></li>
	</ul>
	
	<ul class="set1">
      <li>性别</li>
	   <li><span class="webname">
      <input style="border:none; height:16px; width:16px;" name="sex" id="sex" type="radio" value="1">
      男
	  <input style="border:none; height:16px; width:16px;" type="radio" id="sex" name="sex" value="0">女
	   <input style="border:none; height:16px; width:16px;" type="radio" id="sex" name="sex" value="-1">保密
	   </span>
	   </li>
	</ul>
    <!-- <ul class="set1">
      <li>举报商品</li>
	   <li><span class="webname">
      <input style="border:none; height:16px; width:16px;" name="report" id="report" type="radio" value="0">
      允许
	  <input style="border:none; height:16px; width:16px;" type="radio" id="report" name="report" value="-1">
	  禁止
	   </span>
	   </li>
	</ul> -->
    <ul class="set1">
      <li>QQ</li>
      <li><span class="webname">
        <input name="qq" type="text" id="QQ" value="">
      </span></li>
    </ul>
	  <ul class="set1">
      <li>旺旺</li>
      <li><span class="webname">
        <input name="wangwang" type="text" id="WW" value="">
      </span></li>
    </ul>
	  <ul class="set1">
      <li>MSN</li>
      <li><span class="webname">
        <input name="msn" type="text" id="MSN" value="">
      </span></li>
    </ul>
    <ul class="set1">
      <li>手机号码</li>
      <li><span class="webname">
        <input name="phonenumber" type="text" id="mobile" value="">
      </span></li>
    </ul>
    </div>
    <div class="submit">
    	<input type="submit" value="提交">
  	</div>
  </form>
  
</div>

</body></html>