package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DropMemberAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url ="member/member_delete.jsp";
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") == null) {
			url = "index.rcdi";
		}
		
		ActionForward forward = new ActionForward(); 
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
