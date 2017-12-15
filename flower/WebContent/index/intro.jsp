<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>鲜花详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<jsp:include page="header.jsp"/>

	<div id="content_wrapper">
		<div id="content">
			<div class="content_section">

				<h2>详细介绍</h2>

				<div class="product_box" style="width: 320px">
					<h3>名称: ${flower.name}</h3>
					<img src="../${flower.photo}" style="width:310px;height: 310px"/>
					<p class="price">类型: ${flower.category.name}</p>
					<p class="price">价格: ￥${flower.price}</p>
					<p class="price">介绍: ${flower.intro}</p>
					<div class="cleaner"></div>
					<a href="shopcartAdd.action?flowerid=${flower.id}" style="float:right;border:1px solid #CCC;padding:2px 5px">点此订购</a>
				</div>
      			<div class="cleaner"></div>

			</div>
    		<div class="cleaner_h40"></div>

		</div>
		
		<div id="sidebar">
		    <div class="sidebar_section">
		      <h2>鲜花分类</h2>
		      <div class="sidebar_section_content">
		        <ul class="categories_list">
		        	<!-- 用struts的iterator标签遍历集合 -->
					<s:iterator value="#request.categories">
		          		<li><a href="category.action?category=<s:property value="id"/>">
		          			<s:property value="name"/></a></li>
		          	</s:iterator>
		        </ul>
		      </div>
		    </div>
		    <div class="cleaner_h30"></div>
		</div>
  
	<div class="cleaner"></div>
	</div>
  
	<jsp:include page="footer.jsp"/>
</body>
</html>
