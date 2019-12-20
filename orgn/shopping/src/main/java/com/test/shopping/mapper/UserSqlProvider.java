package com.test.shopping.mapper;

import com.test.shopping.entity.User;
import org.apache.ibatis.jdbc.SQL;

public class UserSqlProvider {

    public String insertSelective(User record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("user");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getUsername() != null) {
            sql.VALUES("username", "#{username,jdbcType=VARCHAR}");
        }
        
        if (record.getPassword() != null) {
            sql.VALUES("password", "#{password,jdbcType=VARCHAR}");
        }
        
        if (record.getName() != null) {
            sql.VALUES("name", "#{name,jdbcType=VARCHAR}");
        }
        
        if (record.getAddtime() != null) {
            sql.VALUES("addtime", "#{addtime,jdbcType=TIMESTAMP}");
        }
        
        if (record.getLasttime() != null) {
            sql.VALUES("lasttime", "#{lasttime,jdbcType=TIMESTAMP}");
        }
        
        if (record.getImg() != null) {
            sql.VALUES("img", "#{img,jdbcType=VARCHAR}");
        }
        
        if (record.getMail() != null) {
            sql.VALUES("mail", "#{mail,jdbcType=VARCHAR}");
        }
        
        if (record.getQq() != null) {
            sql.VALUES("qq", "#{qq,jdbcType=VARCHAR}");
        }
        
        if (record.getWangwang() != null) {
            sql.VALUES("wangwang", "#{wangwang,jdbcType=VARCHAR}");
        }
        
        if (record.getMsn() != null) {
            sql.VALUES("msn", "#{msn,jdbcType=VARCHAR}");
        }
        
        if (record.getVippoints() != null) {
            sql.VALUES("vippoints", "#{vippoints,jdbcType=INTEGER}");
        }
        
        if (record.getVipcoins() != null) {
            sql.VALUES("vipcoins", "#{vipcoins,jdbcType=INTEGER}");
        }
        
        if (record.getLogintimes() != null) {
            sql.VALUES("logintimes", "#{logintimes,jdbcType=INTEGER}");
        }
        
        if (record.getMoney() != null) {
            sql.VALUES("money", "#{money,jdbcType=INTEGER}");
        }
        
        if (record.getMoneyfreeze() != null) {
            sql.VALUES("moneyfreeze", "#{moneyfreeze,jdbcType=INTEGER}");
        }
        
        if (record.getPower() != null) {
            sql.VALUES("power", "#{power,jdbcType=VARCHAR}");
        }
        
        if (record.getSex() != null) {
            sql.VALUES("sex", "#{sex,jdbcType=VARCHAR}");
        }
        
        if (record.getPhonenumber() != null) {
            sql.VALUES("phonenumber", "#{phonenumber,jdbcType=VARCHAR}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(User record) {
        SQL sql = new SQL();
        sql.UPDATE("user");
        
        if (record.getUsername() != null) {
            sql.SET("username = #{username,jdbcType=VARCHAR}");
        }
        
        if (record.getPassword() != null) {
            sql.SET("password = #{password,jdbcType=VARCHAR}");
        }
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getAddtime() != null) {
            sql.SET("addtime = #{addtime,jdbcType=TIMESTAMP}");
        }
        
        if (record.getLasttime() != null) {
            sql.SET("lasttime = #{lasttime,jdbcType=TIMESTAMP}");
        }
        
        if (record.getImg() != null) {
            sql.SET("img = #{img,jdbcType=VARCHAR}");
        }
        
        if (record.getMail() != null) {
            sql.SET("mail = #{mail,jdbcType=VARCHAR}");
        }
        
        if (record.getQq() != null) {
            sql.SET("qq = #{qq,jdbcType=VARCHAR}");
        }
        
        if (record.getWangwang() != null) {
            sql.SET("wangwang = #{wangwang,jdbcType=VARCHAR}");
        }
        
        if (record.getMsn() != null) {
            sql.SET("msn = #{msn,jdbcType=VARCHAR}");
        }
        
        if (record.getVippoints() != null) {
            sql.SET("vippoints = #{vippoints,jdbcType=INTEGER}");
        }
        
        if (record.getVipcoins() != null) {
            sql.SET("vipcoins = #{vipcoins,jdbcType=INTEGER}");
        }
        
        if (record.getLogintimes() != null) {
            sql.SET("logintimes = #{logintimes,jdbcType=INTEGER}");
        }
        
        if (record.getMoney() != null) {
            sql.SET("money = #{money,jdbcType=INTEGER}");
        }
        
        if (record.getMoneyfreeze() != null) {
            sql.SET("moneyfreeze = #{moneyfreeze,jdbcType=INTEGER}");
        }
        
        if (record.getPower() != null) {
            sql.SET("power = #{power,jdbcType=VARCHAR}");
        }
        
        if (record.getSex() != null) {
            sql.SET("sex = #{sex,jdbcType=VARCHAR}");
        }
        
        if (record.getPhonenumber() != null) {
            sql.SET("phonenumber = #{phonenumber,jdbcType=VARCHAR}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
    
    
	/*
	 * public String selectByUsernameAndMailAndName(User user) { StringBuffer sb =
	 * new StringBuffer(); sb.append("select * from user where 1=1"); if() {
	 * 
	 * } return""; }
	 */
}






