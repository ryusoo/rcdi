package com.rcdi.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcdi.common.Constants;
import com.rcdi.dao.BoardDAO;

public class RemovePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 첨부파일 삭제
		String filename = request.getParameter("filename");
		if(filename.equals("-")) { // 첨부파일이 있는 경우
			File file = new File(Constants.UPLOAD_PATH+filename);
			file.delete(); // 첨부파일 삭제
			// 첨부파일은 수정기능이 없다. 그냥 삭제하고 다시 올리는 것만 있다.
		}
		
		// 게시글 삭제
		String bno = request.getParameter("bno");
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.removeBoard(bno);
		
		String url = "boardList.rcdi"; // 삭제하고 나서 게시글 목록으로 감
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
