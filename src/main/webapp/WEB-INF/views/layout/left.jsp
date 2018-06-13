<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<c:set value="${pageContext.request.contextPath}" var="ctx" />

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${ctx}/static/image/avatar3.png" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
                <p>Hello, <shiro:principal/></p>
                <a href="${ctx}/logout"><i class="fa fa-circle text-success"></i> 退出登录</a>
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
        <ul class="sidebar-menu" data-widget="tree">
        	<c:forEach var="menu" items="${menus }" varStatus="i">
				<li class="treeview">
	                <a href="javascript:void(0)">
	                    <i class="fa fa-edit"></i>
	                    <span>${menu.name }</span>
	                    <i class="fa fa-angle-left pull-right"></i>
	                </a>
	                <ul class="treeview-menu">
	                	<c:forEach var="submenu" items="${menu.subPermissions }">
	                		<li><a href="${ctx }/${submenu.link }" class="J_iframe"><i class="fa fa-angle-double-right"></i> ${submenu.name }</a></li>
	                	</c:forEach>
	                </ul>
	            </li>
			</c:forEach>
        </ul>
    </section>
</aside>