package com.test;


import org.apache.commons.codec.digest.DigestUtils;

import com.framework.shiro.CredentialsMatcher;

public class Main {

	public static void main(String[] args) {
		System.out.println(CredentialsMatcher.encrypt("admin", "123456"));
	}
	

}
