package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Goodsclass;
import com.test.shopping.entity.Goodsclassplus;
import com.test.shopping.mapper.GoodsclassMapper;

@Service
public class GoodsclassService {

	
	/**
	 * 	分类
	 */
	@Autowired
	private GoodsclassMapper dao;
	
	//add by lhy 1121 begin
	
	public List<Goodsclassplus> GoodsClassFindAllByLevel(Integer level){
		return dao.GoodsClassFindAllByLevel(level);
	}
	
	//add by lhy 1121 end
}
