package com.test.shopping.mapper;

import com.test.shopping.entity.Ordergoods;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

public interface OrdergoodsMapper {
    @Delete({
        "delete from ordergoods",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into ordergoods (id, orderid, ",
        "goodsid, name, img, ",
        "specmessage, url, ",
        "price, number)",
        "values (#{id,jdbcType=INTEGER}, #{orderid,jdbcType=INTEGER}, ",
        "#{goodsid,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, #{img,jdbcType=VARCHAR}, ",
        "#{specmessage,jdbcType=VARCHAR}, #{url,jdbcType=VARCHAR}, ",
        "#{price,jdbcType=INTEGER}, #{number,jdbcType=INTEGER})"
    })
    int insert(Ordergoods record);

    @InsertProvider(type=OrdergoodsSqlProvider.class, method="insertSelective")
    int insertSelective(Ordergoods record);

    @Select({
        "select",
        "id, orderid, goodsid, name, img, specmessage, url, price, number",
        "from ordergoods",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="orderid", property="orderid", jdbcType=JdbcType.INTEGER),
        @Result(column="goodsid", property="goodsid", jdbcType=JdbcType.INTEGER),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
        @Result(column="specmessage", property="specmessage", jdbcType=JdbcType.VARCHAR),
        @Result(column="url", property="url", jdbcType=JdbcType.VARCHAR),
        @Result(column="price", property="price", jdbcType=JdbcType.INTEGER),
        @Result(column="number", property="number", jdbcType=JdbcType.INTEGER)
    })
    Ordergoods selectByPrimaryKey(Integer id);

    @UpdateProvider(type=OrdergoodsSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Ordergoods record);

    @Update({
        "update ordergoods",
        "set orderid = #{orderid,jdbcType=INTEGER},",
          "goodsid = #{goodsid,jdbcType=INTEGER},",
          "name = #{name,jdbcType=VARCHAR},",
          "img = #{img,jdbcType=VARCHAR},",
          "specmessage = #{specmessage,jdbcType=VARCHAR},",
          "url = #{url,jdbcType=VARCHAR},",
          "price = #{price,jdbcType=INTEGER},",
          "number = #{number,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Ordergoods record);
    
    //add by lhy 1208 begin
    
    @InsertProvider(type=OrdergoodsSqlProvider.class, method="insertGoods")
    int insertGoods(Integer id,String[] img,String[] name,String[] specmessage,
			  		Integer[] price,Integer[] number,Integer[] goodsid);
    
    //add bu 1208 end
}