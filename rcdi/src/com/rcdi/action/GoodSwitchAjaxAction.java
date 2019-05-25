package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.rcdi.dao.BoardDAO;
import com.rcdi.dao.GoodDAO;
import com.rcdi.dto.GoodDTO;

public class GoodSwitchAjaxAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String writer = id;
		
		GoodDAO gDao = GoodDAO.getInstance();
		GoodDTO gDto = gDao.goodCheck(id, bno);
		if(gDto == null) {
			int result = gDao.goodInsert(id, bno);
			if(result > 0) {
				System.out.println("좋아요 추가 성공");
			} else {
				System.out.println("좋아요 추가 실패");
			}
		} else {
			int result2 = gDao.goodDelete(id, bno);
			if(result2 > 0) {
				System.out.println("좋아요 삭제 성공");
			} else {
				System.out.println("좋아요 삭제 실패");
			}
		}
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		int goodcnt = gDao.goodCurrent(bno);
		
		// 게시판 테이블의 goodcnt update
		bDao.goodcntUpdate(bno, goodcnt);
		

		JSONObject jObj = new JSONObject();
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		return null;
	}

}
