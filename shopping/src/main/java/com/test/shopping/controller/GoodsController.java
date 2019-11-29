package com.test.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
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
	 * 	品牌
	 */
	@Autowired
	private GoodsbrandService goodsbrandservice;

	/**
	 * 	规格
	 */
	@Autowired
	private SpecService specservice;

	/**
	 *	 规格值
	 */
	@Autowired
	private SpecvalService specvalservice;
	
	// add by lhy 1129 begin

	/**
	 * 
	 * @Title: goodsadd
	 * @Description: 商品添加页面
	 * @Author lhy
	 * @DateTime 2019年11月29日 下午1:58:54
	 * @param req
	 * @return
	 */
	@RequestMapping("/goodsadd.htm")
	public String goodsadd(HttpServletRequest req) {
		
		//三级分类列表
		List<Goodsclassplus> classlist = goodsClassService.GoodsClassFindAllByLevel(0);
		req.setAttribute("classlistforgoodsadd", classlist);
		//所有品牌列表
		List<Goodsbrand> brandlist = goodsbrandservice.findall();
		req.setAttribute("brandlistforgoodsadd", brandlist);
		//所有规格列表
		List<Specplus> speclist = specservice.findall();
		req.setAttribute("speclistforgoodsadd", speclist);
		for (Specplus specplus : speclist) {
			System.out.println(specplus.getId());
		}
		
		return "goods_list_add";
	}

	/**
	 * 
	 * @Title: findspecval
	 * @Description: 根据规格展示相应的规格值
	 * @Author lhy
	 * @DateTime 2019年11月29日 下午1:59:09
	 * @param specid
	 * @return
	 */
	@RequestMapping("/findspecval.htm")
	@ResponseBody
	public String findspecval(Integer specid) {
		
		List<Specval> list = specvalservice.selectByspecid(specid);
		JSONObject jo = new JSONObject();
		jo.put("specvallist", list);
		
		return jo.toString();
	}

	/**
	 * 
	 * @Title: getbrandbyclassid
	 * @Description: 根据类型展示相应的品牌
	 * @Author lhy
	 * @DateTime 2019年11月29日 下午1:59:48
	 * @param 
	 * @return
	 */
	@RequestMapping("/getbrandbytypeid.htm")
	@ResponseBody
	public String getbrandbyclassid(Integer typeid) {
		
		List<Goodsbrandplus> brandlist = service.selectBrandByClassId(typeid);
		
		JSONObject jo = new JSONObject();
		jo.put("brandlist", brandlist);

		return jo.toString();
	}

	// add by lhy 1129 end

	@RequestMapping("/goodsfindall.htm")
	public String goodsfindall(HttpServletRequest req) {

		List<Goodsplus> list = service.findAll();
		req.setAttribute("goodslist", list);

		// add by zy

		List<Goodsbrand> goodslist = goodsbrandservice.findall();
		List<Goodsclassplus> listgoods = goodsClassService.GoodsClassFindAllByLevel(0);
		req.setAttribute("goodsbrandbygoods", goodslist);
		req.setAttribute("goodsbrandbygoodsclassplus", listgoods);

		// add by zy

		return "goods_list";
	}

	// add by zhaoyu 1128 begin

	@RequestMapping("/selectgoods.htm")
	public String selectgoods(Goods goods, HttpServletRequest req) {
		List<Goodsplus> list = service.selectbynameAndClassnameAndBrandname(goods);
		req.setAttribute("goodslist", list);

		List<Goodsbrand> goodslist = goodsbrandservice.findall();
		List<Goodsclassplus> listgoods = goodsClassService.GoodsClassFindAllByLevel(0);
		req.setAttribute("goodsbrandbygoods", goodslist);
		req.setAttribute("goodsbrandbygoodsclassplus", listgoods);
		return "goods_list";
	}

	// add by zhaoyu 1128 end
	
	//add by lhy 1129 begin
	
	@RequestMapping("/goodsaddsubmit.htm")
	public String goodsaddsubmit(Goods goods) {
		
		service.insertSelective(goods);
		return "redirect:/goodsfindall.htm";
	}
	
	//add by lhy 1129 end

}
