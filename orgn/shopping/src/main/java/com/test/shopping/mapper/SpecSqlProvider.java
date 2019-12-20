package com.test.shopping.mapper;

import com.test.shopping.entity.Spec;
import org.apache.ibatis.jdbc.SQL;

public class SpecSqlProvider {

    public String insertSelective(Spec record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("spec");
        
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

    public String updateByPrimaryKeySelective(Spec record) {
        SQL sql = new SQL();
        sql.UPDATE("spec");
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getSort() != null) {
            sql.SET("sort = #{sort,jdbcType=INTEGER}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
    
    //add lhy 1114 begin
    
    /**
     * 
     * @Title: deleteAll
     * @Description: 批量删除
     * @Author lhy
     * @DateTime 2019年11月14日 下午3:06:12
     * @param ids
     * @return
     */
    public String deleteAll(String ids){
    	
    	StringBuilder sql = new StringBuilder();
    	sql.append("DELETE FROM spec WHERE id in (");
    	sql.append(ids);
    	sql.append(")");
    	return sql.toString();
    }
    
    //add lhy 1114 end
}