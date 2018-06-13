package com.sys.repository;



import java.util.List;

import com.sys.entity.SysPermission;

public interface SysPermissionDao extends MyBaseRepository<SysPermission, Long> {
	
	/**
	 * 查询顶级菜单
	 * @return
	 */
	List<SysPermission> findByParentidIsNullOrderByWeightDesc();
	
}
