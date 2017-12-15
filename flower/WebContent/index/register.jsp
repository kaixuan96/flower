<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>用户注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<jsp:include page="header.jsp"/>
	
	<div id="content_wrapper">
		<div id="content">
			<div class="content_section">
			
				<h2>用户注册<font color=red>${msg}</font></h2>
              	<div class="contact_form">
                	<div class="form_subtitle">创建新账户</div>
	                <form name="register" action="register.action" method="post">          
	                    <div class="form_row">
		                    <label class="contact"><font color=red>*</font><strong>用户名:</strong></label>
		                    <input type="text" name="customer.username" class="contact_input" />
	                    </div>  
	                    <div class="form_row">
		                    <label class="contact"><font color=red>*</font><strong>密码:</strong></label>
		                    <input type="password" name="customer.password"  class="contact_input" />
	                    </div>
	                    <div class="form_row">
		                    <label class="contact"><font color=red>*</font><strong>电话:</strong></label>
		                    <input type="text" name="customer.phone"  class="contact_input" />
	                    </div>
	                    <div class="form_row">
		                    <label class="contact"><font color=red>*</font><strong>地址:</strong></label>
		                    <input type="text" name="customer.address"  class="contact_input" />
	                    </div>
	                    <div class="form_row">
	                    	<input type="submit" class="register" value="注册" />
	                    </div>
	                    <div class="form_row">已有帐号? <a href="login.jsp">点击登录</a></div>   
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
