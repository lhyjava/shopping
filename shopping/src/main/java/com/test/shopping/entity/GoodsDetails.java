package com.test.shopping.entity;

/**
 * 
 * @ClassName: GoodsDetails
 * @Description: 商品详情
 * @Author lhy
 * @DateTime 2019年12月2日 下午12:54:54
 */
public class GoodsDetails extends Goods {

	private String specname;

	private String specval;

	public String getSpecname() {
		return specname;
	}

	public void setSpecname(String specname) {
		this.specname = specname;
	}

	public String getSpecval() {
		return specval;
	}

	public void setSpecval(String specval) {
		this.specval = specval;
	}

}
