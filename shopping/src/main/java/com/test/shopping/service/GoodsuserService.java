package com.test.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.shopping.entity.User;
import com.test.shopping.mapper.UserMapper;

@Service
public class GoodsuserService {

	@Autowired
	private UserMapper dao;
	
	
	public List<User> goodsuserfindall(){
		return dao.goodsuserfindall();
	}
	
	
	public int insert(User record) {
		
		return dao.insert(record);
	}
	
	
	public List<User> selectByUserame(String username){
		
		return dao.selectByUserame(username);
	}
	
	
	public List<User> selectByMail(String value){
		return dao.selectByMail(value);
	}
	
	
	public List<User> selectByName(String value){
		return dao.selectByName(value);
	}
	
	//add by lys
	public List<User> selectByuserfindall()
	{
		return dao.selectByuserfindall();
	}
	
}




