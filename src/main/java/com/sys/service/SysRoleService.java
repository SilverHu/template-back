package com.sys.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.sys.entity.SysRole;

public interface SysRoleService {

	public void save(SysRole entity);

	public void deleteById(Long id);

	public SysRole findById(Long id);
	
	public List<SysRole> findAll();

	public Page<SysRole> findByCondition(Pageable pageable, SysRole sysRole);
	
	/**
	 * 判断角色名是否已存在
	 * 
	 * @param id
	 * @param username
	 * @return
	 */
	public boolean isExists(Long id, String name);
}
