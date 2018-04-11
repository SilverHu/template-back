package com.sys.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.util.Constants.Operation;

@Controller
@RequestMapping("/sys/role")
public class SysRoleController {
	@Autowired
	private SysRoleService sysRoleService;

	@RequestMapping("/get")
	public Object findAll(Model model, Pageable pageable, String name) {
		model.addAttribute("page", sysRoleService.findByNameLike(name, pageable));
		return "sys/role/list";
	}

	@RequestMapping("/save/go")
	public Object gosave(Model model, Long id) {
		if (id == null) {
			model.addAttribute(Constants.OPERATION, Operation.ADD);
		} else {
			model.addAttribute(Constants.OPERATION, Operation.UPDATE);
			model.addAttribute("entity", sysRoleService.findById(id));
		}
		return "sys/role/input";
	}

	@RequestMapping("/save")
	@ResponseBody
	public Object save(SysRole sysrole) {
		sysRoleService.save(sysrole);
		return Constants.SUCCESS;
	}

	@RequestMapping("/delete/{id}")
	@ResponseBody
	public Object deleteById(@PathVariable Long id) {
		if (id == null) {
			throw new SysBusinessException("id is null");
		}
		sysRoleService.deleteById(id);
		return Constants.SUCCESS;
	}
}
