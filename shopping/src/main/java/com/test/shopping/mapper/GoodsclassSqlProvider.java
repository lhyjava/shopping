package com.test.shopping.mapper;

import com.test.shopping.entity.Goodsclass;
import org.apache.ibatis.jdbc.SQL;

public class GoodsclassSqlProvider {

    public String insertSelective(Goodsclass record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("goodsclass");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getName() != null) {
            sql.VALUES("name", "#{name,jdbcType=VARCHAR}");
        }
        
        if (record.getDisplay() != null) {
            sql.VALUES("display", "#{display,jdbcType=BIT}");
        }
        
        if (record.getLevel() != null) {
            sql.VALUES("level", "#{level,jdbcType=INTEGER}");
        }
        
        if (record.getRecommend() != null) {
            sql.VALUES("recommend", "#{recommend,jdbcType=BIT}");
        }
        
        if (record.getSort() != null) {
            sql.VALUES("sort", "#{sort,jdbcType=INTEGER}");
        }
        
        if (record.getTypeid() != null) {
            sql.VALUES("typeid", "#{typeid,jdbcType=INTEGER}");
        }
        
        if (record.getParentid() != null) {
            sql.VALUES("parentid", "#{parentid,jdbcType=INTEGER}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Goodsclass record) {
        SQL sql = new SQL();
        sql.UPDATE("goodsclass");
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getDisplay() != null) {
            sql.SET("display = #{display,jdbcType=BIT}");
        }
        
        if (record.getLevel() != null) {
            sql.SET("level = #{level,jdbcType=INTEGER}");
        }
        
        if (record.getRecommend() != null) {
            sql.SET("recommend = #{recommend,jdbcType=BIT}");
        }
        
        if (record.getSort() != null) {
            sql.SET("sort = #{sort,jdbcType=INTEGER}");
        }
        
        if (record.getTypeid() != null) {
            sql.SET("typeid = #{typeid,jdbcType=INTEGER}");
        }
        
        if (record.getParentid() != null) {
            sql.SET("parentid = #{parentid,jdbcType=INTEGER}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
    
    // add by zhaoyu 1122 begin
    
    /**
     * 
     * @param ids 所有的id值拼接的字符串
     * @return 返回sql语句
     */
    public String deletegoodsclassById(String ids) {
    	
    	StringBuilder sql = new StringBuilder();
    	sql.append("DELETE FROM goodsclass WHERE id in (");
    	sql.append(ids);
    	sql.append(")");
    	return sql.toString();
    }
    
    // add by zhaoyu 1122 end
    
    //add by lhy 1124 begin
    
	public String deleteAll(String ids){
	    	
		StringBuilder sql = new StringBuilder();
    	sql.append("DELETE FROM goodsclass WHERE id in (");
    	sql.append(ids);
    	sql.append(")");
    	return sql.toString();
    }
    
    //add by lhy 1124 end
}