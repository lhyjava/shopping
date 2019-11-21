package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Typespec;
import com.test.shopping.mapper.TypespecMapper;

@Service
public class TypespecService {

	
	@Autowired
	private TypespecMapper dao;
	
	public int insertByTypeid(List<Typespec> list) {
		
		return dao.insertByTypeid(list);
	}
	
	public int deleteByTypeId(Integer id) {
		return dao.deleteByTypeId(id);
	}
}
