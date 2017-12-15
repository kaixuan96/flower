package com.action;

import java.io.IOException;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Flower;
import com.service.FlowerService;
import com.service.ShopcartService;
import com.util.SessionUtil;

/**
 * 订单action
 * 响应订单的增删改查等功能的
 */
@Namespace("/index")
@Results({
	@Result(name="login",location="/index/login.jsp"),
	@Result(name="returncart",type="redirectAction",location="cart.action"),
})
public class ShopcartAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	@Resource
	private ShopcartService shopcartService;
	@Resource
	private FlowerService flowerService;

	
	//添加订单
	@Action("shopcartAdd")
	public String add() throws IOException{
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			getRequest().put("msg", "(购物前请先登录用户!!)");
			return "login";
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			int flowerid = Integer.valueOf(getServletRequest().getParameter("flowerid"));
			if (shopcartService.get(username, flowerid)==null) {//若没有次订单
				shopcartService.add(username, flowerid);	//添加订单记录
			}else {	//否则更新订单即可
				shopcartService.updateCart(username, flowerid);
			}
			Flower flower = flowerService.getFlower(flowerid);//获取鲜花信息
			flower.setStock(flower.getStock()-1);//鲜花库存数量-1
			flowerService.update(flower);//更新鲜花信息
			int total_count = shopcartService.getTotalCount(username);	//获取用户购买商品总数
			int total_price = shopcartService.getTotalPrice(username);	//获取用户商品总价值
			getSession().put("total_count", total_count);	//将购买商品总数写入session
			getSession().put("total_price", total_price);	//将商品总价写入session
		}
		// 返回到请求前页面
		getServletResponse().sendRedirect(getServletRequest().getHeader("Referer"));
		return null;
	}
	
	//删除订单
	@Action("shopcartDelete")
	public String delete(){
		shopcartService.delete(Integer.valueOf(getServletRequest().getParameter("id")));
		SessionUtil.initShopCard(getSession(), shopcartService);
		return "returncart";
	}
	
	
}
