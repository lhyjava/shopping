package com.test.shopping.entity;

public class ClassForBrand {

	/**
	 * 第三级分类id
	 */
	private Integer classid;

	/**
	 * 第三级分类名
	 */
	private String classname;

	/**
	 * 品牌id
	 */
	private Integer brandid;

	/**
	 * 品牌名
	 */
	private String brandname;

	public Integer getClassid() {
		return classid;
	}

	public void setClassid(Integer classid) {
		this.classid = classid;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public Integer getBrandid() {
		return brandid;
	}

	public void setBrandid(Integer brandid) {
		this.brandid = brandid;
	}

	public String getBrandname() {
		return brandname;
	}

	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}
}
