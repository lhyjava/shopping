package com.test.shopping.mapper;

import com.test.shopping.entity.Specval;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;

public class SpecvalSqlProvider {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table specval
     *
     * @mbg.generated
     */
    public String insertSelective(Specval record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("specval");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getSpecid() != null) {
            sql.VALUES("specid", "#{specid,jdbcType=INTEGER}");
        }
        
        if (record.getValue() != null) {
            sql.VALUES("value", "#{value,jdbcType=VARCHAR}");
        }
        
        if (record.getSort() != null) {
            sql.VALUES("sort", "#{sort,jdbcType=INTEGER}");
        }
        
        return sql.toString();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table specval
     *
     * @mbg.generated
     */
    public String updateByPrimaryKeySelective(Specval record) {
        SQL sql = new SQL();
        sql.UPDATE("specval");
        
        if (record.getSpecid() != null) {
            sql.SET("specid = #{specid,jdbcType=INTEGER}");
        }
        
        if (record.getValue() != null) {
            sql.SET("value = #{value,jdbcType=VARCHAR}");
        }
        
        if (record.getSort() != null) {
            sql.SET("sort = #{sort,jdbcType=INTEGER}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
    
    //add by lhy 1114
    
    public String insertlist(List<Specval> list){
    	
    	StringBuffer sb = new StringBuffer();
    	sb.append("INSERT INTO specval (specid, value, sort) VALUES ");
    	
    	for (Specval s : list) {
			int specid = s.getSpecid();
			String value = s.getValue();
			int sort = s.getSort();
			sb.append("('");
			sb.append(specid);
			sb.append("', '");
			sb.append(value);
			sb.append("', '");
			sb.append(sort);
			sb.append("')");
			sb.append(",");
		}
    	
    	String str = sb.toString();
    	String sql = str.substring(0, str.length() - 1);
    	
    	return sql;
    }
    
    //add by lhy 1114
}