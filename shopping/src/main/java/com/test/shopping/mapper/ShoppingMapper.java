package com.test.shopping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;

import com.test.shopping.entity.GoodsDetails;
import com.test.shopping.entity.Spec;
import com.test.shopping.entity.Specplus;
import com.test.shopping.entity.Specval;

public interface ShoppingMapper {

	//add by lhy 1202 begin
    
	@Select({
		"select DISTINCT c.id id,c.name name,c.sort sort",
		 "from goods a,",
			   "goodsspec b,",
			   "spec c",
		"where a.id = b.goodsid",
		  "and b.specid = c.id",
		  "and a.id = #{id,jdbcType=INTEGER}"
	})
	@Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER)
    })
	List<Spec> selectSpecByClassId(Integer id);
	
    //add by lhy 1202 end
	
	//add by lhy 1203 begin
	
	@Select({
		"select c.id id,c.sort sort,c.specid specid,c.value value",
		  "from goods a,",
				"goodsspec b,",
	            "specval c",
		 "where a.id = b.goodsid",
		   "and b.specvalid = c.id",
		   "and a.id = #{id,jdbcType=INTEGER}"
	})
	@Results({
		@Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
	    @Result(column="specid", property="specid", jdbcType=JdbcType.INTEGER),
	    @Result(column="value", property="value", jdbcType=JdbcType.VARCHAR),
	    @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER)
	})
	List<Specval> selectSpecValByClassId(Integer id);
	
	//add by lhy 1203 end
}
