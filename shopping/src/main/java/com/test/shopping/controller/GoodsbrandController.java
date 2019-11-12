package com.test.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.shopping.entity.Goodsbrand;
import com.test.shopping.service.GoodsbrandService;

/**
 * 
 * @ClassName: GoodsbrandController
 * @Description: 品牌管理
 * @Author lhy
 * @DateTime 2019年11月11日 下午2:37:13
 */
@Controller
public class GoodsbrandController {
	
	@Autowired
	private GoodsbrandService service;

	/**
	 * 
	 * @Title: goodsbrandfindall
	 * @Description: 品牌管理列表显示
	 * @Author lhy
	 * @DateTime 2019年11月11日 下午2:37:13
	 * @param req
	 * @return
	 */
	@RequestMapping("/goodsbrandfindall.htm")
	public String goodsbrandfindall(HttpServletRequest req){
		
		List<Goodsbrand> list = service.findall();
		req.setAttribute("goodsbrandlist", list);
		return "goods_brand_list";
	}
	
	/**
	 * 
	 * @Title: goodsbrandupdate
	 * @Description: 品牌修改
	 * @Author lhy
	 * @DateTime 2019年11月12日 下午12:56:46
	 * @return
	 */
	@RequestMapping("/goodsbrandupdate.htm")
	@ResponseBody
	public String goodsbrandupdate(Integer id,String fieldName,String value){
		
		Goodsbrand gb = new Goodsbrand();
		gb.setId(id);
		//判断修改列
		if("sort".equals(fieldName)){
			gb.setSort(Integer.parseInt(value));
		}else if("firstchar".equals(fieldName)){
			gb.setFirstchar(value);
		}else{
			gb.setName(value);
		}
		
		//调用修改方法
		int ret = service.updateByPrimaryKeySelective(gb);
		
		//修改后返回
		if(ret == 1){
			return "success";
		}else{
			return "error";
		}
	}
	
	/**
	 * 
	 * @Title: goodsbrandupdateimg
	 * @Description: 修改推荐标识
	 * @Author lhy
	 * @DateTime 2019年11月12日 下午1:04:54
	 * @param id
	 * @param recommand
	 * @return
	 */
	@RequestMapping("/goodsbrandupdateimg.htm")
	@ResponseBody
	public String goodsbrandupdateimg(Integer id, Boolean recommand){
		
		Goodsbrand gb = new Goodsbrand();
		gb.setId(id);
		gb.setRecommand(!recommand);
		
		//调用修改方法
		int ret = service.updateByPrimaryKeySelective(gb);
		
		//修改后返回
		if(ret == 1){
			return "success";
		}else{
			return "error";
		}
	}
	
	/**
	 * 
	 * @Title: goodsbrandadd
	 * @Description: 返回品牌添加页面
	 * @Author lhy
	 * @DateTime 2019年11月12日 下午1:06:57
	 * @return
	 */
	@RequestMapping("/goodsbrandadd.htm")
	public String goodsbrandadd(){
		return "goods_brand_list_add";
	}
	
	/**
	 * 
	 * @Title: goodsbrandaddsubmit
	 * @Description: 品牌添加
	 * @Author lhy
	 * @DateTime 2019年11月12日 下午1:07:38
	 * @param gb
	 * @return
	 */
	@RequestMapping("/goodsbrandaddsubmit.htm")
	public String goodsbrandaddsubmit(Goodsbrand gb){
		
		int ret = service.insert(gb);
		return "redirect:/goodsbrandfindall.htm";
	}
	
	/**
	 * 
	 * @Title: goodsbranddel
	 * @Description: 品牌删除
	 * @Author Administrator
	 * @DateTime 2019年11月13日 上午7:15:22
	 * @param id
	 * @return
	 */
	@RequestMapping("/goodsbranddel.htm")
	public String goodsbranddel(Integer id) {
		
		int ret = service.deleteByPrimaryKey(id);
		return "redirect:/goodsbrandfindall.htm";
	}
	
}
