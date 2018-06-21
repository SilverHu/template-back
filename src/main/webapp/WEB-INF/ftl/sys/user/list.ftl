<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户管理</title>
	<@style.common ctx=ctx/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="consumer-header">
		<h1>
			用户列表
		</h1>
	    <ol class="breadcrumb">
	      <li><i class="fa fa-dashboard"></i> 系统设置</li>
	      <li>用户管理</li>
	      <li class="active">用户列表</li>
	    </ol>
	</div>
	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
		            <div class="box-header with-border">
		            	<form id="searchForm" class="form-inline" method="post">
		            		<table width="100%">
								<tr>
									<td>
										<div class="form-group">
			                                <input type="text" name="username" class="form-control" value="${sysUser.username}" placeholder="用户名">
			                            </div>
			                            <div class="form-group">
			                                <select name="status" class="form-control" style="width:100%;">
			                                	<option></option>
			                                	<option value="1" <#if sysUser.status?string("true","false") == "true" >selected="selected"</#if>>启用</option>
			                                	<option value="0" <#if sysUser.status?string("true","false") == "false" >selected="selected"</#if>>禁用</option>
			                                </select>
			                            </div>
			                            <#-- 
			                           	<div class="form-group padding-bottom">
			                                <select id="roleId" name="roleId" data-placeholder="请选择角色" class="chosen-select">
			                                	<option value="">请选择角色</option>
			                                    <c:forEach items="${sysRoles}" var="sysRole">
			                                    	<option value="${sysRole.id}" <c:if test="${sysUser.roleId == sysRole.id}">selected="selected"</c:if>>${sysRole.name} </option>
			                                    </c:forEach>
		                                	</select>
			                            </div>
			                             -->
			                            <div class="form-group padding-bottom">
			                            	<button type="button" id="searchButton" class="btn btn-primary"><i class="fa fa-search-plus"></i>&nbsp;搜索</button>
			                            </div>
									</td>
									<td align="right">
										<div class="form-group padding-bottom">
											<a class="btn btn-primary" href="${ctx}/sys/user/save/go"><i class="fa fa-user-plus"></i>&nbsp;添加用户</a>
										</div>
									</td>
								</tr>
							</table>
		            	</form>
		            </div>
		            
		            <#-- table start -->
		            <div class="box-body">
		            	<table id="contentTable" class="table table-bordered table-hover">
                			<thead>
                				<tr>
				                  	<th style="width: 10%">ID</th>
				                  	<th style="width: 15%">用户名</th>
				                  	<th style="width: 15%">mail</th>
				                  	<th style="width: 10%">状态</th>
				                  	<th style="width: 30%">角色</th>
				                  	<th style="width: 20%">操作</th>
				                </tr>
                			</thead>
		                	<tbody>
		                	</tbody>
              			</table>
		            </div>
		            <#-- table end -->
				</div>
			</div>
		</div>
	</section>
 
	<script>
	$(function(){
		$('[name=status]').select2({
			placeholder: '请选择状态',
			allowClear: true
		});
		
		var _table = $('#contentTable').initAjaxDataTable({
			url: '${ctx}/sys/user/get/page',
			form: $('#searchForm'),
			columns: [
				{data: 'id'},
				{data: 'username'},
				{data: 'email'},
				{
					data: 'status',
					render: function(data, type, row, meta) {
						if (data == true) {
							return '启用';
						} else {
							return '禁用';
						}
	                }
				},
				{data : 'roles'},
				{
					data: 'id',
					render: function(data, type, row, meta) {
						return '<a href="${ctx}/sys/user/save/go?id="' + data +' style="padding-right:10px"><i class="fa fa-edit fa-fw fa-lg"></i></a>' +
	              		'<a href="javascript:void" onclick="remove(' + data +')" style="padding-right:10px"><i class="fa fa-trash-o fa-fw fa-lg"></i></a>' +
	              		'<a href="${ctx}/sys/user/permission/go/' + data +'" style="padding-right:10px"><i class="fa fa-gear fa-fw fa-lg"></i></a>';
	                }
				}
			]
		});
		
		$("#searchButton").click(function(){
	        _table.draw();
	    });
	});
	
	function remove(id){
		ajaxDelete('${ctx}/sys/user/delete/'+id, '确认删除ID为 '+id+' 的用户吗？');
	}
	</script>
</body>
</html>