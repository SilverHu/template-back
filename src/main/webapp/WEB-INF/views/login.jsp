<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="${ctx }/static/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ctx }/static/bootstrap/css/bootstrap-theme.min.css" />
	<link rel="stylesheet" href="${ctx }/static/bootstrap/css/signin.css" />
	<script src="${ctx }/static/jquery/js/jquery-3.3.1.min.js"></script>
	<script src="${ctx }/static/bootstrap/js/bootstrap.min.js"></script>
	
	<title>登录</title>
</head>
<body>
	<div class="container">
		<form class="form-signin" action="${ctx }/login" method="post">
			<h2 class="form-signin-heading">用户登录</h2>
			<div style="color: red">
	        	${error}
	        </div>
			<label for="inputEmail" class="sr-only" autofocus>用户名</label>
			<input class="form-control" name="username" placeholder="用户名" required autofocus/>
			<label for="inputPassword" class="sr-only">密码</label>
			<input class="form-control" name="password" type="password"  placeholder="密码" required/>
			<div class="checkbox">
	          <label>
	            <input type="checkbox" value="remember-me"> Remember me
	          </label>
	        </div>
	        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		</form>
	</div>
	
	
</body>
</html>