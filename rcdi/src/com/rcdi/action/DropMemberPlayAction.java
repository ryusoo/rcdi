package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rcdi.dao.MemberDAO;
import com.rcdi.dto.MemberDTO;

public class DropMemberPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "index.rcdi";
		
		HttpSession session = request.getSession();
		// 세션에 있는 타입은 따로 있는 것이 아니고 그냥 객체이다 그래서 데이터 타입이 없기 때문에 형변환해서 데이터 타입을 써준다.
		// DTO로 담겨서 낱개로는 못 꺼내니까 DTO로 꺼내고 낱개로 꺼낸다.
		MemberDTO mDto = (MemberDTO) session.getAttribute("loginUser");
		String id = mDto.getId();
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.memDelete(id);
		
	
		if(result > 0) {
			session.invalidate();
		}
		ActionForward forward = new ActionForward(); 
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
