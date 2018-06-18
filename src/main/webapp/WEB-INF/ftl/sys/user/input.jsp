<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="ctx" />

<!-- Left side column. contains the logo and sidebar -->
<aside class="left-side sidebar-offcanvas">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${ctx}/static/image/avatar3.png" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
                <p>Hello, Jane</p>
                <a href="javascript:void(0)"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
		<!-- 
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..."/>
                <span class="input-group-btn">
                    <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                </span>
            </div>
        </form>
		-->
        <!-- /.search form -->

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
        	<c:forEach var="menu" items="${menus }">
				<li class="treeview">
	                <a href="${ctx }/${menu.link }">
	                    <i class="fa fa-bar-chart-o"></i>
	                    <span>${menu.name }</span>
	                    <i class="fa fa-angle-left pull-right"></i>
	                </a>
	                <ul class="treeview-menu">
	                	<c:forEach var="submenu" items="${menu.subPermissions }">
	                		<li><a href="${ctx }/${submenu.link }"><i class="fa fa-angle-double-right"></i> ${submenu.name }</a></li>
	                	</c:forEach>
	                </ul>
	            </li>
			</c:forEach>
        </ul>
    </section>
</aside>