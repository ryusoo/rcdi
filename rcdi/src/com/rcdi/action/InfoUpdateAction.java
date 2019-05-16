package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InfoUpdateAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "member/info_update.jsp";
		System.out.println("action탔음.");
		
		// 로그인 된 유저만 회원수정 가능
		//Session 저장소에서 세션에 저장된 자료를 불러온다
		HttpSession session = request.getSession();
		
		// 게스트유저라면 index로 돌려보냄
		if(session.getAttribute("loginUser") == null) {
			url = "index.rcdi";
		}
		
		
		ActionForward forward = new ActionForward(); 
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		return forward;
	}

}
