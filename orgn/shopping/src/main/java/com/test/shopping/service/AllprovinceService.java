package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Allprovince;
import com.test.shopping.mapper.AllprovinceMapper;

@Service
public class AllprovinceService {

	@Autowired
	private AllprovinceMapper dao;
	
	//add by zhaoyu 1208 begin
	
	public List<Allprovince> selectallAllprovince(){
		return dao.selectallAllprovince();
	}
	
	public String selectBycode(Integer code) {
		return dao.selectBycode(code);
	}
	
	//add by zhaoyu 1208 end
	
}
