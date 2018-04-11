package com.sys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sys.entity.SysPermission;
import com.sys.exception.SysBusinessException;
import com.sys.service.SysPermissionService;
import com.util.Constants;
import com.util.Constants.Operation;

@Controller
@RequestMapping("/sys/permission")
public class SysPermissionController {
	@Autowired
	private SysPermissionService sysPermissionService;

	@RequestMapping("/findAll")
	public Object findAll(Model model, Pageable pageable) {
		Sort sort = Sort.by(Order.desc("weight"));
		if (pageable == null) {
			pageable = PageRequest.of(0, 20, sort);
		}
		model.addAttribute("page", sysPermissionService.findAll(pageable));
		return "sys/permission/list";
	}

	@RequestMapping("/save/go")
	public Object gosave(Model model, Long id) {
		if (id == null) {
			model.addAttribute(Constants.OPERATION, Operation.ADD);
		} else {
			model.addAttribute(Constants.OPERATION, Operation.UPDATE);
			model.addAttribute("entity", sysPermissionService.findById(id));
		}
		return "sys/permission/input";
	}

	@RequestMapping("/save")
	@ResponseBody
	public Object save(SysPermission syspermission) {
		sysPermissionService.save(syspermission);
		return Constants.SUCCESS;
	}

	@RequestMapping("/delete/{id}")
	@ResponseBody
	public Object deleteById(@PathVariable Long id) {
		if (id == null) {
			throw new SysBusinessException("id is null");
		}
		sysPermissionService.deleteById(id);
		return Constants.SUCCESS;
	}
}
