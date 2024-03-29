package com.test.shopping.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Shoppingcar;
import com.test.shopping.mapper.ShoppingcarMapper;

@Service
public class ShoppingcarService {

	@Autowired
	private ShoppingcarMapper dao;
	
	//add by lhy 1207 begin
	
	public List<Shoppingcar> findById(String id,String userid){
		return dao.findById(id,userid);
	}
	
	public String selectTotalPriceByUserId(String id,String userid) {
		return dao.selectTotalPriceByUserId(id,userid);
	}
	
	//add by lhy 1207 end
	
	//add by xdx 1210 begin

	public List<Shoppingcar> selectByUserid(Integer userid){
		return dao.selectByUserid(userid);
	}
	
	
	public int updateById(Integer id,Integer number) {
		return dao.updateById(id, number);
	}
	
	
	
	  public String selectzongjiaByUserid(Integer userid) { 
		  
		  return dao.selectzongjiaByUserid(userid); }
	 
	 
	/*
	 * public int insertShoppngcar(Goods goods,String specname,String
	 * sparvals,Integer goodscount,Integer userid) { return
	 * dao.insertShoppngcar(goods, specname,sparvals, goodscount, userid); }
	 */
	
	//add by xdx 1210 end
	  
	  //add by lhy 1210 begin
	  
	  public int insertShoppingCar(Integer userid,Integer goodsid,String name,String img,Integer opice,Integer number,
			  					   String[] specnames,String[] specvals) {
		  
		  return dao.insertShoppingCar(userid, goodsid, name, img, opice, number, specnames, specvals);
	  }
	  
	  //add by lhy 1210 end
	  
	  //add by zhaoyu 1216 begin
	  
	  public int deleteByPrimaryKey(Integer id) {
		  return dao.deleteByPrimaryKey(id);
	  }
	  
	  public int deleteByid(String idss) {
		  return dao.deleteByid(idss);
	  }
	  //add by zhaoyu 1216 end
	  
	
}
