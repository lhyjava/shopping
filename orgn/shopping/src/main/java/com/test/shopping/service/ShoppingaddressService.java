package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Receiptaddress;
import com.test.shopping.mapper.ReceiptaddressMapper;

@Service
public class ShoppingaddressService {

	@Autowired
	private ReceiptaddressMapper dao;
	
	public List<Receiptaddress> selectByuserid(Integer currid){
		return dao.selectByuserid(currid);
	}
	
	public int insert(Receiptaddress record) {
		return dao.insert(record);
	}
	
	public int deleteByPrimaryKey(Integer id) {
		return dao.deleteByPrimaryKey(id);
	}

	
}
