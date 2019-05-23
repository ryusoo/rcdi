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
		int rno = Integer.parseInt(request.getParameter("rno"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		ReplyDAO rDao = ReplyDAO.getInstance();
		int result = rDao.replyRemove(rno);
		
		if(result > 0) {
			System.out.println("성공");
			
			BoardDAO bDao = BoardDAO.getInstance();
			int result1 = bDao.replycntMinus(bno);
			if(result1 > 0) {
				System.out.println("댓글카운트 -1 성공");
			} else {
				System.out.println("댓글카운트 -1 실패");
			}
			
			
		} else {
			System.out.println("실패");
		}
		
		
		return null;
	}

}
