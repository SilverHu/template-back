<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>
		<#if operation=="ADD">
			新增角色
		<#elseif operation=="UPDATE">
			编辑角色
		</#if>
	</title>
	<@style.common ctx=ctx/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="consumer-header">
		<h1>
			<#if operation=="ADD">
				新增角色
			<#elseif operation=="UPDATE">
				编辑角色
			</#if>
		</h1>
	    <ol class="breadcrumb">
	      	<li><i class="fa fa-dashboard"></i> 系统管理</li>
	      	<li><a href="${ctx}/sys/role/get">角色管理</a></li>
	      	<li class="active">
		      	<#if operation=="ADD">
					新增角色
				<#elseif operation=="UPDATE">
					编辑角色
				</#if>
	      	</li>
	    </ol>
	</div>
	
	 <!-- Main content -->
    <section class="content">
      	<div class="row">
        	<div class="col-xs-12">
        		<form id="saveForm" class="form-horizontal" action="${ctx}/sys/role/save" method="post">
          		<div class="box">
            		<div class="box-body">
            			<input type="hidden" name="id" value="${entity.id}"/>
		                <div class="form-group">
		                  	<label for="name" class="col-sm-2 control-label">角色名称</label>
		                  	<div class="col-sm-8">
		                    	<input type="text" name="name" value="${entity.name}" class="form-control" placeholder="角色名称（必填）" required tel>
		                  	</div>
		                </div>
            		</div>
            		<div class="box-footer" style="text-align:center">
            			<a href="javascript:history.go(-1)" class="btn btn-default">
		                	<i class="fa fa-undo"></i> 返回
		                </a>
            			<button id="submitButton" type="submit" class="btn btn-primary">
		                	<#if operation=="ADD">
								添加
							<#elseif operation=="UPDATE">
								编辑
							</#if>
		                </button>
            		</div>
          		</div>
          		<form>
        	</div>
      	</div>
    </section>
	
	<script>
	$(function(){
		$('[name=status]').iCheck({
			checkboxClass: 'icheckbox_flat-green',
			radioClass   : 'iradio_flat-green'
		});
		
		$('#saveForm').bootstrapValidator({
		}).on('success.form.bv', function(e){
            e.preventDefault(); // Prevent form submission
            var $form = $(e.target); // Get the form instance
            var bv = $form.data('bootstrapValidator');  // Get the BootstrapValidator instance

            ajaxSubmit($form, '${ctx}/sys/role/get');
		});
	});
	</script>
</body>
</html>