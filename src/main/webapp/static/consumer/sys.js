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
				$form.find('.errorwarning').find('.box-body').html(data);
				$form.find('.errorwarning').show();
			}
		},
		error: function(){
			$form.find('.errorwarning').find('.box-body').html('请检查是否已登录');
			$form.find('.errorwarning').show();
		}
	});
}

