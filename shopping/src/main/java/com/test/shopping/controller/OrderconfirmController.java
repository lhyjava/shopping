package com.test.shopping.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.shopping.entity.Addorder;
import com.test.shopping.entity.Receiptaddress;
import com.test.shopping.entity.Shoppingcar;
import com.test.shopping.service.AddOrderService;
import com.test.shopping.service.OrdergoodsService;
import com.test.shopping.service.ReceiptaddressService;
import com.test.shopping.service.ShoppingcarService;
import com.test.shopping.util.OrderNo;

@Controller
public class OrderconfirmController {

	/**
	 * 收货地址
	 */
	@Autowired
	private ReceiptaddressService receiptAddressService;

	/**
	 * 购物车
	 */
	@Autowired
	private ShoppingcarService shoppingcarService;
	
	/**
	 * 订单
	 */
	@Autowired
	private AddOrderService addOrderService;
	
	/**
	 * 订单商品
	 */
	@Autowired
	private OrdergoodsService ordergoodsService;

	//add by lhy 1207 begin

	/**
	 * 
	 * @Title: orderconfirm
	 * @Description: 订单结算页面
	 * @Author lhy
	 * @DateTime 2019年12月7日 下午8:42:00
	 * @param ids 购物车中的id数组
	 * @param userid 当前用户id
	 * @param req
	 * @return
	 */
	@RequestMapping("/orderconfirm.htm")
	public String orderconfirm(String[] ids,String userid, HttpServletRequest req) {

		// 将传过来的id数组转为字符串
		String id = Arrays.toString(ids);
		id = id.replace("[", "").replace("]", "").substring(0, id.length() - 2);
		// 购物车提交过来的数据
		List<Shoppingcar> shoppingcarList = shoppingcarService.findById(id,userid);
		req.setAttribute("shoppingcarList", shoppingcarList);
		//总价
		String totalPrice = shoppingcarService.selectTotalPriceByUserId(id,userid);
		req.setAttribute("totalPrice", totalPrice);
		// 收货地址列表
		List<Receiptaddress> addressList = receiptAddressService.AddressFindByUserId(userid);
		req.setAttribute("addressList", addressList);

		return "order_confirm";
	}
	
	/**
	 * 
	 * @Title: ordersubmit
	 * @Description: 提交订单
	 * @Author lhy
	 * @DateTime 2019年12月7日 下午9:31:09
	 * @param userid		当前用户id
	 * @param img			商品图片名称
	 * @param name			商品名
	 * @param specmessage	规格信息
	 * @param price			小计
	 * @param number		数量
	 * @param goodsid		商品id
	 * @param Invoice		发票信息
	 * @param delivery		配送方式
	 * @param message		买家备注
	 * @param consignee		收货人信息
	 * @param totalPrice	总价
	 * @return
	 */
	@RequestMapping("ordersubmit.htm")
	public String ordersubmit(Integer userid,String[] img,String[] name,String[] specmessage,
							  Integer[] price,Integer[] number,Integer[] goodsid,String Invoice,String delivery,
							  String message,String consignee,Integer totalPrice) {
		
		//订单编号
		String ordernumber = OrderNo.getOrderIdByUUId();
		//下单时间
		Date orderdate = new Date();
		//订单表
		Addorder add = new Addorder();
		add.setUserid(userid);
		add.setOrdernumber(ordernumber);
		add.setOrderdate(orderdate);
		//add.setStatus("已付款");
		add.setConsignee(consignee);
		add.setInvoice(Invoice);
		add.setDelivery(delivery);
		add.setMessage(message);
		add.setPrice(totalPrice);
		addOrderService.insertSelective(add);
		//当前订单id
		Integer id = addOrderService.selectIdByOrdernumber(ordernumber);
		//订单商品表
		ordergoodsService.insertGoods(id,img,name,specmessage,price,number,goodsid);
		
		
		
		return "order_form";
	}
	
	//add by lhy 1207 end

}
