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

import com.sys.entity.SysPermission;
import com.sys.entity.SysRole;
import com.sys.exception.SysBusinessException;
import com.sys.service.SysPermissionService;
import com.sys.service.SysRoleService;
import com.util.Constants;
import com.util.ResponseResult;
import com.util.ResponseResult.ResponseCode;
import com.util.ResponseResult.SaveOperation;

@Controller
@RequestMapping("sys/role")
public class SysRoleController {
	@Autowired
	private SysRoleService sysRoleService;
	
	@Autowired
	private SysPermissionService sysPermissionService;

	/**
	 * 角色授权
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
		SysRole sysRole = sysRoleService.findById(id);
		if (sysRole == null) {
			return new ResponseResult(ResponseCode.ERROR_400, "角色不存在");
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
		sysRole.setPermissions(lastPermissions);
		sysRoleService.save(sysRole);
		return ResponseResult.success;
	}

	/**
	 * 进入授权页
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/permission/go/{id}")
	public Object goGrantPermissions(Model model,@PathVariable Long id){
		if (id == null) {
			throw new SysBusinessException("id is null");
		}
		SysRole entity = sysRoleService.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("permissions", sysPermissionService.findByParentidIsNull());
		return "sys/role/permission";
	}

	@RequestMapping("/get")
	public Object findAll() {
		return "sys/role/list";
	}

	/**
	 * 分页查询
	 * 
	 * @param page
	 * @param size
	 * @param sysRole
	 * @return
	 */
	@RequestMapping("/get/page")
	@ResponseBody
	public Object findByPage(Integer page, Integer size, SysRole sysRole) {
		if (page == null) {
			page = 0;
		}
		if (size == null) {
			size = 10;
		}
		Pageable pageable = PageRequest.of(page, size);
		return sysRoleService.findByCondition(pageable, sysRole);
	}
	
	@ResponseBody
	public Object getById(@PathVariable Long id) {
		return sysRoleService.findById(id);
	}
	
	@RequestMapping("/save/go")
	public Object gosave(Model model, Long id) {
		if (id == null) {
			model.addAttribute(Constants.OPERATION, SaveOperation.ADD);
		} else {
			model.addAttribute(Constants.OPERATION, SaveOperation.UPDATE);
			model.addAttribute("entity", sysRoleService.findById(id));
		}
		return "sys/role/input";
	}

	@RequestMapping("/save")
	@ResponseBody
	public Object save(SysRole sysRole) {
		if (sysRole == null) {
			return new ResponseResult(ResponseCode.ERROR_400, "参数错误");
		}
		// 角色权限不变
		if (sysRole.getId() != null) {
			SysRole old = sysRoleService.findById(sysRole.getId());
			if (old != null) {
				sysRole.setPermissions(old.getPermissions());
			}
		}
		sysRoleService.save(sysRole);
		return ResponseResult.success;
	}

	@RequestMapping("/delete/{id}")
	@ResponseBody
	public Object deleteById(@PathVariable Long id) {
		if (id == null) {
			throw new SysBusinessException("id is null");
		}
		sysRoleService.deleteById(id);
		return ResponseResult.success;
	}
}
