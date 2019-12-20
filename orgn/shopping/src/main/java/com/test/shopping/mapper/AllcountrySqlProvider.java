package com.test.shopping.mapper;

import com.test.shopping.entity.Allcountry;
import org.apache.ibatis.jdbc.SQL;

public class AllcountrySqlProvider {

    public String insertSelective(Allcountry record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("allcountry");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getCode() != null) {
            sql.VALUES("code", "#{code,jdbcType=VARCHAR}");
        }
        
        if (record.getName() != null) {
            sql.VALUES("name", "#{name,jdbcType=VARCHAR}");
        }
        
        if (record.getCitycode() != null) {
            sql.VALUES("citycode", "#{citycode,jdbcType=VARCHAR}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Allcountry record) {
        SQL sql = new SQL();
        sql.UPDATE("allcountry");
        
        if (record.getCode() != null) {
            sql.SET("code = #{code,jdbcType=VARCHAR}");
        }
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getCitycode() != null) {
            sql.SET("citycode = #{citycode,jdbcType=VARCHAR}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
}