package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Goodsbrand;
import com.test.shopping.mapper.GoodsbrandMapper;

/**
 * 
 * @ClassName: GoodsbrandService
 * @Description: 品牌管理
 * @Author lhy
 * @DateTime 2019年11月11日 下午2:37:57
 */
@Service
public class GoodsbrandService {

	@Autowired
	private GoodsbrandMapper dao;
	
	public List<Goodsbrand> findall(){
		
		return dao.findall();
	}
	
	public int updateByPrimaryKeySelective(Goodsbrand record) {
		return dao.updateByPrimaryKeySelective(record);
	}
	
	public int insert(Goodsbrand record){
		return dao.insert(record);
	}
	
	public int deleteByPrimaryKey(Integer id) {
		return dao.deleteByPrimaryKey(id);
	}
	
	public List<Goodsbrand> selectByNameAndType(Goodsbrand gb) {
		return dao.selectByNameAndType(gb);
	}
	
	public int deleteAll(String ids) {
		return dao.deleteAll(ids);
	}
	
	//add by lys
	public List<String> selectAllType(){
		return dao.selectAllType();
	}
	
	// add by lhy 1129 begin

	public List<Goodsbrand> selectByTypeid(Integer typeid) {
		return dao.selectByTypeid(typeid);
	}

	// add by lhy 1129 end
	
}
