package com.test.shopping.mapper;

import com.test.shopping.entity.Goods;
import org.apache.ibatis.jdbc.SQL;

public class GoodsSqlProvider {

    public String insertSelective(Goods record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("goods");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getName() != null) {
            sql.VALUES("name", "#{name,jdbcType=VARCHAR}");
        }
        
        if (record.getImg() != null) {
            sql.VALUES("img", "#{img,jdbcType=VARCHAR}");
        }
        
        if (record.getNumber() != null) {
            sql.VALUES("number", "#{number,jdbcType=INTEGER}");
        }
        
        if (record.getStock() != null) {
            sql.VALUES("stock", "#{stock,jdbcType=INTEGER}");
        }
        
        if (record.getOpice() != null) {
            sql.VALUES("opice", "#{opice,jdbcType=INTEGER}");
        }
        
        if (record.getPice() != null) {
            sql.VALUES("pice", "#{pice,jdbcType=INTEGER}");
        }
        
        if (record.getBrandid() != null) {
            sql.VALUES("brandid", "#{brandid,jdbcType=INTEGER}");
        }
        
        //为typeid设置默认值
        sql.VALUES("typeid", "1");
        
        
        if (record.getGoodsspecid() != null) {
            sql.VALUES("goodsspecid", "#{goodsspecid,jdbcType=INTEGER}");
        }
        
        if (record.getGoodsclassid() != null) {
            sql.VALUES("goodsclassid", "#{goodsclassid,jdbcType=INTEGER}");
        }
        
        if (record.getRecommend() != null) {
            sql.VALUES("recommend", "#{recommend,jdbcType=BIT}");
        }
        
        if (record.getGrounding() != null) {
            sql.VALUES("grounding", "#{grounding,jdbcType=BIT}");
        }
        
        if (record.getDetails() != null) {
            sql.VALUES("details", "#{details,jdbcType=VARCHAR}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Goods record) {
        SQL sql = new SQL();
        sql.UPDATE("goods");
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getImg() != null) {
            sql.SET("img = #{img,jdbcType=VARCHAR}");
        }
        
        if (record.getNumber() != null) {
            sql.SET("number = #{number,jdbcType=INTEGER}");
        }
        
        if (record.getStock() != null) {
            sql.SET("stock = #{stock,jdbcType=INTEGER}");
        }
        
        if (record.getOpice() != null) {
            sql.SET("opice = #{opice,jdbcType=INTEGER}");
        }
        
        if (record.getPice() != null) {
            sql.SET("pice = #{pice,jdbcType=INTEGER}");
        }
        
        if (record.getBrandid() != null) {
            sql.SET("brandid = #{brandid,jdbcType=INTEGER}");
        }
        
        if (record.getTypeid() != null) {
            sql.SET("typeid = #{typeid,jdbcType=INTEGER}");
        }
        
        if (record.getGoodsspecid() != null) {
            sql.SET("goodsspecid = #{goodsspecid,jdbcType=INTEGER}");
        }
        
        if (record.getGoodsclassid() != null) {
            sql.SET("goodsclassid = #{goodsclassid,jdbcType=INTEGER}");
        }
        
        if (record.getRecommend() != null) {
            sql.SET("recommend = #{recommend,jdbcType=BIT}");
        }
        
        if (record.getGrounding() != null) {
            sql.SET("grounding = #{grounding,jdbcType=BIT}");
        }
        
        if (record.getDetails() != null) {
            sql.SET("details = #{details,jdbcType=VARCHAR}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
    
//add by zhaoyu 1128 begin 
    
    public String selectbynameAndClassnameAndBrandname(Goods goods){
    	StringBuffer sql = new StringBuffer();
    	sql.append("select * from goods where 1=1 ");
    	if(!goods.getName().equals("")) {
    		sql.append("AND name LIKE '%");
    		sql.append(goods.getName());
    		sql.append("%' ");
    	}
    	
    	if(goods.getGoodsclassid() != null) {
    		sql.append("AND goodsclassid LIKE '%");
    		sql.append(goods.getGoodsclassid());
    		sql.append("%' ");
    	}
    	
    	if(goods.getBrandid() != null) {
    		sql.append("AND brandid LIKE '%");
    		sql.append(goods.getBrandid());
    		sql.append("%' ");
    	}
    	
    	if(goods.getRecommend() != null) {
    		sql.append("AND recommend = ");
    		sql.append(goods.getRecommend());
    	}
    	return sql.toString();
    }
    
    //add by zhaoyu 1128 end
    
    //add by lys 1205 begin
    
    public String selectBygoodsname(String keyword) {
     StringBuffer sql = new StringBuffer();
     sql.append("select * from goods where name like '%" );
     sql.append(keyword);
     sql.append("%'");
     return sql.toString();
    }
    
    //add by lys 1205 end
}