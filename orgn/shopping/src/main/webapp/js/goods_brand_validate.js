//表单验证
$(function(){
	$("#myForm").validate({
		rules:{
			name:{
				required:true
			},
			firstchar:{
				required:true,
				maxlength:1
			},
			type:{
				required:true
			},
			img:{
				required:true
			},
			sort:{
				required:true,
				digits:true
			}
		},
		messages:{
			name:{
				required:'品牌名不能为空',
				remote:'品牌名已存在'
			},
			firstchar:{
				required:'首字母不能为空',
				maxlength:'长度不能超过1个字符'
			},
			type:{
				required:'类型不能为空'
			},
			img:{
				required:'图片不能为空'
			},
			sort:{
				required:'排序不能为空',
				digits:'只能是整数'
			}
		}
	});
});