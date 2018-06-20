<#macro bootstrap ctx>
	<link href="${ctx}/static/bootstrap/css/bootstrap.css?v=3.3.7" rel="stylesheet" />
	<script src="${ctx}/static/jquery/js/jquery-3.3.1.min.js"></script>
	<script src="${ctx}/static/jquery/js/json2.js"></script>
	<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.7"></script>
</#macro>

<#macro validator ctx>
	<link href="${ctx}/static/adminlte/plugins/bootstrap-validator/css/bootstrapValidator.min.css" rel="stylesheet" />
	<script src="${ctx}/static/adminlte/plugins/bootstrap-validator/js/bootstrapValidator.min.js"></script>
	<#-- <script src="${ctx}/static/adminlte/plugins/bootstrap-validator/js/language/zh_CN.js"></script> -->
</#macro>

<#macro adminlte ctx>
	<link href="${ctx}/static/adminlte/css/font-awesome.min.css" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/plugins/Ionicons/css/ionicons.min.css" rel="stylesheet">
	<link href="${ctx}/static/adminlte/css/AdminLTE.min.css" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/skins/_all-skins.min.css" rel="stylesheet">
	<#-- google font -->
	<link href="${ctx}/static/adminlte/css/googleapis.css" rel="stylesheet">
	
	<#-- 滚动条 -->
	<script src="${ctx}/static/adminlte/js/jquery.slimscroll.min.js"></script>
	<#-- fastclick -->
	<script src="${ctx}/static/adminlte/plugins/fastclick/fastclick.js"></script>
	<script src="${ctx}/static/adminlte/js/adminlte.min.js"></script>
</#macro>

<#macro select2 ctx>
	<link href="${ctx}/static/select2/select2.min.css" rel="stylesheet">
	<script src="${ctx}/static/select2/select2.full.min.js"></script>
</#macro>

<#macro datepicker ctx>
	<link href="${ctx}/static/adminlte/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
	<script src="${ctx}/static/adminlte/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
</#macro>

<#macro icheck ctx>
	<link href="${ctx}/static/adminlte/plugins/iCheck/all.css" rel="stylesheet">
	<script src="${ctx}/static/adminlte/plugins/iCheck/icheck.min.js"></script>
</#macro>

<#macro DataTables ctx>
	<link href="${ctx}/static/adminlte/plugins/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
	<script src="${ctx}/static/adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="${ctx}/static/adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
</#macro>

<#-- layer弹框样式 -->
<#macro layer ctx>
	<link href="${ctx}/static/layer/theme/default/layer.css" rel="stylesheet">
	<script src="${ctx}/static/layer/layer.js"></script>
</#macro>

<#-- 首页样式 -->
<#macro index ctx>
	<@style.bootstrap ctx=ctx/>
	<@style.adminlte ctx=ctx/>
</#macro>

<#-- 其他页面样式 -->
<#macro common ctx>
	<@style.bootstrap ctx=ctx/>
	<@style.select2 ctx=ctx/>
	<@style.icheck ctx=ctx/>
	<@style.DataTables ctx=ctx/>
	<@style.layer ctx=ctx/>
	<@style.adminlte ctx=ctx/>
	<@style.validator ctx=ctx/>
	<#-- 自定义 -->
	<link href="${ctx}/static/consumer/css/content.css" rel="stylesheet">
	<script src="${ctx}/static/consumer/sys.js"></script>
	
	<#-- jquery form ajax -->
	<script src="${ctx}/static/jquery/js/jquery-form.js"></script>
</#macro>
