package com.test.shopping.mapper;

import com.test.shopping.entity.Typebrand;
import com.test.shopping.entity.Typespec;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;

public class TypebrandSqlProvider {

    public String insertSelective(Typebrand record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("typebrand");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getTypeid() != null) {
            sql.VALUES("typeid", "#{typeid,jdbcType=INTEGER}");
        }
        
        if (record.getBrandid() != null) {
            sql.VALUES("brandid", "#{brandid,jdbcType=INTEGER}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Typebrand record) {
        SQL sql = new SQL();
        sql.UPDATE("typebrand");
        
        if (record.getTypeid() != null) {
            sql.SET("typeid = #{typeid,jdbcType=INTEGER}");
        }
        
        if (record.getBrandid() != null) {
            sql.SET("brandid = #{brandid,jdbcType=INTEGER}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
    
    //add by lhy 1118 begin
    
    public String insertByTypeid(List<Typebrand> list) {
    	
    	StringBuffer sb = new StringBuffer();
    	sb.append("insert into typebrand (typeid,brandid) values ");
    	
    	for (Typebrand s : list) {
    		
    		//参数
    		Integer typeid = s.getTypeid();
    		Integer brandid = s.getBrandid();
			
			//sql拼接
			sb.append("(");
			sb.append(typeid);
			sb.append(",");
			sb.append(brandid);
			sb.append(")");
			sb.append(",");
		}
    	
    	String str = sb.toString();
    	String sql = str.substring(0, str.length() - 1);
    	
		return sql;
    }
    
    //add bu lhy 1118 end
}