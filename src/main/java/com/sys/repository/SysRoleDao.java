package com.sys.repository;

import com.sys.entity.SysRole;

public interface SysRoleDao extends MyBaseRepository<SysRole, Long> {
	public SysRole findByName(String name);
}
