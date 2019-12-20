package com.test.shopping.mapper;

import com.test.shopping.entity.Allprovince;

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

public interface AllprovinceMapper {
    @Delete({
        "delete from allprovince",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into allprovince (id, code, ",
        "name, SIMPLENAME)",
        "values (#{id,jdbcType=INTEGER}, #{code,jdbcType=VARCHAR}, ",
        "#{name,jdbcType=VARCHAR}, #{simplename,jdbcType=VARCHAR})"
    })
    int insert(Allprovince record);

    @InsertProvider(type=AllprovinceSqlProvider.class, method="insertSelective")
    int insertSelective(Allprovince record);

    @Select({
        "select",
        "id, code, name, SIMPLENAME",
        "from allprovince",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="code", property="code", jdbcType=JdbcType.VARCHAR),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="SIMPLENAME", property="simplename", jdbcType=JdbcType.VARCHAR)
    })
    Allprovince selectByPrimaryKey(Integer id);

    @UpdateProvider(type=AllprovinceSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Allprovince record);

    @Update({
        "update allprovince",
        "set code = #{code,jdbcType=VARCHAR},",
          "name = #{name,jdbcType=VARCHAR},",
          "SIMPLENAME = #{simplename,jdbcType=VARCHAR}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Allprovince record);
    
    //add vby zhaoyu 1208 begin
    
    @Select({
        "select",
        "id, code, name, SIMPLENAME",
        "from allprovince"
    })
    List<Allprovince> selectallAllprovince();
    
    
    @Select({
        "select name",
        "from allprovince",
        "where code = #{code,jdbcType=INTEGER}"
    })
    String selectBycode(Integer code);
    
    //add by zhaoyu 1208 end
}