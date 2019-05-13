package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.rcdi.dao.LoginDAO;
import com.rcdi.dto.MemberDTO;

public class LoginAjaxAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Session을 사용하기 위해 session 객체 생성
		// 웹에서 쓰는 공용 저장소
		// WAS를 활용하여 Web에서 사용하는 공용저장소
		
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		LoginDAO lDao = LoginDAO.getInstance();
		MemberDTO mDto = lDao.loginCheck(id, pw);
		String message = "";
		
		// System.out.println(id + ", "+ pw);
		
		if(mDto != null) {// 로그인 성공
			// Session에 Login된 회원 정보를 담음
			
			// 세션에서 loginUser정보를 삭제
			// 혹시모를 기존에 남아있는 값을 제거
			// session에가서 "loginUser"이름표 단것에 혹시 뭐가있으면 지운다. 기존의 값을 제거한다
			session.removeAttribute("loginUser");
			// 세션에 loginUser정보를 저장
			session.setAttribute("loginUser", mDto);
			message = "1";
		} else {
			message = "-1";
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("message", message);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		
		
		
		return null; // Ajax라 목적지 없으니 ActionForward보낼 필요없음. null
	}

}
