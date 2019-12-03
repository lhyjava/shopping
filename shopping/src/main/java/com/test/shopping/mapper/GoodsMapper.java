package com.test.shopping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

import com.test.shopping.entity.BrandBySpec;
import com.test.shopping.entity.ClassForBrand;
import com.test.shopping.entity.ClassForSpec;
import com.test.shopping.entity.Goods;
import com.test.shopping.entity.GoodsDetails;
import com.test.shopping.entity.Goodsbrandplus;
import com.test.shopping.entity.Goodsplus;

public interface GoodsMapper {
	@Delete({ 
		"delete from goods", "where id = #{id,jdbcType=INTEGER}"
	})
	int deleteByPrimaryKey(Integer id);

	@Insert({ 
		"insert into goods (id, name, ", "img, number, stock, ", "opice, pice, brandid, ",
		"typeid, goodsspecid, ", "goodsclassid, recommend, ", "grounding, details)",
		"values (#{id,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, ",
		"#{img,jdbcType=VARCHAR}, #{number,jdbcType=INTEGER}, #{stock,jdbcType=INTEGER}, ",
		"#{opice,jdbcType=INTEGER}, #{pice,jdbcType=INTEGER}, #{brandid,jdbcType=INTEGER}, ",
		"#{typeid,jdbcType=INTEGER}, #{goodsspecid,jdbcType=INTEGER}, ",
		"#{goodsclassid,jdbcType=INTEGER}, #{recommend,jdbcType=BIT}, ",
		"#{grounding,jdbcType=BIT}, #{details,jdbcType=VARCHAR})" 
	})
	int insert(Goods record);

	@InsertProvider(type = GoodsSqlProvider.class, method = "insertSelective")
	int insertSelective(Goods record);

	@Select({ 
		"select", "id, name, img, number, stock, opice, pice, brandid, typeid, goodsspecid, goodsclassid, ",
		"recommend, grounding, details", "from goods", "where id = #{id,jdbcType=INTEGER}" 
	})
	@Results({ 
			@Result(column = "id", property = "id", jdbcType = JdbcType.INTEGER, id = true),
			@Result(column = "name", property = "name", jdbcType = JdbcType.VARCHAR),
			@Result(column = "img", property = "img", jdbcType = JdbcType.VARCHAR),
			@Result(column = "number", property = "number", jdbcType = JdbcType.INTEGER),
			@Result(column = "stock", property = "stock", jdbcType = JdbcType.INTEGER),
			@Result(column = "opice", property = "opice", jdbcType = JdbcType.INTEGER),
			@Result(column = "pice", property = "pice", jdbcType = JdbcType.INTEGER),
			@Result(column = "brandid", property = "brandid", jdbcType = JdbcType.INTEGER),
			@Result(column = "typeid", property = "typeid", jdbcType = JdbcType.INTEGER),
			@Result(column = "goodsspecid", property = "goodsspecid", jdbcType = JdbcType.INTEGER),
			@Result(column = "goodsclassid", property = "goodsclassid", jdbcType = JdbcType.INTEGER),
			@Result(column = "recommend", property = "recommend", jdbcType = JdbcType.BIT),
			@Result(column = "grounding", property = "grounding", jdbcType = JdbcType.BIT),
			@Result(column = "details", property = "details", jdbcType = JdbcType.VARCHAR) 
		})
	Goods selectByPrimaryKey(Integer id);

	@UpdateProvider(type = GoodsSqlProvider.class, method = "updateByPrimaryKeySelective")
	int updateByPrimaryKeySelective(Goods record);

	@Update({ 
		"update goods", "set name = #{name,jdbcType=VARCHAR},", "img = #{img,jdbcType=VARCHAR},",
		"number = #{number,jdbcType=INTEGER},", "stock = #{stock,jdbcType=INTEGER},",
		"opice = #{opice,jdbcType=INTEGER},", "pice = #{pice,jdbcType=INTEGER},",
		"brandid = #{brandid,jdbcType=INTEGER},", "typeid = #{typeid,jdbcType=INTEGER},",
		"goodsspecid = #{goodsspecid,jdbcType=INTEGER},", "goodsclassid = #{goodsclassid,jdbcType=INTEGER},",
		"recommend = #{recommend,jdbcType=BIT},", "grounding = #{grounding,jdbcType=BIT},",
		"details = #{details,jdbcType=VARCHAR}", "where id = #{id,jdbcType=INTEGER}" 
	})
	int updateByPrimaryKey(Goods record);

	// add by lhy 1127 begin

	@Select({ 
		"select DISTINCT a.name classname,a.id classid,d.name brandname,d.id brandid", "from goodsclass a,",
		"goodstype b,", "typebrand c,", "goodsbrand d", "where a.typeid = b.id", "and b.id = c.typeid",
		"and c.brandid = d.id", "and a.level = 2" 
	})
	@Results({ 
		@Result(column = "classid", property = "classid", jdbcType = JdbcType.INTEGER),
		@Result(column = "classname", property = "classname", jdbcType = JdbcType.VARCHAR),
		@Result(column = "brandid", property = "brandid", jdbcType = JdbcType.INTEGER),
		@Result(column = "brandname", property = "brandname", jdbcType = JdbcType.VARCHAR) 
	})
	List<ClassForBrand> selectForBrand();

	@Select({
		"select DISTINCT a.id classid,a.name classname,d.id specid,d.name specname,e.id specvalid,e.value specval",
		"from goodsclass a,", "goodstype b,", "typespec c,", "spec d,", "specval e", "where a.typeid = b.id",
		"and b.id = c.typeid", "and c.specid = d.id", "and d.id = e.specid", "and a.level = 2" 
	})
	@Results({ 
		@Result(column = "classid", property = "classid", jdbcType = JdbcType.INTEGER),
		@Result(column = "classname", property = "classname", jdbcType = JdbcType.VARCHAR),
		@Result(column = "specid", property = "specid", jdbcType = JdbcType.INTEGER),
		@Result(column = "specname", property = "specname", jdbcType = JdbcType.VARCHAR),
		@Result(column = "specvalid", property = "specvalid", jdbcType = JdbcType.INTEGER),
		@Result(column = "specval", property = "specval", jdbcType = JdbcType.VARCHAR) 
	})
	List<ClassForSpec> selectForSpec();

	// add by lhy 1127 end

	// add by xdx 1127 begin

	@Select({
		"CALL goodsByTypeNameAndBrandName(1)" 
	})
	@Results({ 
		@Result(column = "id", property = "id", jdbcType = JdbcType.INTEGER),
		@Result(column = "name", property = "name", jdbcType = JdbcType.VARCHAR),
		@Result(column = "img", property = "img", jdbcType = JdbcType.VARCHAR),
		@Result(column = "number", property = "number", jdbcType = JdbcType.INTEGER),
		@Result(column = "stock", property = "stock", jdbcType = JdbcType.INTEGER),
		@Result(column = "opice", property = "opice", jdbcType = JdbcType.INTEGER),
		@Result(column = "pice", property = "pice", jdbcType = JdbcType.INTEGER),
		@Result(column = "brandid", property = "brandid", jdbcType = JdbcType.INTEGER),
		@Result(column = "brandname", property = "brandname", jdbcType = JdbcType.VARCHAR),
		@Result(column = "typeid", property = "typeid", jdbcType = JdbcType.INTEGER),
		@Result(column = "classtype", property = "classtype", jdbcType = JdbcType.VARCHAR),
		@Result(column = "goodsspecid", property = "goodsspecid", jdbcType = JdbcType.INTEGER),
		@Result(column = "goodsclassid", property = "goodsclassid", jdbcType = JdbcType.INTEGER),
		@Result(column = "recommend", property = "recommend", jdbcType = JdbcType.BIT),
		@Result(column = "grounding", property = "grounding", jdbcType = JdbcType.BIT),
		@Result(column = "details", property = "details", jdbcType = JdbcType.VARCHAR) 
	})
	List<Goodsplus> findAll();

	// add by xdx 1127 end
	
	//add by zhaoyu 1128 begin
    
    @SelectProvider(type=GoodsSqlProvider.class, method="selectbynameAndClassnameAndBrandname")
    @Results({
    	@Result(column = "id", property = "id", jdbcType = JdbcType.INTEGER),
		@Result(column = "name", property = "name", jdbcType = JdbcType.VARCHAR),
		@Result(column = "img", property = "img", jdbcType = JdbcType.VARCHAR),
		@Result(column = "number", property = "number", jdbcType = JdbcType.INTEGER),
		@Result(column = "stock", property = "stock", jdbcType = JdbcType.INTEGER),
		@Result(column = "opice", property = "opice", jdbcType = JdbcType.INTEGER),
		@Result(column = "pice", property = "pice", jdbcType = JdbcType.INTEGER),
		@Result(column = "brandid", property = "brandid", jdbcType = JdbcType.INTEGER),
		@Result(column = "brandname", property = "brandname", jdbcType = JdbcType.VARCHAR),
		@Result(column = "typeid", property = "typeid", jdbcType = JdbcType.INTEGER),
		@Result(column = "classtype", property = "classtype", jdbcType = JdbcType.VARCHAR),
		@Result(column = "goodsspecid", property = "goodsspecid", jdbcType = JdbcType.INTEGER),
		@Result(column = "goodsclassid", property = "goodsclassid", jdbcType = JdbcType.INTEGER),
		@Result(column = "recommend", property = "recommend", jdbcType = JdbcType.BIT),
		@Result(column = "grounding", property = "grounding", jdbcType = JdbcType.BIT),
		@Result(column = "details", property = "details", jdbcType = JdbcType.VARCHAR) 
    })
    List<Goodsplus> selectbynameAndClassnameAndBrandname(Goods goods);
    
    //add by zhaoyu 1128 end
    
    //add by lhy 1128 begin
    
    @Select({
    	"select DISTINCT f.name specname,c.brandid brandid,e.name brandname",
    	  "from goodsclass a,",
    	        "goodstype b,",
    			"typebrand c,",
    			"typespec d,",
    			"goodsbrand e,",
    			"spec f",
    	 "where a.typeid = b.id",
    	   "and b.id = c.typeid",
    	   "and c.typeid = d.typeid",
    	   "and c.brandid = e.id",
    	   "and d.specid = f.id",
    	   "and a.level = 2",
    	   "and c.brandid = #{brandid,jdbcType=BIT}"
    })
    @Results({
    	@Result(column = "brandid", property = "brandid", jdbcType = JdbcType.INTEGER),
		@Result(column = "brandname", property = "brandname", jdbcType = JdbcType.VARCHAR),
		@Result(column = "specname", property = "specname", jdbcType = JdbcType.VARCHAR)
    })
    List<BrandBySpec> selectSpecByBrandName(Integer brandid);
    
    @Select({
    	"select DISTINCT d.id id, d.sort sort, d.firstchar firstchar, d.name name, d.type type, d.img img, d.recommand recommand, a.id classid",
    	  "from goodsclass a,",
    	        "goodstype b,",
    	        "typebrand c,",
    	        "goodsbrand d",
    	 "where a.typeid = b.id",
    	   "and b.id = c.typeid",
    	   "and c.brandid = d.id",
    	   " and a.id = #{classid,jdbcType=INTEGER}",
    	   "and a.level = 2"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER),
        @Result(column="firstchar", property="firstchar", jdbcType=JdbcType.VARCHAR),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="type", property="type", jdbcType=JdbcType.VARCHAR),
        @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
        @Result(column="recommand", property="recommand", jdbcType=JdbcType.BIT),
        @Result(column="classid", property="classid", jdbcType=JdbcType.INTEGER)
    })
    List<Goodsbrandplus> selectBrandByClassId(Integer classid);
    
    //add by lhy 1128 end
}
