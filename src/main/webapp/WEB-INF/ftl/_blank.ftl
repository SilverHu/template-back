<!DOCTYPE html>
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
            			<@layout.errorwarning/>
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