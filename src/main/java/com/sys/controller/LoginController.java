package com.sys.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.service.SysPermissionService;
import com.util.Constants;

@Controller
public class LoginController {
	@Autowired
	private SysPermissionService sysPermissionService;
	
	@RequestMapping("/login")
	public Object login(HttpServletRequest request) {
		String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
		String error = null;
		if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
			error = "用户名/密码错误";
		} else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
			error = "用户名/密码错误";
		} else if (LockedAccountException.class.getName().equals(exceptionClassName)) {
			error = "账号锁定";
		} else if (exceptionClassName != null) {
			error = "其他错误";
		}
		request.setAttribute("error", error);
		return "login";
	}

	@RequestMapping("/logout")
	public Object logout(HttpServletRequest request) {
		request.removeAttribute("sysUser");
		return "login";
	}

	@RequestMapping("/unauthorized")
	public Object unauthorized(HttpServletRequest request) {
		return "unauthorized";
	}

	/**
	 * 身份鉴定成功后，根据用户取相关权限信息，并跳转到index页面
	 * @return
	 */
	@RequestMapping(value = "/")
	public String success(Model model) {
		model.addAttribute(Constants.MENUS, sysPermissionService.findByParentidIsNull());
		return "index";
	}
	
	@RequestMapping(value = "/welcome")
	public String welcome(Model model) {
		return "welcome";
	}
}
