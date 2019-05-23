package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcdi.dao.BoardDAO;
import com.rcdi.dao.GoodDAO;
import com.rcdi.dto.BoardDTO;

public class GoodPlusAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.goodPlus(bno);
		
		
		if(result > 0) {
			System.out.println("좋아요");
			GoodDAO gDao = GoodDAO.getInstance();
			int goodcnt = gDao.goodCnt(bno);
			
		} else {
			System.out.println("싫어요");
		}
		
		return null;
		
	}

}
