package com.test.shopping.mapper;

import com.test.shopping.entity.Goodsbrand;
import org.apache.ibatis.jdbc.SQL;

public class GoodsbrandSqlProvider {

    public String insertSelective(Goodsbrand record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("goodsbrand");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getSort() != null) {
            sql.VALUES("sort", "#{sort,jdbcType=INTEGER}");
        }
        
        if (record.getFirstchar() != null) {
            sql.VALUES("firstchar", "#{firstchar,jdbcType=VARCHAR}");
        }
        
        if (record.getName() != null) {
            sql.VALUES("name", "#{name,jdbcType=VARCHAR}");
        }
        
        if (record.getType() != null) {
            sql.VALUES("type", "#{type,jdbcType=VARCHAR}");
        }
        
        if (record.getImg() != null) {
            sql.VALUES("img", "#{img,jdbcType=VARCHAR}");
        }
        
        if (record.getRecommand() != null) {
            sql.VALUES("recommand", "#{recommand,jdbcType=BIT}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Goodsbrand record) {
        SQL sql = new SQL();
        sql.UPDATE("goodsbrand");
        
        if (record.getSort() != null) {
            sql.SET("sort = #{sort,jdbcType=INTEGER}");
        }
        
        if (record.getFirstchar() != null) {
            sql.SET("firstchar = #{firstchar,jdbcType=VARCHAR}");
        }
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getType() != null) {
            sql.SET("type = #{type,jdbcType=VARCHAR}");
        }
        
        if (record.getImg() != null) {
            sql.SET("img = #{img,jdbcType=VARCHAR}");
        }
        
        if (record.getRecommand() != null) {
            sql.SET("recommand = #{recommand,jdbcType=BIT}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
}