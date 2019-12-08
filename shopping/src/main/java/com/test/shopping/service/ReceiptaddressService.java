package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Receiptaddress;
import com.test.shopping.mapper.ReceiptaddressMapper;

@Service
public class ReceiptaddressService {

	@Autowired
	private ReceiptaddressMapper dao;
	
	//add by lhy 1206 begin
	
	public List<Receiptaddress> AddressFindByUserId(String userid){
		return dao.AddressFindByUserId(userid);
	}
	
	//add by lhy 1206 end
	
}
