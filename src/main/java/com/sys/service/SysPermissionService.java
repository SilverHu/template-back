package com.sys.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.sys.entity.SysPermission;

public interface SysPermissionService {

	public void save(SysPermission entity);

	public void deleteById(Long id);

	public SysPermission findById(Long id);

	public Page<SysPermission> findAll(Pageable pageable);
}
