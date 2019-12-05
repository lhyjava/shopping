package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Adv;
import com.test.shopping.mapper.AdvMapper;

@Service
public class AdvService {

	@Autowired
	private AdvMapper dao;
	
	public List<Adv>selectByadvfindall()
	{
		return dao.selectByadvfindall();
	}
	
	public List<Adv>selectByadvimgurl(String url)
	{
		return dao.selectByadvimgurl(url);
	}
}
