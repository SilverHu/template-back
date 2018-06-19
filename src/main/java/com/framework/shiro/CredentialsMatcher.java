package com.framework.shiro;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class CredentialsMatcher extends SimpleCredentialsMatcher {

	@Override
	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
		// 获取用户名和密码
		String username = (String) token.getPrincipal();
		String password = new String((char[]) token.getCredentials());

		// 将密码加密与系统加密后的密码校验，内容一致就返回true,不一致就返回false
		return equals(encrypt(username, password), getCredentials(info));
	}

	/**
	 * 加密方法
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public static String encrypt(String username, String password) {
		if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
			return password;
		}
		String hashAlgorithmName = "MD5";// 加密方式
		int hashIterations = 8;// 加密8次
		ByteSource salt = ByteSource.Util.bytes(username);// 以账号作为盐值
		SimpleHash hash = new SimpleHash(hashAlgorithmName, password, salt, hashIterations);
		return hash.toString();
	}
}
