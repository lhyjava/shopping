package com.test.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.test.shopping.entity.Adv;
import com.test.shopping.entity.Goods;
import com.test.shopping.entity.Goodsclassplus;
import com.test.shopping.entity.Spec;
import com.test.shopping.entity.Specval;
import com.test.shopping.service.AdvService;
import com.test.shopping.service.GoodsService;
import com.test.shopping.service.GoodsclassService;
import com.test.shopping.service.ShoppingService;

@Controller
public class ShoppingController {

	@Autowired
	private ShoppingService service;
	
	/**
	 *	商品
	 */
	@Autowired
	private GoodsService goodsService;
	
	/**
	 * 三级分类
	 */
	@Autowired
	private GoodsclassService goodsclassservice;
	
	/**
	 * 轮播图
	 */
	@Autowired
	private AdvService advservice;

	// add by lhy 1202 begin
	
	/**
	 * 
	 * @Title: commodityDetailsShow
	 * @Description: 商品列表页点击事件
	 * @Author lhy
	 * @DateTime 2019年12月4日 上午9:50:31
	 * @param id
	 * @return
	 */
	@RequestMapping("/commodityDetailsShow.htm")
	public String commodityDetailsShow(Integer id) {
		return "commodityDetails";
	}

	/**
	 * 
	 * @Title: commodityDetails
	 * @Description: 商品详情
	 * @Author lhy
	 * @DateTime 2019年12月4日 上午9:50:16
	 * @param id
	 * @return
	 */
	@RequestMapping("/commodityDetails.htm")
	@ResponseBody
	public String commodityDetails(Integer id) {
		
		//商品信息
		Goods g = goodsService.selectByPrimaryKey(id);
		//商品规格名
		List<Spec> specList = service.selectSpecByClassId(id);
		//商品规格值
		List<Specval> specvalList = service.selectSpecValByClassId(id);
		
		JSONObject json = new JSONObject();
		json.put("goods", g);
		json.put("specList", specList);
		json.put("specvalList", specvalList);
		
		return json.toString();
	}

	// add by lhy 1202 end
	
	//add by lys 1205 begin
	
	/* index页面请求方法 */
	
	@RequestMapping("/indexpage.htm")
	public String indexshow()
	{
		return "index";
	}
	
	@RequestMapping("/shangcheng.htm")
	public String showindex(HttpServletRequest req)
	{
		List<Goodsclassplus> list = goodsclassservice.GoodsClassFindAllByLevel(0);
		req.setAttribute("classforfirstpage", list);
		
		List<Adv> advlist = advservice.selectByadvfindall();
		req.setAttribute("advlist", advlist);
		return "firstpage";
	}
	
	@RequestMapping("/goodsfirstpage.htm")
	public String selectBygoodsname(String keyword,HttpServletRequest req)
	{
		List<Goods> goodsnamelist = goodsService.selectBygoodsname(keyword);
		req.setAttribute("goodslist", goodsnamelist);
		return "qiantaishangpin_list";
	}
	
	@RequestMapping("/advimgurl.htm")
	public String selectByadvimgurl(String img,HttpServletRequest req)
	{
		return "photo";
	}
	
	//add by lys 1205 end
	
	//add by zhaoyu 1203 begin
	
	@RequestMapping("/findallgoods.htm")
	public String findallgoods(Integer goodsclassid,Integer level,HttpServletRequest req) {
		List<Goods> list = null;
		  if(level == 2) { 
			  list = service.selectBygoodsclassid3(goodsclassid); 
		  }else if(level == 1) {
			  list = service.selectBygoodsclassid2(goodsclassid); 
		  }else if(level == 0) {
			  list = service.selectBygoodsclassid1(goodsclassid);
		  }
		  req.setAttribute("goodslist", list);
		  req.getSession().setAttribute("level", level);
		  req.getSession().setAttribute("goodsclassid", goodsclassid);
		  
		return "qiantaishangpin_list";
	}
	
	@RequestMapping("/findbygoods.htm")
	public String findgoods(Integer store_price_begin,Integer store_price_end,String goods_name,HttpServletRequest req) {
		Integer level = (Integer) req.getSession().getAttribute("level");
		int leve = level.intValue();
		Integer id = (Integer) req.getSession().getAttribute("goodsclassid");
		int goodsclassid = id.intValue();
		List<Goods> list = null;
		if(leve == 2) { 
			list = service.selectgoods3(store_price_begin,store_price_end,goodsclassid, goods_name);
		}else if(leve == 1) {
			list = service.selectgoods2(store_price_begin,store_price_end,goodsclassid, goods_name);
		}else if(leve == 0) { 
			list = service.selectgoods1(store_price_begin,store_price_end,goodsclassid, goods_name);
		}
		req.setAttribute("goodslist", list);
		
		return "qiantaishangpin_list";
	}
	
	/**
	 * 根据价格高低排序
	 * @param panduan 判断当前价格排序的状态
	 * @param req
	 * @return
	 */
	@RequestMapping("/piceorder.htm")
	public String piceorder(String panduan,HttpServletRequest req) {
		List<Goods> list = null;
		if(panduan.equals("0")) {
			list = service.orderbydesc();
			req.getSession().removeAttribute("panduanpice");
		}else {
			list = service.orderbyasc();
			req.getSession().setAttribute("panduanpice", "pice");
			
		}
		req.setAttribute("goodslist", list);
		return "qiantaishangpin_list";
	}
	//add by zhaoyu 1203 end
}
