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

import com.test.shopping.entity.Spec;
import com.test.shopping.entity.Specplus;

public interface SpecMapper {

    @Delete({
        "delete from spec",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into spec (id, name, ",
        "sort)",
        "values (#{id,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, ",
        "#{sort,jdbcType=INTEGER})"
    })
    int insert(Spec record);

    @InsertProvider(type=SpecSqlProvider.class, method="insertSelective")
    int insertSelective(Spec record);

    @Select({
        "select",
        "id, name, sort",
        "from spec",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER)
    })
    Spec selectByPrimaryKey(Integer id);
    
    //add by lhy 1114 begin
    
    @Select({
        "select s.*, GROUP_CONCAT(v.value) vals",
        "FROM spec s, specval v",
        "WHERE s.id = v.specid",
        "GROUP BY s.id  order by sort"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER),
        @Result(column="vals", property="vals", jdbcType=JdbcType.VARCHAR)
    })
    List<Specplus> findall();
    
    @Select({
        "select",
        "id, name, sort",
        "from spec",
        "where name = #{name,jdbcType=VARCHAR}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER)
    })
    Spec selectByName(String name);
    
    @DeleteProvider(type=SpecSqlProvider.class, method="deleteAll")
    int deleteAll(String ids);
    
    //add by lhy 1114 end
    
    @UpdateProvider(type=SpecSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Spec record);

    @Update({
        "update spec",
        "set name = #{name,jdbcType=VARCHAR},",
          "sort = #{sort,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Spec record);
}