package com.test.shopping.mapper;

import com.test.shopping.entity.Ordergoods;
import org.apache.ibatis.jdbc.SQL;

public class OrdergoodsSqlProvider {

    public String insertSelective(Ordergoods record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("ordergoods");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getOrderid() != null) {
            sql.VALUES("orderid", "#{orderid,jdbcType=INTEGER}");
        }
        
        if (record.getGoodsid() != null) {
            sql.VALUES("goodsid", "#{goodsid,jdbcType=INTEGER}");
        }
        
        if (record.getName() != null) {
            sql.VALUES("name", "#{name,jdbcType=VARCHAR}");
        }
        
        if (record.getImg() != null) {
            sql.VALUES("img", "#{img,jdbcType=VARCHAR}");
        }
        
        if (record.getSpecmessage() != null) {
            sql.VALUES("specmessage", "#{specmessage,jdbcType=VARCHAR}");
        }
        
        if (record.getUrl() != null) {
            sql.VALUES("url", "#{url,jdbcType=VARCHAR}");
        }
        
        if (record.getPrice() != null) {
            sql.VALUES("price", "#{price,jdbcType=INTEGER}");
        }
        
        if (record.getNumber() != null) {
            sql.VALUES("number", "#{number,jdbcType=INTEGER}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Ordergoods record) {
        SQL sql = new SQL();
        sql.UPDATE("ordergoods");
        
        if (record.getOrderid() != null) {
            sql.SET("orderid = #{orderid,jdbcType=INTEGER}");
        }
        
        if (record.getGoodsid() != null) {
            sql.SET("goodsid = #{goodsid,jdbcType=INTEGER}");
        }
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getImg() != null) {
            sql.SET("img = #{img,jdbcType=VARCHAR}");
        }
        
        if (record.getSpecmessage() != null) {
            sql.SET("specmessage = #{specmessage,jdbcType=VARCHAR}");
        }
        
        if (record.getUrl() != null) {
            sql.SET("url = #{url,jdbcType=VARCHAR}");
        }
        
        if (record.getPrice() != null) {
            sql.SET("price = #{price,jdbcType=INTEGER}");
        }
        
        if (record.getNumber() != null) {
            sql.SET("number = #{number,jdbcType=INTEGER}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
    
    //add by lhy 1208 begin
    
    public String insertGoods(Integer id,String[] img,String[] name,String[] specmessage,
			  				  Integer[] price,Integer[] number,Integer[] goodsid) {
    	
    	StringBuffer sql = new StringBuffer();
    	sql.append("insert into ordergoods (orderid,goodsid,name,img,specmessage,price,number) VALUES ");
    	for (int i = 0; i < goodsid.length; i++) {
			sql.append("(");
			sql.append("'"+id+"'");
			sql.append(",");
			sql.append("'"+goodsid[i]+"'");
			sql.append(",");
			sql.append("'"+name[i]+"'");
			sql.append(",");
			sql.append("'"+img[i]+"'");
			sql.append(",");
			sql.append("'"+specmessage[i].replace(",", " ")+"'");
			sql.append(",");
			sql.append(price[i]);
			sql.append(",");
			sql.append(number[i]);
			sql.append("),");
		}
    	String str = sql.toString();
    	str = str.substring(0, str.length() - 1);
    	
    	return str;
    }
    
    //add by lhy 1208 end
}