<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>后台管理系统</title>
	<@style.common ctx=ctx/>
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