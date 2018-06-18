<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>后台管理系统</title>
	<link href="${ctx}/static/bootstrap/css/bootstrap.css?v=3.3.7" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/AdminLTE.min.css" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/font-awesome.min.css" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/skins/skin-blue-light.min.css" rel="stylesheet">
	
	<script src="${ctx}/static/jquery/js/jquery-3.3.1.min.js"></script>
	<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.7"></script>
	<script src="${ctx}/static/adminlte/js/adminlte.min.js"></script>
	<script src="${ctx}/static/adminlte/js/jquery.slimscroll.min.js"></script>
</head>
<body class="skin-blue-light">
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