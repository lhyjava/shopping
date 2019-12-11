package com.test.shopping.mapper;

import com.test.shopping.entity.Addorder;
import org.apache.ibatis.jdbc.SQL;

public class AddorderSqlProvider {

	public String insertSelective(Addorder record) {
		SQL sql = new SQL();
		sql.INSERT_INTO("addorder");

		if (record.getId() != null) {
			sql.VALUES("id", "#{id,jdbcType=INTEGER}");
		}

		if (record.getOrdernumber() != null) {
			sql.VALUES("ordernumber", "#{ordernumber,jdbcType=VARCHAR}");
		}

		if (record.getOrderdate() != null) {
			sql.VALUES("orderdate", "#{orderdate,jdbcType=TIMESTAMP}");
		}

		if (record.getStatus() != null) {
			sql.VALUES("status", "#{status,jdbcType=VARCHAR}");
		}

		if (record.getConsignee() != null) {
			sql.VALUES("consignee", "#{consignee,jdbcType=VARCHAR}");
		}

		if (record.getInvoice() != null) {
			sql.VALUES("Invoice", "#{invoice,jdbcType=VARCHAR}");
		}

		if (record.getDelivery() != null) {
			sql.VALUES("delivery", "#{delivery,jdbcType=VARCHAR}");
		}

		if (record.getMessage() != null) {
			sql.VALUES("message", "#{message,jdbcType=VARCHAR}");
		}

		if (record.getPrice() != null) {
			sql.VALUES("price", "#{price,jdbcType=INTEGER}");
		}

		if (record.getUserid() != null) {
			sql.VALUES("userid", "#{userid,jdbcType=INTEGER}");
		}

		return sql.toString();
	}

	public String updateByPrimaryKeySelective(Addorder record) {
		SQL sql = new SQL();
		sql.UPDATE("addorder");

		if (record.getOrdernumber() != null) {
			sql.SET("ordernumber = #{ordernumber,jdbcType=VARCHAR}");
		}

		if (record.getOrderdate() != null) {
			sql.SET("orderdate = #{orderdate,jdbcType=TIMESTAMP}");
		}

		if (record.getStatus() != null) {
			sql.SET("status = #{status,jdbcType=VARCHAR}");
		}

		if (record.getConsignee() != null) {
			sql.SET("consignee = #{consignee,jdbcType=VARCHAR}");
		}

		if (record.getInvoice() != null) {
			sql.SET("Invoice = #{invoice,jdbcType=VARCHAR}");
		}

		if (record.getDelivery() != null) {
			sql.SET("delivery = #{delivery,jdbcType=VARCHAR}");
		}

		if (record.getMessage() != null) {
			sql.SET("message = #{message,jdbcType=VARCHAR}");
		}

		if (record.getPrice() != null) {
			sql.SET("price = #{price,jdbcType=INTEGER}");
		}

		if (record.getUserid() != null) {
			sql.SET("userid = #{userid,jdbcType=INTEGER}");
		}

		sql.WHERE("id = #{id,jdbcType=INTEGER}");

		return sql.toString();
	}

	// add by lys 1211 begin
	public String selectByaddorder(String ordernumber, String begintime, String endtime, String delivery) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT * FROM addorder WHERE 1=1 ");
		if (ordernumber != null && ordernumber != "") {
			sql.append("AND ordernumber like '%");
			sql.append(ordernumber);
			sql.append("%' ");
		}
		if (begintime != null && begintime != "") {
			sql.append("AND orderdate>'");
			sql.append(begintime);
			sql.append("' ");
		}
		if (endtime != null && endtime != "") {
			sql.append("AND orderdate<'");
			sql.append(endtime);
			sql.append("' ");
		}
		if (delivery != null && delivery != "") {
			sql.append("AND delivery like '%");
			sql.append(delivery);
			sql.append("%'");
		}
		return sql.toString();

	}

	// add by lys 1211 end
}