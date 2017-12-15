<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>用户登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<jsp:include page="header.jsp"/>

	<div id="content_wrapper">
		<div id="content">
			<div class="content_section">
			
				<h2>用户登录<font color="red">${msg}</font></h2>
				<div class="contact_form">
                	<div class="form_subtitle">已有账户登录</div>
	                 <form name="login" action="login.action" method="post">          
	                    <div class="form_row">
		                    <label class="contact"><strong>用户名:</strong></label>
		                    <input type="text" name="customer.username" class="contact_input" />
	                    </div>  
	                    <div class="form_row">
		                    <label class="contact"><strong>密码:</strong></label>
		                    <input type="password" name="customer.password" class="contact_input" />
	                    </div>                     
	                    <div class="form_row">
	                    	<input type="submit" class="register" value="登录" />
	                    </div>   
	                    <div class="form_row">还没有帐号? <a href="register.jsp">点击注册</a></div>   
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