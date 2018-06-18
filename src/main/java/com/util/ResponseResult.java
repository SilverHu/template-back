package com.util;

/**
 * 响应报文
 * @author hucy
 *
 */
public class ResponseResult {
	private ResponseCode code;
	private String msg;
	public static ResponseResult success = new ResponseResult(ResponseCode.SUCCESS, "success");
	
	public ResponseCode getCode() {
		return code;
	}
	
	public String getMsg() {
		return msg;
	}
	
	public ResponseResult(ResponseCode code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}

	public static enum ResponseCode{
		SUCCESS, ERROR_400
	}
	
	public static enum SaveOperation{
		ADD, UPDATE
	}
}
