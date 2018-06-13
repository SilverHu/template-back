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
	<link href="${ctx}/static/adminlte/css/skins/_all-skins.min.css" rel="stylesheet">
	<link href="${ctx}/static/consumer/css/content.css" rel="stylesheet">
	
	<script src="${ctx}/static/jquery/js/jquery-3.3.1.min.js"></script>
	<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.7"></script>
	<script src="${ctx}/static/adminlte/js/jquery.slimscroll.min.js"></script>
	<script src="${ctx}/static/adminlte/js/adminlte.min.js"></script>
</head>
<body class="skin-blue-light">
	<div class="consumer-header">
		<h1>
			Welcome!
			<small><shiro:principal/></small>
		</h1>
	    <ol class="breadcrumb">
	      <li><a href="${ctx }/welcome"><i class="fa fa-dashboard"></i> Home</a></li>
	      <li class="active">Welcome</li>
	    </ol>
	</div>
	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
		            <div class="box-header with-border">
		            	查询条件
		            </div>
		            <!-- table start -->
		            <div class="box-body">
		            </div>
		            <!-- table end -->
		            
		            <div class="box-footer clearfix">
		            </div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
		            <div class="box-header with-border">
		            	查询条件
		            </div>
		            <!-- table start -->
		            <div class="box-body">
		            	<table class="table table-bordered">
                			<tr>
			                  <th style="width: 10px">#</th>
			                  <th>Task</th>
			                  <th>Progress</th>
			                  <th style="width: 40px">Label</th>
			                </tr>
			                <tr>
			                  <td>1.</td>
			                  <td>Update software</td>
			                  <td>
			                    <div class="progress progress-xs">
			                      <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
			                    </div>
			                  </td>
			                  <td><span class="badge bg-red">55%</span></td>
			                </tr>
			                <tr>
			                  <td>2.</td>
			                  <td>Clean database</td>
			                  <td>
			                    <div class="progress progress-xs">
			                      <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
			                    </div>
			                  </td>
			                  <td><span class="badge bg-yellow">70%</span></td>
			                </tr>
			                <tr>
			                  <td>3.</td>
			                  <td>Cron job running</td>
			                  <td>
			                    <div class="progress progress-xs progress-striped active">
			                      <div class="progress-bar progress-bar-primary" style="width: 30%"></div>
			                    </div>
			                  </td>
			                  <td><span class="badge bg-light-blue">30%</span></td>
			                </tr>
			                <tr>
			                  <td>4.</td>
			                  <td>Fix and squish bugs</td>
			                  <td>
			                    <div class="progress progress-xs progress-striped active">
			                      <div class="progress-bar progress-bar-success" style="width: 90%"></div>
			                    </div>
			                  </td>
			                  <td><span class="badge bg-green">90%</span></td>
			                </tr>
              			</table>
		            </div>
		            <!-- table end -->
		            
		            <div class="box-footer clearfix">
		              <ul class="pagination pagination-sm no-margin pull-right">
		                <li><a href="#">«</a></li>
		                <li><a href="#">1</a></li>
		                <li><a href="#">2</a></li>
		                <li><a href="#">3</a></li>
		                <li><a href="#">»</a></li>
		              </ul>
		            </div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>