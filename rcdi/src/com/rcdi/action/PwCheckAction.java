package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.rcdi.dao.MemberDAO;

public class PwCheckAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println(id+", "+pw);
		MemberDAO mDao = MemberDAO.getInstance();
		boolean flag = mDao.pwCheck(id, pw);
		// flag 에 값이 true 이면 입력한 비밀번호가 현재 비밀번호와 일치한다.
		// flag 에 값이 false 이면 입력한 비밀번호가 현재 비밀번호와 일치하지 않는다.
			
		
		JSONObject jObj = new JSONObject();
		jObj.put("flag", flag);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		return null;
	}

}
