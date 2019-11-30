package com.test.shopping.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
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
	
	/**
	 * 
	 * @Title: goodsbrandedit
	 * @Description: 品牌修改页面(页面中带有当前修改行的参数)
	 * @Author lhy
	 * @DateTime 2019年11月13日 上午10:46:14
	 * @param id
	 * @return
	 */
	@RequestMapping("/goodsbrandedit.htm")
	public String goodsbrandedit(Integer id) {
		
		return "goods_brand_list_edit";
	}
	
	/**
	 * 
	 * @Title: goodsbrandeditsubmit
	 * @Description: 品牌修改
	 * @Author lhy
	 * @DateTime 2019年11月13日 上午10:46:53
	 * @param gb
	 * @return
	 */
	@RequestMapping("/goodsbrandeditsubmit.htm")
	public String goodsbrandeditsubmit(Goodsbrand gb) {
		
		int ret = service.updateByPrimaryKeySelective(gb);
		return "redirect:/goodsbrandfindall.htm";
	}
	
	/**
	 * 
	 * @Title: goodsbrandquery
	 * @Description: 根据品牌名和品牌类别查找
	 * @Author lhy
	 * @DateTime 2019年11月13日 下午12:20:53
	 * @param gb
	 * @param req
	 * @return
	 */
	@RequestMapping("/goodsbrandquery.htm")
	public String goodsbrandquery(Goodsbrand gb,HttpServletRequest req) {
		
		List<Goodsbrand> list = service.selectByNameAndType(gb);
		req.setAttribute("goodsbrandlist", list);
		return "goods_brand_list";
	}
	
	/**
	 * 
	 * @Title: goodsbranddeleteAll
	 * @Description: 批量删除
	 * @Author lhy
	 * @DateTime 2019年11月13日 下午12:42:59
	 * @param ids
	 * @return
	 */
	@RequestMapping("/goodsbranddeleteall.htm")
	public String goodsbranddeleteAll(String ids) {
		
		service.deleteAll(ids);
		return "redirect:/goodsbrandfindall.htm";
	}
	
	/**
	 * 
	 * @Title: getallimgforajax
	 * @Description: 品牌添加页面选择图片列表
	 * @Author lhy
	 * @DateTime 2019年11月29日 下午2:55:31
	 * @return
	 */
	@RequestMapping("/getallimageforajax.htm")
	@ResponseBody
	public String getallimgforajax() {
		
		File  dirfile = new File("D:\\uploads\\img1\\");
		
		String[] fname = dirfile.list();
		
		List<String> list = new ArrayList<>();
		
		for (String string : fname) {
			list.add(string);
		}
		
		JSONObject jo = new JSONObject();
		jo.put("imagelist",list);
		
		return jo.toString();
	}
	
}
