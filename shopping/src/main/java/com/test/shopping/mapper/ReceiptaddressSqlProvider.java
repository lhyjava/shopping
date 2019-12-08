package com.test.shopping.mapper;

import com.test.shopping.entity.Receiptaddress;
import org.apache.ibatis.jdbc.SQL;

public class ReceiptaddressSqlProvider {

    public String insertSelective(Receiptaddress record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("receiptaddress");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getReceiptname() != null) {
            sql.VALUES("receiptname", "#{receiptname,jdbcType=VARCHAR}");
        }
        
        if (record.getReceiptnregionsheng() != null) {
            sql.VALUES("receiptnregionsheng", "#{receiptnregionsheng,jdbcType=VARCHAR}");
        }
        
        if (record.getReceiptnregionshi() != null) {
            sql.VALUES("receiptnregionshi", "#{receiptnregionshi,jdbcType=VARCHAR}");
        }
        
        if (record.getReceiptnregionqu() != null) {
            sql.VALUES("receiptnregionqu", "#{receiptnregionqu,jdbcType=VARCHAR}");
        }
        
        if (record.getReceiptnstreet() != null) {
            sql.VALUES("receiptnstreet", "#{receiptnstreet,jdbcType=VARCHAR}");
        }
        
        if (record.getReceiptnumber() != null) {
            sql.VALUES("receiptnumber", "#{receiptnumber,jdbcType=VARCHAR}");
        }
        
        if (record.getReceiptphone() != null) {
            sql.VALUES("receiptphone", "#{receiptphone,jdbcType=INTEGER}");
        }
        
        if (record.getReceiptyoubian() != null) {
            sql.VALUES("receiptyoubian", "#{receiptyoubian,jdbcType=INTEGER}");
        }
        
        if (record.getUserid() != null) {
            sql.VALUES("userid", "#{userid,jdbcType=INTEGER}");
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Receiptaddress record) {
        SQL sql = new SQL();
        sql.UPDATE("receiptaddress");
        
        if (record.getReceiptname() != null) {
            sql.SET("receiptname = #{receiptname,jdbcType=VARCHAR}");
        }
        
        if (record.getReceiptnregionsheng() != null) {
            sql.SET("receiptnregionsheng = #{receiptnregionsheng,jdbcType=VARCHAR}");
        }
        
        if (record.getReceiptnregionshi() != null) {
            sql.SET("receiptnregionshi = #{receiptnregionshi,jdbcType=VARCHAR}");
        }
        
        if (record.getReceiptnregionqu() != null) {
            sql.SET("receiptnregionqu = #{receiptnregionqu,jdbcType=VARCHAR}");
        }
        
        if (record.getReceiptnstreet() != null) {
            sql.SET("receiptnstreet = #{receiptnstreet,jdbcType=VARCHAR}");
        }
        
        if (record.getReceiptnumber() != null) {
            sql.SET("receiptnumber = #{receiptnumber,jdbcType=VARCHAR}");
        }
        
        if (record.getReceiptphone() != null) {
            sql.SET("receiptphone = #{receiptphone,jdbcType=INTEGER}");
        }
        
        if (record.getReceiptyoubian() != null) {
            sql.SET("receiptyoubian = #{receiptyoubian,jdbcType=INTEGER}");
        }
        
        if (record.getUserid() != null) {
            sql.SET("userid = #{userid,jdbcType=INTEGER}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
}