package com.test.shopping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.type.JdbcType;

import com.test.shopping.entity.Goods;
import com.test.shopping.entity.Spec;
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
	
	// add by zhaoyu 1203 begin
	
	@Select({ 
		"select", "id, name, img, number, stock, opice, pice, brandid, typeid, goodsspecid, goodsclassid, ",
		"recommend, grounding, details", "from goods", "where goodsclassid = #{goodsclassid,jdbcType=INTEGER}" 
	})
	List<Goods> selectBygoodsclassid3(Integer goodsclassid);
	
	@Select({ 
		"SELECT g.* ",
		"from goods g", 
		"where goodsclassid in (",
		"SELECT gc.id" , 
		"FROM goodsclass gc",
		"where parentid = #{goodsclassid,jdbcType=INTEGER})"
	})
	List<Goods> selectBygoodsclassid2(Integer goodsclassid);
	
	@Select({ 
		"select g.*" ,
		"from goods g",
		"where goodsclassid in (",
		"SELECT gc.id",
		"from goodsclass gc",
		"where parentid in (",
		"SELECT c.id",
		"FROM goodsclass c",
		"where parentid = #{goodsclassid,jdbcType=INTEGER}))"
	})
	List<Goods> selectBygoodsclassid1(Integer goodsclassid);
	//add by zhaoyu 1203 end
	
	//add by zhaoyu 1204 begin
	
	@SelectProvider(type=ShoppingsqlProvider.class, method="selectgoods1")
	List<Goods> selectgoods1(Integer store_price_begin,Integer store_price_end,Integer goodsclassid,String name);
	
	@SelectProvider(type=ShoppingsqlProvider.class, method="selectgoods2")
	List<Goods> selectgoods2(Integer store_price_begin,Integer store_price_end,Integer goodsclassid,String name);
	
	@SelectProvider(type=ShoppingsqlProvider.class, method="selectgoods3")
	List<Goods> selectgoods3(Integer store_price_begin,Integer store_price_end,Integer goodsclassid,String name);
	
	//add byg zhaoyu 1204 end
}
