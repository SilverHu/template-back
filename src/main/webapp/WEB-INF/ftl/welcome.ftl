<!DOCTYPE html>
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>后台管理系统</title>
	<@style.common ctx=ctx/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="consumer-header">
		<h1>
			Welcome!
			<small><shiro:principal/></small>
		</h1>
	    <ol class="breadcrumb">
	      <li><a href="${ctx }/welcome"><i class="fa fa-dashboard"></i> Home</a></li>
	      <li class="active">Welcome</li>
	    </ol>
	</div>
	
	 <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Hover Data Table</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
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
                    	Explorer 5.5 中文
                 	</td>
                  	<td>Win 95+</td>
                  	<td>5.5</td>
                  	<td>A</td>
                </tr>
                <tr>
                  	<td>KHTML</td>
                  	<td>Konqureror 3.1</td>
                  	<td>KDE 3.1</td>
                  	<td>3.1</td>
                  	<td>C</td>
                </tr>
                <tr>
                  	<td>KHTML</td>
                  	<td>Konqureror 3.3</td>
                  	<td>KDE 3.3</td>
                  	<td>3.3</td>
                  	<td>A</td>
                </tr>
                <tr>
                  	<td>KHTML</td>
                  	<td>Konqureror 3.5</td>
                  	<td>KDE 3.5</td>
                  	<td>3.5</td>
                  	<td>A</td>
                </tr>
                <tr>
                  	<td>Tasman</td>
                  	<td>Internet Explorer 4.5</td>
                  	<td>Mac OS 8-9</td>
                  	<td>-</td>
                  	<td>X</td>
                </tr>
                <tr>
                  	<td>Tasman</td>
                  	<td>Internet Explorer 5.1</td>
                  	<td>Mac OS 7.6-9</td>
                  	<td>1</td>
                  	<td>C</td>
                </tr>
                <tr>
                  	<td>Tasman</td>
                  	<td>Internet Explorer 5.2</td>
                  	<td>Mac OS 8-X</td>
                  	<td>1</td>
                  	<td>C</td>
                </tr>
                <tr>
                  	<td>Misc</td>
                  	<td>NetFront 3.1</td>
                  	<td>Embedded devices</td>
                  	<td>-</td>
                  	<td>C</td>
                </tr>
                <tr>
                  	<td>Misc</td>
                  	<td>NetFront 3.4</td>
                  	<td>Embedded devices</td>
                  	<td>-</td>
                  	<td>A</td>
                </tr>
                <tr>
                  	<td>Misc</td>
                  	<td>Dillo 0.8</td>
                  	<td>Embedded devices</td>
                  	<td>-</td>
                  	<td>X</td>
                </tr>
                <tr>
                  	<td>Misc</td>
                  	<td>Links</td>
                  	<td>Text only</td>
                  	<td>-</td>
                  	<td>X</td>
                </tr>
                <tr>
                  	<td>Misc</td>
                  	<td>Lynx</td>
                  	<td>Text only</td>
                  	<td>-</td>
                  	<td>X</td>
                </tr>
                <tr>
                  	<td>Misc</td>
                  	<td>IE Mobile</td>
                  	<td>Windows Mobile 6</td>
                  	<td>-</td>
                  	<td>C</td>
                </tr>
                <tr>
                  	<td>Misc</td>
                  	<td>PSP browser</td>
                  	<td>PSP</td>
                  	<td>-</td>
                  	<td>C</td>
                </tr>
                <tr>
                  	<td>Other browsers</td>
                  	<td>All others</td>
                  	<td>-</td>
                  	<td>-</td>
                  	<td>U</td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                  	<th>Rendering engine</th>
                  	<th>Browser</th>
                  	<th>Platform(s)</th>
                  	<th>Engine version</th>
                  	<th>CSS grade</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
	
	<script>
	$(function(){
		$('#example2').DataTable()
	});
	</script>
</body>
</html>