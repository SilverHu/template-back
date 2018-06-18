<#-- 保存权限 -->
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
        <#-- /.modal-content -->
      </div>
      <#-- /.modal-dialog -->
</div>
<#-- /.modal -->
<script type="text/javascript">
$(function(){
	$('[name=type]').select2({
		placeholder: '请选择'
	});
	resetParentId();
	
	<#-- 选择资源类型变化 -->
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
	
});

function resetParentId(){
	$('[name=parentid]').select2({
		placeholder: '请选择',
		allowClear: true
	});
}
</script>