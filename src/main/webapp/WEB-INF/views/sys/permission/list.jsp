<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp" %>
<%@ include file="/WEB-INF/views/layout/style.jsp" %>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>权限列表</title>
	<!-- jstree -->
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
        
		            <!-- table start -->
		            <div class="box-body">
		            	<!-- 顶级菜单 -->
		            	<div id="jstree">
		            	<ul>
		            		<c:forEach var="menu" items="${list }">
							<li class="jstree-open">
				                <span>
				                	${menu.name } 
				                	<a onclick="gosave(${menu.id})"><i class="fa fa-edit"></i></a>
				                	<c:choose>
				                		<c:when test="${menu.type == 1 }"><span class="badge bg-olive" style="margin-left: 10px">菜单</span></c:when>
				                		<c:when test="${menu.type == 2 }"><span class="badge bg-orange" style="margin-left: 10px">按钮</span></c:when>
				                	</c:choose>
				                </span>
				                <!-- 二级菜单 -->
				                <c:if test="${menu.subPermissions != null}"></c:if>
				                <ul>
				                	<c:forEach var="submenu" items="${menu.subPermissions }">
			                		<li class="jstree-open">
			                			<span>
			                				${submenu.name } 
				                			<a onclick="gosave(${submenu.id})"><i class="fa fa-edit"></i></a>
				                			<c:choose>
						                		<c:when test="${submenu.type == 1 }"><span class="badge bg-olive" style="margin-left: 10px">菜单</span></c:when>
						                		<c:when test="${submenu.type == 2 }"><span class="badge bg-orange" style="margin-left: 10px">按钮</span></c:when>
						                	</c:choose>
			                			</span>
			                			<!-- 三级按钮 -->
						                <c:if test="${submenu.subPermissions != null}"></c:if>
						                <ul>
						                	<c:forEach var="buttonmenu" items="${submenu.subPermissions }">
					                		<li class="jstree-open">
					                			<span>
					                				${buttonmenu.name } 
						                			<a onclick="gosave(${buttonmenu.id})"><i class="fa fa-edit"></i></a>
						                			<c:choose>
								                		<c:when test="${buttonmenu.type == 1 }"><span class="badge bg-olive" style="margin-left: 10px">菜单</span></c:when>
								                		<c:when test="${buttonmenu.type == 2 }"><span class="badge bg-orange" style="margin-left: 10px">按钮</span></c:when>
								                	</c:choose>
					                			</span>
					                		</li>
						                	</c:forEach>
						                </ul>
				                	</li>
				                	</c:forEach>
				                </ul>
				            </li>
							</c:forEach>
						</ul>
						</div>
		            </div>
		            <!-- table end -->
		            
		            <div class="box-footer clearfix">
		            </div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 保存权限 -->
	<div class="modal fade" id="savePermission">
		<div class="modal-dialog">
			<div class="modal-header" style="background-color: #3c8dbc;">
             	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
               		<span aria-hidden="true">&times;</span>
               	</button>
             	<h4 class="modal-title" style="color: white"></h4>
           	</div>
           	<form id="saveform" class="form-horizontal" action="${ctx }/sys/permission/save" method="post">
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
	                    		<c:forEach var="parentMenu" items="${parentMenus }">
	                    			<c:choose>
	                    				<c:when test="${parentMenu.parentid == null }">
	                    					<option value="${parentMenu.id }" menutype="1">${parentMenu.name }</option>
	                    				</c:when>
	                    				<c:otherwise>
	                    					<option value="${parentMenu.id }" menutype="2">${parentMenu.name }</option>
	                    				</c:otherwise>
	                    			</c:choose>
	                    		</c:forEach>
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
	                <div id="modal-warning" class="box box-warning hidden">
			            <div class="box-header with-border">
			              <h3 class="box-title">ERROR</h3>
			              <div class="box-tools pull-right">
			                	<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
			              </div>
			            </div>
			            <div class="box-body">
			              The body of the box
			            </div>
		          	</div>
             	</div>
             	<div class="modal-footer">
	                <button type="submit" class="btn btn-primary">
	                	编辑
	                </button>
				</div>
            </div>
            </form>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
        
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
		
		// 选择资源类型变化
		$('[name=type]').on('change',function(){
			var type = $('[name=type]').val();
			if (type == 1) {
				$('[name=parentid]').removeAttr('required');
				$('[name=parentid]').find('option').each(function(){
					if ($(this).attr('menutype') == 1) {
						$(this).prop('disabled',false);
					} else {
						$(this).prop('disabled',true);
					}
				});
			} else {
				$('[name=parentid]').attr('required','required');
				$('[name=parentid]').find('option').each(function(){
					if ($(this).attr('menutype') == 1) {
						$(this).prop('disabled',true);
					} else {
						$(this).prop('disabled',false);
					}
				});
			}
			$('[name=parentid]').val(0);
			resetParentId();

			$('#saveform').submit(function(){
				ajaxSubmit($(this), '${ctx}/sys/permission/get');
			})
		});
		
		$('[name=type]').select2({
			placeholder: '请选择'
		});
		resetParentId();
	});

	function resetParentId(){
		$('[name=parentid]').select2({
			placeholder: '请选择',
			allowClear: true
		});
	}
	
	function gosave(id){
		$('#saveform')[0].reset();
		var url = '${ctx}/sys/permission/save/go';
		if (typeof(id) == undefined || isNaN(id)) {
			$('.modal-title').html('<i class="fa fa-plus"></i> 新增权限');
			$('.modal-footer button').html('新增');
			$('#savePermission').modal('show');
			resetParentId();
		} else {
			$('.modal-title').html('<i class="fa fa-edit"></i> 编辑权限');
			$('.modal-footer button').html('编辑');
			url += '?id' + id;
			$()
			$('#savePermission').modal('show');
		}
	}
	</script>
</body>
</html>
