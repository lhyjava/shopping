package com.test.shopping.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.shopping.entity.Goods;
import com.test.shopping.entity.Shoppingcar;
import com.test.shopping.service.ShoppingcarService;

@Controller
public class shoppingcarController {

	@Autowired
	private ShoppingcarService shopservice;
	
	@RequestMapping("showaa.htm")
	public String shiw() {
		return "shoppingcar";
	}
	
	
	@RequestMapping("/tianjiagouwuche.htm")
	public String tianjiagouwuche(Goods goods,Integer goodscount,Integer userid,HttpServletRequest req) {

		/*
		 * System.out.println(specname); System.out.println(sparvals);
		 */

		  //shopservice.insertShoppngcar(goods, specname,sparvals, goodscount, userid);
		  List<Shoppingcar> list = shopservice.selectByUserid(userid);
		  String str = shopservice.selectzongjiaByUserid(userid);
		  req.setAttribute("shoppingcarlist", list); req.setAttribute("zongjia", str);
		 		 
		return"shoppingcar"; 
	}
	
	
	@RequestMapping("/numberupdate.htm")
	@ResponseBody
	public String numberupdate(Integer id,Integer number) {
		int ret = shopservice.updateById(id, number);
		if(ret == 1) {
			return"success";
		}else {
			return"error";
		}
	}
	
	
}




