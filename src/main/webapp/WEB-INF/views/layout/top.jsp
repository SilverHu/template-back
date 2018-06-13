<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp" %>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<header class="main-header">
    <a href="${ctx}/welcome" class="logo" target="J_iframe">
    	<span class="logo-lg">后台管理系统</span>
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