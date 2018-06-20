<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>
		<#if operation=="ADD">
			新增资源
		<#elseif operation=="UPDATE">
			编辑资源
		</#if>
	</title>
	<@style.common ctx=ctx/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="consumer-header">
		<h1>
			<#if operation=="ADD">
				新增资源
			<#elseif operation=="UPDATE">
				编辑资源
			</#if>
		</h1>
	    <ol class="breadcrumb">
	      	<li><i class="fa fa-dashboard"></i> 系统管理</li>
	      	<li><a href="${ctx}/sys/permission/get">权限管理</a></li>
	      	<li class="active">
		      	<#if operation=="ADD">
					新增资源
				<#elseif operation=="UPDATE">
					编辑资源
				</#if>
	      	</li>
	    </ol>
	</div>
	
	 <!-- Main content -->
    <section class="content">
      	<div class="row">
        	<div class="col-xs-12">
        		<form id="saveForm" class="form-horizontal" action="${ctx}/sys/permission/save" method="post">
          		<div class="box">
            		<div class="box-body">
            			<input type="hidden" name="id" value="${entity.id}"/>
		          		<div class="form-group">
		                  	<label for="type" class="col-sm-2 control-label">资源类型</label>
		                  	<div class="col-sm-8">
	                  			<select <#if operation=="ADD">name="type" required<#elseif operation=="UPDATE">disabled</#if> class="form-control" style="width: 100%;">
				                  	<option></option>
				                  	<option value="1" <#if entity.type==1>selected</#if>>菜单</option>
				                  	<option value="2" <#if entity.type==2>selected</#if>>按钮</option>
			                	</select>
								<#if operation=="UPDATE">
									<input type="hidden" name="type" value="${entity.type}" class="form-control" placeholder="资源名称（必填）" required>
								</#if>
		                  	</div>
		                </div>
		                <div class="form-group">
		                  	<label for="name" class="col-sm-2 control-label">资源名称</label>
		                  	<div class="col-sm-8">
		                    	<input type="text" name="name" value="${entity.name}" class="form-control" placeholder="资源名称（必填）" required>
		                  	</div>
		                </div>
		                <div class="form-group">
		                  	<label for="parentid" class="col-sm-2 control-label">父资源</label>
		                  	<div class="col-sm-8">
	                  			<select <#if operation=="ADD">name="parentid"<#elseif operation=="UPDATE">disabled</#if> class="form-control" style="width: 100%;">
		                    		<option></option>
		                    		<#list parentMenus as parentMenu>
		                    			<#if !parentMenu.parentid?? || parentMenu.parentid == '' >
		                    				<option value="${parentMenu.id }" menulevel="1" <#if entity.parentid==parentMenu.id>selected</#if>>${parentMenu.name }</option>
		                    			<#else>
		                    				<option value="${parentMenu.id }" menulevel="2" <#if entity.parentid==parentMenu.id>selected</#if>>${parentMenu.name }</option>
		                    			</#if>>>
		                    		</#list>
		                		</select>
			                	<#if operation=="UPDATE">
			                		<input type="hidden" name="parentid" value="${entity.parentid}" class="form-control" placeholder="父资源">
		                  		</#if>
		                  	</div>
		                </div>
		                <div class="form-group">
		                  	<label for="link" class="col-sm-2 control-label">链接</label>
		                  	<div class="col-sm-8">
		                    	<input type="text" name="link" value="${entity.link}" class="form-control" placeholder="连接">
		                  	</div>
		                </div>
		                <div class="form-group">
		                  	<label for="permission" class="col-sm-2 control-label">权限标识</label>
		                  	<div class="col-sm-8">
		                    	<input type="text" name="permission" value="${entity.permission}" class="form-control" placeholder="权限标识（必填）" required>
		                  	</div>
		                </div>
		                <div class="form-group">
		                  	<label for="urlpattern" class="col-sm-2 control-label">可访问路径</label>
		                  	<div class="col-sm-8">
		                    	<input type="text" name="urlpattern" value="${entity.urlpattern}" class="form-control" placeholder="可访问路径">
		                  	</div>
		                </div>
		                <div class="form-group">
		                  	<label for="weight" class="col-sm-2 control-label">权重</label>
		                  	<div class="col-sm-8">
		                    	<input type="text" name="weight" class="form-control" placeholder="权重">
		                  	</div>
		                </div>
		                <@layout.errorwarning/>
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
		$('select[name=type]').select2({
			placeholder: '请选择（必选）'
		});
		$('select[name=parentid]').select2({
			placeholder: '请选择',
			allowClear: true
		});
		
		<#-- bootstrap validator验证 -->
		$('#saveForm').bootstrapValidator({
			excluded : [':disabled']
		}).on('success.form.bv', function(e){
	        e.preventDefault();
	        var $form = $(e.target);
	        var bv = $form.data('bootstrapValidator'); 
	        ajaxSubmit($form, '${ctx}/sys/permission/get');
		});
		
		<#-- 资源类型变化 -->
		if('${operation}' == 'ADD'){
			$('select[name=type]').on('change',function(){
				var type = $('select[name=type]').val();
				if(type == 1){
					showParentMenu(1);
					$('#saveForm').bootstrapValidator('addField', 'parentid',{
						validators: {notEmpty: {enabled: false}}
					});
				} else if(type == 2){
					showParentMenu(2);
					$('#saveForm').bootstrapValidator('addField','parentid',{
						validators: {notEmpty: {enabled: true}}
					});
				}
				$('[name=parentid]').select2({
					placeholder: '请选择',
					allowClear: true
				});
				$('#saveForm').data('bootstrapValidator').resetForm();
			});
		}
	});

	function showParentMenu(menulevel){
		var selectedLevel = $('select[name=parentid] :selected').attr('menulevel'); //当前类型
		if(selectedLevel != menulevel) {
			$('select[name=parentid]').val('');
		}
		$('select[name=parentid]').find('option').each(function(){
			if ($(this).attr('menulevel') == menulevel) {
				$(this).prop('disabled', false);
			} else {
				$(this).prop('disabled', true);
			}
		});
	}
	</script>
</body>
</html>