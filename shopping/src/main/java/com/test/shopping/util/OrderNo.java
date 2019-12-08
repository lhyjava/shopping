package com.test.shopping.util;

import java.util.UUID;

public class OrderNo {

	public static String getOrderIdByUUId() {
		
		int first = (int) (Math.random() * 8999) + 1000;
		int hashCodeV = UUID.randomUUID().toString().hashCode();
		if (hashCodeV < 0) {// 有可能是负数
			hashCodeV = -hashCodeV;
		}
		return first + String.format("%015d", hashCodeV);
	}
}
