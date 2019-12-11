package com.test.shopping.mapper;

import com.test.shopping.entity.Allcity;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

public interface AllcityMapper {
    @Delete({
        "delete from allcity",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into allcity (id, code, ",
        "name, provincecode)",
        "values (#{id,jdbcType=INTEGER}, #{code,jdbcType=VARCHAR}, ",
        "#{name,jdbcType=VARCHAR}, #{provincecode,jdbcType=VARCHAR})"
    })
    int insert(Allcity record);

    @InsertProvider(type=AllcitySqlProvider.class, method="insertSelective")
    int insertSelective(Allcity record);

    @Select({
        "select",
        "id, code, name, provincecode",
        "from allcity",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="code", property="code", jdbcType=JdbcType.VARCHAR),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="provincecode", property="provincecode", jdbcType=JdbcType.VARCHAR)
    })
    Allcity selectByPrimaryKey(Integer id);

    @UpdateProvider(type=AllcitySqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Allcity record);

    @Update({
        "update allcity",
        "set code = #{code,jdbcType=VARCHAR},",
          "name = #{name,jdbcType=VARCHAR},",
          "provincecode = #{provincecode,jdbcType=VARCHAR}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Allcity record);
    
    //add by zhaoyu 1208 begin 
    
    @Select({
        "select",
        "id, code, name, provincecode",
        "from allcity"
    })
    List<Allcity> selectallAllcity();
    
    
    @Select({
        "select name",
        "from allcity",
        "where code = #{code,jdbcType=INTEGER}"
    })
    String selectBycode(Integer code);
    
    //add by zhaoyu 1208 end
}