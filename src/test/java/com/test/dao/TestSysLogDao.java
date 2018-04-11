/*package com.test.dao;

import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.templete.entity.SysLog;
import com.templete.repository.SysLogMapper;
import com.test.main.TestBase;
import com.util.Page;


public class TestSysLogDao extends TestBase{
	@Autowired
	private SysLogMapper sysLogMapper;

	public void testInsert() {
		SysLog sysLog = new SysLog();
		sysLog.setOperater("admin");
		sysLog.setMethod("add");
		sysLog.setTableName("xxx");
		sysLog.setCommandType((byte) 1);
		sysLog.setIp("127.0.0.1");
		sysLog.setCreateBy("admin");
		sysLog.setCreateDate(new Date());
		sysLog.setUpdateBy("admin");
		sysLog.setUpdateDate(new Date());
		sysLog.setSqlCommand("insert xxx(xxx) values(xxx)");
		sysLogMapper.insert(sysLog);
		System.out.println("id = " + sysLog.getId());
		System.out.println("insert test success!");

		SysLog log = sysLogMapper.selectById(sysLog.getId());
		JSONObject json = (JSONObject) JSON.toJSON(log);
		System.out.println("insert sysLog = " + json.toString());
	}
	
	@Test
	public void testSelectList() {
		SysLog sysLog = new SysLog();
		sysLog.setOperater("admin");
		sysLog.setMethod("add");
		sysLog.setTableName("xxx");
		sysLog.setCommandType((byte) 1);
		sysLog.setIp("127.0.0.1");
		sysLog.setCreateBy("admin");
		sysLog.setUpdateBy("admin");
		sysLog.setSqlCommand("insert xxx(xxx) values(xxx)");

		Page<SysLog> page = new Page<>();
		page.setQueryObject(sysLog);
		page.setOrderBy("create_date desc");
		page.setList(sysLogMapper.selectList(page));
		page.setTotal(sysLogMapper.selectCount(page));
		JSONObject json = (JSONObject) JSON.toJSON(page);
		System.out.println("selectList = " + json.toString());
	}

	public void testUpdateById() {
		SysLog sysLog = new SysLog();
		sysLog.setId(20L);
		sysLog.setOperater("admin");
		sysLog.setMethod("update");
		sysLog.setTableName("ooxx");
		sysLog.setIp("127.0.0.1");
		sysLog.setSqlCommand("insert ooxx(ooxx) values(ooxx)");
		sysLogMapper.updateByIdSelective(sysLog);
		System.out.println("id = " + sysLog.getId());
		System.out.println("update test success!");

		SysLog log = sysLogMapper.selectById(sysLog.getId());
		JSONObject json = (JSONObject) JSON.toJSON(log);
		System.out.println("update sysLog = " + json.toString());
	}

	public void testDeleteById() {
		sysLogMapper.deleteById(18L);
		System.out.println("delete test success!");
	}
}
*/