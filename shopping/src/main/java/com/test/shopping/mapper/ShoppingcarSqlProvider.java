package com.test.shopping.mapper;

import com.test.shopping.entity.Shoppingcar;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.jdbc.SQL;

public class ShoppingcarSqlProvider {

    public String insertSelective(Shoppingcar record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("shoppingcar");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getImage() != null) {
            sql.VALUES("image", "#{image,jdbcType=VARCHAR}");
        }
        
        if (record.getName() != null) {
            sql.VALUES("name", "#{name,jdbcType=VARCHAR}");
        }
        
        if (record.getPrice() != null) {
            sql.VALUES("price", "#{price,jdbcType=INTEGER}");
        }
        
        if (record.getNumber() != null) {
            sql.VALUES("number", "#{number,jdbcType=INTEGER}");
        }
        
        if (record.getUrl() != null) {
            sql.VALUES("url", "#{url,jdbcType=VARCHAR}");
        }
        
        if (record.getSpec() != null) {
            sql.VALUES("spec", "#{spec,jdbcType=VARCHAR}");
        }
        
        if (record.getUserid() != null) {
            sql.VALUES("userid", "#{userid,jdbcType=INTEGER}");
        }
        
        if (record.getGoodsid() != null) {
            sql.VALUES("goodsid", "#{goodsid,jdbcType=INTEGER}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Shoppingcar record) {
        SQL sql = new SQL();
        sql.UPDATE("shoppingcar");
        
        if (record.getImage() != null) {
            sql.SET("image = #{image,jdbcType=VARCHAR}");
        }
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getPrice() != null) {
            sql.SET("price = #{price,jdbcType=INTEGER}");
        }
        
        if (record.getNumber() != null) {
            sql.SET("number = #{number,jdbcType=INTEGER}");
        }
        
        if (record.getUrl() != null) {
            sql.SET("url = #{url,jdbcType=VARCHAR}");
        }
        
        if (record.getSpec() != null) {
            sql.SET("spec = #{spec,jdbcType=VARCHAR}");
        }
        
        if (record.getUserid() != null) {
            sql.SET("userid = #{userid,jdbcType=INTEGER}");
        }
        
        if (record.getGoodsid() != null) {
            sql.SET("goodsid = #{goodsid,jdbcType=INTEGER}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
    
    //add by lhy 1207 begin
    
    public String findById(String id,String userid) {
    	
    	StringBuffer sql = new StringBuffer();
    	
    	sql.append("select id, image, name, price, number, url, spec, userid, goodsid from shoppingcar where id in (");
    	sql.append(id);
    	sql.append(")");
    	sql.append(" and userid=");
    	sql.append(userid);
    	
    	return sql.toString();
    }
    
    public String selectTotalPriceByUserId(String id,String userid) {
    	
    	StringBuffer sql = new StringBuffer();
    	
    	sql.append("select sum(price*number) sum from shoppingcar where id in (");
    	sql.append(id);
    	sql.append(")");
    	sql.append(" and ");
    	sql.append("userid=");
    	sql.append(userid);
    	
    	return sql.toString();
    }
    
    //add by lhy 1207 end
    
    //add by lhy 1210 begin
    
    public String insertShoppingCar(Integer userid,Integer goodsid,String name,String img,Integer opice,Integer number,
			   						String[] specnames,String[] specvals) {
    	
    	StringBuffer sql = new StringBuffer();
    	
    	String spec = "";
    	
    	for (int i = 0; i < specnames.length; i++) {
			spec += specnames[i] + ":" + specvals[i] + ";";
		}
    	
    	spec = spec.substring(0, spec.length() - 1);
    	
    	sql.append("INSERT INTO shoppingcar (image, name, price, number, spec, userid, goodsid) ");
    	sql.append("VALUES (");
    	sql.append("'"+img+"'");
    	sql.append(",");
    	sql.append("'"+name+"'");
    	sql.append(",");
    	sql.append(opice);
    	sql.append(",");
    	sql.append(number);
    	sql.append(",");
    	sql.append("'"+spec+"'");
    	sql.append(",");
    	sql.append(userid);
    	sql.append(",");
    	sql.append(goodsid);
    	sql.append(")");
    	
    	return sql.toString();
    }
    
    //add by lhy 1210 end
}