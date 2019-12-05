package com.test.shopping.mapper;

import com.test.shopping.entity.Adv;

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

public interface AdvMapper {
    @Delete({
        "delete from adv",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into adv (id, img, ",
        "url, isshow)",
        "values (#{id,jdbcType=INTEGER}, #{img,jdbcType=VARCHAR}, ",
        "#{url,jdbcType=VARCHAR}, #{isshow,jdbcType=BIT})"
    })
    int insert(Adv record);

    @InsertProvider(type=AdvSqlProvider.class, method="insertSelective")
    int insertSelective(Adv record);

    @Select({
        "select",
        "id, img, url, isshow",
        "from adv",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
        @Result(column="url", property="url", jdbcType=JdbcType.VARCHAR),
        @Result(column="isshow", property="isshow", jdbcType=JdbcType.BIT)
    })
    Adv selectByPrimaryKey(Integer id);

    @UpdateProvider(type=AdvSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Adv record);

    @Update({
        "update adv",
        "set img = #{img,jdbcType=VARCHAR},",
          "url = #{url,jdbcType=VARCHAR},",
          "isshow = #{isshow,jdbcType=BIT}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Adv record);
    
    //add by lys 1203 begin
    
    @Select({
        "select",
        "id, img, url, isshow",
        "from adv"
    })
    List<Adv>selectByadvfindall();
    
    //add by lys 1203 end
    
    //add by lys 1204 begin
    
    @Select({
        "select",
        "id, img, url, isshow",
        "from adv",
        "where url = #{url,jdbcType=VARCHAR}"
    })
    List<Adv>selectByadvimgurl(String url);
    
    //add by lys 1204 end
    
}