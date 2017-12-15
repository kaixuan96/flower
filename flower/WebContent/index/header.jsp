<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    
<div id="header_wrapper">

  <div id="header">
	    <div id="site_title">
	      	<h1>
	      		<a href="front!index.action">
	      		<img src="images/logo.png"/><span>flower shop</span>
				</a>
	      	</h1>
	    </div>
	    <div id="menu">
	      <ul>
	        <li><a href="index.action" <%if(request.getRequestURI().contains("/index.jsp")){out.print("class='current'");}%>>花店首页</a></li>
	        <s:if test="session.username!=null">
		        <li><a href="my.action" <%if(request.getRequestURI().contains("/my.jsp")){out.print("class='current'");}%>>个人中心</a></li>
		        <li><a href="order.action" <%if(request.getRequestURI().contains("/order.jsp")){out.print("class='current'");}%>>我的订单</a></li>
		        <li><a href="cart.action" <%if(request.getRequestURI().contains("/shopcart.jsp")){out.print("class='current'");}%>>购物车</a></li>
		        <li><a href="logout.action">退出</a></li>
	        </s:if>
	        <s:if test="session.username==null">
		        <li><a href="loginpage.action" <%if(request.getRequestURI().contains("/login.jsp")){out.print("class='current'");}%>>用户登录</a></li>
		        <li><a href="registerpage.action" <%if(request.getRequestURI().contains("/register.jsp")){out.print("class='current'");}%>>用户注册</a></li>
	        	<li><a href="../admin/login.jsp" target="_blank">后台登录</a></li>
	        </s:if>
	      </ul>
	    </div>
	    
		<jsp:include page="cart.jsp"/>
	
  </div>

</div>

</body>
</html>
