package com.sys.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.sys.entity.SysRole;

public interface SysRoleService {

	public void save(SysRole entity);

	public void deleteById(Long id);

	public SysRole findById(Long id);

	public Page<SysRole> findByCondition(Pageable pageable, SysRole sysRole);
}
