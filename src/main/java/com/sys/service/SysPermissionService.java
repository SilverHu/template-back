package com.sys.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.sys.entity.SysPermission;

public interface SysPermissionService {

	public void save(SysPermission entity);

	public void deleteById(Long id);

	public SysPermission findById(Long id);

	/**
	 * 查询顶级菜单（倒叙）
	 * 
	 * @return
	 */
	public List<SysPermission> findByParentidIsNull();

	/**
	 * 根据类型查询菜单
	 * 
	 * @param type
	 * @return
	 */
	public List<SysPermission> findByType(Byte type);

	public Page<SysPermission> findAll(Pageable pageable);

	/**
	 * 判断权限标识是否已存在
	 * 
	 * @param id
	 * @param permission
	 * @return
	 */
	public boolean isExists(Long id, String permission);
}
