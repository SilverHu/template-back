<!DOCTYPE html>
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>后台管理系统</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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