package com.test.shopping.mapper;

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

import com.test.shopping.entity.Addorder;

public interface AddorderMapper {
    @Delete({
        "delete from addorder",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into addorder (id, ordernumber, ",
        "orderdate, status, ",
        "consignee, Invoice, ",
        "delivery, message, ",
        "price, userid)",
        "values (#{id,jdbcType=INTEGER}, #{ordernumber,jdbcType=VARCHAR}, ",
        "#{orderdate,jdbcType=TIMESTAMP}, #{status,jdbcType=VARCHAR}, ",
        "#{consignee,jdbcType=VARCHAR}, #{invoice,jdbcType=VARCHAR}, ",
        "#{delivery,jdbcType=VARCHAR}, #{message,jdbcType=VARCHAR}, ",
        "#{price,jdbcType=INTEGER}, #{userid,jdbcType=INTEGER})"
    })
    int insert(Addorder record);

    @InsertProvider(type=AddorderSqlProvider.class, method="insertSelective")
    int insertSelective(Addorder record);

    @Select({
        "select",
        "id, ordernumber, orderdate, status, consignee, Invoice, delivery, message, price, ",
        "userid",
        "from addorder",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="ordernumber", property="ordernumber", jdbcType=JdbcType.VARCHAR),
        @Result(column="orderdate", property="orderdate", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="status", property="status", jdbcType=JdbcType.VARCHAR),
        @Result(column="consignee", property="consignee", jdbcType=JdbcType.VARCHAR),
        @Result(column="Invoice", property="invoice", jdbcType=JdbcType.VARCHAR),
        @Result(column="delivery", property="delivery", jdbcType=JdbcType.VARCHAR),
        @Result(column="message", property="message", jdbcType=JdbcType.VARCHAR),
        @Result(column="price", property="price", jdbcType=JdbcType.INTEGER),
        @Result(column="userid", property="userid", jdbcType=JdbcType.INTEGER)
    })
    Addorder selectByPrimaryKey(Integer id);

    @UpdateProvider(type=AddorderSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Addorder record);

    @Update({
        "update addorder",
        "set ordernumber = #{ordernumber,jdbcType=VARCHAR},",
          "orderdate = #{orderdate,jdbcType=TIMESTAMP},",
          "status = #{status,jdbcType=VARCHAR},",
          "consignee = #{consignee,jdbcType=VARCHAR},",
          "Invoice = #{invoice,jdbcType=VARCHAR},",
          "delivery = #{delivery,jdbcType=VARCHAR},",
          "message = #{message,jdbcType=VARCHAR},",
          "price = #{price,jdbcType=INTEGER},",
          "userid = #{userid,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Addorder record);
    
    //add by lhy 1208 begin
    
    @Select({
        "select",
        "id",
        "from addorder",
        "where ordernumber = #{ordernumber,jdbcType=VARCHAR}"
    })
    int selectIdByOrdernumber(String ordernumber);
    
    //add by lhy 1208 end
    
    //add by lys 1209 begin
    
    @Select({
        "select *",
        "from addorder",
        "where userid = #{userid,jdbcType=INTEGER}"
    })
    List<Addorder>selectByaddorderfindAll(Integer userid);
    
    //add by lys 1209 end 
   
    @SelectProvider(type=AddorderSqlProvider.class, method="selectByaddorder")
    List<Addorder> selectByaddorder(String ordernumber,String begintime,String endtime,String delivery);
    
    //add by lys 1210 end
}