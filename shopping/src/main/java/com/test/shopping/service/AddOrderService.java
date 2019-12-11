package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Addorder;
import com.test.shopping.mapper.AddorderMapper;

@Service
public class AddOrderService {

	@Autowired
	private AddorderMapper dao;

	// add by lhy 1208 begin

	public int insertSelective(Addorder record) {
		return dao.insertSelective(record);
	}

	public int selectIdByOrdernumber(String ordernumber) {
		return dao.selectIdByOrdernumber(ordernumber);
	}

	// add by lhy 1208 end

	// add by lys 1209 begin

	public List<Addorder> selectByaddorderfindAll(Integer userid) {
		return dao.selectByaddorderfindAll(userid);
	}

	public List<Addorder> selectByaddorder(String ordernumber, String begintime, String endtime, String delivery) {
		return dao.selectByaddorder(ordernumber, begintime, endtime, delivery);
	}

	// add by lys 1209 end
}
