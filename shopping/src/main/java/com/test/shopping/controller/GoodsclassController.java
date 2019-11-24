package com.test.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.shopping.entity.Goodsclass;
import com.test.shopping.entity.Goodsclassplus;
import com.test.shopping.entity.Goodsclasstype;
import com.test.shopping.entity.Goodstype;
import com.test.shopping.service.GoodsclassService;
import com.test.shopping.service.GoodstypeService;

@Controller
public class GoodsclassController {

	/**
	 * 分类
	 */
	@Autowired
	private GoodsclassService service;

	/**
	 * 类型
	 */
	@Autowired
	private GoodstypeService goodsTypeService;

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

		// 三级列表
		List<Goodsclassplus> list = service.GoodsClassFindAllByLevel(0);
		req.setAttribute("goodsclasslist", list);

		// 第三级下的类型
		List<Goodstype> typelist = goodsTypeService.goodstypefindall();
		req.setAttribute("goodsclasstypelist", typelist);

		return "goods_class_list";
	}

	/**
	 * 
	 * @Title: goodsClassEdit
	 * @Description: 带参数跳转至编辑页面
	 * @Author lhy
	 * @DateTime 2019年11月22日 下午12:38:13
	 * @return
	 */
	@RequestMapping("/goodsClassEdit.htm")
	public String goodsClassEdit(Goodsclass gs, HttpServletRequest req) {

		// 所有的分类
		List<Goodsclassplus> classlist = service.GoodsClassFindAllByLevel(0);
		req.setAttribute("goodsclasslist", classlist);
		// 所有的类型
		List<Goodstype> typelist = goodsTypeService.goodstypefindall();
		req.setAttribute("goodsclasstypelist", typelist);
		
		return "goods_class_edit";
	}
	
	/**
	 * 
	 * @Title: goodsclasseditsubmit
	 * @Description: 修改
	 * @Author lhy
	 * @DateTime 2019年11月24日 上午10:13:19
	 * @param gs
	 * @return
	 */
	@RequestMapping("/goodsclasseditsubmit.htm")
	public String goodsclasseditsubmit(Goodsclass gs) {
		
		service.updateByPrimaryKeySelective(gs);
		return "redirect:/goodsclassfindall.htm";
	}
	
	/**
	 * 
	 * @Title: goodsClassAddJunior
	 * @Description: 新增下级页面(带参跳转)
	 * @Author lhy
	 * @DateTime 2019年11月24日 上午10:51:19
	 * @return
	 */
	@RequestMapping("/goodsClassAddJunior.htm")
	public String goodsClassAddJunior(Goodsclass gs, HttpServletRequest req) {
		
		// 所有的分类
		List<Goodsclassplus> classlist = service.GoodsClassFindAllByLevel(0);
		req.setAttribute("goodsclasslist", classlist);
		// 所有的类型
		List<Goodstype> typelist = goodsTypeService.goodstypefindall();
		req.setAttribute("goodsclasstypelist", typelist);
		
		return "goods_class_junior";
	}
	
	/**
	 * 
	 * @Title: goodsclassaddjuniorsubmit
	 * @Description: 新增下级提交
	 * @Author lhy
	 * @DateTime 2019年11月24日 上午11:17:00
	 * @param name
	 * @param parentid
	 * @param typeid
	 * @param display
	 * @param recommend
	 * @param sort
	 * @return
	 */
	@RequestMapping("/goodsclassaddjuniorsubmit.htm")
	public String goodsclassaddjuniorsubmit(String name,String parentid,Integer typeid,Boolean display,Boolean recommend,Integer sort) {
		
		Goodsclass gs = new Goodsclass();
		String[] str = parentid.split(",");
		gs.setName(name);
		gs.setSort(sort);
		gs.setDisplay(display);
		gs.setRecommend(recommend);
		gs.setTypeid(typeid);
		gs.setParentid(Integer.parseInt(str[0]));
		gs.setLevel(Integer.parseInt(str[1])+1);
		service.insertSelective(gs);
		return "redirect:/goodsclassfindall.htm";
	}
	
	@RequestMapping("/goodsclassdeleteall.htm")
	public String goodsclassdeleteall(String ids) {
		
		int ret = service.deleteAll(ids);
		return "redirect:/goodsclassfindall.htm";
	}

	/**
	 * 
	 * @Title: goodsclassadd
	 * @Description: 新增页面
	 * @Author lys
	 * @DateTime 2019年11月22日 上午13:34:31
	 * @return
	 */
	@RequestMapping("/goodsclassadd.htm")
	public String goodsclassadd(HttpServletRequest req) {
		List<Goodsclassplus> list = service.GoodsClassFindAllByLevel(0);
		req.setAttribute("goodsclasslist", list);

		List<Goodstype> typelist = goodsTypeService.goodstypefindall();
		req.setAttribute("typelistforgoodsclass", typelist);
		return "goods_class_add";
	}

	/**
	 * 
	 * @Title: goodsclassaddsubmit
	 * @Description: 新增提交
	 * @Author lys
	 * @DateTime 2019年11月22日 上午14:05:31
	 * @return
	 */
	@RequestMapping("/goodsclassaddsubmit.htm")
	public String goodsclassaddsubmit(Goodsclass gs) {
		service.insertSelective(gs);
		return "redirect:/goodsclassfindall.htm";
	}

	// add by zhaoyu 1122 begin

	/*
	 * 单选删除
	 */
	@RequestMapping("/deletegoodsclass.htm")
	@ResponseBody
	public String deletegoodsclass(String ids) {

		int ret = service.deletegoodsclassById(ids);
		if (ret != 0) {
			return "success";
		} else {
			return "error";
		}
	}

	// add by zhaoyu 1122 end

	// add xdx 11.22 begin

	@RequestMapping("/goodsclassupdata.htm")
	@ResponseBody
	public String goodsclassupdata(Integer id, String fieldName, String value) {
		Goodsclass gc = new Goodsclass();
		gc.setId(id);
		if ("sort".equals(fieldName)) {
			gc.setSort(Integer.parseInt(value));
		} else {
			gc.setName(value);
		}
		int ret = service.updateByPrimaryKeySelective(gc);
		if (ret == 1) {
			return "success";
		} else {
			return "error";
		}
	}

	@RequestMapping("/goodsclassupdateimg.htm")
	@ResponseBody
	public String goodsclassupdateimg(Integer id, Boolean recommend) {
		Goodsclass gc = new Goodsclass();
		gc.setId(id);
		gc.setRecommend(!recommend);
		int ret = service.updateByPrimaryKeySelective(gc);
		if (ret == 1) {
			return "success";
		} else {
			return "error";
		}
	}

	@RequestMapping("/goodsclassupdatexs.htm")
	@ResponseBody
	public String goodsclassupdatexs(Integer id, Boolean display) {
		Goodsclass gc = new Goodsclass();
		gc.setId(id);
		gc.setDisplay(!display);
		int ret = service.updateByPrimaryKeySelective(gc);
		if (ret == 1) {
			return "success";
		} else {
			return "error";
		}
	}

	// add xdx 11.22 end

}
