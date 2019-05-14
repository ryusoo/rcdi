package com.rcdi.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcdi.dao.MemberDAO;
import com.rcdi.dto.MemberDTO;

public class MemberPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "index.jsp";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email_id = request.getParameter("email_id");
		String email_url = request.getParameter("email_url");
		String email = email_id + '@' + email_url;
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		MemberDTO mDto = new MemberDTO(id, pw, name, phone, email, zipcode, addr1, addr2);
		
		MemberDAO mDao = MemberDAO.getInstance();
		
		int result = mDao.memInsert(mDto);
		
		if(result > 0) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		ActionForward forward = new ActionForward(); 
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
	
	/*
	 * Map<String, String[]> map = request.getParameterMap(); for (String key :
	 * map.keySet()) { String[] value = map.get(key);
	 * System.out.println(key+" : "+value[0]); }
	 */
	
//	int i = 0;
//	for(String val : receive_vals) {
//		if(i == 0) {
//			preceiveyn = val;
//			i++;
//		} else if(i == 1) {
//			ereceiveyn = val;
//		}
//	}

	private String Integer(String parameter) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
