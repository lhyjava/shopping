package com.test.shopping.mapper;

import com.test.shopping.entity.Goodstype;
import org.apache.ibatis.jdbc.SQL;

public class GoodstypeSqlProvider {

    public String insertSelective(Goodstype record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("goodstype");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getName() != null) {
            sql.VALUES("name", "#{name,jdbcType=VARCHAR}");
        }
        
        if (record.getSort() != null) {
            sql.VALUES("sort", "#{sort,jdbcType=INTEGER}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Goodstype record) {
        SQL sql = new SQL();
        sql.UPDATE("goodstype");
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getSort() != null) {
            sql.SET("sort = #{sort,jdbcType=INTEGER}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
    
    //add by zy
    public String goodstypedeleteall(String values) {
    	StringBuffer sb = new StringBuffer();
    	sb.append("delete from goodstype where id in ("+values+")");
    	return sb.toString();
    }
}