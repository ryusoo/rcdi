package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rcdi.dao.MemberDAO;
import com.rcdi.dto.MemberDTO;

public class PwUpdatePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String url = "index.jsp";
		MemberDTO mDto = (MemberDTO) session.getAttribute("loginUser");
		
		String id = mDto.getId();
		String pw = request.getParameter("npw");
		System.out.println(id + ", " + pw);
		
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.memPwUpdate(id, pw);
		
		if(result > 0) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		ActionForward forward = new ActionForward(); 
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
