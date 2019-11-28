package com.test.shopping.controller;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.test.shopping.entity.BrandBySpec;
import com.test.shopping.entity.Goods;
import com.test.shopping.entity.Goodsbrand;
import com.test.shopping.entity.Goodsbrandplus;
import com.test.shopping.entity.Goodsclassplus;
import com.test.shopping.entity.Goodsplus;
import com.test.shopping.entity.Specplus;
import com.test.shopping.entity.Specval;
import com.test.shopping.service.GoodsService;
import com.test.shopping.service.GoodsbrandService;
import com.test.shopping.service.GoodsclassService;
import com.test.shopping.service.SpecService;
import com.test.shopping.service.SpecvalService;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService service;

	/**
	 * 	分类
	 */
	@Autowired
	private GoodsclassService goodsClassService;

	/**
	 *	品牌 
	 */
	@Autowired
	private GoodsbrandService goodsbrandservice;
	
	/**
	 * 	规格
	 */
	@Autowired
	private SpecService specservice;
	
	/**
	 * 	规格值
	 */
	@Autowired
	private SpecvalService specvalservice;

	/**
	 * 
	 * @Title: goodsadd
	 * @Description: 商品管理添加页面
	 * @Author lhy
	 * @DateTime 2019年11月28日 下午12:16:19
	 * @param req
	 * @return
	 */
	@RequestMapping("/goodsadd.htm")
	public String goodsadd(HttpServletRequest req) {

		// 商品图片列表
		/*
		 * File dirfile = new File("D:\\image"); String[] fnames = dirfile.list();
		 * List<String> imgList = new ArrayList<>(); for (String string : fnames) {
		 * imgList.add(string); } req.setAttribute("imagelist", imgList);
		 */
		// 三级分类列表
		List<Goodsclassplus> classList = goodsClassService.GoodsClassFindAllByLevel(0);
		req.setAttribute("goodsclasslist", classList);
		//品牌列表
		List<Goodsbrand> brandlist = goodsbrandservice.findall();
		req.setAttribute("brandlistforgoodsadd", brandlist);
		//规格列表
		List<Specplus> speclist = specservice.findall();
		req.setAttribute("speclistforgoodsadd", speclist);

		return "goods_list_add";
	}
	
	/**
	 * 
	 * @Title: findspecval
	 * @Description: 根据规格名，显示对应的规格值
	 * @Author lhy
	 * @DateTime 2019年11月28日 下午12:47:30
	 * @param specid
	 * @return
	 */
	@RequestMapping("/findspecval.htm")
	@ResponseBody
	public String findspecval(Integer specid){
		List<Specval> list = specvalservice.selectByspecid(specid);
		JSONObject jo = new JSONObject();
		jo.put("specvallist", list);
		return jo.toString();
	}
	
	@RequestMapping("/findspec.htm")
	@ResponseBody
	public String findspec(Integer brandid) {
		
		List<BrandBySpec> list = service.selectSpecByBrandName(brandid);
		JSONObject jo = new JSONObject();
		jo.put("speclist", list);
		return jo.toString();
	}
	
	@RequestMapping("/findbrand.htm")
	@ResponseBody
	public String findbrand(Integer brandid) {
		
		List<Goodsbrandplus> list = service.selectBrandByClassId(brandid);
		JSONObject jo = new JSONObject();
		jo.put("brandlist", list);
		return jo.toString();
	}
	
	@RequestMapping("goodsaddsubmit.htm")
	public String goodsaddsubmit(Goods goods) {
		
		service.insertSelective(goods);
		return "redirect:/goodsfindall.htm";
	}

	@RequestMapping("/goodsfindall.htm")
	public String goodsfindall(HttpServletRequest req) {
		
		List<Goodsplus> list = service.findAll();		
		req.setAttribute("goodslist", list);
		
		//add by zy
		
		List<Goodsbrand> goodslist =goodsbrandservice.findall();
		List<Goodsclassplus> listgoods = goodsClassService.GoodsClassFindAllByLevel(0);
		req.setAttribute("goodsbrandbygoods", goodslist);
		req.setAttribute("goodsbrandbygoodsclassplus", listgoods);
		
		//add by zy
		
		return"goods_list";
	}
	
		//add by zhaoyu 1128 begin
		
		@RequestMapping("/selectgoods.htm")
		public String selectgoods(Goods goods,HttpServletRequest req) {
			List<Goodsplus> list = service.selectbynameAndClassnameAndBrandname(goods);
			req.setAttribute("goodslist", list);
			
			List<Goodsbrand> goodslist =goodsbrandservice.findall();
			List<Goodsclassplus> listgoods = goodsClassService.GoodsClassFindAllByLevel(0);
			req.setAttribute("goodsbrandbygoods", goodslist);
			req.setAttribute("goodsbrandbygoodsclassplus", listgoods);
			return "goods_list";
		}
		
		//add by zhaoyu 1128 end

}
