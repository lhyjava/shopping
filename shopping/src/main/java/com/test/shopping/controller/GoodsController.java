package com.test.shopping.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.shopping.entity.ClassForBrand;
import com.test.shopping.entity.ClassForSpec;
import com.test.shopping.entity.Goodsclassplus;
import com.test.shopping.service.GoodsService;
import com.test.shopping.service.GoodsclassService;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService service;
	
	/**
	 * 分类
	 */
	@Autowired
	private GoodsclassService goodsClassService;
	
	/**
	 * 
	 * @Title: goodsadd
	 * @Description: 商品添加页面
	 * @Author lhy
	 * @DateTime 2019年11月27日 下午1:15:03
	 * @return
	 */
	@RequestMapping("/goodsadd.htm")
	public String goodsadd(HttpServletRequest req) {
		
		//商品图片列表
		/*
		 * File dirfile = new File("D:\\image"); String[] fnames = dirfile.list();
		 * List<String> imgList = new ArrayList<>(); for (String string : fnames) {
		 * imgList.add(string); } req.setAttribute("imagelist", imgList);
		 */
		//三级分类列表
		List<Goodsclassplus> classList = goodsClassService.GoodsClassFindAllByLevel(0);
		req.setAttribute("goodsclasslist", classList);
		//品牌名称列表
		List<ClassForBrand> brandList = service.selectForBrand();
		req.setAttribute("brandList", brandList);
		//规格列表
		List<ClassForSpec> specList = service.selectForSpec();
		req.setAttribute("specList", specList);
		
		return "goods_add";
	}
}











