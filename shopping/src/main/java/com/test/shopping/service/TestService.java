package com.test.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Test;
import com.test.shopping.mapper.TestMapper;

@Service
public class TestService {

	@Autowired
	private TestMapper dao;
	
	public Test selectByPrimaryKey(Integer id){
		return dao.selectByPrimaryKey(id);
	}
	
	public Test selectByName(String name){
		return dao.selectByName(name);
	}
}
