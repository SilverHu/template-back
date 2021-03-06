package com.sys.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
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
		if (entity != null) {
			sysUserDao.save(entity);
		}
	}

	@Transactional
	@Override
	public void grantPermissions(SysUser entity) {
		if (entity == null || entity.getId() == null) {
			return;
		}
		// 删除原有权限

		// 批量新增权限
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
	public SysUser findByUsername(String username) {
		return sysUserDao.findByUsername(username);
	}

	@Override
	public Page<SysUser> findByCondition(Pageable pageable, SysUser sysUser) {
		return sysUserDao.findAll(new Specification<SysUser>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<SysUser> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> list = new ArrayList<Predicate>();
				if (sysUser != null) {
					// 根据用户名查询
					if (StringUtils.isNotBlank(sysUser.getUsername())) {
						list.add(cb.like(root.get("username").as(String.class), "%" + sysUser.getUsername() + "%"));
					}
					if (sysUser.getStatus() != null) {
						list.add(cb.equal(root.get("status").as(Boolean.class), sysUser.getStatus()));
					}
				}
				Predicate[] p = new Predicate[list.size()];
				return cb.and(list.toArray(p));
			}
		}, pageable);
	}

	@Override
	public boolean isExists(Long id, String username) {
		SysUser sysUser = sysUserDao.findByUsername(username);
		if (sysUser == null || sysUser.getId() == null) {
			return false;
		} else if (sysUser.getId().equals(id)) {
			return false;
		}
		return true;
	}

}
