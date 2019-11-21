package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Goodsbrand;
import com.test.shopping.entity.Goodstype;
import com.test.shopping.entity.Specplus;
import com.test.shopping.mapper.GoodstypeMapper;

@Service
public class GoodstypeService {

	@Autowired
	private GoodstypeMapper dao;
	
	//add by lhy
	public int insertSelective(Goodstype record) {
		return dao.insertSelective(record);
	}
	
	public String selectByNameValidate(String name) {
		return dao.selectByNameValidate(name);
	}
	
	public List<Specplus> selectBySpecplus(Integer id){
		return dao.selectBySpecplus(id);
	}
	
	public List<String> selectByBrandType(Integer id){
		return dao.selectByBrandType(id);
	}
	
	public List<Goodsbrand> selectByBrandName(Integer id){
		return dao.selectByBrandName(id);
	}
	
	//add by lys
	public Goodstype selectByName(String name){
		return dao.selectByName(name);
	}
	
	//add  by xdx
	public int updateByPrimaryKeySelective(Goodstype record){
		return dao.updateByPrimaryKeySelective(record);
	}
	
	//add by zy
	public List<Goodstype> goodstypefindall() {
		return dao.goodstypefindall();
	}
	
	public int deleteByPrimaryKey(Integer id) {
		return dao.deleteByPrimaryKey(id);
	}
	
	public int goodstypedeleteall(String values) {
		return dao.goodstypedeleteall(values);
	}
}
