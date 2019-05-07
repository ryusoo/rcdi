package com.rcdi.action;

public class ActionForward {
	// view page(결과값을 어디로 넘길지 결정)
	private String path; // shs_index.jsp
	private boolean isRedirect; // false
	
	// 페이지 넘길 때 2가지 방법
	// 1) sendRedirect
	// 2) forward
	// true -> sendRedirect
	// false -> forward
	
	
	public String getPath() {
		return path; // 전역에 담김 shs_index.jsp를 가지고 나를 호출한 곳으로 돌아감
	}
	public void setPath(String path) { //shs_index.jsp 가지고와서
		this.path = path; // this 전역변수 담아줌
	}
	public boolean isRedirect() {
		return isRedirect; // 전역에 담겨있던 false 담아서 나를 호출한 곳으로 돌아감
	}
	public void setRedirect(boolean isRedirect) { // false가지고와서
		this.isRedirect = isRedirect; // this 전역변수에 담아줌
	}
	
}
