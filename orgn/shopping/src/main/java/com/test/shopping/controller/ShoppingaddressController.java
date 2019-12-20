package com.test.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.shopping.entity.Allcity;
import com.test.shopping.entity.Allcountry;
import com.test.shopping.entity.Allprovince;
import com.test.shopping.entity.Receiptaddress;
import com.test.shopping.service.AllcityService;
import com.test.shopping.service.AllcountryService;
import com.test.shopping.service.AllprovinceService;
import com.test.shopping.service.ShoppingaddressService;

@Controller
public class ShoppingaddressController {
	@Autowired
	private ShoppingaddressService service;
	
	@Autowired
	private AllcityService allcityservice;
	
	@Autowired
	private AllprovinceService allprovinceservice;
	
	@Autowired
	private AllcountryService allcountryservice;
	
	//add by zhaoyu 1206 begin
	@RequestMapping("/findaddres.htm")
	public String findaddres(HttpServletRequest req) {
		Integer currid =  (Integer)req.getSession().getAttribute("currentuserid");
		List<Receiptaddress> list = service.selectByuserid(currid);
		
		List<Allprovince> shenglist = allprovinceservice.selectallAllprovince();
		List<Allcity> shilist = allcityservice.selectallAllcity();
		List<Allcountry> qulist = allcountryservice.selectallAllcountry();
		
		req.setAttribute("shenglist",shenglist);
		req.setAttribute("shilist",shilist);
		req.setAttribute("qulist",qulist);
		
		req.setAttribute("curruseradds", list);
		return "receiving_address_list";
	}
	
	//add by zhaoyu 1206 end
	
	//add by zhaoyu 1208 begin
	/**
	 *  add by zhaoyu 1208 
	 * @param receiptname 收货人
	 * @param receiptnregionshengcode 收货人省份
	 * @param receiptnregionshicode	收货人城市
	 * @param receiptnregionqucode 收货人所在区
	 * @param receiptnstreet 收货人详细地址
	 * @param receiptyoubian 收货人所在地邮编
	 * @param receiptnumber 收货人手机号码
	 * @param receiptphone 收货人联系电话
	 * @return
	 */
	@RequestMapping("/addreceiptaddres.htm")
	public String addreceiptaddres(String receiptname,Integer receiptnregionshengcode,Integer receiptnregionshicode,
			Integer receiptnregionqucode,String receiptnstreet,Integer receiptyoubian,String receiptnumber,
			Integer receiptphone,String panduan,String currreciptid,HttpServletRequest req) {
		
		//使用session取当前用户id
		Integer currentid = (Integer)req.getSession().getAttribute("currentuserid");
		Receiptaddress recode = new Receiptaddress();
		if(panduan.equals("1")) {
			//删除数据库中原有数据
			int i = service.deleteByPrimaryKey(new Integer(currreciptid));
			
			recode.setReceiptname(receiptname);
			recode.setReceiptnregionsheng(allprovinceservice.selectBycode(receiptnregionshengcode));
			recode.setReceiptnregionshi(allcityservice.selectBycode(receiptnregionshicode)); 
			recode.setReceiptnregionqu(allcountryservice.selectBycode(receiptnregionqucode));
			recode.setReceiptnstreet(receiptnstreet);
			recode.setReceiptnumber(receiptnumber); 
			recode.setReceiptphone(receiptphone);
			recode.setReceiptyoubian(receiptyoubian); 
			recode.setUserid(currentid);
			 //添加新数据 
			service.insert(recode);
		}else {
			
			 //添加新数据 
			recode.setReceiptname(receiptname);
			recode.setReceiptnregionsheng(allprovinceservice.selectBycode(receiptnregionshengcode));
			recode.setReceiptnregionshi(allcityservice.selectBycode(receiptnregionshicode)); 
			recode.setReceiptnregionqu(allcountryservice.selectBycode(receiptnregionqucode));
			recode.setReceiptnstreet(receiptnstreet);
			recode.setReceiptnumber(receiptnumber); 
			recode.setReceiptphone(receiptphone);
			recode.setReceiptyoubian(receiptyoubian); 
			recode.setUserid(currentid);
			  
			service.insert(recode);
		}
		
		return "redirect:/findaddres.htm";
	}
	
	@RequestMapping("/deletecurr.htm")
	@ResponseBody
	public int deletecurr(Integer id) {
		int data = service.deleteByPrimaryKey(id);
		return data;
	}
	
	//add by zhaoyu 1208 end
}


























