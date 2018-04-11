package com.sys.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.sys.entity.SysRole;

public interface SysRoleDao extends MyBaseRepository<SysRole, Long> {

	public Page<SysRole> findByNameLike(String name, Pageable pageable);
}
