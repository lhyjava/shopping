package com.test.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.shopping.entity.Goodsbrand;
import com.test.shopping.service.GoodsbrandService;

/**
 * 
 * @ClassName: GoodsbrandController
 * @Description: 品牌管理
 * @Author lhy
 * @DateTime 2019年11月11日 下午2:37:13
 */
@Controller
public class GoodsbrandController {
	
	@Autowired
	private GoodsbrandService service;

	@RequestMapping("/goodsbrandfindall.htm")
	public String goodsbrandfindall(HttpServletRequest req){
		
		List<Goodsbrand> list = service.findall();
		req.setAttribute("goodsbrandlist", list);
		return "goods_brand_list";
	}
	
}
