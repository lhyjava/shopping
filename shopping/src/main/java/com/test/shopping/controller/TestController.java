package com.test.shopping.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.shopping.entity.Test;
import com.test.shopping.service.TestService;

@Controller
public class TestController {

	@Autowired
	private TestService service;
	
	@RequestMapping("/testlogin")
	public String fun(String username, String password){
		
		System.out.println(username+" "+password);
		
		Test test = service.selectByName(username);
		if (test == null) {
			//登录失败
			return "redirect:/login.jsp";
		}
		else{
			if(test.getPass().equals(password)){
				//登录；成功
				return "redirect:/success.jsp";
			}
			else{
				//登录失败
				return "redirect:/login.jsp";
			}
		}
	}
	
	@RequestMapping("/testchaxun")
	public String fun1(Integer userid, HttpSession session){
		Test test =  service.selectByPrimaryKey(userid);
		session.setAttribute("testobj", test);
		return "redirect:/show.jsp";
	}
}
