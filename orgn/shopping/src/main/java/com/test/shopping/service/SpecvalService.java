package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Specval;
import com.test.shopping.mapper.SpecvalMapper;

@Service
public class SpecvalService {

	@Autowired
	private SpecvalMapper dao;
	
	public int insertlist(List<Specval> list) {
		return dao.insertlist(list);
	}
	
	public List<Specval> selectByspecid(Integer specid){
		return dao.selectByspecid(specid);
	}
	
	public int deleteBySpecid(Integer specid) {
		return dao.deleteBySpecid(specid);
	}
}
