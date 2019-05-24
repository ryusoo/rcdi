package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcdi.dao.BoardDAO;
import com.rcdi.dao.ReplyDAO;
import com.rcdi.dto.ReplyDTO;

public class ReplyRemoveAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String strBno = request.getParameter("bno");
		int rno = Integer.parseInt(request.getParameter("rno"));
		int bno = Integer.parseInt(strBno);
		
		ReplyDAO rDao = ReplyDAO.getInstance();
		int result = rDao.replyRemove(rno);
		
		if(result > 0) {
			System.out.println("성공");
			
			BoardDAO bDao = BoardDAO.getInstance();
			String flag = "minus";
			bDao.replyCntUpdate(strBno, flag);
			
		} else {
			System.out.println("실패");
		}
		
		
		return null;
	}

}
