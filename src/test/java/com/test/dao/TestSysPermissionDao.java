package com.test.dao;
/*package com.test.dao;

import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.templete.entity.SysResource;
import com.templete.repository.SysResourceMapper;
import com.test.main.TestBase;
import com.util.Page;

public class TestSysResourceDao extends TestBase {
	@Autowired
	private SysResourceMapper sysResourceMapper;

	public void testInsert() {
		SysResource sysResource = new SysResource();
		sysResource.setCode("TEST");
		sysResource.setName("Test测试");
		sysResource.setParentId(0L);
		sysResource.setLink("/test");
		sysResource.setPermission("TEST:read");
		sysResource.setUrlPattern("/test");
		sysResource.setDescription("测试");
		sysResource.setType((byte) 1);
		sysResource.setCreateBy("admin");
		sysResource.setCreateDate(new Date());
		sysResource.setUpdateBy("admin");
		sysResource.setUpdateDate(new Date());

		sysResourceMapper.insert(sysResource);

		System.out.println("id = " + sysResource.getId());
		System.out.println("insert test success!");

		sysResource = sysResourceMapper.selectById(sysResource.getId());
		JSONObject json = (JSONObject) JSON.toJSON(sysResource);
		System.out.println("insert sysResource = " + json.toString());
	}

	public void testSelectList() {
		SysResource sysResource = new SysResource();
		sysResource.setCode("TEST");
		sysResource.setName("Test测试");
		sysResource.setParentId(0L);
		sysResource.setPermission("TEST:read");
		sysResource.setUrlPattern("/test");
		sysResource.setDescription("测试");
		sysResource.setType((byte) 1);
		sysResource.setCreateBy("admin");
		sysResource.setUpdateBy("admin");

		Page<SysResource> page = new Page<>();
		page.setQueryObject(sysResource);
		page.setOrderBy("create_date desc");
		page.setList(sysResourceMapper.selectList(page));
		page.setTotal(sysResourceMapper.selectCount(page));
		JSONObject json = (JSONObject) JSON.toJSON(page);
		System.out.println("selectList = " + json.toString());
	}

	public void testUpdateById() {
		SysResource sysResource = new SysResource();
		sysResource.setId(18L);
		sysResource.setCode("TEST001");
		sysResource.setName("Test测试");
		sysResource.setParentId(0L);
		sysResource.setLink("/test");
		sysResource.setPermission("TEST:read");
		sysResource.setUrlPattern("/test");
		sysResource.setDescription("测试");
		sysResource.setType((byte) 1);
		sysResource.setCreateBy("admin");
		sysResource.setCreateDate(new Date());
		sysResource.setUpdateBy("admin");
		sysResource.setUpdateDate(new Date());
		sysResourceMapper.updateByIdSelective(sysResource);
		System.out.println("id = " + sysResource.getId());
		System.out.println("update test success!");

		sysResource = sysResourceMapper.selectById(sysResource.getId());
		JSONObject json = (JSONObject) JSON.toJSON(sysResource);
		System.out.println("update sysResource = " + json.toString());
	}

	@Test
	public void testDeleteById() {
		sysResourceMapper.deleteById(19L);
		System.out.println("delete test success!");
	}
}
*/