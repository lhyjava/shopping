package com.test.shopping.controller;

import java.util.ArrayList;
import java.util.Arrays;
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

	/**
	 * 购物车
	 */
	@Autowired
	private ShoppingcarService shopservice;

	//add by lhy 1210 begin
	
	/**
	 * 
	 * @Title: tianjiagouwuche
	 * @Description: 添加到购物车，并在购物车页面显示
	 * @Author Administrator
	 * @DateTime 2019年12月10日 下午8:58:13
	 * @return
	 */
	@RequestMapping("/tianjiagouwuche.htm")
	public String tianjiagouwuche(Integer userid,Integer goodsid,String name,String img,Integer opice,Integer number,
								  String[] specnames,String[] specvals,HttpServletRequest req) {
		
		//添加到购物车
		shopservice.insertShoppingCar(userid, goodsid, name, img, opice, number, specnames, specvals);
		//显示到购物车列表
		List<Shoppingcar> list = shopservice.selectByUserid(userid);
		String str = shopservice.selectzongjiaByUserid(userid);
		req.setAttribute("shoppingcarlist", list); req.setAttribute("zongjia", str);
		return "shoppingcar";
	}
	
	//add by lhy 1210 end

	@RequestMapping("/numberupdate.htm")
	@ResponseBody
	public String numberupdate(Integer id, Integer number) {
		int ret = shopservice.updateById(id, number);
		if (ret == 1) {
			return "success";
		} else {
			return "error";
		}
	}
	
	//add by zhaoyu 1216 begin
	@RequestMapping("/delcurrtr.htm")
	@ResponseBody
	public String delcurrtr(Integer id) {
		
		int data = shopservice.deleteByPrimaryKey(id);
		if(data != 0) {
			return "success";
		}else{
			return "error";
		}
		
	}
	  
	  //add by zhaoyu 1216 end

}
