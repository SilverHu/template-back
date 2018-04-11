package com.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sys.entity.SysUser;
import com.sys.repository.SysUserDao;
import com.sys.service.SysUserService;

@Service
public class SysUserServiceImpl implements SysUserService {

	@Autowired
	private SysUserDao sysUserDao;

	@Transactional
	@Override
	public void save(SysUser entity) {
		sysUserDao.save(entity);
	}

	@Transactional
	@Override
	public void deleteById(Long id) {
		sysUserDao.deleteById(id);
	}

	@Override
	public SysUser findById(Long id) {
		return sysUserDao.findById(id).get();
	}

	@Override
	public Page<SysUser> findByUsernameLike(String username, Pageable pageable) {
		return sysUserDao.findByUsernameLike(username, pageable);
	}

}
