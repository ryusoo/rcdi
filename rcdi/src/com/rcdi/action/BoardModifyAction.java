package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcdi.dao.BoardDAO;
import com.rcdi.dto.BoardDTO;

public class BoardModifyAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "board/board_modify.jsp";
		
		String bno = request.getParameter("bno");
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = new BoardDTO();
		bDto = bDao.view(bno);
		
		System.out.println(bDto.toString());
		
		request.setAttribute("one", bDto);
		
		
		ActionForward forward = new ActionForward(); 
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
