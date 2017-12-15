<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>花店首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<jsp:include page="header.jsp"/>

	<div id="content_wrapper">

		  <div id="content">
		  		<div class="content_section">
					<h2>掌柜推荐</h2>
					<!-- 用struts的iterator标签遍历集合 -->
					<s:iterator value="#request.flowers">
			          	<div class="product_box margin_r10">
					        <h3>
					        	<a href="intro.action?flower.id=<s:property value="id"/>"><s:property value="name"/></a>
					        </h3>
					        <a href="intro.action?flower.id=<s:property value="id"/>"><img src="../<s:property value="photo"/>" /></a>
					        <p class="price">价格: ￥<s:property value="price"/></p>
					        <a href="intro.action?flower.id=<s:property value="id"/>" style="float:left;border:1px solid #CCC;padding:2px 5px">查看详情</a>
					        <a href="shopcartAdd.action?flowerid=<s:property value="id"/>" style="float:right;border:1px solid #CCC;padding:2px 5px">点此订购</a> 
			        	</div>
			        </s:iterator>
		    	</div>
		    	<div class="cleaner_h40"></div>
		  </div>

		  <div id="sidebar">
			    <div class="sidebar_section">
				      <h2>鲜花分类</h2>
				      <div class="sidebar_section_content">
					        <ul class="categories_list">
					        	<!-- 用struts的iterator标签遍历集合 -->
								<s:iterator value="categories">
					          		<li>
					          			<a href="category.action?category=<s:property value="id"/>" >
					          				<s:property value="name"/>
					          			</a>
					          		</li>
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
