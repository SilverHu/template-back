package com.sys.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.service.SysUserService;

@Controller
public class LoginController {

	private static Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	SysUserService sysUserService;

	@RequestMapping("/login")
	public Object login(HttpServletRequest request) {
		String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
		String error = null;
		if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
			error = "用户名/密码错误";
		} else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
			error = "用户名/密码错误";
		} else if (exceptionClassName != null) {
			error = "其他错误：" + exceptionClassName;
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
	@RequestMapping(value = "/index")
	public String success() {

		return "index";
	}
}
