package com.sys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sys.entity.SysUser;
import com.sys.exception.SysBusinessException;
import com.sys.service.SysUserService;
import com.util.Constants;
import com.util.ResponseResult;
import com.util.ResponseResult.SaveOperation;

@Controller
@RequestMapping("sys/user")
public class SysUserController {

	@Autowired
	private SysUserService sysUserService;

	@RequestMapping("/get")
	public Object findAll(Model model, Pageable pageable, String username) {
		model.addAttribute("page", sysUserService.findByUsernameLike(username, pageable));
		return "sys/user/list";
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
	public Object save(SysUser sysuser) {
		sysUserService.save(sysuser);
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
