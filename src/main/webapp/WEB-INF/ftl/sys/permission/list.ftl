<!DOCTYPE html>
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>权限列表</title>
	<@style.common ctx=ctx/>
	<@style.jstree ctx=ctx/>
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
			资源列表
		</h1>
		<ol class="breadcrumb">
	      <li><i class="fa fa-dashboard"></i> 系统设置</li>
	      <li>权限管理</li>
	      <li class="active">资源列表</li>
	    </ol>
	</div>
	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
		            <div class="box-header with-border" style="text-align:right">
		            	<@shiro.hasPermission name="permission:save">
		            	<a class="btn btn-primary" onclick="gosave()">
		            		<i class="fa fa-plus"></i> 新增资源
		            	</a>
		            	</@shiro.hasPermission>
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
				                	<@shiro.hasPermission name="permission:save">
				                	<a onclick="gosave(${menu.id})" style="padding-left:10px"><i class="fa fa-edit fa-fw"></i></a>
				                	</@shiro.hasPermission>
				                	<@shiro.hasPermission name="permission:delete">
				                	<a onclick="remove(${menu.id})" style="padding-left:10px"><i class="fa fa-trash-o fa-fw"></i></a>
				                	</@shiro.hasPermission>
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
			                				<@shiro.hasPermission name="permission:save">
				                			<a onclick="gosave(${submenu.id})" style="padding-left:10px"><i class="fa fa-edit fa-fw"></i></a>
				                			</@shiro.hasPermission>
				                			<@shiro.hasPermission name="permission:delete">
				                			<a onclick="remove(${submenu.id})" style="padding-left:10px"><i class="fa fa-trash-o fa-fw"></i></a>
				                			</@shiro.hasPermission>
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
						                			<@shiro.hasPermission name="permission:save">
						                			<a onclick="gosave(${buttonmenu.id})" style="padding-left:10px"><i class="fa fa-edit fa-fw"></i></a>
						                			</@shiro.hasPermission>
				                					<@shiro.hasPermission name="permission:delete">
						                			<a onclick="remove(${buttonmenu.id})" style="padding-left:10px"><i class="fa fa-trash-o fa-fw"></i></a>
						                			</@shiro.hasPermission>
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
	
	<#include "layout/modal.ftl" />
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
	});
	
	function gosave(id){
		var url = '${ctx}/sys/permission/save/go';
		if (typeof(id) != undefined && !isNaN(id)) {
			url += '?id=' + id;
		}
		location.href = url;
	}
	
	function remove(id){
		ajaxDelete('${ctx}/sys/permission/delete/'+id, '确认删除ID为 '+id+' 的资源吗？');
	}
	</script>
</body>
</html>
