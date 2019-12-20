package com.test.shopping.mapper;

import com.test.shopping.entity.Allcountry;

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

public interface AllcountryMapper {
    @Delete({
        "delete from allcountry",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into allcountry (id, code, ",
        "name, citycode)",
        "values (#{id,jdbcType=INTEGER}, #{code,jdbcType=VARCHAR}, ",
        "#{name,jdbcType=VARCHAR}, #{citycode,jdbcType=VARCHAR})"
    })
    int insert(Allcountry record);

    @InsertProvider(type=AllcountrySqlProvider.class, method="insertSelective")
    int insertSelective(Allcountry record);

    @Select({
        "select",
        "id, code, name, citycode",
        "from allcountry",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="code", property="code", jdbcType=JdbcType.VARCHAR),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="citycode", property="citycode", jdbcType=JdbcType.VARCHAR)
    })
    Allcountry selectByPrimaryKey(Integer id);

    @UpdateProvider(type=AllcountrySqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Allcountry record);

    @Update({
        "update allcountry",
        "set code = #{code,jdbcType=VARCHAR},",
          "name = #{name,jdbcType=VARCHAR},",
          "citycode = #{citycode,jdbcType=VARCHAR}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Allcountry record);
    
    //add by zhaoyu 1208 begin
    
    @Select({
        "select",
        "id, code, name, citycode",
        "from allcountry"
    })
    List<Allcountry> selectallAllcountry();
    
    
    @Select({
        "select name",
        "from allcountry",
        "where code = #{code,jdbcType=INTEGER}"
    })
     String selectBycode(Integer code);
    
    
    //add by zhaoyu 1208 end
}