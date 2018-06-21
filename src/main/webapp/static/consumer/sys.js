/**
 * 
 * @param $form form表单
 * @param jumpUrl 请求成功后跳转地址
 */
function ajaxSubmit($form, jumpUrl){
	$form.find('.errorwarning').find('.box-body').html('');
	$form.find('.errorwarning').hide();
	$.ajax({
		url: $form.attr('action'),
		type: $form.attr('method'),
		data: $form.serialize(),
		dataType: 'json',
		success: function(data){
			if (data.code == 'SUCCESS') {
				location.href = jumpUrl;
			} else {
				$form.find('.errorwarning').find('.box-body').html(JSON.stringify(data));
				$form.find('.errorwarning').show();
			}
		},
		error: function(){
			$form.find('.errorwarning').find('.box-body').html('请检查是否已登录/已登录用户请联系管理员');
			$form.find('.errorwarning').show();
		}
	});
}

/**
 * ajax请求后刷新页面
 * @param $form form表单
 * @returns
 */
function ajaxSubmitReload($form){
	$form.find('.errorwarning').find('.box-body').html('');
	$form.find('.errorwarning').hide();
	$.ajax({
		url: $form.attr('action'),
		type: $form.attr('method'),
		data: $form.serialize(),
		dataType: 'json',
		success: function(data){
			if (data.code == 'SUCCESS') {
				window.location.reload();
			} else {
				$form.find('.errorwarning').find('.box-body').html(JSON.stringify(data));
				$form.find('.errorwarning').show();
			}
		},
		error: function(){
			$form.find('.errorwarning').find('.box-body').html('请检查是否已登录');
			$form.find('.errorwarning').show();
		}
	});
}

/**
 * 使用ajax方式删除信息，删除后刷新
 * @param url
 * @param msg
 * @returns
 */
function ajaxDelete(url, msg){
	layer.confirm(msg, {
		btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
			url: url,
			type: 'GET',
			dataType: 'json',
			success: function(data){
				if (data.code == 'SUCCESS') {
					layer.msg('删除成功', {icon: 1,time: 1000},function(){
						window.location.reload();
					});
				} else {
					layer.msg(JSON.stringify(data), {
						icon: 4,
						btn: ['确认']
					});
				}
			},
			error: function(){
				layer.msg('请检查是否已登录', {
					icon: 3,
					btn: ['确认']
				});
			}
		});
	});
}

