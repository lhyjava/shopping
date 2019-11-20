package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Goodstype;
import com.test.shopping.mapper.GoodstypeMapper;

@Service
public class GoodstypeService {

	@Autowired
	private GoodstypeMapper dao;
	
	/**
	 * 
	 * @Title: insertSelective
	 * @Description: 类型名唯一，添加失败返回-1
	 * @Author lhy
	 * @DateTime 2019年11月18日 下午12:25:49
	 * @param record
	 * @return
	 */
	public int insertSelective(Goodstype record) {
		
		int ret = -1;
		
		try {
			 ret = dao.insertSelective(record);
		} catch (Exception e) {
			System.err.println("insert error：违反唯一键约束" + e.getStackTrace());
		}
		
		return ret;
	}
	
	public String selectByNameValidate(String name) {
		return dao.selectByNameValidate(name);
	}
	
	//add by lys
	public Goodstype selectByName(String name){
		return dao.selectByName(name);
	}
	
	//add  by xdx
	public int updateByPrimaryKeySelective(Goodstype record){
		return dao.updateByPrimaryKeySelective(record);
	}
	
	//add by zy
	public List<Goodstype> goodstypefindall() {
		return dao.goodstypefindall();
	}
	
	public int deleteByPrimaryKey(Integer id) {
		return dao.deleteByPrimaryKey(id);
	}
	
	public int goodstypedeleteall(String values) {
		return dao.goodstypedeleteall(values);
	}
}
