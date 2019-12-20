package com.test.shopping.mapper;

import com.test.shopping.entity.Typespec;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;

public class TypespecSqlProvider {

    public String insertSelective(Typespec record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("typespec");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getTypeid() != null) {
            sql.VALUES("typeid", "#{typeid,jdbcType=INTEGER}");
        }
        
        if (record.getSpecid() != null) {
            sql.VALUES("specid", "#{specid,jdbcType=INTEGER}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Typespec record) {
        SQL sql = new SQL();
        sql.UPDATE("typespec");
        
        if (record.getTypeid() != null) {
            sql.SET("typeid = #{typeid,jdbcType=INTEGER}");
        }
        
        if (record.getSpecid() != null) {
            sql.SET("specid = #{specid,jdbcType=INTEGER}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
    
    //add by lhy 1118 begin
    
    public String insertByTypeid(List<Typespec> list) {
    	
    	StringBuffer sb = new StringBuffer();
    	sb.append("insert into typespec (typeid,specid) values ");
    	
    	for (Typespec s : list) {
    		
    		//参数
			Integer typeid = s.getTypeid();
			Integer specid = s.getSpecid();
			
			//sql拼接
			sb.append("(");
			sb.append(typeid);
			sb.append(",");
			sb.append(specid);
			sb.append(")");
			sb.append(",");
		}
    	
    	String str = sb.toString();
    	String sql = str.substring(0, str.length() - 1);
    	
		return sql;
    }
    
    //add bu lhy 1118 end
}