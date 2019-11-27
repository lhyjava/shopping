package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.ClassForBrand;
import com.test.shopping.entity.ClassForSpec;
import com.test.shopping.mapper.GoodsMapper;

@Service
public class GoodsService {

	@Autowired
	private GoodsMapper dao;
	
	public List<ClassForBrand> selectForBrand(){
		return dao.selectForBrand();
	}
	
	public List<ClassForSpec> selectForSpec(){
		return dao.selectForSpec();
	}
}