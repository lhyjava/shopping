package com.test.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.shopping.entity.Addorder;
import com.test.shopping.entity.Ordergoods;
import com.test.shopping.service.AddOrderService;
import com.test.shopping.service.OrdergoodsService;

@Controller
public class OrderformController {

	@Autowired
	private AddOrderService addorderservice;

	@Autowired
	private OrdergoodsService ordergoodsservice;

	// add by lys 1209 begin
	
	@RequestMapping("/addordersearch.htm")
	public String selectByfindall(String ordernumber, String begintime, String endtime, String delivery,
			HttpServletRequest req) {
		List<Addorder> list = addorderservice.selectByaddorder(ordernumber, begintime, endtime, delivery);
		req.setAttribute("addorderlist", list);
		List<Ordergoods> list1 = ordergoodsservice.selectByfindall();
		req.setAttribute("ordergoodslist", list1);
		return "order_form";
	}

	// add by lys 1209 end
	
	//add by lhy 1217 begin
	
	@RequestMapping("findorder.htm")
	public String findorder(Integer userid,HttpServletRequest req) {
		
		
		//订单列表展示
		List<Addorder> list = addorderservice.selectByaddorderfindAll(userid);
		req.setAttribute("addorderlist", list);
		List<Ordergoods> list1 = ordergoodsservice.selectByfindall();
		req.setAttribute("ordergoodslist", list1);
		return "order_form";
	}
	
	//add by lhy 1217 end

}
