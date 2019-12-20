package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Allcountry;
import com.test.shopping.mapper.AllcountryMapper;

@Service
public class AllcountryService {
	@Autowired
	private AllcountryMapper dao;
	
	//add by zhaoyu 1208 begin
	public List<Allcountry> selectallAllcountry(){
		return dao.selectallAllcountry();
	}
	
	public String selectBycode(Integer code) {
		return dao.selectBycode(code);
	}
	//add by zhaoyu 1208 end
	
}
