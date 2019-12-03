package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
