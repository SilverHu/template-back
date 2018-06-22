<!DOCTYPE html>
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>用户授权</title>
	<@style.common ctx=ctx/>
	<@style.jstree ctx=ctx/>
	<#-- jstree -->
	
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
			用户授权
		</h1>
		<ol class="breadcrumb">
	      <li><i class="fa fa-dashboard"></i> 系统设置</li>
	      <li><a href="${ctx}/sys/user/get">用户管理</a></li>
	      <li class="active">用户授权</li>
	    </ol>
	</div>
	
	<form id="saveForm" class="form-horizontal" action="${ctx}/sys/user/permission" method="post">
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
		            <#-- table start -->
		            <div class="box-body">
		            	<input type="hidden" name="id" value="${entity.id}"/>
            			<input type="hidden" name="permissions"/>
            			
            			<table width="100%" class="table" style="border:0px">
        					<tr>
        						<th colspan="3">请确认授权用户信息</th>
        					</tr>
            				<tr>
            					<td>用户名：${entity.username}</td>
            					<td>邮箱：${entity.email}</td>
            					<td>用户状态：<#if entity.status==true>启用<#elseif entity.status==false>禁用</#if></td>
            				</tr>
            			</table>
		            	<#-- 顶级菜单 -->
		            	<div id="jstree" style="padding-top:20px;">
		            	<ul>
		            		<#list permissions as menu>
							<li id="${menu.id}" class="jstree-open"
								<#list entity.permissions as has>
	                				<#if has.id==menu.id>
	                					<#if !has.subPermissions??>data-jstree='{"opened":true,"selected":true}'
	                					<#else>class="jstree-undetermined"
	                					</#if>
	                				</#if>
	                			</#list>>
				                <span>
				                	${menu.name }
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
			                		<li class="jstree-open" id="${submenu.id}" 
			                			<#list entity.permissions as has>
			                				<#if has.id==submenu.id>
			                					<#if !has.subPermissions??>data-jstree='{"opened":true,"selected":true}'
			                					<#else>class="jstree-undetermined"
			                					</#if>
			                				</#if>
			                			</#list>>
			                			<span>
			                				${submenu.name } 
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
					                		<li class="jstree-open jstree-selected" id="${buttonmenu.id}" <#list entity.permissions as has><#if has.id==buttonmenu.id>data-jstree='{"opened":true,"selected":true}'</#if></#list>>
					                			<span>
					                				${buttonmenu.name } 
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
		            <div class="box-footer clearfix" style="text-align:center">
		            	<a href="javascript:history.go(-1)" class="btn btn-default">
		                	<i class="fa fa-undo"></i> 返回
		                </a>
            			<button type="submit" class="btn btn-primary">
							授权
		                </button>
		            </div>
				</div>
			</div>
		</div>
	</section>
	</form>
	
	<#include "layout/modal.ftl" />
	<script type="text/javascript">
	$(function(){
		//$('#jstree').jstree('destroy');
		_jstree = $('#jstree').jstree({
			'plugins': ['checkbox'],
			'checkbox': {
                'keep_selected_style': false//是否默认选中
			},
			'core': {
				'themes': {
					'stripes': true,
					'variant': 'large', 
					'icons': false
				}
			}
		});
	    
	    $('#saveForm').bootstrapValidator({
		}).on('success.form.bv', function(e){
			var checked=$("#jstree").jstree("get_checked"); // 获取选中节点
			var undetermined=$("#jstree").jstree("get_undetermined"); //获取半选中节点
			checked = $.merge(checked,undetermined); // 合并节点
			$('input[name=permissions]').val(checked);
		
            e.preventDefault();
            var $form = $(e.target);
            var bv = $form.data('bootstrapValidator'); 
            ajaxSubmit($form, '${ctx}/sys/user/get');
		});
	});
	
	</script>
</body>
</html>
