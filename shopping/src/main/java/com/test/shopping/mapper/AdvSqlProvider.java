package com.test.shopping.mapper;

import com.test.shopping.entity.Adv;
import org.apache.ibatis.jdbc.SQL;

public class AdvSqlProvider {
    public String insertSelective(Adv record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("adv");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getImg() != null) {
            sql.VALUES("img", "#{img,jdbcType=VARCHAR}");
        }
        
        if (record.getUrl() != null) {
            sql.VALUES("url", "#{url,jdbcType=VARCHAR}");
        }
        
        if (record.getIsshow() != null) {
            sql.VALUES("isshow", "#{isshow,jdbcType=BIT}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Adv record) {
        SQL sql = new SQL();
        sql.UPDATE("adv");
        
        if (record.getImg() != null) {
            sql.SET("img = #{img,jdbcType=VARCHAR}");
        }
        
        if (record.getUrl() != null) {
            sql.SET("url = #{url,jdbcType=VARCHAR}");
        }
        
        if (record.getIsshow() != null) {
            sql.SET("isshow = #{isshow,jdbcType=BIT}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
}