package com.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页
 * 
 * @author SilverHu
 *
 */
public class Page<T> {

	private T queryObject; // 查询条件

	private String orderBy; // 排序

	private Integer size = 10; // 每页显示数据

	private Integer pageNo = 1; // 页码

	private Integer start = 0; // 查询起始位置

	private Integer total = 0; // 数据总量

	private List<T> list = new ArrayList<>(); // 分页列表

	private boolean pageSwitch = true; // 分页开关,true-分页查询 flase-不分页查询

	/**
	 * 查询条件
	 * 
	 * @return
	 */
	public T getQueryObject() {
		return queryObject;
	}

	/**
	 * 查询条件
	 * 
	 * @param queryObject
	 */
	public void setQueryObject(T queryObject) {
		this.queryObject = queryObject;
	}

	/**
	 * 排序
	 * 
	 * @return
	 */
	public String getOrderBy() {
		return orderBy;
	}

	/**
	 * 排序
	 * 
	 * @param orderBy
	 */
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	/**
	 * 每页显示数据，默认10
	 * 
	 * @return
	 */
	public Integer getSize() {
		return size;
	}

	/**
	 * 页码，默认1
	 * 
	 * @return
	 */
	public Integer getPageNo() {
		return pageNo;
	}

	/** 查询起始位置 */
	public Integer getStart() {
		return start;
	}

	/**
	 * 数据总量
	 * 
	 * @return
	 */
	public Integer getTotal() {
		return total;
	}

	/**
	 * 数据总量，默认0（total不合法取默认值）
	 * 
	 * @param total
	 */
	public void setTotal(Integer total) {
		if (total == null || total <= 0) {
			this.total = 0;
		} else {
			this.total = total;
		}
	}

	/**
	 * 分页列表
	 * 
	 * @return
	 */
	public List<T> getList() {
		return list;
	}

	/**
	 * 分页列表
	 * 
	 * @param list
	 */
	public void setList(List<T> list) {
		this.list = list;
	}

	/**
	 * 分页开关,true-分页查询 flase-不分页查询
	 * 
	 * @return
	 */
	public boolean isPageSwitch() {
		return pageSwitch;
	}

	/**
	 * 分页开关,true-分页查询 flase-不分页查询<br/>
	 * 如果设置分页查询，请设置页码和查询数量，不设置则使用默认页码1、数量10<br/>
	 * 
	 * @param pageSwitch
	 */
	public void setPageSwitch(boolean pageSwitch) {
		this.pageSwitch = pageSwitch;
	}

	/**
	 * 默认分页，请设置页码和查询数量，不设置则使用默认页码1、数量10
	 */
	public Page() {
		super();
	}

	/**
	 * 如果设置分页查询，请设置页码和查询数量，不设置则使用默认页码1、数量10
	 * 
	 * @param pageSwitch
	 *            分页开关,true-分页查询 flase-不分页查询
	 */
	public Page(boolean pageSwitch) {
		super();
		this.pageSwitch = pageSwitch;
	}

	/**
	 * 设置页码和查询数量
	 * 
	 * @param pageNo
	 *            页码，默认1（pageNo不合法取默认值）
	 * @param size
	 *            每页显示数据，默认10（size不合法取默认值）
	 */
	public void setPageConditon(Integer pageNo, Integer size) {
		if (pageNo == null || pageNo <= 0) {
			this.pageNo = 1;
		} else {
			this.pageNo = pageNo;
		}

		if (size == null || size <= 0) {
			this.size = 10;
		} else {
			this.size = size;
		}

		this.start = (this.pageNo - 1) * this.size;
	}
}
