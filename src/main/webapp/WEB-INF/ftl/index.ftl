<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>后台管理系统</title>
	<@style.index ctx=ctx/>
</head>
<body class="skin-blue">
<div class="wrapper">
	
	<!-- 顶部导航栏 -->
	<@layout.header ctx=ctx name="后台管理系统"/>
	
	<!-- 左边导航栏 -->
	<@layout.left ctx=ctx/>
	
	<!-- 正文 -->
	<@layout.content ctx=ctx />
	
	<!-- 底部导航栏 -->
	<@layout.foot />
</div>
</body>
</html>