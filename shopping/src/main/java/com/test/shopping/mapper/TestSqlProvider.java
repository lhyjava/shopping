package com.test.shopping.mapper;

import com.test.shopping.entity.Test;
import org.apache.ibatis.jdbc.SQL;

public class TestSqlProvider {

    public String insertSelective(Test record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("test");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getName() != null) {
            sql.VALUES("name", "#{name,jdbcType=VARCHAR}");
        }
        
        if (record.getPass() != null) {
            sql.VALUES("pass", "#{pass,jdbcType=VARCHAR}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Test record) {
        SQL sql = new SQL();
        sql.UPDATE("test");
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getPass() != null) {
            sql.SET("pass = #{pass,jdbcType=VARCHAR}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
}