<#macro header ctx name>
	<header class="main-header">
	    <a href="${ctx}/welcome" class="logo" target="J_iframe">
	    	<span class="logo-lg">${name}</span>
	    </a>
	    <nav class="navbar navbar-static-top" role="navigation">
	        <div class="navbar-custom-menu">
	            <ul class="nav navbar-nav"> 
	                <li class="dropdown user user-menu">
	                    <a href="javascript:void(0)">
	                        <span id="showDate"></span>
	                    </a>
	                </li>
	            </ul>
	        </div>
	    </nav>
	</header>
	<script type="text/javascript">
		$(document).ready(function(){
			var week; 
			var date = new Date();
			if(date.getDay()==0)   	  week='星期日';
			else if(date.getDay()==1)   week='星期一';
			else if(date.getDay()==2)   week='星期二';
			else if(date.getDay()==3)   week='星期三';
			else if(date.getDay()==4)   week='星期四';
			else if(date.getDay()==5)   week='星期五';
			else   week='星期六';
			$('#showDate').html(date.getFullYear()+'年'+(date.getMonth()+1)+'月'+date.getDate()+'日 '+week);
		});
	</script>
</#macro>

<#macro left ctx menus>
	<#-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar">
	    <#-- sidebar: style can be found in sidebar.less -->
	    <section class="sidebar">
	        <#-- Sidebar user panel -->
	        <div class="user-panel">
	            <div class="pull-left image">
	                <img src="${ctx}/static/image/avatar3.png" class="img-circle" alt="User Image" />
	            </div>
	            <div class="pull-left info">
	                <p>Hello, <@shiro.principal/></p>
	                <a href="${ctx}/logout"><i class="fa fa-circle text-success"></i> 退出登录</a>
	            </div>
	        </div>
	        <#-- search form -->
			<#-- 
	        <form action="#" method="get" class="sidebar-form">
	            <div class="input-group">
	                <input type="text" name="q" class="form-control" placeholder="Search..."/>
	                <span class="input-group-btn">
	                    <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
	                </span>
	            </div>
	        </form>
			-->
	        <#-- /.search form -->
	
	        <#-- sidebar menu: : style can be found in sidebar.less -->
	        <ul class="sidebar-menu" data-widget="tree">
	        	<#list menus as menu>
	        		<li class="treeview">
		                <a href="javascript:void(0)">
		                    <i class="fa fa-list"></i>
		                    <span>${menu.name }</span>
		                    <i class="fa fa-angle-left pull-right"></i>
		                </a>
		                <ul class="treeview-menu">
		                	<#list menu.subPermissions as submenu>
		                		<li><a href="${ctx }/${submenu.link }" target="J_iframe"><i class="fa fa-angle-double-right"></i> ${submenu.name }</a></li>
		                	</#list>
		                </ul>
		            </li>
	        	</#list>
	        </ul>
	    </section>
	</aside>
	<script>
		$(function(){
		    $('.sidebar-menu').tree()
			$('.treeview-menu').find('a').click(function () {
				$('.treeview-menu').find('a').each(function(){
					$(this).parent('li').removeClass('active').parent('ul').css("display","block").parent('li').removeClass('active');
				});
				$(this).parent('li').addClass('active').parent('ul').css("display","block").parent('li').addClass('active');
			})
		});
	</script>
</#macro>

<#macro content ctx>
	<#-- 给链接增加class="J_menuItem"后，链接跳转页面的target就是当前的iframe -->
	<div class="content-wrapper" style="height: 100%">
		<iframe id="J_iframe" name="J_iframe" width="100%" height="200%" src="${ctx}/welcome" data-id="${ctx}/welcome" frameborder="0" scrolling="no" seamless></iframe>
	</div>
	<script>
	$(function(){
		//setIframeHeight(document.getElementById('J_iframe'));
		window.onload = function () {
			setIframeHeight(document.getElementById('J_iframe'));
		};
		window.onresize=function(){  
			setIframeHeight(document.getElementById('J_iframe'));
		} 
	});
	
	function setIframeHeight(iframe) {
		if (iframe) {
			var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
				if (iframeWin.document.body) {
				iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
			}
		}
	};
	
	</script>
</#macro>

<#macro foot>
	<footer class="main-footer">
	  	<div class="pull-right hidden-xs">
	    	<b>Version</b> 1.0.0
	  	</div>
	  	<strong>templete © 2018-2019
	</footer>
</#macro>

<#macro page url>
	<div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">
			<li><a href="${url}">«</a></li>
		    <li><a href="${url}">1</a></li>
		    <li><a href="${url}">2</a></li>
		    <li><a href="${url}">3</a></li>
		    <li><a href="${url}">»</a></li>
		</ul>
	</div>
</#macro>

<#macro errorwarning>
	<div class="box box-danger errorwarning" style="display:none;">
        <div class="box-header with-border">
          	<h3 class="box-title">ERROR</h3>
          	<div class="box-tools pull-right">
            	<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
          	</div>
        </div>
        <div class="box-body">
          	请检查是否已登录
        </div>
  	</div>
</#macro>