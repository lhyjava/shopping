package com.test.shopping.mapper;

import com.test.shopping.entity.User;

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

public interface UserMapper {
    @Delete({
        "delete from user",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into user (id, username, ",
        "password, name, ",
        "addtime, lasttime, ",
        "img, mail, qq, ",
        "wangwang, msn, vippoints, ",
        "vipcoins, logintimes, ",
        "money, moneyfreeze, ",
        "power, sex, phonenumber)",
        "values (#{id,jdbcType=INTEGER}, #{username,jdbcType=VARCHAR}, ",
        "#{password,jdbcType=VARCHAR}, #{name,jdbcType=VARCHAR}, ",
        "#{addtime,jdbcType=TIMESTAMP}, #{lasttime,jdbcType=TIMESTAMP}, ",
        "#{img,jdbcType=VARCHAR}, #{mail,jdbcType=VARCHAR}, #{qq,jdbcType=VARCHAR}, ",
        "#{wangwang,jdbcType=VARCHAR}, #{msn,jdbcType=VARCHAR}, #{vippoints,jdbcType=INTEGER}, ",
        "#{vipcoins,jdbcType=INTEGER}, #{logintimes,jdbcType=INTEGER}, ",
        "#{money,jdbcType=INTEGER}, #{moneyfreeze,jdbcType=INTEGER}, ",
        "#{power,jdbcType=VARCHAR}, #{sex,jdbcType=VARCHAR}, #{phonenumber,jdbcType=VARCHAR})"
    })
    int insert(User record);

    @InsertProvider(type=UserSqlProvider.class, method="insertSelective")
    int insertSelective(User record);

    @Select({
        "select",
        "id, username, password, name, addtime, lasttime, img, mail, qq, wangwang, msn, ",
        "vippoints, vipcoins, logintimes, money, moneyfreeze, power, sex, phonenumber",
        "from user",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="username", property="username", jdbcType=JdbcType.VARCHAR),
        @Result(column="password", property="password", jdbcType=JdbcType.VARCHAR),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="addtime", property="addtime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="lasttime", property="lasttime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
        @Result(column="mail", property="mail", jdbcType=JdbcType.VARCHAR),
        @Result(column="qq", property="qq", jdbcType=JdbcType.VARCHAR),
        @Result(column="wangwang", property="wangwang", jdbcType=JdbcType.VARCHAR),
        @Result(column="msn", property="msn", jdbcType=JdbcType.VARCHAR),
        @Result(column="vippoints", property="vippoints", jdbcType=JdbcType.INTEGER),
        @Result(column="vipcoins", property="vipcoins", jdbcType=JdbcType.INTEGER),
        @Result(column="logintimes", property="logintimes", jdbcType=JdbcType.INTEGER),
        @Result(column="money", property="money", jdbcType=JdbcType.INTEGER),
        @Result(column="moneyfreeze", property="moneyfreeze", jdbcType=JdbcType.INTEGER),
        @Result(column="power", property="power", jdbcType=JdbcType.VARCHAR),
        @Result(column="sex", property="sex", jdbcType=JdbcType.VARCHAR),
        @Result(column="phonenumber", property="phonenumber", jdbcType=JdbcType.VARCHAR)
    })
    User selectByPrimaryKey(Integer id);
    
    
    //add by xdx 12.02 begin
    
    @Select({
    	"select",
        "id, username, password, name, addtime, lasttime, img, mail, qq, wangwang, msn, ",
        "vippoints, vipcoins, logintimes, money, moneyfreeze, power, sex, phonenumber",
        "from user"
    })
    @Results({
    	 @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
         @Result(column="username", property="username", jdbcType=JdbcType.VARCHAR),
         @Result(column="password", property="password", jdbcType=JdbcType.VARCHAR),
         @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
         @Result(column="addtime", property="addtime", jdbcType=JdbcType.TIMESTAMP),
         @Result(column="lasttime", property="lasttime", jdbcType=JdbcType.TIMESTAMP),
         @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
         @Result(column="mail", property="mail", jdbcType=JdbcType.VARCHAR),
         @Result(column="qq", property="qq", jdbcType=JdbcType.VARCHAR),
         @Result(column="wangwang", property="wangwang", jdbcType=JdbcType.VARCHAR),
         @Result(column="msn", property="msn", jdbcType=JdbcType.VARCHAR),
         @Result(column="vippoints", property="vippoints", jdbcType=JdbcType.INTEGER),
         @Result(column="vipcoins", property="vipcoins", jdbcType=JdbcType.INTEGER),
         @Result(column="logintimes", property="logintimes", jdbcType=JdbcType.INTEGER),
         @Result(column="money", property="money", jdbcType=JdbcType.INTEGER),
         @Result(column="moneyfreeze", property="moneyfreeze", jdbcType=JdbcType.INTEGER),
         @Result(column="power", property="power", jdbcType=JdbcType.VARCHAR),
         @Result(column="sex", property="sex", jdbcType=JdbcType.VARCHAR),
         @Result(column="phonenumber", property="phonenumber", jdbcType=JdbcType.VARCHAR)
    })
    List<User> goodsuserfindall();
    
    
    @Select({
    	"select * ",
        "from user ",
        "where power=1 and username = #{value,jdbcType=VARCHAR}"       
    })
    @Results({
    	 @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
         @Result(column="username", property="username", jdbcType=JdbcType.VARCHAR),
         @Result(column="password", property="password", jdbcType=JdbcType.VARCHAR),
         @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
         @Result(column="addtime", property="addtime", jdbcType=JdbcType.TIMESTAMP),
         @Result(column="lasttime", property="lasttime", jdbcType=JdbcType.TIMESTAMP),
         @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
         @Result(column="mail", property="mail", jdbcType=JdbcType.VARCHAR),
         @Result(column="qq", property="qq", jdbcType=JdbcType.VARCHAR),
         @Result(column="wangwang", property="wangwang", jdbcType=JdbcType.VARCHAR),
         @Result(column="msn", property="msn", jdbcType=JdbcType.VARCHAR),
         @Result(column="vippoints", property="vippoints", jdbcType=JdbcType.INTEGER),
         @Result(column="vipcoins", property="vipcoins", jdbcType=JdbcType.INTEGER),
         @Result(column="logintimes", property="logintimes", jdbcType=JdbcType.INTEGER),
         @Result(column="money", property="money", jdbcType=JdbcType.INTEGER),
         @Result(column="moneyfreeze", property="moneyfreeze", jdbcType=JdbcType.INTEGER),
         @Result(column="power", property="power", jdbcType=JdbcType.VARCHAR),
         @Result(column="sex", property="sex", jdbcType=JdbcType.VARCHAR),
         @Result(column="phonenumber", property="phonenumber", jdbcType=JdbcType.VARCHAR)
    })
    List<User> selectByUserame(String value);
    
    
    @Select({
    	"select * ",
        "from user ",
        "where mail = #{value,jdbcType=VARCHAR}"       
    })
    @Results({
    	 @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
         @Result(column="username", property="username", jdbcType=JdbcType.VARCHAR),
         @Result(column="password", property="password", jdbcType=JdbcType.VARCHAR),
         @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
         @Result(column="addtime", property="addtime", jdbcType=JdbcType.TIMESTAMP),
         @Result(column="lasttime", property="lasttime", jdbcType=JdbcType.TIMESTAMP),
         @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
         @Result(column="mail", property="mail", jdbcType=JdbcType.VARCHAR),
         @Result(column="qq", property="qq", jdbcType=JdbcType.VARCHAR),
         @Result(column="wangwang", property="wangwang", jdbcType=JdbcType.VARCHAR),
         @Result(column="msn", property="msn", jdbcType=JdbcType.VARCHAR),
         @Result(column="vippoints", property="vippoints", jdbcType=JdbcType.INTEGER),
         @Result(column="vipcoins", property="vipcoins", jdbcType=JdbcType.INTEGER),
         @Result(column="logintimes", property="logintimes", jdbcType=JdbcType.INTEGER),
         @Result(column="money", property="money", jdbcType=JdbcType.INTEGER),
         @Result(column="moneyfreeze", property="moneyfreeze", jdbcType=JdbcType.INTEGER),
         @Result(column="power", property="power", jdbcType=JdbcType.VARCHAR),
         @Result(column="sex", property="sex", jdbcType=JdbcType.VARCHAR),
         @Result(column="phonenumber", property="phonenumber", jdbcType=JdbcType.VARCHAR)
    })
    List<User> selectByMail(String value);
    
    
    @Select({
    	"select * ",
        "from user ",
        "where name = #{value,jdbcType=VARCHAR}"       
    })
    @Results({
    	 @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
         @Result(column="username", property="username", jdbcType=JdbcType.VARCHAR),
         @Result(column="password", property="password", jdbcType=JdbcType.VARCHAR),
         @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
         @Result(column="addtime", property="addtime", jdbcType=JdbcType.TIMESTAMP),
         @Result(column="lasttime", property="lasttime", jdbcType=JdbcType.TIMESTAMP),
         @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
         @Result(column="mail", property="mail", jdbcType=JdbcType.VARCHAR),
         @Result(column="qq", property="qq", jdbcType=JdbcType.VARCHAR),
         @Result(column="wangwang", property="wangwang", jdbcType=JdbcType.VARCHAR),
         @Result(column="msn", property="msn", jdbcType=JdbcType.VARCHAR),
         @Result(column="vippoints", property="vippoints", jdbcType=JdbcType.INTEGER),
         @Result(column="vipcoins", property="vipcoins", jdbcType=JdbcType.INTEGER),
         @Result(column="logintimes", property="logintimes", jdbcType=JdbcType.INTEGER),
         @Result(column="money", property="money", jdbcType=JdbcType.INTEGER),
         @Result(column="moneyfreeze", property="moneyfreeze", jdbcType=JdbcType.INTEGER),
         @Result(column="power", property="power", jdbcType=JdbcType.VARCHAR),
         @Result(column="sex", property="sex", jdbcType=JdbcType.VARCHAR),
         @Result(column="phonenumber", property="phonenumber", jdbcType=JdbcType.VARCHAR)
    })
    List<User> selectByName(String value);
    
    //add by xdx 12.02 end
        
    @UpdateProvider(type=UserSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(User record);

    @Update({
        "update user",
        "set username = #{username,jdbcType=VARCHAR},",
          "password = #{password,jdbcType=VARCHAR},",
          "name = #{name,jdbcType=VARCHAR},",
          "addtime = #{addtime,jdbcType=TIMESTAMP},",
          "lasttime = #{lasttime,jdbcType=TIMESTAMP},",
          "img = #{img,jdbcType=VARCHAR},",
          "mail = #{mail,jdbcType=VARCHAR},",
          "qq = #{qq,jdbcType=VARCHAR},",
          "wangwang = #{wangwang,jdbcType=VARCHAR},",
          "msn = #{msn,jdbcType=VARCHAR},",
          "vippoints = #{vippoints,jdbcType=INTEGER},",
          "vipcoins = #{vipcoins,jdbcType=INTEGER},",
          "logintimes = #{logintimes,jdbcType=INTEGER},",
          "money = #{money,jdbcType=INTEGER},",
          "moneyfreeze = #{moneyfreeze,jdbcType=INTEGER},",
          "power = #{power,jdbcType=VARCHAR},",
          "sex = #{sex,jdbcType=VARCHAR},",
          "phonenumber = #{phonenumber,jdbcType=VARCHAR}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(User record);
}