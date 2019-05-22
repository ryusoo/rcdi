package com.rcdi.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcdi.dao.ReplyDAO;
import com.rcdi.dto.ReplyDTO;

public class CommentListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="board/commentlist.jsp";
		
		String bno = request.getParameter("bno");
		System.out.println("게시글 번호: "+bno);
		
		// 해당 게시글의 댓글 목록을 조회
		ReplyDAO rDao = ReplyDAO.getInstance();
		List<ReplyDTO> list = rDao.replyList(bno);
		
		request.setAttribute("replyList", list);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward; // AJAX지만 페이지 이동한다. 화면단을 jsp 통으로 보내는게 댓글 ajax의 트렌드이다.
	}

}
