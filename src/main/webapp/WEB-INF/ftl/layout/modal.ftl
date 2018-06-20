<div class="modal fade" id="removeModal">
	<div class="modal-dialog">
		<div class="modal-header" style="background-color: #3c8dbc;">
         	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
           		<span aria-hidden="true">&times;</span>
           	</button>
         	<h4 class="modal-title" style="color: white"></h4>
       	</div>
    	<div class="modal-content">
          	<div class="modal-body">
          		确认删除吗？
                <@layout.errorwarning/>
         	</div>
         	
         	<div class="modal-footer">
                <button type="submit" id="submitButton" class="btn btn-primary">
                	删除
                </button>
			</div>
        </div>
        <#-- /.modal-content -->
      </div>
      <#-- /.modal-dialog -->
</div>
<#-- /.modal -->