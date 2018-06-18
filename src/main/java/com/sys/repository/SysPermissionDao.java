package com.sys.repository;



import java.util.List;

import com.sys.entity.SysPermission;

public interface SysPermissionDao extends MyBaseRepository<SysPermission, Long> {
	
	/**
	 * 查询顶级菜单（倒叙）
	 * @return
	 */
	public List<SysPermission> findByParentidIsNullOrderByWeightDesc();

	/**
	 * 根据类型查询菜单
	 * @param type
	 * @return
	 */
	public List<SysPermission> findByType(Byte type);
	
	public SysPermission findByPermission(String permission);
}
