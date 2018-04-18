package com.test;


import org.apache.commons.codec.digest.DigestUtils;

public class Main {

	public static void main(String[] args) {
		String password = DigestUtils.md5Hex("123456");
		System.out.println(password);
	}

}
