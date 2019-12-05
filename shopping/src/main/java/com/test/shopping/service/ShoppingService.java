package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Goods;
import com.test.shopping.entity.Spec;
import com.test.shopping.entity.Specval;
import com.test.shopping.mapper.ShoppingMapper;

@Service
public class ShoppingService {

	@Autowired
	private ShoppingMapper dao;
	
	//add by lhy 1202 begin
	
	public List<Spec> selectSpecByClassId(Integer id){
		return dao.selectSpecByClassId(id);
	}
	
	//add by lhy 1202 end
	
	//add by lhy 1203 begin
	
	public List<Specval> selectSpecValByClassId(Integer id){
		return dao.selectSpecValByClassId(id);
	}
	
	//add by 1203 end
	
	public List<Goods> selectBygoodsclassid3(Integer goodsclassid){
		return dao.selectBygoodsclassid3(goodsclassid);
	}
	
	public List<Goods> selectBygoodsclassid2(Integer goodsclassid){
		return dao.selectBygoodsclassid2(goodsclassid);
	}
	
	public List<Goods> selectBygoodsclassid1(Integer goodsclassid){
		return dao.selectBygoodsclassid1(goodsclassid);
	}
	
	//add by zhaoyu 1203 end
	
	
	//add by zhaoyu 1204 begin
	
	public List<Goods> selectgoods1(Integer store_price_begin,Integer store_price_end,Integer goodsclassid,String name){
		return dao.selectgoods1(store_price_begin,store_price_end,goodsclassid, name);
	}
	
	public List<Goods> selectgoods2(Integer store_price_begin,Integer store_price_end,Integer goodsclassid,String name){
		return dao.selectgoods2(store_price_begin,store_price_end,goodsclassid, name);
	}
	
	public List<Goods> selectgoods3(Integer store_price_begin,Integer store_price_end,Integer goodsclassid,String name){
		return dao.selectgoods3(store_price_begin,store_price_end,goodsclassid, name);
	}
	
	//add by zhaoyu 1204 end
	
}
