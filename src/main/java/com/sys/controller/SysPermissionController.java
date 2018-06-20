package com.sys.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sys.entity.SysPermission;
import com.sys.exception.SysBusinessException;
import com.sys.service.SysPermissionService;
import com.util.Constants;
import com.util.ResponseResult;
import com.util.ResponseResult.ResponseCode;
import com.util.ResponseResult.SaveOperation;

@Controller
@RequestMapping("sys/permission")
public class SysPermissionController {
	@Autowired
	private SysPermissionService sysPermissionService;

	@RequestMapping("/get")
	public Object findAll(Model model) {
		model.addAttribute("list", sysPermissionService.findByParentidIsNull());
		return "sys/permission/list";
	}

	@RequestMapping("/get/{id}")
	@ResponseBody
	public Object getById(Model model, @PathVariable Long id) {
		return sysPermissionService.findById(id);
	}
	
	@RequestMapping("/save/go")
	public Object gosave(Model model, Long id) {
		model.addAttribute("parentMenus", sysPermissionService.findByType((byte) 1)); // 查询菜单
		if (id == null) {
			model.addAttribute(Constants.OPERATION, SaveOperation.ADD);
		} else {
			model.addAttribute(Constants.OPERATION, SaveOperation.UPDATE);
			model.addAttribute("entity", sysPermissionService.findById(id));
		}
		return "sys/permission/input";
	}

	@RequestMapping("/save")
	@ResponseBody
	public Object save(SysPermission syspermission) {
		if (StringUtils.isBlank(syspermission.getPermission())) {
			return new ResponseResult(ResponseCode.ERROR_400, "权限字符不能为空");
		} else if (sysPermissionService.isExists(syspermission.getId(), syspermission.getPermission())) {
			return new ResponseResult(ResponseCode.ERROR_400, "权限字符已存在");
		}
		sysPermissionService.save(syspermission);
		return ResponseResult.success;
	}

	@RequestMapping("/delete/{id}")
	@ResponseBody
	public Object deleteById(@PathVariable Long id) {
		if (id == null) {
			throw new SysBusinessException("id is null");
		}
		sysPermissionService.deleteById(id);
		return ResponseResult.success;
	}
}
