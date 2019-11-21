package com.test.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.shopping.entity.Goodsclass;
import com.test.shopping.entity.Goodsclassplus;
import com.test.shopping.service.GoodsclassService;

@Controller
public class GoodsclassController {

	/**
	 * 	分类
	 */
	@Autowired
	private GoodsclassService service;
	
	/**
	 * 
	 * @Title: goodsclassfindall
	 * @Description: 三级分类列表
	 * @Author lhy
	 * @DateTime 2019年11月21日 上午11:58:31
	 * @return
	 */
	@RequestMapping("/goodsclassfindall.htm")
	public String goodsclassfindall(HttpServletRequest req) {
		
		List<Goodsclassplus> list = service.GoodsClassFindAllByLevel(0);
		req.setAttribute("goodsclasslist", list);
		return "goods_class_list";
	}
	
}
