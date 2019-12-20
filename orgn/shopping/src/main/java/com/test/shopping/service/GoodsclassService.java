package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Goodsbrand;
import com.test.shopping.entity.Goodsclass;
import com.test.shopping.entity.Goodsclassplus;
import com.test.shopping.entity.Goodsclasstype;
import com.test.shopping.mapper.GoodsclassMapper;

@Service
public class GoodsclassService {

	/**
	 * 分类
	 */
	@Autowired
	private GoodsclassMapper dao;

	// add by lhy 1121 begin

	public List<Goodsclassplus> GoodsClassFindAllByLevel(Integer level) {
		return dao.GoodsClassFindAllByLevel(level);
	}

	// add by lhy 1121 end

	// add by lhy 1122 begin

	public List<Goodsclasstype> GoodsClassType() {
		return dao.GoodsClassType();
	}

	// add by lhy 1122 end

	// add by lhy 1124 begin

	public int deleteAll(String ids) {
		return dao.deleteAll(ids);
	}

	// add by lhy 1123 end

	// add by lys 11.22

	public int insertSelective(Goodsclass record) {
		return dao.insertSelective(record);
	}

	// add by lys 11.22 end

	// add by zhaoyu 1122 begin

	public int deletegoodsclassById(String ids) {
		return dao.deletegoodsclassById(ids);
	}

	// add by zhaoyu 1122 end

	// add by xdx 1122 begin

	public int updateByPrimaryKeySelective(Goodsclass record) {
		return dao.updateByPrimaryKeySelective(record);
	}

	// add by xdx 1122 end

	
}
