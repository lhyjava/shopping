package com.test.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.mapper.OrdergoodsMapper;

@Service
public class OrdergoodsService {
	
	@Autowired
	private OrdergoodsMapper dao;
	
	public int insertGoods(Integer id,String[] img,String[] name,String[] specmessage,
			  			   Integer[] price,Integer[] number,Integer[] goodsid) {
		return dao.insertGoods(id,img,name,specmessage,price,number,goodsid);
	}
	
}
