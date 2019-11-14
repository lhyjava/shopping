package com.test.shopping.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.shopping.entity.Specval;
import com.test.shopping.service.SpecvalService;

@Controller
public class SpecvalController {

	@Autowired
	private SpecvalService service;
	
	/**
	 * 
	 * @Title: specandvalinsert
	 * @Description:  根据规格id添加多条记录
	 * @Author lhy
	 * @DateTime 2019年11月14日 下午1:32:35
	 * @param specid 规格id
	 * @param valsort
	 * @param valname
	 * @return
	 */
	@RequestMapping("/specandvalinsert.htm")
	public String specandvalinsert(Integer specid, Integer[] valsort, String[] valname){
		
		List<Specval> list = new ArrayList<Specval>();
		
		for (int i=0; i<valname.length; i++) {
			Specval s = new Specval();
			s.setSpecid(specid);
			s.setSort(valsort[i]);
			s.setValue(valname[i]);
			list.add(s);
		}
		
		int ret = service.insertlist(list);
		
		return "redirect:/specfindall.htm";
	}
	
	/**
	 * 
	 * @Title: spacvaledit
	 * @Description: 修改(带参跳转)
	 * @Author lhy
	 * @DateTime 2019年11月15日 上午7:14:32
	 * @return
	 */
	@RequestMapping("/spacvaledit.htm")
	public String spacvaledit(Integer id,Integer sort,String name,HttpServletRequest req) {
		
		List<Specval> list = service.selectByspecid(id);
		req.setAttribute("specvals", list);
		
		return "spec_edit";
	}
}
