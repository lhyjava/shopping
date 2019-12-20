package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Allcity;
import com.test.shopping.mapper.AllcityMapper;

@Service
public class AllcityService {

	@Autowired
	private AllcityMapper dao;
	
	//add by zhaoyu 1208 begin
	public List<Allcity> selectallAllcity(){
		return dao.selectallAllcity();
	}
	
	public String selectBycode(Integer code) {
		return dao.selectBycode(code);
	}
	//add by zhaoyu 1208 end
	
}
