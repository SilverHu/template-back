package com.sys.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.sys.entity.SysUser;

public interface SysUserService {

	public void save(SysUser entity);

	public void deleteById(Long id);

	public SysUser findById(Long id);
	
	public SysUser findByUsername(String username);

	public Page<SysUser> findByUsernameLike(String username, Pageable pageable);
}
