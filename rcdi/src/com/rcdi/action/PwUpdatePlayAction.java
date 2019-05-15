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
		
		String url = "index.rcdi";
		// 새 비밀번호의 값
		String pw = request.getParameter("npw");
		// ID를 Session에서 가져오는 방법은 pw_update.jsp에서 input태그를 id로 하나 만들어서 사용하는 방법있음
		String id = request.getParameter("id");
		
		// ID를 Session에서 가져오는 방법 중 하나.
		// HttpSession session = request.getSession();
		// MemberDTO mDto = (MemberDTO) session.getAttribute("loginUser");
		// String id = mDto.getId();
	
		System.out.println(id + ", " + pw);
		
		// 패스워드 수정
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.pwUpdate(id, pw);
		
		if(result > 0) {
			System.out.println("성공");
			HttpSession session = request.getSession();
			MemberDTO mDto = mDao.memOne(id);
			
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", mDto);
		} else {
			System.out.println("실패");
		}
		
		ActionForward forward = new ActionForward(); 
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
