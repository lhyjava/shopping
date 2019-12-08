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

import com.test.shopping.entity.Receiptaddress;

public interface ReceiptaddressMapper {
    @Delete({
        "delete from receiptaddress",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into receiptaddress (id, receiptname, ",
        "receiptnregionsheng, receiptnregionshi, ",
        "receiptnregionqu, receiptnstreet, ",
        "receiptnumber, receiptphone, ",
        "receiptyoubian, userid)",
        "values (#{id,jdbcType=INTEGER}, #{receiptname,jdbcType=VARCHAR}, ",
        "#{receiptnregionsheng,jdbcType=VARCHAR}, #{receiptnregionshi,jdbcType=VARCHAR}, ",
        "#{receiptnregionqu,jdbcType=VARCHAR}, #{receiptnstreet,jdbcType=VARCHAR}, ",
        "#{receiptnumber,jdbcType=VARCHAR}, #{receiptphone,jdbcType=INTEGER}, ",
        "#{receiptyoubian,jdbcType=INTEGER}, #{userid,jdbcType=INTEGER})"
    })
    int insert(Receiptaddress record);

    @InsertProvider(type=ReceiptaddressSqlProvider.class, method="insertSelective")
    int insertSelective(Receiptaddress record);

    @Select({
        "select",
        "id, receiptname, receiptnregionsheng, receiptnregionshi, receiptnregionqu, receiptnstreet, ",
        "receiptnumber, receiptphone, receiptyoubian, userid",
        "from receiptaddress",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="receiptname", property="receiptname", jdbcType=JdbcType.VARCHAR),
        @Result(column="receiptnregionsheng", property="receiptnregionsheng", jdbcType=JdbcType.VARCHAR),
        @Result(column="receiptnregionshi", property="receiptnregionshi", jdbcType=JdbcType.VARCHAR),
        @Result(column="receiptnregionqu", property="receiptnregionqu", jdbcType=JdbcType.VARCHAR),
        @Result(column="receiptnstreet", property="receiptnstreet", jdbcType=JdbcType.VARCHAR),
        @Result(column="receiptnumber", property="receiptnumber", jdbcType=JdbcType.VARCHAR),
        @Result(column="receiptphone", property="receiptphone", jdbcType=JdbcType.INTEGER),
        @Result(column="receiptyoubian", property="receiptyoubian", jdbcType=JdbcType.INTEGER),
        @Result(column="userid", property="userid", jdbcType=JdbcType.INTEGER)
    })
    Receiptaddress selectByPrimaryKey(Integer id);

    @UpdateProvider(type=ReceiptaddressSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Receiptaddress record);

    @Update({
        "update receiptaddress",
        "set receiptname = #{receiptname,jdbcType=VARCHAR},",
          "receiptnregionsheng = #{receiptnregionsheng,jdbcType=VARCHAR},",
          "receiptnregionshi = #{receiptnregionshi,jdbcType=VARCHAR},",
          "receiptnregionqu = #{receiptnregionqu,jdbcType=VARCHAR},",
          "receiptnstreet = #{receiptnstreet,jdbcType=VARCHAR},",
          "receiptnumber = #{receiptnumber,jdbcType=VARCHAR},",
          "receiptphone = #{receiptphone,jdbcType=INTEGER},",
          "receiptyoubian = #{receiptyoubian,jdbcType=INTEGER},",
          "userid = #{userid,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Receiptaddress record);
    
    //add by lhy 1206 begin
    
    @Select({
        "select",
        "id, receiptname, receiptnregionsheng, receiptnregionshi, receiptnregionqu, receiptnstreet, ",
        "receiptnumber, receiptphone, receiptyoubian",
        "from receiptaddress",
        "where userid = #{userid,jdbcType=VARCHAR}"
    })
    List<Receiptaddress> AddressFindByUserId(String userid);
    
    //add by lhy 1206 end
}