package com.test.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sound.midi.SysexMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.shopping.entity.Spec;
import com.test.shopping.entity.Specplus;
import com.test.shopping.service.SpecService;

@Controller
public class SpecController {

	@Autowired
	private SpecService service;
	
	/**
	 * 
	 * @Title: specfindall
	 * @Description: 规格管理页面展示
	 * @Author lhy
	 * @DateTime 2019年11月14日 下午2:17:55
	 * @param req
	 * @return
	 */
	@RequestMapping("/specfindall.htm")
	public String specfindall(HttpServletRequest req){
		List<Specplus> list = service.findall();
		req.setAttribute("specpluslist", list);
		return "spec_list";
	}
	
	/**
	 * 
	 * @Title: specadd
	 * @Description: 跳转至规格添加页面
	 * @Author lhy
	 * @DateTime 2019年11月14日 下午1:13:19
	 * @return
	 */
	@RequestMapping("/specadd.htm")
	public String specadd(){
		
		return "spec_add";
	}
	
	/**
	 * 
	 * @Title: specinsert
	 * @Description: 向规格表添加规格，并取出添加信息的id相响应回去
	 * @Author lhy
	 * @DateTime 2019年11月14日 下午1:15:35
	 * @param spec
	 * @return
	 */
	@RequestMapping("/specinsert.htm")
	@ResponseBody
	public String specinsert(Spec spec) {
		
		//插入规格
		int ret = service.insert(spec);
		
		//插入失败返回error
		if(ret != 1) {
			return "error";
		}
		
		//插入成功，查询该条记录的id
		Spec s = service.selectByName(spec.getName());
		
		//没查到返回error
		if(s == null) {
			return "error";
		}
		
		//查询到，响应
		return ""+s.getId();
	}
	
	/**
	 * 
	 * @Title: specupdate
	 * @Description: 页面内修改
	 * @Author lhy
	 * @DateTime 2019年11月14日 下午2:54:21
	 * @param id
	 * @param fieldName
	 * @param value
	 * @return
	 */
	@RequestMapping("/specupdate.htm")
	@ResponseBody
	public String specupdate(Integer id,String fieldName,String value) {
		
		Spec spec = new Spec();
		spec.setId(id);
		
		//判断修改列
		if("sort".equals(fieldName)){
			spec.setSort(Integer.parseInt(value));
		}else {
			spec.setName(value);
		}
		
		//调用修改方法
		int ret = service.updateByPrimaryKeySelective(spec);
		
		//修改后返回
		if(ret == 1){
			return "success";
		}else{
			return "error";
		}
	}
	
	/**
	 * 
	 * @Title: specdel
	 * @Description: 单条删除
	 * @Author lhy
	 * @DateTime 2019年11月14日 下午2:55:01
	 * @param id
	 * @return
	 */
	@RequestMapping("/specdel.htm")
	public String specdel(Integer id) {
		
		int ret = service.deleteByPrimaryKey(id);
		return "redirect:/specfindall.htm";
	}
	
	/**
	 * 
	 * @Title: specdeleteall
	 * @Description: 批量删除
	 * @Author lhy
	 * @DateTime 2019年11月14日 下午3:02:13
	 * @param ids
	 * @return
	 */
	@RequestMapping("/specdeleteall.htm")
	public String specdeleteall(String ids){
		
		service.deleteAll(ids);
		return "redirect:/specfindall.htm";
	}
	
	@RequestMapping("/specupdating.htm")
	@ResponseBody
	public String specupdate(Spec spec) {
		
		service.updateByPrimaryKeySelective(spec);
		return "succsee";
	}
	
}