package com.test.shopping.service;

import java.util.List;

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
}
