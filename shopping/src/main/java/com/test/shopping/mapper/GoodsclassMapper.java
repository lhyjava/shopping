package com.test.shopping.mapper;

import com.test.shopping.entity.Goodsclass;
import com.test.shopping.entity.Goodsclassplus;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

public interface GoodsclassMapper {
    @Delete({
        "delete from goodsclass",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into goodsclass (id, name, ",
        "display, level, recommend, ",
        "sort, typeid, parentid)",
        "values (#{id,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, ",
        "#{display,jdbcType=BIT}, #{level,jdbcType=INTEGER}, #{recommend,jdbcType=BIT}, ",
        "#{sort,jdbcType=INTEGER}, #{typeid,jdbcType=INTEGER}, #{parentid,jdbcType=INTEGER})"
    })
    int insert(Goodsclass record);

    @InsertProvider(type=GoodsclassSqlProvider.class, method="insertSelective")
    int insertSelective(Goodsclass record);

    @Select({
        "select",
        "id, name, display, level, recommend, sort, typeid, parentid",
        "from goodsclass",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="display", property="display", jdbcType=JdbcType.BIT),
        @Result(column="level", property="level", jdbcType=JdbcType.INTEGER),
        @Result(column="recommend", property="recommend", jdbcType=JdbcType.BIT),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER),
        @Result(column="typeid", property="typeid", jdbcType=JdbcType.INTEGER),
        @Result(column="parentid", property="parentid", jdbcType=JdbcType.INTEGER)
    })
    Goodsclass selectByPrimaryKey(Integer id);

    @UpdateProvider(type=GoodsclassSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Goodsclass record);

    @Update({
        "update goodsclass",
        "set name = #{name,jdbcType=VARCHAR},",
          "display = #{display,jdbcType=BIT},",
          "level = #{level,jdbcType=INTEGER},",
          "recommend = #{recommend,jdbcType=BIT},",
          "sort = #{sort,jdbcType=INTEGER},",
          "typeid = #{typeid,jdbcType=INTEGER},",
          "parentid = #{parentid,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Goodsclass record);
    
    //add by lhy 1121 begin
    
    /**
	 * 	level 1
	 */
    @Select({
        "select",
        "id, name, display, level, recommend, sort, typeid, parentid",
        "from goodsclass",
        "where level = #{level,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="display", property="display", jdbcType=JdbcType.BIT),
        @Result(column="level", property="level", jdbcType=JdbcType.INTEGER),
        @Result(column="recommend", property="recommend", jdbcType=JdbcType.BIT),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER),
        @Result(column="typeid", property="typeid", jdbcType=JdbcType.INTEGER),
        @Result(column="parentid", property="parentid", jdbcType=JdbcType.INTEGER)
    })
    List<Goodsclass> GoodsClassFindAll(Integer level);
    
    /**
   	 * 	level 2
   	 */
    @Select({
        "select",
        "id, name, display, level, recommend, sort, typeid, parentid",
        "from goodsclass",
        "where level = #{level,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="display", property="display", jdbcType=JdbcType.BIT),
        @Result(column="level", property="level", jdbcType=JdbcType.INTEGER),
        @Result(column="recommend", property="recommend", jdbcType=JdbcType.BIT),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER),
        @Result(column="typeid", property="typeid", jdbcType=JdbcType.INTEGER),
        @Result(column="parentid", property="parentid", jdbcType=JdbcType.INTEGER),
        @Result(property="list",column="id",javaType=List.class,
        many=@Many(select="com.test.shopping.mapper.GoodsclassMapper.GoodsClassFindAllByParentId"))
    })
    List<Goodsclassplus> GoodsClassFindAllByLevel(Integer level);
    
    /**
   	 * 	level 3
   	 */
    @Select({
        "select",
        "id, name, display, level, recommend, sort, typeid, parentid",
        "from goodsclass",
        "where parentid = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="display", property="display", jdbcType=JdbcType.BIT),
        @Result(column="level", property="level", jdbcType=JdbcType.INTEGER),
        @Result(column="recommend", property="recommend", jdbcType=JdbcType.BIT),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER),
        @Result(column="typeid", property="typeid", jdbcType=JdbcType.INTEGER),
        @Result(column="parentid", property="parentid", jdbcType=JdbcType.INTEGER),
        @Result(property="list",column="id",javaType=List.class,
        many=@Many(select="com.test.shopping.mapper.GoodsclassMapper.GoodsClassFindAllByParentId"))
    })
    List<Goodsclassplus> GoodsClassFindAllByParentId(Integer id);
    
    //add by lhy 1121 end
}