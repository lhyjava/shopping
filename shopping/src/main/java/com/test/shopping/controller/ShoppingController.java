package com.test.shopping.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.test.shopping.entity.Goods;
import com.test.shopping.entity.GoodsDetails;
import com.test.shopping.entity.Spec;
import com.test.shopping.entity.Specplus;
import com.test.shopping.entity.Specval;
import com.test.shopping.service.GoodsService;
import com.test.shopping.service.ShoppingService;

@Controller
public class ShoppingController {

	@Autowired
	private ShoppingService service;
	
	@Autowired
	private GoodsService goodsService;
	

	// add by lhy 1202 begin
	//该请求应为ajax方式发出  传参
	@RequestMapping("/commodityDetailsShow.htm")
	public String commodityDetailsShow(Integer id) {
		return "commodityDetails";
	}

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
