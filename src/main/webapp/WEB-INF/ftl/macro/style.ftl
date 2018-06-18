<#macro common ctx>
	<!-- jquery -->
	<script src="${ctx}/static/jquery/js/jquery-3.3.1.min.js"></script>
	<script src="${ctx}/static/jquery/js/jquery-form.js"></script>
	
	<!-- bootstrap -->
	<link href="${ctx}/static/bootstrap/css/bootstrap.css?v=3.3.7" rel="stylesheet" />
	<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.7"></script>
	
	<!-- select2 -->
	<link href="${ctx}/static/select2/select2.min.css" rel="stylesheet">
	<script src="${ctx}/static/select2/select2.full.min.js"></script>
	
	<!-- 滚动条 -->
	<script src="${ctx}/static/adminlte/js//jquery.slimscroll.min.js"></script>
	
	<!-- Ionicons -->
	<link href="${ctx}/static/adminlte/plugins/Ionicons/css/ionicons.min.css" rel="stylesheet">
	
	<!-- fastclick -->
	<script src="${ctx}/static/adminlte/plugins/fastclick/fastclick.js"></script>
	
	<!-- html5 -->
	<script src="${ctx}/static/adminlte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	
	<!-- AdminLTE -->
	<link href="${ctx}/static/adminlte/css/AdminLTE.min.css" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/font-awesome.min.css" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/skins/skin-blue-light.min.css" rel="stylesheet">
	<link href="${ctx}/static/adminlte/css/skins/_all-skins.min.css" rel="stylesheet">
	<script src="${ctx}/static/adminlte/js/adminlte.min.js"></script>
	
	<!-- 自定义 -->
	<link href="${ctx}/static/consumer/css/content.css" rel="stylesheet">
	<script src="${ctx}/static/consumer/sys.js"></script>
	
	<!-- icheck -->
	<link href="${ctx}/static/adminlte/plugins/iCheck/square/blue.css" rel="stylesheet">
	<script src="${ctx}/static/adminlte/plugins/iCheck/icheck.min.js"></script>
	
	<!-- bootstrap-datepicker -->
	<link href="${ctx}/static/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
	<script src="${ctx}/static/bootstrap-datepicker/bootstrap-datepicker.js"></script>
</#macro>

<#macro errorwarning>
	<div class="box box-warning hidden errorwarning">
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
</#macro>