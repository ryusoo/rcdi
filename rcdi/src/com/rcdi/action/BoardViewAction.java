package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rcdi.dao.BoardDAO;
import com.rcdi.dto.BoardDTO;

public class BoardViewAction implements Action {
	
	// bno 검색해서 한건 갖고오는 것
	// 조회수 증가

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url ="board/boardview.jsp";
		
		
		String bno = request.getParameter("bno");
		// System.out.println("게시글 번호: "+ bno);
		BoardDAO bDao = BoardDAO.getInstance();
		HttpSession session = request.getSession();
		
		// 조회수 증가(+1) : 순서가 중요하다. 먼저 증가를 시켜줘야한다.
		bDao.viewCnt(bno, session);
		
		// 게시글 1건(상세 조회)
		BoardDTO bDto = bDao.view(bno);
		// System.out.println(bDto.toString());
		request.setAttribute("one", bDto); 
		
	
		
		ActionForward forward = new ActionForward(); 
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		return forward;
	}

}
