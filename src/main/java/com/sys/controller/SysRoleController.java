package com.sys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sys.entity.SysRole;
import com.sys.exception.SysBusinessException;
import com.sys.service.SysRoleService;
import com.util.Constants;
import com.util.ResponseResult;
import com.util.ResponseResult.SaveOperation;

@Controller
@RequestMapping("sys/role")
public class SysRoleController {
	@Autowired
	private SysRoleService sysRoleService;

	@RequestMapping("/get")
	public Object findAll(Model model, Integer page, Integer size,SysRole sysRole) {
		if (page == null) {
			page = 0;
		}
		if (size == null) {
			size = 10;
		}
		Pageable pageable = PageRequest.of(page, size);
		model.addAttribute("page", sysRoleService.findByCondition(pageable, sysRole));
		return "sys/role/list";
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
	public Object save(SysRole sysrole) {
		sysRoleService.save(sysrole);
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
