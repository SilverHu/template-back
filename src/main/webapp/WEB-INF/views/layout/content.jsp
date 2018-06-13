<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp" %>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<!-- 给链接增加class="J_menuItem"后，链接跳转页面的target就是当前的iframe -->
<div class="content-wrapper" style="height: 100%">
	<iframe id="J_iframe" class="J_iframe" name="J_iframe" width="100%" height="100%" src="${ctx}/welcome" data-id="${ctx}/welcome" frameborder="0" seamless></iframe>
</div>
<script>
$(function(){
	setIframeHeight(document.getElementById('J_iframe'));
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
 <!-- <aside class="right-side">
     <section class="content-header">
		<h1>
			查看信息
		</h1>
		
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
		
	</section>
	
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Hover Data Table</h3>                                    
                    </div>
                    <div class="box-body table-responsive">
                        <table id="example2" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Rendering engine</th>
                                    <th>Browser</th>
                                    <th>Platform(s)</th>
                                    <th>Engine version</th>
                                    <th>CSS grade</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Trident</td>
                                    <td>Internet
                                        Explorer 4.0</td>
                                    <td>Win 95+</td>
                                    <td> 4</td>
                                    <td>X</td>
                                </tr>
                                <tr>
                                    <td>Gecko</td>
                                    <td>Netscape Browser 8</td>
                                    <td>Win 98SE+</td>
                                    <td>1.7</td>
                                    <td>A</td>
                                </tr>
                                <tr>
                                    <td>Gecko</td>
                                    <td>Netscape Navigator 9</td>
                                    <td>Win 98+ / OSX.2+</td>
                                    <td>1.8</td>
                                    <td>A</td>
                                </tr>
                                <tr>
                                    <td>Other browsers</td>
                                    <td>All others</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>U</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
			</div>
        </div>
    </section>
</aside>
 -->