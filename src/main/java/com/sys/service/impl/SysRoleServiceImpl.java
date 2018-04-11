package com.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sys.entity.SysRole;
import com.sys.repository.SysRoleDao;
import com.sys.service.SysRoleService;

@Service
public class SysRoleServiceImpl implements SysRoleService {

	@Autowired
	private SysRoleDao sysRoleDao;

	@Transactional
	@Override
	public void save(SysRole entity) {
		sysRoleDao.save(entity);
	}

	@Transactional
	@Override
	public void deleteById(Long id) {
		sysRoleDao.deleteById(id);
	}

	@Override
	public SysRole findById(Long id) {
		return sysRoleDao.findById(id).get();
	}

	@Override
	public Page<SysRole> findByNameLike(String name, Pageable pageable) {
		return sysRoleDao.findByNameLike(name, pageable);
	}

}
