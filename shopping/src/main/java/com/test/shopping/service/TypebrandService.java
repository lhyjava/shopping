package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Typebrand;
import com.test.shopping.mapper.TypebrandMapper;

@Service
public class TypebrandService {
	
	@Autowired
	private TypebrandMapper dao;
	
	public int insertByTypeid(List<Typebrand> list) {
		return dao.insertByTypeid(list);
	}
}
