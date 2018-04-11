package com.test.main;



import com.util.HttpClientUtil;

public class Application {
	
	public static void main(String[] args) {
		String url = "http://baidu.com";
		String str = HttpClientUtil.sendHttpGetRequest(url);
		System.out.println(str);
	}
}
