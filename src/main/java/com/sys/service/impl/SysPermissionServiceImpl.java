package com.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sys.entity.SysPermission;
import com.sys.repository.SysPermissionDao;
import com.sys.service.SysPermissionService;

@Service
public class SysPermissionServiceImpl implements SysPermissionService {

	@Autowired
	private SysPermissionDao sysPermissionDao;

	@Transactional
	@Override
	public void save(SysPermission entity) {
		sysPermissionDao.save(entity);
	}

	@Transactional
	@Override
	public void deleteById(Long id) {
		sysPermissionDao.deleteById(id);
	}

	@Override
	public SysPermission findById(Long id) {
		return sysPermissionDao.findById(id).get();
	}

	@Override
	public List<SysPermission> findByParentidIsNull() {
		return sysPermissionDao.findByParentidIsNullOrderByWeightDesc();
	}

	@Override
	public List<SysPermission> findByType(Byte type) {
		return sysPermissionDao.findByType(type);
	}

	@Override
	public List<SysPermission> findAll() {
		return sysPermissionDao.findAll();
	}

	@Override
	public boolean isExists(Long id, String permission) {
		SysPermission sysPermission = sysPermissionDao.findByPermission(permission);
		if (sysPermission == null || sysPermission.getId() == null) {
			return false;
		} else if (sysPermission.getId().equals(id)) {
			return false;
		}
		return true;
	}

}
