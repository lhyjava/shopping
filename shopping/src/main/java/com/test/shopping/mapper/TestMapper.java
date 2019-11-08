package com.test.shopping.mapper;

import com.test.shopping.entity.Test;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

public interface TestMapper {
    @Delete({
        "delete from test",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into test (id, name, ",
        "pass)",
        "values (#{id,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, ",
        "#{pass,jdbcType=VARCHAR})"
    })
    int insert(Test record);

    @InsertProvider(type=TestSqlProvider.class, method="insertSelective")
    int insertSelective(Test record);

    @Select({
        "select",
        "id, name, pass",
        "from test",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="pass", property="pass", jdbcType=JdbcType.VARCHAR)
    })
    Test selectByPrimaryKey(Integer id);
    
    @Select({
        "select",
        "id, name, pass",
        "from test",
        "where name = #{name,jdbcType=VARCHAR}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="pass", property="pass", jdbcType=JdbcType.VARCHAR)
    })
    Test selectByName(String name);

    @UpdateProvider(type=TestSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Test record);

    @Update({
        "update test",
        "set name = #{name,jdbcType=VARCHAR},",
          "pass = #{pass,jdbcType=VARCHAR}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Test record);
}