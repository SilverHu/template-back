package com.test;

import java.io.UnsupportedEncodingException;

import org.apache.shiro.codec.Base64;

public class Main {

	public static void main(String[] args) {
		byte[] bytes = Base64.decode("kPe6hhSc2hTlC8Ehw01DHQ==");
		try {
			System.out.println(new String(bytes,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
