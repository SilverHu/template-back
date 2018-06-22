<!DOCTYPE html>
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>编辑用户</title>
	<@style.common ctx=ctx/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="consumer-header">
		<h1>
			<#if operation=="ADD">
				新增用户
			<#elseif operation=="UPDATE">
				编辑用户
			</#if>
		</h1>
	    <ol class="breadcrumb">
	      	<li><i class="fa fa-dashboard"></i> 系统管理</li>
	      	<li><a href="${ctx}/sys/user/get">用户管理</a></li>
	      	<li class="active">
		      	<#if operation=="ADD">
					新增用户
				<#elseif operation=="UPDATE">
					编辑用户
				</#if>
	      	</li>
	    </ol>
	</div>
	
	<!-- Main content -->
    <section class="content">
      	<div class="row">
        	<div class="col-xs-12">
        		<form id="saveForm" class="form-horizontal" action="${ctx}/sys/user/save" method="post">
          		<div class="box">
            		<div class="box-body">
            			<input type="hidden" name="id" value="${entity.id}"/>
		                <div class="form-group">
		                  	<label for="username" class="col-sm-2 control-label">用户名</label>
		                  	<div class="col-sm-8">
		                    	<input type="text" name="username" value="${entity.username}" class="form-control" placeholder="User Name（必填）"
		                    		<#if operation=="UPDATE">readonly</#if> required>
		                  	</div>
		                </div>
		                <div class="form-group">
		                  	<label for="email" class="col-sm-2 control-label">邮箱</label>
		                  	<div class="col-sm-8">
		                    	<input type="email" name="email" value="${entity.email}" class="form-control" placeholder="邮箱">
		                  	</div>
		                </div>
		                <div class="form-group">
		                  	<label for="name" class="col-sm-2 control-label">昵称</label>
		                  	<div class="col-sm-8">
		                    	<input type="text" name="name" value="${entity.name}" class="form-control" placeholder="昵称">
		                  	</div>
		                </div>
		                <div class="form-group">
		                  	<label for="password" class="col-sm-2 control-label">密码</label>
		                  	<div class="col-sm-8">
		                    	<input type="password" name="password" value="" class="form-control" placeholder="Password（必填），编辑时不填写则为不修改">
		                  	</div>
		                </div>
		                <div class="form-group">
		                  	<label for="rpassword" class="col-sm-2 control-label">确认密码</label>
		                  	<div class="col-sm-8">
		                    	<input type="password" name="rpassword" value="" class="form-control" placeholder="确认密码（必填），编辑时不填写则为不修改">
		                  	</div>
		                </div>
		                <div class="form-group">
		                  	<label for="roles" class="col-sm-2 control-label">角色</label>
		                  	<div class="col-sm-8">
		                  		<select name="roleids" multiple="multiple" class="form-control select2" data-placeholder="请选择角色" style="width: 100%;">
				                  	<#list roles as role>
				                  		<option value="${role.id}" <#list entity.roles as has><#if has.id==role.id>selected</#if></#list>>${role.name}</option>
				                  	</#list>
			                	</select>
		                  	</div>
		                </div>
		                <div class="form-group">
		                  	<label for="subcompany" class="col-sm-2 control-label">所属部门</label>
		                  	<div class="col-sm-8">
		                    	<input type="text" name="subcompany" value="" class="form-control" placeholder="所属部门（必选）">
		                  	</div>
		                </div>
		                <div class="form-group">
		                  	<label for="status" class="col-sm-2 control-label">用户状态</label>
		                  	<div class="col-sm-8">
		                  		<input type="radio" name="status" value="false" <#if operation == "ADD" || entity.status?string("true","false") == "false">checked</#if>> 禁用
		                  		&nbsp;&nbsp;&nbsp;&nbsp;
		                  		<input type="radio" name="status" value="true" <#if entity.status?string("true","false") == "true">checked</#if>> 启用
		                  	</div>
		                </div>
		                <@layout.errorwarning/>
            		</div>
            		<div class="box-footer" style="text-align:center">
            			<a href="javascript:history.go(-1)" class="btn btn-default">
		                	<i class="fa fa-undo"></i> 返回
		                </a>
            			<button type="submit" class="btn btn-primary">
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
		
		$('.select2').select2();
		
		$('#saveForm').bootstrapValidator({
			fields: {
				username: {
					trigger: 'blur',
					validators:{
						remote: {
							url: '${ctx}/sys/user/save/validator',
							data:{
								id: function(){return $('input[name=id]').val();},
								username: function(){return $('input[name=username]').val()}
							},
							message: '该角色名称已存在'
						}
					}
				}
			}
		}).on('success.form.bv', function(e){
            e.preventDefault();
            var $form = $(e.target);
            var bv = $form.data('bootstrapValidator'); 
            ajaxSubmit($form, '${ctx}/sys/user/get');
		});
	});
	</script>
</body>
</html>