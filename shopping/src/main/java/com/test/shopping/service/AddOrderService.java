package com.test.shopping.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Addorder;
import com.test.shopping.mapper.AddorderMapper;

@Service
public class AddOrderService {

	@Autowired
	private AddorderMapper dao;
	
	//add by lhy 1208 begin
	
	public int insertSelective(Addorder record) {
		return dao.insertSelective(record);
	}
	
	public int selectIdByOrdernumber(String ordernumber) {
		return dao.selectIdByOrdernumber(ordernumber);
	}
	
	//add by lhy 1208 end
}
