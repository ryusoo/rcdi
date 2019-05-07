package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action { // 매개변수 타입을 가져와 써야해서 import해준다.
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	

}
