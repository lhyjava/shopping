package com.test.shopping.mapper;

import com.test.shopping.entity.Shoppingcar;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

public interface ShoppingcarMapper {
    @Delete({
        "delete from shoppingcar",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into shoppingcar (id, image, ",
        "name, price, number, ",
        "url, spec, userid, ",
        "goodsid)",
        "values (#{id,jdbcType=INTEGER}, #{image,jdbcType=VARCHAR}, ",
        "#{name,jdbcType=VARCHAR}, #{price,jdbcType=INTEGER}, #{number,jdbcType=INTEGER}, ",
        "#{url,jdbcType=VARCHAR}, #{spec,jdbcType=VARCHAR}, #{userid,jdbcType=INTEGER}, ",
        "#{goodsid,jdbcType=INTEGER})"
    })
    int insert(Shoppingcar record);

    @InsertProvider(type=ShoppingcarSqlProvider.class, method="insertSelective")
    int insertSelective(Shoppingcar record);

    @Select({
        "select",
        "id, image, name, price, number, url, spec, userid, goodsid",
        "from shoppingcar",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="image", property="image", jdbcType=JdbcType.VARCHAR),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="price", property="price", jdbcType=JdbcType.INTEGER),
        @Result(column="number", property="number", jdbcType=JdbcType.INTEGER),
        @Result(column="url", property="url", jdbcType=JdbcType.VARCHAR),
        @Result(column="spec", property="spec", jdbcType=JdbcType.VARCHAR),
        @Result(column="userid", property="userid", jdbcType=JdbcType.INTEGER),
        @Result(column="goodsid", property="goodsid", jdbcType=JdbcType.INTEGER)
    })
    Shoppingcar selectByPrimaryKey(Integer id);

    @UpdateProvider(type=ShoppingcarSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Shoppingcar record);

    @Update({
        "update shoppingcar",
        "set image = #{image,jdbcType=VARCHAR},",
          "name = #{name,jdbcType=VARCHAR},",
          "price = #{price,jdbcType=INTEGER},",
          "number = #{number,jdbcType=INTEGER},",
          "url = #{url,jdbcType=VARCHAR},",
          "spec = #{spec,jdbcType=VARCHAR},",
          "userid = #{userid,jdbcType=INTEGER},",
          "goodsid = #{goodsid,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Shoppingcar record);
    
    //add by lhy 1207 begin
    
    @SelectProvider(type=ShoppingcarSqlProvider.class, method="findById")
    List<Shoppingcar> findById(String id,String userid);
    
    @SelectProvider(type=ShoppingcarSqlProvider.class, method="selectTotalPriceByUserId")
    String selectTotalPriceByUserId(String id,String userid);

    //add by 1207 end
}