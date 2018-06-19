package com.sys.repository;

import com.sys.entity.SysUser;

public interface SysUserDao extends MyBaseRepository<SysUser, Long> {

	SysUser findByUsername(String user);

}
