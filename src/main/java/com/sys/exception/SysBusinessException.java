package com.sys.exception;

public class SysBusinessException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public SysBusinessException() {
		super();
	}
	
	public SysBusinessException(String message){
		super(message);
	}
}
