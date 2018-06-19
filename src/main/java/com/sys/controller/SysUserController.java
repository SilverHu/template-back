package com.sys.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.framework.shiro.CredentialsMatcher;
import com.sys.entity.SysUser;
import com.sys.exception.SysBusinessException;
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

	@RequestMapping("/get")
	public Object findAll(Model model, Integer page, Integer size, SysUser sysUser) {
		if (page == null) {
			page = 0;
		}
		if (size == null) {
			size = 10;
		}
		Pageable pageable = PageRequest.of(page, size);
		model.addAttribute("page", sysUserService.findByCondition(pageable, sysUser));
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
		if (sysuser == null) {
			return new ResponseResult(ResponseCode.ERROR_400, "用户名/密码不能为空");
		}
		if (StringUtils.isNotBlank(sysuser.getUsername()) && StringUtils.isNotBlank(sysuser.getPassword())) {
			sysuser.setPassword(CredentialsMatcher.encrypt(sysuser.getUsername(), sysuser.getPassword()));
		}
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
