package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.rcdi.dao.BoardDAO;
import com.rcdi.dao.GoodDAO;
import com.rcdi.dto.BoardDTO;
import com.rcdi.dto.GoodDTO;

public class GoodPlusAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String id = request.getParameter("id");
		
		System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★" + bno + ", " + id);
		
		
		// 이미 좋아요 버튼을 누른 사람인지 판단하기 위해 tbl_goodcnt 조회
		GoodDAO gDao = GoodDAO.getInstance();
		GoodDTO gDto = gDao.goodCheck(id, bno);
		
		if(gDto != null) {
			System.out.println(gDto.toString());
			System.out.println("너 이미 눌렀으니깐 또 못눌러");
			return null;
		}
		
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.goodPlus(bno, id);
		
		if(result > 0) {
			System.out.println("tbl_board의 goodcnt 값 + 1 성공");
			
			int result2 = gDao.goodInsert(id, bno);
			if(result2 > 0) {
				System.out.println("tbl_goodcnt의 등록 성공");
			} else {
				System.out.println("tbl_goodcnt의 등록 실패");
			}
		} else {
			System.out.println("tbl_board의 goodcnt 값 + 1 실패");
		}
		
		int goodcnt = bDao.goodSelect(bno);
		System.out.println("내가 필요한 goodcnt : " +  goodcnt);
		
		JSONObject jObj = new JSONObject();
		jObj.put("goodcnt", goodcnt);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		return null;
		
	}

}
