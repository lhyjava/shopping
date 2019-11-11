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
 * @Description: 
 * @Author lhy
 * @DateTime 2019年11月11日 下午2:37:13
 */
@Controller
public class GoodsbrandController {
	
	@Autowired
	private GoodsbrandService service;

	@RequestMapping("/goodsbrandfindall.htm")
	public String goodsbrandfindall(HttpServletRequest req)
	{
		//请求goodsbrand表数据
		List<Goodsbrand> list = service.findall();
		//将数据放到容器中
		req.setAttribute("goodsbrandlist", list);
		//转发，服务器直接将该页面的数据发送给客户端浏览器显示
		return "goods_brand_list";
	}
	
}
