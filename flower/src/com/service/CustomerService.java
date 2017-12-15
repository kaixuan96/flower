package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CustomerDao;
import com.entity.Customer;
import com.service.CustomerService;

/**
 * 顾客service的
 */
@Service
@Transactional	//配置此方法加入事务管理
public class CustomerService{

	@Resource
	private CustomerDao customerDao;

	public Customer getCustomer(int id) {
		return customerDao.getCustomer(id);
	}
	
	//获取顾客信息
	public Customer getCustomer(String username, String password){
		return customerDao.getCustomer(username, password);
	}
	
	//获取顾客信息
	public Customer getCustomer(String username) {
		return customerDao.getCustomer(username);
	}

	//注册用户
	public boolean register(Customer customer) {
		return customerDao.save(customer);
	}

	//获取顾客信息列表
	public List<Customer> getCustomers() {
		return customerDao.getCustomers();
	}

	//删除顾客信息
	public void delete(Customer customer) {
		customerDao.delete(customer);//删除此顾客信息
	}

	//更新顾客信息
	public void update(Customer customer) {
		customerDao.update(customer);
	}

	//添加顾客信息
	public void add(Customer customer) {
		customerDao.save(customer);
	}

	//判断用户名是否存在
	public boolean isUser(Customer customer) {
		if (customerDao.getCustomer(customer.getUsername())!=null) {
			return true;
		}return false;
	}

}
