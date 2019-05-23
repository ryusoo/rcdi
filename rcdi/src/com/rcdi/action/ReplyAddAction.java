package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcdi.dao.BoardDAO;
import com.rcdi.dao.ReplyDAO;
import com.rcdi.dto.ReplyDTO;

public class ReplyAddAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("re_bno"));
		String writer = request.getParameter("re_writer");
		String content = request.getParameter("re_textarea");
	
		
		ReplyDTO rDto = new ReplyDTO(content, writer, bno);
		// System.out.println(rDto.toString());
		ReplyDAO rDao = ReplyDAO.getInstance();
		int result = rDao.replyAdd(rDto);
		if(result > 0) {
			System.out.println("댓글등록 성공");
			
			BoardDAO bDao = BoardDAO.getInstance();
			int result1 = bDao.replycntAdd(bno);
			if(result1 > 0) {
				System.out.println("replycnt+1성공");
			} else {
				System.out.println("replycnt+1 실패");
			}
		} else {
			System.out.println("댓글등록 실패");
		}
		return null;
	}
}
