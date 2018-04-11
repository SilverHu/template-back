package com.test.dao;

import java.util.Optional;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import com.alibaba.fastjson.JSON;
import com.sys.repository.SysRoleDao;
import com.sys.entity.SysRole;
import com.test.main.TestBase;

public class TestSysRoleDao extends TestBase {
	@Autowired
	private SysRoleDao sysRoleDao;

	@Test
	public void testInsert() {
		SysRole sysRole = new SysRole();
		sysRole.setName("测试角色2");
		sysRoleDao.save(sysRole);
		System.out.println("id = " + sysRole.getId());
		System.out.println("insert test success!");
		Optional<SysRole> optional = sysRoleDao.findById(sysRole.getId());
		System.out.println("insert sysRole = " + JSON.toJSONString(optional.orElse(null)));
	}
	
	@Test
	public void testSelectList() {
		Pageable pageable = PageRequest.of(0, 20);
		Page<SysRole> page = sysRoleDao.findAll(pageable);
		System.out.println("selectList = " + JSON.toJSONString(page.getContent()));
	}

	@Test
	public void testUpdateById() {
		SysRole sysRole = new SysRole();
		sysRole.setId(18L);
		sysRole.setName("测试角色000");
		sysRoleDao.save(sysRole);
		System.out.println("id = " + sysRole.getId());
		System.out.println("update test success!");

		Optional<SysRole> optional = sysRoleDao.findById(sysRole.getId());
		System.out.println("insert sysRole = " + JSON.toJSONString(optional.orElse(null)));
	}

	@Test
	public void testDeleteById() {
		if (sysRoleDao.existsById(20L)) {
			sysRoleDao.deleteById(20L);
		}
		System.out.println("delete test success!");
	}
}
