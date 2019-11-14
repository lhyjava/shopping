package com.test.shopping.service;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
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
	
	/**
	 * 
	 * @Title: insert
	 * @Description: 插入失败时返回-1
	 * @Author lhy
	 * @DateTime 2019年11月14日 下午4:04:22
	 * @param record
	 * @return
	 */
	public int insert(Spec record) {
		
		int ret = -1;
		
		try {
			 ret = dao.insert(record);
		} catch (Exception e) {
			System.err.println("insert error：违反唯一键约束" + e.getStackTrace());
		}
		
		return ret;
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
