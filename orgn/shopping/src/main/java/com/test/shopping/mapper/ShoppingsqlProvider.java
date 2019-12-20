package com.test.shopping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.SelectProvider;

import com.test.shopping.entity.Goods;

public class ShoppingsqlProvider {
	
	//add by zhaoyu 1204 begin
	
	public String selectgoods1(Integer store_price_begin,Integer store_price_end,Integer goodsclassid,String name){
		
		StringBuffer sql = new StringBuffer();
		sql.append("select goods.* FROM goods where goodsclassid in ( SELECT gc.id FROM goodsclass gc where parentid in ( select g.id from goodsclass g where parentid = ");
		sql.append(goodsclassid);
		sql.append("))");
		
		if(name != null) {
			sql.append(" and goods.name like '%");
			sql.append(name);
			sql.append("%'");
		}
		
		if(store_price_begin != null) {
			sql.append(" and pice >=");
			sql.append(store_price_begin);
		}
		
		if(store_price_end != null) {
			sql.append(" and pice <=");
			sql.append(store_price_end);
		}
		return sql.toString();
	}
	
	public String selectgoods2(Integer store_price_begin,Integer store_price_end,Integer goodsclassid,String name) {
		
		StringBuffer sql = new StringBuffer();
		sql.append("select goods.* FROM goods where goodsclassid in ( SELECT g.id FROM goodsclass g where parentid =");
		sql.append(goodsclassid);
		sql.append(")");
		
		if(name != null) {
			sql.append(" and goods.name like '%");
			sql.append(name);
			sql.append("%'");
		}
		
		if(store_price_begin != null) {
			sql.append(" and pice >=");
			sql.append(store_price_begin);
		}
		
		if(store_price_end != null) {
			sql.append(" and pice <=");
			sql.append(store_price_end);
		}
		
		return sql.toString();
	}
	
	public String selectgoods3(Integer store_price_begin,Integer store_price_end,Integer goodsclassid,String name) {
		
		StringBuffer sql = new StringBuffer();
		sql.append("select goods.* from goods where goodsclassid =");
		sql.append(goodsclassid);
		
		if(name != null) {
			sql.append(" and goods.name like '%");
			sql.append(name);
			sql.append("%'");
		}
		
		if(store_price_begin != null) {
			sql.append(" and pice >=");
			sql.append(store_price_begin);
		}
		
		if(store_price_end != null) {
			sql.append(" and pice <=");
			sql.append(store_price_end);
		}
		
		return sql.toString();
	}
	
	
	//add by zhaoyu 1204 end
}
