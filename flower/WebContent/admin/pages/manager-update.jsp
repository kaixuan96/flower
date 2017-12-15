<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<link type="text/css" href="css/admin.css" rel="stylesheet">

</head>
<body>
	<table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
		<tr height=28><td background="images/title_bg1.jpg">当前位置 &raquo; 掌柜管理</td></tr>
		<tr><td bgcolor=#b1ceef height=1></td></tr>
		<tr height=20><td background="images/shadow_bg.jpg"></td></tr>
	</table>


		<form action="managerUpdate.action" method="post">
			<input type="hidden" name="manager.id" value="${manager.id}">
			<input type="hidden" name="manager.username" value="${manager.username}">
			用户:${manager.username}<br>
			密码:<input type="text" name="manager.password" value="${manager.password}" required="required"/>
					<input type="submit" value="更新">
		</form>

</body>
</html>