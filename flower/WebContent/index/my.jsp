<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>个人中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<jsp:include page="header.jsp"/>

	<div id="content_wrapper">
		<div id="content">
			<div class="content_section">

				<h2>个人中心<font color="red">${msg}</font></h2>

		        <div class="contact_form">
	                <div class="form_subtitle">基本信息</div>
	                <form name="login" action="updateMy.action" method="post">
	                 	<input type="hidden" name="customer.username" value="${customer.username}"/>    
	                    <div class="form_row">
		                    <label class="contact"><strong>电话:</strong></label>
		                    <input type="text" name="customer.phone" class="contact_input" value="${customer.phone}"/>
	                    </div>                     
	                    <div class="form_row">
		                    <label class="contact"><strong>地址:</strong></label>
		                    <input type="text" name="customer.address" class="contact_input" value="${customer.address}"/>
	                    </div>                     
	                    <div class="form_row">
	                    	<input type="submit" class="register" value="保存" />
	                    </div>   
	                 </form>     
	             </div>  

		         <div class="contact_form">
	                 <div class="form_subtitle">安全信息</div>
	                 <form name="login" action="updatePassword.action" method="post"> 
	                 	<input type="hidden" name="customer.username" value="${customer.username}"/>             
	                    <div class="form_row">
		                    <label class="contact"><strong>原密码:</strong></label>
		                    <input type="password" name="customer.password" class="contact_input" value=""/>
	                    </div>                     
	                    <div class="form_row">
		                    <label class="contact"><strong>新密码:</strong></label>
		                    <input type="password" name="password1" class="contact_input" value=""/>
	                    </div>                     
	                    <div class="form_row">
		                    <label class="contact"><strong>新密码:</strong></label>
		                    <input type="password" name="password2" class="contact_input" value=""/>
	                    </div>                     
	                    <div class="form_row">
	                    	<input type="submit" class="register" value="保存" />
	                    </div>   
	                  </form>     
	              </div>  
		
			</div>
			<div class="cleaner"></div>
		</div>
		<div class="cleaner_h40"></div>
	</div>
	<div class="cleaner"></div>

	<jsp:include page="footer.jsp"/>
	
</body>
</html>