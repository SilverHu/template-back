<!DOCTYPE html>
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="${ctx}/static/bootstrap/css/bootstrap.css?v=3.3.7" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/AdminLTE.min.css" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/font-awesome.min.css" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/skins/skin-blue-light.min.css" rel="stylesheet">
	
	<script src="${ctx}/static/jquery/js/jquery-3.3.1.min.js"></script>
	<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.7"></script>
	<script src="${ctx}/static/adminlte/js/adminlte.min.js"></script>
	<script src="${ctx}/static/adminlte/js/jquery.slimscroll.min.js"></script>
	<#-- icheck -->
	<link href="${ctx}/static/adminlte/plugins/iCheck/square/blue.css" rel="stylesheet">
	<script src="${ctx}/static/adminlte/plugins/iCheck/icheck.min.js"></script>
	<title>登录</title>
	
	<style type="text/css">
	html,body{
		height: 100%;
	}
	</style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
	<div class="login-logo">
	    <a href="javascript:void(0)">后台管理系统</a>
	</div>
  	<#-- /.login-logo -->
  	<div class="login-box-body">
	    <p class="login-box-msg">Sign in</p>
	
	    <form action="${ctx }/login" method="post">
	      	<div class="form-group has-feedback">
		        <input type="text" name="username" class="form-control" placeholder="User Name" required autofocus>
		        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
	      	</div>
	      	<div class="form-group has-feedback">
	        	<input type="password" name="password" class="form-control" placeholder="Password">
	        	<span class="glyphicon glyphicon-lock form-control-feedback"></span>
	      	</div>
	      	<div class="row">
	      	<#-- 
	        <div class="col-xs-8">
	          	<div class="checkbox icheck">
		            <label>
		              <input type="checkbox"> Remember Me
		            </label>
	          	</div>
	        </div>
	         -->
	         <div class="col-xs-8">
	          	<span style="color:red">${error }</span>
	        </div>
	        <#-- /.col -->
	        <div class="col-xs-4">
	          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
	        </div>
	        <#-- /.col -->
	      </div>
	    </form>
		<#-- 
	    <div class="social-auth-links text-center">
	      	<p>- OR -</p>
	      	<a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
	        	Facebook
	        </a>
	      	<a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
	        	Google+
	        </a>
	    </div>
	    <a href="#">I forgot my password</a><br>
	    <a href="register.html" class="text-center">Register a new membership</a>
		 -->
	
	  </div>
  	<#-- /.login-box-body -->
</div>
<#-- /.login-box -->
	
<script>
$(function () {
	$('input').iCheck({
		checkboxClass: 'icheckbox_square-blue',
      	radioClass: 'iradio_square-blue',
      	increaseArea: '20%' /* optional */
    });
});
</script>
</body>
</html>