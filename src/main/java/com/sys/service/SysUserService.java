package com.sys.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.sys.entity.SysUser;

public interface SysUserService {

	public void save(SysUser entity);

	/**
	 * 授权
	 * @param entity
	 */
	public void grantPermissions(SysUser entity);

	public void deleteById(Long id);

	public SysUser findById(Long id);

	public SysUser findByUsername(String username);

	public Page<SysUser> findByCondition(Pageable pageable, SysUser sysUser);
	
	/**
	 * 判断用户名是否已存在
	 * 
	 * @param id
	 * @param username
	 * @return
	 */
	public boolean isExists(Long id, String username);
}
