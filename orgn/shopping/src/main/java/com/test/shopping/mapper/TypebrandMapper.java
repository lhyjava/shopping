package com.test.shopping.mapper;

import com.test.shopping.entity.Typebrand;
import com.test.shopping.entity.Typespec;

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

public interface TypebrandMapper {
    @Delete({
        "delete from typebrand",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into typebrand (id, typeid, ",
        "brandid)",
        "values (#{id,jdbcType=INTEGER}, #{typeid,jdbcType=INTEGER}, ",
        "#{brandid,jdbcType=INTEGER})"
    })
    int insert(Typebrand record);

    @InsertProvider(type=TypebrandSqlProvider.class, method="insertSelective")
    int insertSelective(Typebrand record);
    
    //add by lhy 1118 begin
    
    /**
     * 
     * @Title: insertByTypeid
     * @Description: 根据typeid、brandid添加
     * @Author lhy
     * @DateTime 2019年11月18日 下午1:11:13
     * @param list
     * @return
     */
    @InsertProvider(type=TypebrandSqlProvider.class, method="insertByTypeid")
    int insertByTypeid(List<Typebrand> list);
    
    //add by lhy 1118 end
    
    //add by lhy 1121 begin
    
    @Delete({
        "delete from typebrand",
        "where typeid = #{id,jdbcType=INTEGER}"
    })
    int deleteByTypeId(Integer id);
    
    //add by lhy 1121 end

    @Select({
        "select",
        "id, typeid, brandid",
        "from typebrand",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="typeid", property="typeid", jdbcType=JdbcType.INTEGER),
        @Result(column="brandid", property="brandid", jdbcType=JdbcType.INTEGER)
    })
    Typebrand selectByPrimaryKey(Integer id);

    @UpdateProvider(type=TypebrandSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Typebrand record);

    @Update({
        "update typebrand",
        "set typeid = #{typeid,jdbcType=INTEGER},",
          "brandid = #{brandid,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Typebrand record);
}