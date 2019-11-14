package com.test.shopping.mapper;

import com.test.shopping.entity.Specval;

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

public interface SpecvalMapper {
    
    @Delete({
        "delete from specval",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into specval (id, specid, ",
        "value, sort)",
        "values (#{id,jdbcType=INTEGER}, #{specid,jdbcType=INTEGER}, ",
        "#{value,jdbcType=VARCHAR}, #{sort,jdbcType=INTEGER})"
    })
    int insert(Specval record);

    @InsertProvider(type=SpecvalSqlProvider.class, method="insertSelective")
    int insertSelective(Specval record);
    
    //add by lhy 1114 begin
    
    /**
     * 
     * @Title: insertlist
     * @Description: 一次添加多条
     * @Author lhy
     * @DateTime 2019年11月14日 下午1:29:23
     * @param list
     * @return
     */
    @InsertProvider(type=SpecvalSqlProvider.class, method="insertlist")
    int insertlist(List<Specval> list);
    
    //add by lhy 1114 end
    
    //add by lhy 1115 begin
    
    @Select({
        "select",
        "id, specid, value, sort",
        "from specval",
        "where specid = #{specid,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="specid", property="specid", jdbcType=JdbcType.INTEGER),
        @Result(column="value", property="value", jdbcType=JdbcType.VARCHAR),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER)
    })
    List<Specval> selectByspecid(Integer specid);
    
    //add bu lhy end

    @Select({
        "select",
        "id, specid, value, sort",
        "from specval",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="specid", property="specid", jdbcType=JdbcType.INTEGER),
        @Result(column="value", property="value", jdbcType=JdbcType.VARCHAR),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER)
    })
    Specval selectByPrimaryKey(Integer id);

    @UpdateProvider(type=SpecvalSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Specval record);

    @Update({
        "update specval",
        "set specid = #{specid,jdbcType=INTEGER},",
          "value = #{value,jdbcType=VARCHAR},",
          "sort = #{sort,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Specval record);
}