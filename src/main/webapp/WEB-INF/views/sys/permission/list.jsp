<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp" %>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<jsp:include page="/WEB-INF/views/layout/top.jsp"/>
	
	<!-- 左边导航栏 -->
	<jsp:include page="/WEB-INF/views/layout/left.jsp"/>
	
	<!-- 正文 -->
	<div class="content-wrapper">
	    <!-- Content Header (Page header) -->
	    <section class="content-header">
	      <h1>
	        	权限列表
	      </h1>
	      <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
	        <li class="active">Here</li>
	      </ol>
	    </section>

	    <!-- Main content -->
	    <section class="content container-fluid">
			<c:forEach var="menu" items="${list }">
				<li>
	                <a href="${ctx }/${menu.link }">
	                    <span>${menu.name }</span>
	                </a>
	                <ul>
                		<li>${submenu.name }</li>
	                </ul>
	            </li>
			</c:forEach>
	    </section>
    <!-- /.content -->
  	</div>
	<!-- 底部导航栏 -->
	<jsp:include page="/WEB-INF/views/layout/foot.jsp"/>
</div>
</body>
</html>
