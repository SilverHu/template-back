/**
 * 
 * @param form form表单
 * @param url 请求url
 * @param jumpUrl 请求成功之后跳转的url
 */
function ajaxSubmit(formId,url,jumpUrl) {
	//$(form).find('[type=submit]').prop('disabled',false);
	$('#'+formId).find('.errorwarning').eq(0).find('.box-body').eq(0).html('');
	$('#'+formId).find('.errorwarning').hide();
	var options = {
		dataType : "json",
		url : url,
		success : function(data) {
			console.log(data);
			if (data.code == "SUCCESS") {
				window.location.href = jumpUrl;
			} else {
				$('#'+formId).find('.errorwarning').eq(0).find('.box-body').eq(0).html(data);
				console.log($('#'+formId).find('.errorwarning').eq(0).find('.box-body').eq(0).html());
				$('#'+formId).find('.errorwarning').show();
			}
			$('#'+formId).find('[type=submit]').prop('disabled',true);
		},
		error : function(result) {
			$('#'+formId).find('.errorwarning').find('.box-body').html(result);
			$('#'+formId).find('.errorwarning').show();
			$('#'+formId).find('[type=submit]').prop('disabled',true);
		}
	};
	$('#'+formId).ajaxSubmit(options);
}

