<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp" %>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>后台管理系统</title>
	<link href="${ctx}/static/bootstrap/css/bootstrap.css?v=3.3.7" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/AdminLTE.css" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/font-awesome.min.css" rel="stylesheet" />
	<script src="${ctx}/static/jquery/js/jquery-3.3.1.min.js"></script>
	<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.7"></script>
	<script src="${ctx}/static/adminlte/js/app.js"></script>
</head>
<body class="skin-blue">
	<!-- 顶部导航栏 -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp"/>
	
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- 左边导航栏 -->
		<jsp:include page="/WEB-INF/views/layout/left.jsp"/>
		
		<!-- 正文 -->
		<!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">                
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    500 Error Page
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">Examples</a></li>
                    <li class="active">500 error</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
             
                <div class="error-page">
                    <h2 class="headline">500</h2>
                    <div class="error-content">
                        <h3><i class="fa fa-warning text-yellow"></i> Oops! Something went wrong.</h3>
                        <p>
                            We will work on fixing that right away. 
                            Meanwhile, you may <a href='${ctx }/'>return to index</a> or try using the search form.
                        </p>
                        <!-- 
                        <form class='search-form'>
                            <div class='input-group'>
                                <input type="text" name="search" class='form-control' placeholder="Search"/>
                                <div class="input-group-btn">
                                    <button type="submit" name="submit" class="btn btn-info"><i class="fa fa-search"></i></button>
                                </div>
                            </div>/.input-group
                        </form>
                         -->
                    </div>
                </div><!-- /.error-page -->

            </section><!-- /.content -->
        </aside><!-- /.right-side -->
	</div>
	
	<!-- 底部导航栏 -->
	<jsp:include page="/WEB-INF/views/layout/foot.jsp"/>
</body>
</html>