package com.test.shopping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

import com.test.shopping.entity.Goodsbrand;
import com.test.shopping.entity.Goodstype;
import com.test.shopping.entity.Specplus;

public interface GoodstypeMapper {
    @Delete({
        "delete from goodstype",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into goodstype (id, name, ",
        "sort)",
        "values (#{id,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, ",
        "#{sort,jdbcType=INTEGER})"
    })
    int insert(Goodstype record);

    @InsertProvider(type=GoodstypeSqlProvider.class, method="insertSelective")
    int insertSelective(Goodstype record);

    @Select({
        "select",
        "id, name, sort",
        "from goodstype",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER)
    })
    Goodstype selectByPrimaryKey(Integer id);
    
    //add by lys 11.18 begin
    @Select({
        "select",
        "id, name, sort",
        "from goodstype",
        "where name = #{name,jdbcType=VARCHAR}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER)
    })
	Goodstype selectByName(String name);
    
	//add by lys end 11.18
    
    //add 1118 by zhaoyu begin
    
    @Select({
        "select",
        "id, name, sort",
        "from goodstype order by sort"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER)
    })
    List<Goodstype> goodstypefindall();
    
    
    @DeleteProvider(type=GoodstypeSqlProvider.class, method="goodstypedeleteall")
    int goodstypedeleteall(String values);
    
    //add 1118 by zhaoyu end

    @UpdateProvider(type=GoodstypeSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Goodstype record);

    @Update({
        "update goodstype",
        "set name = #{name,jdbcType=VARCHAR},",
          "sort = #{sort,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Goodstype record);
    
    //add by lhy 1120 begin
    
    @Select({
        "select",
        "name",
        "from goodstype",
        "where name = #{name,jdbcType=VARCHAR}"
    })
	String selectByNameValidate(String name);
    
    //add by lhy 1120 end
    
    //add by lhy 1121 begin
    
    @Select({
    	"select c.*,group_concat(d.value) vals",
    	  "from goodstype a,",
    			"typespec b,",
    			"spec c,",
    			"specval d",
    	 "where a.id = b.typeid",
    	   "and b.specid = c.id",
    	   "and c.id = d.specid",
    	   "and a.id = #{id,jdbcType=INTEGER}",
    	   "group by c.id"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER),
        @Result(column="vals", property="vals", jdbcType=JdbcType.VARCHAR)
    })
    List<Specplus> selectBySpecplus(Integer id);
    
    @Select({
    	"select DISTINCT c.type",
    	 "from goodstype a,",
    	       "typebrand b,",
    	       "goodsbrand c",
    	 "where a.id = b.typeid",
    	   "and b.brandid = c.id",
    	   "and a.id = #{id,jdbcType=INTEGER}"
    })
    List<String> selectByBrandType(Integer id);
    
    @Select({
    	"select c.*",
    	 "from goodstype a,",
    	       "typebrand b,",
    	       "goodsbrand c",
    	 "where a.id = b.typeid",
    	   "and b.brandid = c.id",
    	   "and a.id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER),
        @Result(column="firstchar", property="firstchar", jdbcType=JdbcType.VARCHAR),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="type", property="type", jdbcType=JdbcType.VARCHAR),
        @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
        @Result(column="recommand", property="recommand", jdbcType=JdbcType.BIT)
    })
    List<Goodsbrand> selectByBrandName(Integer id);
    
    //add by lhy 1121 end
}