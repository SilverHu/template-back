<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp" %>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>后台管理系统</title>
	<link href="${ctx}/static/bootstrap/css/bootstrap.css?v=3.3.7" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/AdminLTE.css" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/font-awesome.min.css" rel="stylesheet" />
	<script src="${ctx}/static/jquery/js/jquery-3.3.1.min.js"></script>
	<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.7"></script>
	<script src="${ctx}/static/adminlte/js/app.js"></script>
</head>
<body class="skin-blue">
	<!-- 顶部导航栏 -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp"/>
	
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- 左边导航栏 -->
		<jsp:include page="/WEB-INF/views/layout/left.jsp"/>
		
		<!-- 正文 -->
		<aside class="right-side">
		     <!-- Content Header (Page header) -->
		     <section class="content-header">
				<h1>
					查看信息
				</h1>
				<!--
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
				-->
			</section>
			
			<!-- Main content -->
		    <section class="content">
		        <div class="row">
		            <div class="col-xs-12">
		                <div class="box">
		                    <div class="box-header">
		                        <h3 class="box-title">Hover Data Table</h3>                                    
		                    </div><!-- /.box-header -->
		                    <div class="box-body table-responsive">
		                        <table id="example2" class="table table-bordered table-hover">
		                            <thead>
		                                <tr>
		                                    <th>Rendering engine</th>
		                                    <th>Browser</th>
		                                    <th>Platform(s)</th>
		                                    <th>Engine version</th>
		                                    <th>CSS grade</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                                <tr>
		                                    <td>Trident</td>
		                                    <td>Internet
		                                        Explorer 4.0</td>
		                                    <td>Win 95+</td>
		                                    <td> 4</td>
		                                    <td>X</td>
		                                </tr>
		                                <tr>
		                                    <td>Gecko</td>
		                                    <td>Netscape Browser 8</td>
		                                    <td>Win 98SE+</td>
		                                    <td>1.7</td>
		                                    <td>A</td>
		                                </tr>
		                                <tr>
		                                    <td>Gecko</td>
		                                    <td>Netscape Navigator 9</td>
		                                    <td>Win 98+ / OSX.2+</td>
		                                    <td>1.8</td>
		                                    <td>A</td>
		                                </tr>
		                                <tr>
		                                    <td>Other browsers</td>
		                                    <td>All others</td>
		                                    <td>-</td>
		                                    <td>-</td>
		                                    <td>U</td>
		                                </tr>
		                            </tbody>
		                        </table>
		                    </div><!-- /.box-body -->
		                </div><!-- /.box -->
					</div>
		        </div>
		    </section><!-- /.content -->
		</aside>
	</div>
	
	<!-- 底部导航栏 -->
	<jsp:include page="/WEB-INF/views/layout/foot.jsp"/>
</body>
</html>