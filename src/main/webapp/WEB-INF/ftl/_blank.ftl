<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>后台管理系统</title>
	<@style.common ctx=ctx/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
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
	
	 <!-- Main content -->
    <section class="content">
      	<div class="row">
        	<div class="col-xs-12">
          		<div class="box">
            		<div class="box-header">
              			填充标题或者搜索框
            		</div>
            		<div class="box-body">
            			填充正文
            		</div>
            		<div class="box-footer">
            			填充尾部内容
            		</div>
          		</div>
        	</div>
      	</div>
    </section>
	
	<script>
	$(function(){
	
	});
	</script>
</body>
</html>