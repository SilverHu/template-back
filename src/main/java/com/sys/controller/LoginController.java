package com.sys.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.sys.entity.SysUser;
import com.sys.service.SysUserService;

@Controller
public class LoginController {

	private static Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	SysUserService sysUserService;

	@RequestMapping("/login")
	public Object gologin(HttpServletRequest request, SysUser sysUser) {
		logger.debug("login : {}", JSON.toJSONString(sysUser));
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

	@RequestMapping("/index")
	public Object index(HttpServletRequest request) {
		return "index";
	}
}
