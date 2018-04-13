package com.sys.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.entity.SysUser;
import com.sys.service.SysUserService;

@Controller
public class LoginController {

	@Autowired
	SysUserService sysUserService;
	@RequestMapping("/login")
	public Object login(HttpServletRequest request, SysUser sysUser) {
		if (StringUtils.isBlank(sysUser.getUsername()) || StringUtils.isBlank(sysUser.getPassword())) {
			return "login";
		}
		SysUser validator = sysUserService.findByUsername(sysUser.getUsername());
		if (validator != null && validator.getPassword().equals(sysUser.getPassword())) {
			HttpSession session = request.getSession();
			session.setAttribute("sysUser", sysUser);
			return index(request);
		} else {
			return "login";
		}
	}
	
	@RequestMapping("/logout")
	public Object loginout(HttpServletRequest request){
		request.removeAttribute("sysUser");
		return "login";
	}

	@RequestMapping("/index")
	public Object index(HttpServletRequest request) {
		if (request.getSession().getAttribute("sysUser") == null) {
			return "login";
		} else{
			return "index";
		}
	}
}
