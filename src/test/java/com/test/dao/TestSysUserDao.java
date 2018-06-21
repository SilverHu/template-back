package com.test.dao;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.orm.jpa.JpaTransactionManager;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.sys.entity.SysPermission;
import com.sys.entity.SysUser;
import com.sys.repository.SysPermissionDao;
import com.sys.repository.SysUserDao;
import com.test.main.TestBase;

public class TestSysUserDao extends TestBase {
	@Autowired
	private SysUserDao sysUserDao;
	@Autowired
	private SysPermissionDao sysPermissionDao;

	@Resource(name = "transactionManager")
	private JpaTransactionManager tm;

	@Test
	public void testInsert() {
		// 保存权限
		SysPermission permission = new SysPermission();
		permission.setName("permission1");
		sysPermissionDao.save(permission);
		permission.setId(null);
		permission.setName("permission2");
		sysPermissionDao.save(permission);

		// 保存用户
		SysUser sysUser = new SysUser();
		sysUser.setUsername("admin00");
		sysUser.setName("silver");
		sysUser.setPassword("md5");
		sysUser.setEmail("silver@126.com");
		sysUser.setStatus(true);
		Set<SysPermission> permissionList = new HashSet<>();
		permissionList.add(permission);
		sysUser.setPermissions(permissionList);
		sysUserDao.save(sysUser);

		permission.setName("permission1");
		permissionList.add(permission);
		sysUser.setPermissions(permissionList);
		sysUserDao.save(sysUser);

		Optional<SysUser> optional = sysUserDao.findById(sysUser.getId());
		System.out.println("insert sysUser = "
				+ JSON.toJSONString(optional.orElse(null), SerializerFeature.DisableCircularReferenceDetect));
	}

	@Test
	public void testSelectList() {
		SysUser sysUser = new SysUser();
		sysUser.setName("silver");
		sysUser.setPassword("md5");
		sysUser.setEmail("silver@126.com");

		Pageable pageable = PageRequest.of(0, 20);
		Page<SysUser> page = sysUserDao.findAll(pageable);
		JSONObject json = (JSONObject) JSON.toJSON(page);
		System.out.println("selectList = " + json.toString());
	}

	@Test
	public void testUpdateById() {
		SysUser sysUser = new SysUser();
		sysUser.setId(18L);
		sysUser.setUsername("test123");
		sysUser.setName("test");
		sysUser.setPassword("123456");
		sysUser.setEmail("silver@126.com");
		sysUserDao.save(sysUser);
		Optional<SysUser> optional = sysUserDao.findById(sysUser.getId());
		System.out.println("update test success! : " + JSON.toJSONString(optional.orElse(null)));
	}

	@Test
	public void testDeleteById() {
		if (sysUserDao.existsById(20L)) {
			sysUserDao.deleteById(20L);
		}
		System.out.println("delete test success!");
	}

	@Test
	public void testDeleteAll() {
		sysUserDao.deleteAll();
		Iterable<SysUser> userList = sysUserDao.findAll();
		System.out.println(JSON.toJSONString(userList));
	}
}
