package com.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Category;
import com.entity.Customer;
import com.entity.Flower;
import com.entity.Orders;
import com.entity.Shopcart;
import com.service.CustomerService;
import com.service.FlowerService;
import com.service.OrderService;
import com.service.ShopcartService;
import com.util.SessionUtil;

/**
 * 前台请求action
 * 响应前台请求
 * 在打开页面时传送相关数据的
 */
@Namespace("/index")
@Results({
	@Result(name="index",location="/index/index.jsp"),
	@Result(name="my",location="/index/my.jsp"),
	@Result(name="intro",location="/index/intro.jsp"),
	@Result(name="order",location="/index/order.jsp"),
	@Result(name="cart",location="/index/shopcart.jsp"),
	@Result(name="login",location="/index/login.jsp"),
	@Result(name="register",location="/index/register.jsp"),
	@Result(name="reindex",type="redirectAction",location="index.action"),
	@Result(name="reorder",type="redirectAction",location="order.action"),
})	
public class IndexAction extends BaseAction{
	private static final long serialVersionUID = 1L;

	// 定义属性, 用于struts自动封装参数
	private int category;
	private Flower flower;
	private Customer customer;
	private List<Flower> flowers;			// 鲜花列表
	private List<Category> categories;	// 类目列表
	
	@Resource // spring注入bean
	private FlowerService flowerService;
	@Resource // spring注入bean
	private ShopcartService shopcartService;
	@Resource
	private OrderService orderService;
	@Resource
	private CustomerService customerService;
	
	
	/**
	 * 响应主页请求
	 * @return
	 */
	@Action("index")
	public String index(){
		flowers = flowerService.getHotFlowers(8);	// 获取首页推荐的鲜花记录(默认取8条)
		categories = flowerService.getCategorys();		// 获取所有类目信息
		SessionUtil.initShopCard(getSession(), shopcartService);	// 加载购物车
		return "index";
	}

	/**
	 * 我的订单
	 * @return
	 */
	@Action("order")
	public String order(){
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			getRequest().put("msg", "(购物前请先登录用户!!)");
			return "login";
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			List<Orders> orders = orderService.getOrders(username);	//获取订单信息
			getRequest().put("orders", orders);//返回订单信息
		}
		return "order";
	}
	
	/**
	 * 提交订单
	 * @return
	 * @throws IOException
	 */
	@Action("orderAdd")
	public String orderAdd() throws IOException{
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			getRequest().put("msg", "(购物前请先登录用户!!)");
			return "login";
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			// 获取购物车
			List<Shopcart> cartList = shopcartService.getCartList(username);
			// 将购物车内容保存到订单
			if (cartList!=null && !cartList.isEmpty()) {
				for(Shopcart cart : cartList){
					orderService.addOrder(username, cart.getFlower().getId(), cart.getTotal());
					shopcartService.delete(cart.getId());
				}
			}
			// 初始化购物车
			SessionUtil.initShopCard(getSession(), shopcartService);
		}
		return "reorder";
	}
	
	
	/**
	 * 我的购物车
	 * @return
	 */
	@Action("cart")
	public String shopcart(){
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			getRequest().put("msg", "(购物前请先登录用户!!)");
			return "login";
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			List<Shopcart> orders = shopcartService.getCartList(username);	//获取订单信息
			getRequest().put("orders", orders);//返回订单信息
		}
		return "cart";
	}
	
	/**
	 * 请求类目列表
	 * @return
	 */
	@Action("category")
	public String category(){
		flowers = flowerService.getFlowers(category);	// 获取某类目下所有鲜花信息
		categories = flowerService.getCategorys();		// 获取所有类目信息
		SessionUtil.initShopCard(getSession(), shopcartService);	// 加载购物车
		return "index";
	}

	/**
	 * 详情
	 * @return
	 */
	@Action("intro")
	public String intro(){
		flower = flowerService.getFlower(flower.getId());
		categories = flowerService.getCategorys();
		return "intro";
	}

	/**
	 * 登录页面
	 * @return
	 */
	@Action("loginpage")
	public String loginpage(){
		return "login";
	}
	
	/**
	 * 顾客登录
	 * @return
	 */
	@Action("login")
	public String login() {
		if(customerService.getCustomer(customer.getUsername(), customer.getPassword())!=null){
			this.getSession().put("username", customer.getUsername());//session中放置用户名, 标志用户已登录
			return "reindex";
		}else {
			this.getRequest().put("msg", "(用户名或密码错误!!)");
			return "login";
		}
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	@Action("logout")
	public String logout(){
		this.getSession().remove("username");
		return "reindex";
	}
	

	/**
	 * 注册页面
	 * @return
	 */
	@Action("registerpage")
	public String registerpage(){
		return "register";
	}
	
	/**
	 * 顾客注册
	 * @return
	 */
	@Action("register")
	public String register() {
		// 判断填写信息
		if (customer.getUsername()==null || customer.getUsername().trim().isEmpty()
				|| customer.getPassword()==null || customer.getPassword().trim().isEmpty()
				|| customer.getPhone()==null || customer.getPhone().trim().isEmpty()
				|| customer.getAddress()==null || customer.getAddress().trim().isEmpty()) {
			getRequest().put("msg", "(请先填写必要信息!!)");
			return "register";
		}
		// 判断用户名是否已经存在
		if (customerService.isUser(customer)) {
			getRequest().put("msg", "(用户名已存在!!)");
			return "register";
		}
		// 注册用户
		if (customerService.register(customer)) {
			getRequest().put("msg", "(注册成功, 请登录!!)");
			return "login";
		}else {
			getRequest().put("msg", "(系统错误, 注册失败!!)");	//系统原因导致注册失败时,返回注册页面
			return "register";
		}
	}
	
	
	/**
	 * 个人中心
	 * @return
	 */
	@Action("my")
	public String my(){
		Object username = getSession().get("username");
		//如果没有登录  则跳转到登录页面
		if (username==null || username.toString().trim().isEmpty()) {
			getRequest().put("msg", "(请先登录用户!!)");
			return "login";
		}
		customer = customerService.getCustomer(username.toString());
		return "my";
	}
	
	
	/**
	 * 更新我的信息
	 * @return
	 */
	@Action("updateMy")
	public String updateMy(){
		Customer c = customerService.getCustomer(customer.getUsername());
		c.setPhone(customer.getPhone());
		c.setAddress(customer.getAddress());
		customerService.update(c);
		getRequest().put("msg", "(信息修改成功!)");
		return "my";
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	@Action("updatePassword")
	public String updatePassword(){
		String password1 = getServletRequest().getParameter("password1");
		String password2 = getServletRequest().getParameter("password2");
		if (password1==null || password1.toString().trim().isEmpty()) {
			getRequest().put("msg", "(新密码不能为空!)");
			return "my";
		}
		if(!password1.equals(password2)){
			getRequest().put("msg", "(两次输入新密码不同!)");
			return "my";
		}
		Customer c = customerService.getCustomer(customer.getUsername(), customer.getPassword());
		if (c==null || c.getUsername()==null) {
			getRequest().put("msg", "(原密码错误!)");
			return "my";
		}
		c.setPassword(password1);
		customerService.update(c);
		getRequest().put("msg", "(密码修改成功!)");
		return "my";
	}
	
	
	public Flower getFlower() {
		return flower;
	}

	public void setFlower(Flower flower) {
		this.flower = flower;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public List<Flower> getFlowers() {
		return flowers;
	}

	public void setFlowers(List<Flower> flowers) {
		this.flowers = flowers;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

}
