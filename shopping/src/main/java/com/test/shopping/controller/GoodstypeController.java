package com.test.shopping.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.shopping.entity.Goodsbrand;
import com.test.shopping.entity.Goodstype;
import com.test.shopping.entity.Specplus;
import com.test.shopping.entity.Typebrand;
import com.test.shopping.entity.Typespec;
import com.test.shopping.service.GoodsbrandService;
import com.test.shopping.service.GoodstypeService;
import com.test.shopping.service.SpecService;
import com.test.shopping.service.TypebrandService;
import com.test.shopping.service.TypespecService;

@Controller
public class GoodstypeController {

	/**
	 * 品牌
	 */
	@Autowired
	private GoodsbrandService goodsbrandservice;

	/**
	 * 类型
	 */
	@Autowired
	private GoodstypeService service;

	/**
	 * 规格
	 */
	@Autowired
	private SpecService specService;

	/**
	 * 类型规格
	 */
	@Autowired
	private TypespecService typespecService;

	/**
	 * 类型品牌
	 */
	@Autowired
	private TypebrandService typebrandService;

	/**
	 * 
	 * @Title: goodstypeaddsubmit
	 * @Description:类型添加、类型规格添加、类型品牌添加 类型名为唯一约束，当类型添加成功时才能执行另外两个添加操作 失败时不进行添加操作
	 * @Author lhy
	 * @DateTime 2019年11月18日 下午12:21:32
	 * @param name    类型名
	 * @param sort    排序
	 * @param specid  规格编号
	 * @param brandid 品牌编号
	 * @return
	 */
	@RequestMapping("/goodstypeaddsubmit.htm")
	public String goodstypeaddsubmit(String name, Integer sort, Integer[] specid, Integer[] brandid) {

		// 添加类别
		Goodstype gt = new Goodstype();
		gt.setName(name);
		gt.setSort(sort);
		int ret = service.insertSelective(gt);

		// 类别添加成功
		if (ret == 1) {

			// 根据类别查找对应的id
			Goodstype gt1 = service.selectByName(name);
			Integer typeid = gt1.getId();

			// 添加类别规格
			List<Typespec> speclist = new ArrayList<Typespec>();
			for (int i = 0; i < specid.length; i++) {

				Typespec ts = new Typespec();
				ts.setTypeid(typeid);
				ts.setSpecid(specid[i]);
				speclist.add(ts);
			}
			typespecService.insertByTypeid(speclist);

			// 添加类别品牌
			List<Typebrand> brandlist = new ArrayList<Typebrand>();
			for (int i = 0; i < brandid.length; i++) {

				Typebrand tb = new Typebrand();
				tb.setTypeid(typeid);
				tb.setBrandid(brandid[i]);
				brandlist.add(tb);
			}
			typebrandService.insertByTypeid(brandlist);

		}

		return "redirect:/goodstypefindall.htm";
	}

	/**
	 * 
	 * @Title: GoodsTypeEdit
	 * @Description: 修改页面
	 * @Author lhy
	 * @DateTime 2019年11月21日 下午2:28:43
	 * @param id
	 * @param name
	 * @param sort
	 * @return
	 */
	@RequestMapping("/goodstypeedit.htm")
	public String GoodsTypeEdit(Integer id, String name, Integer sort, HttpServletRequest req) {

		// 所有规格信息
		List<Specplus> specsList = specService.findall();
		req.setAttribute("specpluslistfortype", specsList);
		// 所有品牌类型
		List<String> brandTypeList = goodsbrandservice.selectAllType();
		req.setAttribute("typelistforgoodstype", brandTypeList);
		// 所有品牌名
		List<Goodsbrand> brandNameList = goodsbrandservice.findall();
		req.setAttribute("brandlistforgoodstype", brandNameList);

		// 关联的规格信息
		List<Specplus> specRelevanceList = service.selectBySpecplus(id);
		req.setAttribute("findBySpec", specRelevanceList);
		// 关联的品牌名
		List<Goodsbrand> goodsBrandRelevanceList = service.selectByBrandName(id);
		req.setAttribute("findByGoodsBrand", goodsBrandRelevanceList);
		
		return "goods_type_edit";
	}

	/**
	 * 
	 * @Title: checkedById
	 * @Description: 修改
	 * @Author Administrator
	 * @DateTime 2019年11月21日 下午6:04:07
	 * @param id
	 * @return
	 */
	@RequestMapping("/goodstypeeditsubmit.htm")
	public String goodsTypeEditSubmit(Goodstype gt, Integer[] specid, Integer[] brandid) {

		// 修改类型名
		service.updateByPrimaryKeySelective(gt);

		// 删除所有规格信息和品牌信息
		typespecService.deleteByTypeId(gt.getId());
		typebrandService.deleteByTypeId(gt.getId());
		
		// 根据类别查找对应的id
		Goodstype gt1 = service.selectByName(gt.getName());
		Integer typeid = gt1.getId();

		// 添加类别规格
		List<Typespec> speclist = new ArrayList<Typespec>();
		for (int i = 0; i < specid.length; i++) {

			Typespec ts = new Typespec();
			ts.setTypeid(typeid);
			ts.setSpecid(specid[i]);
			speclist.add(ts);
		}
		//typespecService.insertByTypeid(speclist);

		// 添加类别品牌
		List<Typebrand> brandlist = new ArrayList<Typebrand>();
		for (int i = 0; i < brandid.length; i++) {

			Typebrand tb = new Typebrand();
			tb.setTypeid(typeid);
			tb.setBrandid(brandid[i]);
			brandlist.add(tb);
		}
		//typebrandService.insertByTypeid(brandlist);

		return "redirect:/goodstypefindall.htm";
	}

	/**
	 * 
	 * @Title: goodstype
	 * @Description: 表单验证，名称存在时不允许提交
	 * @Author lhy
	 * @DateTime 2019年11月20日 下午3:14:18
	 * @param name
	 * @return
	 */
	@RequestMapping("goodstype.htm")
	@ResponseBody
	public String goodstype(String name) {

		String n = service.selectByNameValidate(name);

		if (n == null) {
			// 用户名不存在
			return "true";
		} else {
			return "false";
		}
	}

	/**
	 * 
	 * @Title: goodstypeadd
	 * @Description: 类型添加页面
	 * @Author lys
	 * @DateTime 2019年11月18日 下午2:14:00
	 * @param req
	 * @return
	 */
	@RequestMapping("/goodstypeadd.htm")
	public String goodstypeadd(HttpServletRequest req) {
		// 查询所有规格
		List<Specplus> list = specService.findall();
		req.setAttribute("specpluslistfortype", list);
		// 查询所有品牌
		List<String> typelist = goodsbrandservice.selectAllType();
		List<Goodsbrand> brandlist = goodsbrandservice.findall();
		req.setAttribute("typelistforgoodstype", typelist);
		req.setAttribute("brandlistforgoodstype", brandlist);
		return "goods_type_add";
	}

	/**
	 * 
	 * @Title: goodstypeupdate
	 * @Description: 页面内修改
	 * @Author xdx
	 * @DateTime 2019年11月18日 下午2:56:05
	 * @param id
	 * @param fieldName
	 * @param value
	 * @return
	 */
	@RequestMapping("/goodstypeupdate.htm")
	@ResponseBody
	public String goodstypeupdate(Integer id, String fieldName, String value) {

		Goodstype gt = new Goodstype();
		gt.setId(id);

		if ("sort".equals(fieldName)) {
			gt.setSort(Integer.parseInt(value));
		} else {
			gt.setName(value);
			;
		}

		int ret = service.updateByPrimaryKeySelective(gt);
		if (ret == 1) {
			// 更新成功
			return "success";
		} else {
			// 更新失败
			return "error";
		}

	}

	// add by zy
	@RequestMapping("/goodstypefindall.htm")
	public String goodstypefindall(HttpServletRequest req) {
		List<Goodstype> list = service.goodstypefindall();
		req.setAttribute("goodstypelist", list);
		return "goods_type_list";
	}

	@RequestMapping("/deletegoodstype.htm")
	@ResponseBody
	public String deletegoodstype(Integer id) {
		int ret = service.deleteByPrimaryKey(id);
		if (ret == 1) {
			return "success";
		} else {
			return "error";
		}
	}

	@RequestMapping("/deletegoodstypes.htm")
	public String deletegoodstypes(String values) {
		int ret = service.goodstypedeleteall(values);
		return "redirect:/goodstypefindall.htm";

	}
}
