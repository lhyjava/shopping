package com.test.shopping.mapper;

import com.test.shopping.entity.Allprovince;
import org.apache.ibatis.jdbc.SQL;

public class AllprovinceSqlProvider {

    public String insertSelective(Allprovince record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("allprovince");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getCode() != null) {
            sql.VALUES("code", "#{code,jdbcType=VARCHAR}");
        }
        
        if (record.getName() != null) {
            sql.VALUES("name", "#{name,jdbcType=VARCHAR}");
        }
        
        if (record.getSimplename() != null) {
            sql.VALUES("SIMPLENAME", "#{simplename,jdbcType=VARCHAR}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Allprovince record) {
        SQL sql = new SQL();
        sql.UPDATE("allprovince");
        
        if (record.getCode() != null) {
            sql.SET("code = #{code,jdbcType=VARCHAR}");
        }
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getSimplename() != null) {
            sql.SET("SIMPLENAME = #{simplename,jdbcType=VARCHAR}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
}