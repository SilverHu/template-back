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
	public Page<SysRole> findByCondition(Pageable pageable, SysRole sysRole) {
		return sysRoleDao.findAll(new Specification<SysRole>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<SysRole> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> list = new ArrayList<Predicate>();
				if (sysRole != null) {
					// 根据名称查询
					if (StringUtils.isNotBlank(sysRole.getName())) {
						list.add(cb.like(root.get("name").as(String.class), "%" + sysRole.getName() + "%"));
					}
				}
				Predicate[] p = new Predicate[list.size()];
				return cb.and(list.toArray(p));
			}
		}, pageable);
	}

}
