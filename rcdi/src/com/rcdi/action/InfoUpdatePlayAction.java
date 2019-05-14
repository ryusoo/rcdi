package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rcdi.dao.MemberDAO;
import com.rcdi.dto.MemberDTO;

public class InfoUpdatePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "index.rcdi";
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email_id = request.getParameter("email_id");
		String email_url = request.getParameter("email_url");
		String email = email_id +"@" + email_url;
		String zipcode = request.getParameter("postcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		MemberDTO mDto = new MemberDTO(id, name, phone, email, zipcode, addr1, addr2);
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.memUpdate(mDto);
		
		
		// 상단에 이름 Session 수정해주는 코드
		if(result > 0) {
			
			
			mDto = mDao.memOne(id); 
			// 한줄. 멤버 한 명. 내정보 수정페이지에서 바꾸지 않은 정보도 불러오기 위한 코드이다.
			
			HttpSession session = request.getSession();
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", mDto);
		}
		
		
		
		// System.out.println(mDto.toString());
		
		ActionForward forward = new ActionForward(); 
		forward.setPath(url);
		forward.setRedirect(true);
		
		
		return forward;
	}

}
