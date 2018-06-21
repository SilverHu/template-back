package com.sys.controller;

import java.util.LinkedHashSet;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.framework.shiro.CredentialsMatcher;
import com.sys.entity.SysPermission;
import com.sys.entity.SysUser;
import com.sys.exception.SysBusinessException;
import com.sys.service.SysPermissionService;
import com.sys.service.SysUserService;
import com.util.Constants;
import com.util.ResponseResult;
import com.util.ResponseResult.ResponseCode;
import com.util.ResponseResult.SaveOperation;

@Controller
@RequestMapping("sys/user")
public class SysUserController {

	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private SysPermissionService sysPermissionService;

	/**
	 * 用户授权
	 * 
	 * @param id
	 * @param permissions
	 * @return
	 */
	@RequestMapping("/permission")
	@ResponseBody
	public Object grantPermissions(Long id, String permissions) {
		if (id == null) {
			return new ResponseResult(ResponseCode.ERROR_400, "参数错误");
		}
		SysUser sysUser = sysUserService.findById(id);
		if (sysUser == null) {
			return new ResponseResult(ResponseCode.ERROR_400, "用户不存在");
		}
		// 获取最新权限
		Set<SysPermission> lastPermissions = new LinkedHashSet<>();
		if (StringUtils.isNotBlank(permissions)) {
			String[] permissionIds = permissions.split(",");
			for (String permissionId : permissionIds) {
				if (NumberUtils.isDigits(permissionId)) {
					SysPermission sysPermission = new SysPermission();
					sysPermission.setId(Long.valueOf(permissionId));
					lastPermissions.add(sysPermission);
				}
			}
		}
		sysUser.setPermissions(lastPermissions);
		sysUserService.save(sysUser);
		return ResponseResult.success;
	}

	/**
	 * 进入授权页
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/permission/go/{id}")
	public Object goGrantPermissions(Model model, @PathVariable Long id) {
		if (id == null) {
			throw new SysBusinessException("id is null");
		}
		SysUser entity = sysUserService.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("permissions", sysPermissionService.findByParentidIsNull());
		return "sys/user/permission";
	}

	@RequestMapping("/get")
	public Object page(Model model) {
		return "sys/user/list";
	}

	/**
	 * 分页查询
	 * 
	 * @param page
	 * @param size
	 * @param sysUser
	 * @return
	 */
	@RequestMapping("/get/page")
	@ResponseBody
	public Object findByPage(Integer page, Integer size, SysUser sysUser) {
		if (page == null) {
			page = 0;
		}
		if (size == null) {
			size = 10;
		}
		Pageable pageable = PageRequest.of(page, size);
		return sysUserService.findByCondition(pageable, sysUser);
	}

	@RequestMapping("/save/go")
	public Object gosave(Model model, Long id) {
		if (id == null) {
			model.addAttribute(Constants.OPERATION, SaveOperation.ADD);
		} else {
			model.addAttribute(Constants.OPERATION, SaveOperation.UPDATE);
			model.addAttribute("entity", sysUserService.findById(id));
		}
		return "sys/user/input";
	}

	@RequestMapping("/save")
	@ResponseBody
	public Object save(SysUser sysUser) {
		if (sysUser == null || StringUtils.isBlank(sysUser.getUsername())) {
			return new ResponseResult(ResponseCode.ERROR_400, "用户名不能为空");
		}
		// 新增用户，密码不能为空
		if (sysUser.getId() == null && StringUtils.isBlank(sysUser.getPassword())) {
			return new ResponseResult(ResponseCode.ERROR_400, "密码不能为空");
		}

		if (sysUser.getId() != null) {
			// 用户已存在，不更新权限；密码为空不更新密码
			SysUser old = sysUserService.findById(sysUser.getId());
			if (old != null) {
				sysUser.setPermissions(old.getPermissions());
				if (StringUtils.isBlank(sysUser.getPassword())) {
					sysUser.setPassword(old.getPassword());
				} else {
					sysUser.setPassword(CredentialsMatcher.encrypt(sysUser.getUsername(), sysUser.getPassword()));
				}
			}
		} else {
			// 新增用户，密码加密存储
			sysUser.setPassword(CredentialsMatcher.encrypt(sysUser.getUsername(), sysUser.getPassword()));
		}

		sysUserService.save(sysUser);
		return ResponseResult.success;
	}

	@RequestMapping("/delete/{id}")
	@ResponseBody
	public Object deleteById(@PathVariable Long id) {
		if (id == null) {
			throw new SysBusinessException("id is null");
		}
		sysUserService.deleteById(id);
		return ResponseResult.success;
	}

}
