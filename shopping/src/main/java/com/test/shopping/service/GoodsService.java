package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.BrandBySpec;
import com.test.shopping.entity.ClassForBrand;
import com.test.shopping.entity.ClassForSpec;
import com.test.shopping.entity.Goods;
import com.test.shopping.entity.Goodsbrandplus;
import com.test.shopping.entity.Goodsplus;
import com.test.shopping.mapper.GoodsMapper;

@Service
public class GoodsService {

	@Autowired
	private GoodsMapper dao;

	//add by lhy 1127 begin
	
	public List<ClassForBrand> selectForBrand() {
		return dao.selectForBrand();
	}

	public List<ClassForSpec> selectForSpec() {
		return dao.selectForSpec();
	}
	
	//add by lhy 1127 end

	// add by xdx 1127 begin

	public List<Goodsplus> findAll(){
		return dao.findAll();
	}

	// add by xdx 1127 end
	
	//add by zhaoyu begin
	
	public List<Goodsplus> selectbynameAndClassnameAndBrandname(Goods goods){
		return dao.selectbynameAndClassnameAndBrandname(goods);
	}
	
	//add by zhaoyu end
	
	//add by lhy 1128 begin
	
	public List<BrandBySpec> selectSpecByBrandName(Integer brandid){
		return dao.selectSpecByBrandName(brandid);
	}
	
	public List<Goodsbrandplus> selectBrandByClassId(Integer classid){
		return dao.selectBrandByClassId(classid);
	}
	
	public int insertSelective(Goods record) {
		return dao.insertSelective(record);
	}
	
	//add by lhy 1128 end
}