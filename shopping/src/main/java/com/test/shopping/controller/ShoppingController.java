package com.test.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.test.shopping.entity.Goods;
import com.test.shopping.entity.Spec;
import com.test.shopping.entity.Specval;
import com.test.shopping.entity.User;
import com.test.shopping.service.GoodsService;
import com.test.shopping.service.GoodsuserService;
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
}
