package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.rcdi.dao.GoodDAO;
import com.rcdi.dto.GoodDTO;

public class GoodCheckAjaxAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int flag = 0;
		GoodDAO gDao = GoodDAO.getInstance();
		GoodDTO gDto = gDao.goodCheck(id, bno);
		int goodcnt = gDao.goodCurrent(bno);
		
		if(gDto == null) {
			flag = 0;
		} else {
			flag = 1;
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("goodcheck", flag);
		jObj.put("goodcurrent", goodcnt);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		return null;
	}

}
