package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Spec;
import com.test.shopping.entity.Specplus;
import com.test.shopping.mapper.SpecMapper;

@Service
public class SpecService {

	@Autowired
	private SpecMapper dao;
	
	public List<Specplus> findall(){
		return dao.findall();
	}
	
	public int insert(Spec record) {
		return dao.insert(record);
	}
	
	public Spec selectByName(String name) {
		return dao.selectByName(name);
	}
	
	public int updateByPrimaryKeySelective(Spec record) {
		return dao.updateByPrimaryKeySelective(record);
	}
	
	public int deleteByPrimaryKey(Integer id) {
		return dao.deleteByPrimaryKey(id);
	}
	
	public int deleteAll(String ids) {
		return dao.deleteAll(ids);
	}
}
