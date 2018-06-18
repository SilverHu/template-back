<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>权限列表</title>
	<@style.common ctx=ctx/>
	<#-- jstree -->
	<link href="${ctx}/static/jstree/style.min.css" rel="stylesheet">
	<script src="${ctx}/static/jstree/jstree.js"></script>
	<style type="text/css">
	.close {
	    float: right;
	    font-size: 21px;
	    font-weight: bold;
	    line-height: 1;
	    color: #000;
	    text-shadow: 0 1px 0 #fff;
	    filter: alpha(opacity=20);
	    opacity: .2;
	}
	button.close {
	    -webkit-appearance: none;
	    padding: 0;
	    cursor: pointer;
	    background: transparent;
	    border: 0;
	}
	.modal-content .close {
	    margin-top: -2px;
	}
	</style>
</head>
<body class="skin-blue-light">

	<div class="consumer-header">
		<h1>
			权限列表
		</h1>
	</div>
	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
		            <div class="box-header with-border" style="text-align:right">
		            	<a class="btn btn-primary" onclick="gosave()">
		            		<i class="fa fa-plus"></i> 新增权限
		            	</a>
		            </div>
        
		            <#-- table start -->
		            <div class="box-body">
		            	<#-- 顶级菜单 -->
		            	<div id="jstree">
		            	<ul>
		            		<#list list as menu>
							<li class="jstree-open">
				                <span>
				                	${menu.name } 
				                	<a onclick="gosave(${menu.id})"><i class="fa fa-edit"></i></a>
				                	<#if menu.type == 1>
		                				<span class="badge bg-olive" style="margin-left: 10px">菜单</span>
		                			<#elseif menu.type == 2>
		                				<span class="badge bg-orange" style="margin-left: 10px">按钮</span>
		                			</#if>
				                </span>
				                <#-- 二级菜单 -->
				                <#if menu.subPermissions??>
				                <ul>
				                	<#list menu.subPermissions as submenu>
			                		<li class="jstree-open">
			                			<span>
			                				${submenu.name } 
				                			<a onclick="gosave(${submenu.id})"><i class="fa fa-edit"></i></a>
				                			<#if submenu.type == 1>
				                				<span class="badge bg-olive" style="margin-left: 10px">菜单</span>
				                			<#elseif submenu.type == 2>
				                				<span class="badge bg-orange" style="margin-left: 10px">按钮</span>
				                			</#if>
			                			</span>
			                			<#-- 三级按钮 -->
			                			<#if submenu.subPermissions??>
						                <ul>
				                			<#list submenu.subPermissions as buttonmenu>
					                		<li class="jstree-open">
					                			<span>
					                				${buttonmenu.name } 
						                			<a onclick="gosave(${buttonmenu.id})"><i class="fa fa-edit"></i></a>
						                			<#if buttonmenu.type == 1>
						                				<span class="badge bg-olive" style="margin-left: 10px">菜单</span>
						                			<#elseif buttonmenu.type == 2>
						                				<span class="badge bg-orange" style="margin-left: 10px">按钮</span>
						                			</#if>
					                			</span>
					                		</li>
						                	</#list>
						                </ul>
						                </#if>
				                	</li>
				                	</#list>
				                </ul>
				                </#if>
				            </li>
							</#list>
						</ul>
						</div>
		            </div>
		            <#-- table end -->
		            
		            <div class="box-footer clearfix">
		            </div>
				</div>
			</div>
		</div>
	</section>
	
	<#-- 保存权限 -->
	<div class="modal fade" id="savePermission">
		<div class="modal-dialog">
			<div class="modal-header" style="background-color: #3c8dbc;">
             	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
               		<span aria-hidden="true">&times;</span>
               	</button>
             	<h4 class="modal-title" style="color: white"></h4>
           	</div>
           	<form id="saveform" class="form-horizontal" action="" method="post">
        	<div class="modal-content">
              	<div class="modal-body">
              		<input type="hidden" name="id"/>
              		<div class="form-group">
	                  	<label for="type" class="col-sm-2 control-label">资源类型</label>
	                  	<div class="col-sm-8">
	                    	<select name="type" class="form-control select2" style="width: 100%;" required>
			                  	<option></option>
			                  	<option value="1">菜单</option>
			                  	<option value="2">按钮</option>
		                	</select>
	                  	</div>
	                </div>
	                <div class="form-group">
	                  	<label for="name" class="col-sm-2 control-label">资源名称</label>
	                  	<div class="col-sm-8">
	                    	<input type="text" name="name" class="form-control" placeholder="资源名称（必填）" required>
	                  	</div>
	                </div>
	                <div class="form-group">
	                  	<label for="parentid" class="col-sm-2 control-label">父资源</label>
	                  	<div class="col-sm-8">
	                    	<select name="parentid" class="form-control" style="width: 100%;">
	                    		<option></option>
	                    		<#list parentMenus as parentMenu>
	                    			<#if parentMenu.parentid??>
	                    				<option value="${parentMenu.id }" menutype="1">${parentMenu.name }</option>
	                    			<#else>
	                    				<option value="${parentMenu.id }" menutype="2">${parentMenu.name }</option>
	                    			</#if>>>
	                    		</#list>
		                	</select>
	                  	</div>
	                </div>
	                <div class="form-group">
	                  	<label for="link" class="col-sm-2 control-label">链接</label>
	                  	<div class="col-sm-8">
	                    	<input type="text" name="link" class="form-control" placeholder="连接">
	                  	</div>
	                </div>
	                <div class="form-group">
	                  	<label for="permission" class="col-sm-2 control-label">权限标识</label>
	                  	<div class="col-sm-8">
	                    	<input type="text" name="permission" class="form-control" placeholder="权限标识" required>
	                  	</div>
	                </div>
	                <div class="form-group">
	                  	<label for="urlpattern" class="col-sm-2 control-label">可访问路径</label>
	                  	<div class="col-sm-8">
	                    	<input type="text" name="urlpattern" class="form-control" placeholder="可访问路径">
	                  	</div>
	                </div>
	                <div class="form-group">
	                  	<label for="weight" class="col-sm-2 control-label">权重</label>
	                  	<div class="col-sm-8">
	                    	<input type="text" name="weight" class="form-control" placeholder="权重">
	                  	</div>
	                </div>
	                <@errorwarning/>
             	</div>
             	
             	<div class="modal-footer">
	                <button type="button" id="submitButton" class="btn btn-primary">
	                	编辑
	                </button>
				</div>
            </div>
            <#-- /.modal-content -->
             </form>
          </div>
          <#-- /.modal-dialog -->
	</div>
	<#-- /.modal -->
        
	<script type="text/javascript">
	$(function(){
		$('#jstree').jstree({
			'plugins': ['state'],
			'checkbox': {
				'keep_selected_style': false
			},
			'core': {
				'themes': {
					'stripes': true,
					'variant': 'large', 
					'icons': false
				}
			}
		});
		
		$('[name=type]').select2({
			placeholder: '请选择'
		});
		$('[name=parentid]').select2({
			placeholder: '请选择',
			allowClear: true
		});
		
		<#-- 选择资源类型变化 -->
		$('[name=type]').on('change',function(){
			var type = $('[name=type]').val();
			changeParentIdSelect(type);
			$('[name=parentid]').val(0);
			$('[name=parentid]').select2({
				placeholder: '请选择',
				allowClear: true
			});
		});
		
		$('#submitButton').on('click',function(){
			ajaxSubmit('saveform','${ctx }/sys/permission/save', '${ctx}/sys/permission/get');
		});
	});
	
	function gosave(id){
		$('#saveform')[0].reset();
		if (typeof(id) == undefined || isNaN(id)) {
			$('.modal-title').html('<i class="fa fa-plus"></i> 新增权限');
			$('.modal-footer button').html('新增');
			$('#savePermission').modal('show');
			resetSelect2();
		} else {
			$('.modal-title').html('<i class="fa fa-edit"></i> 编辑权限');
			$('.modal-footer button').html('编辑');
			$.ajax({
				url: '${ctx}/sys/permission/get/'+id,
				type: 'GET',
				dataType: 'json',
				success: function(data){
					$('[name=id]').val(data.id);
					$('[name=name]').val(data.name);
					$('[name=parentid]').val(data.parentid);
					$('[name=link]').val(data.link);
					$('[name=permission]').val(data.permission);
					$('[name=urlpattern]').val(data.urlpattern);
					$('[name=type]').val(data.type);
					$('[name=weight]').val(data.weight);
					changeParentIdSelect(data.type);
					resetSelect2();
					$('#savePermission').modal('show');
				}
			});
		}
	}
	
	function changeParentIdSelect(type){
		if (type == 1) {
			$('[name=parentid]').removeAttr('required');
			$('[name=parentid]').find('option').each(function(){
				if ($(this).attr('menutype') == 1) {
					$(this).prop('disabled',true);
				} else if ($(this).attr('menutype') == 2){
					$(this).prop('disabled',false);
				}
			});
		} else {
			$('[name=parentid]').attr('required','required');
			$('[name=parentid]').find('option').each(function(){
				if ($(this).attr('menutype') == 1) {
					$(this).prop('disabled',false);
				} else if ($(this).attr('menutype') == 2){
					$(this).prop('disabled',true);
				}
			});
		}
	}

	function resetSelect2(){
		$('[name=type]').select2({
			placeholder: '请选择'
		});
		$('[name=parentid]').select2({
			placeholder: '请选择',
			allowClear: true
		});
	}
	
	</script>
</body>
</html>
