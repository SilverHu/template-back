/*
 * Spring jpa + DataTables分页查询插件
 * v1.0.0 (sliverhu)
 */

(function($) {
	/**
	 * 对jpa的page初始化分页表格
	 * 
	 * @param
	 */
	$.fn.initAjaxDataTable = function(options) {
		var opts = $.extend($.fn.initAjaxDataTable.defaults, options); // 赋值
		var _table = $(this).DataTable($.extend(opts.Data_Table_Options, {
			ajax : function(data, callback, settings) {
				$.ajax({
					url : opts.url + '?page='+parseInt(data.start/data.length)+"&size="+data.length,
					type : 'POST',
					data : opts.form.serialize(),
					dataType : 'json',
					success : function(result) { // 封装返回数据，这里仅演示了修改属性名
						var returnData = {};
						//returnData.draw = result.draw;// 请求次数计数器，每次发送给服务器后原封返回，为了确保每次请求都能对应到服务器返回到的数据
						returnData.recordsTotal = result.totalElements;
						returnData.recordsFiltered = result.totalElements;// 后台不实现过滤功能，每次查询均视作全部结果
						returnData.data = result.content;
						callback(returnData);
					},
					error: function(){
						layer.msg('请求失败', {
							icon: 4,
							btn: ['确认']
						});
					}
				});
			},
			columns : opts.columns
		}));
		return _table;
	}

	/* 默认属性 */
	$.fn.initAjaxDataTable.defaults = {
		url : '', // ajax请求url
		form : function($form){
			return $form; // ajax请求表单
		},
		columns : [], // 请求完成后的column填充
		Data_Table_Options : { // DataTables初始化选项
			autoWidth : false, // 禁用自动调整列宽
			stripeClasses : [ 'odd', 'even' ], // 为奇偶行加上样式，兼容不支持CSS伪类的场合
			order : [], // 取消默认排序查询,否则复选框一列会出现小箭头
			processing : false, // 隐藏加载提示,自行处理
			serverSide : true, // 启用服务器端分页
			searching : false, // 禁用原生搜索
			stateSave : false,// 刷新时是否保存状态
			lengthChange : false, // 是否允许用户改变表格每页显示的记录数
			ordering : false, // 是否允许用户排序
			pagingType : 'full_numbers',
			paging : true, // 是否分页
			pageLength : 10,
			language : {
				'infoEmpty' : '没有记录可以显示',
				'paginate' : {
					'first' : '首页',
					'last' : '尾页',
					'previous' : '上一页',
					'next' : '下一页'
				},
				'lengthMenu' : '每页_MENU_项',
				'zeroRecords' : '没有匹配结果',
				'emptyTable' : '无可用数据',
				'info' : '第_PAGE_页（共_PAGES_页/_MAX_条）',
				'infoFiltered' : ' - 从 _MAX_ 记录中过滤',
				'search' : '搜索',
				'loadingRecords' : '请等待，数据正在加载中......',
				'thousands' : ',',
				'aria' : {
					'sortAscending' : '以升序排列',
					'sortDescending' : '以降序排列'
				}
			}
		}
	};
})(jQuery);