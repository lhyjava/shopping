package com.test.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.shopping.entity.User;
import com.test.shopping.service.GoodsuserService;

@Controller
public class GoodsuserController {

	@Autowired
	private GoodsuserService userservice;
	
	
	@RequestMapping("/goodsuserfindall.htm")
	public String goodsuserfindall(HttpServletRequest req){
		List<User> list = userservice.goodsuserfindall();
		req.setAttribute("goodsuserlist", list);
		return"goods_user_list";
	}
	
	@RequestMapping("/goodsuseraddsubmit.htm")
	public String goodsuseraddsubmit(User user) {
		
		userservice.insert(user);
		return"redirect:/goodsuserfindall.htm";
	}
	
	
	@RequestMapping("/goodsuseradd.htm")
	public String goodsuseradd() {
		
		return"goods_user_add";
	}
	
	
	@RequestMapping("/aa")
	public String goodsuserquery(String value,String condition, HttpServletRequest req) {
		System.out.println(value);
		
		  if("1".equals(condition)) {
		  
		  List<User> list1 = userservice.selectByUserame(value); 
		  req.setAttribute("goodsuserlist", list1);
		  
		  }else if ("2".equals(condition)) { 
			   
			  List<User> list2 = userservice.selectByMail(value); 
			  req.setAttribute("goodsuserlist", list2);
		  
		  }else if("3".equals(condition)) { 
			  
		  List<User> list3 =userservice.selectByName(value); 
		  req.setAttribute("goodsuserlist", list3);
		  
		  }

		return "goods_user_list";
	}
	
}







