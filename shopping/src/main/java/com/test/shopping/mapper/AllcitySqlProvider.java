package com.test.shopping.mapper;

import com.test.shopping.entity.Allcity;
import org.apache.ibatis.jdbc.SQL;

public class AllcitySqlProvider {

    public String insertSelective(Allcity record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("allcity");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getCode() != null) {
            sql.VALUES("code", "#{code,jdbcType=VARCHAR}");
        }
        
        if (record.getName() != null) {
            sql.VALUES("name", "#{name,jdbcType=VARCHAR}");
        }
        
        if (record.getProvincecode() != null) {
            sql.VALUES("provincecode", "#{provincecode,jdbcType=VARCHAR}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Allcity record) {
        SQL sql = new SQL();
        sql.UPDATE("allcity");
        
        if (record.getCode() != null) {
            sql.SET("code = #{code,jdbcType=VARCHAR}");
        }
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getProvincecode() != null) {
            sql.SET("provincecode = #{provincecode,jdbcType=VARCHAR}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
}