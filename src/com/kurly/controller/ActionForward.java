package com.kurly.controller;

/*
 
[ActionForward 클래스]
1. Action 인터페이스의 리턴타입으로 사용될 클래스
2. 구성요소
 1) isRedirect 멤버 - boolean 타입
 	- true(*.do) or false(.jsp)
 2) path 멤버 - String 타입
 	- 파일 경로 설정(지정)

*/

public class ActionForward {
	
	private boolean isRedirect;
	private String path;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
}
