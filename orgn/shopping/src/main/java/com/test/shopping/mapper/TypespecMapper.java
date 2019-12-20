package com.test.shopping.mapper;

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

import com.test.shopping.entity.Typespec;

public interface TypespecMapper {
    @Delete({
        "delete from typespec",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into typespec (id, typeid, ",
        "specid)",
        "values (#{id,jdbcType=INTEGER}, #{typeid,jdbcType=INTEGER}, ",
        "#{specid,jdbcType=INTEGER})"
    })
    int insert(Typespec record);

    @InsertProvider(type=TypespecSqlProvider.class, method="insertSelective")
    int insertSelective(Typespec record);
    
    //add by lhy 1118 begin
    
    /**
     * 
     * @Title: insertByTypeid
     * @Description: 根据typeid、specid添加
     * @Author lhy
     * @DateTime 2019年11月18日 下午1:00:44
     * @param list
     * @return
     */
    @InsertProvider(type=TypespecSqlProvider.class, method="insertByTypeid")
    int insertByTypeid(List<Typespec> list);
    
    //add by lhy 1118 end
    
    //add by lhy 1121 begin
    
    @Delete({
        "delete from typespec",
        "where typeid = #{id,jdbcType=INTEGER}"
    })
    int deleteByTypeId(Integer id);
    
    //add by lhy 1121 end

    @Select({
        "select",
        "id, typeid, specid",
        "from typespec",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="typeid", property="typeid", jdbcType=JdbcType.INTEGER),
        @Result(column="specid", property="specid", jdbcType=JdbcType.INTEGER)
    })
    Typespec selectByPrimaryKey(Integer id);

    @UpdateProvider(type=TypespecSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Typespec record);

    @Update({
        "update typespec",
        "set typeid = #{typeid,jdbcType=INTEGER},",
          "specid = #{specid,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Typespec record);
}