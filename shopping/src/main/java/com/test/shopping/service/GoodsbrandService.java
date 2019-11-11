package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.Goodsbrand;
import com.test.shopping.mapper.GoodsbrandMapper;

/**
 * 
 * @ClassName: GoodsbrandService
 * @Description: 
 * @Author lhy
 * @DateTime 2019年11月11日 下午2:37:57
 */
@Service
public class GoodsbrandService {

	@Autowired
	private GoodsbrandMapper dao;
	
	public List<Goodsbrand> findall()
	{
		return dao.findall();
	}
	
}
