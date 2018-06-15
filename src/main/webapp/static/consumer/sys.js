/**
 * 
 * @param form_id form表单的id
 * @param request_url 请求的url
 * @param jump_url 请求成功之后跳转的url
 */
function ajaxSubmit(form,jump_url) {
	$(form).find('[type=submit]').prop('disabled',true);
	$(form).find('#errorwarning').find('.box-body').html();
	$(form).find('#errorwarning').hide();
	var options = {
		dataType : "json",
		url : $(form).attr('action'),
		success : function(data) {
			if (data.code == "success") {
				window.location.href = jump_url;
			} else {
				var code = null;
				if(data.code){
					code = StatusCodeMsg.get(data.code);
				}else{
					code = data.msg;
				}
			}
			$(form).find('[type=submit]').prop('disabled',false);
		},
		error : function(result) {
			$(form).find('#errorwarning').find('.box-body').html(result);
			$(form).find('#errorwarning').show();
			$(form).find('[type=submit]').prop('disabled',false);
		}
	};
	$(form).ajaxSubmit(options);
}

