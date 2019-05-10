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
		
		
		Map<String, String[]> map = request.getParameterMap();
		for (String key : map.keySet()) {
			String[] value = map.get(key);
			System.out.println(key+" : "+value[0]);
		}
		
		
		String url = "index.rcdi"; // 회원가입하고나서 갈 곳
		
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pswd1");
		String name = request.getParameter("name");
		int birth_year = Integer.parseInt(request.getParameter("yy"));
		int birth_month = Integer.parseInt(request.getParameter("mm"));
		int birth_day = Integer.parseInt(request.getParameter("dd"));
		String phone = request.getParameter("phone");
//		String[] receive_vals = request.getParameterValues("is_receive");
		String email_id = request.getParameter("email_id");
		String email_url = request.getParameter("email_url");
		String email = email_id +"@" + email_url;
		String zipcode = request.getParameter("postcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String preceiveyn = request.getParameter("sms_receive");
		String ereceiveyn = request.getParameter("email_receive");
//		int i = 0;
//		for(String val : receive_vals) {
//			if(i == 0) {
//				preceiveyn = val;
//				i++;
//			} else if(i == 1) {
//				ereceiveyn = val;
//			}
//		}
		
		MemberDTO mDto = new MemberDTO(id, pw, name, birth_year, birth_month, birth_day, phone, preceiveyn, email, ereceiveyn, zipcode, addr1, addr2);
		
		System.out.println(mDto.toString());
		MemberDAO mDao = MemberDAO.getInstance();
		
		int result = mDao.memInsert(mDto);
		
		if(result > 0) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		
		
		
		
		ActionForward forward = new ActionForward(); 
		forward.setPath(url);
		forward.setRedirect(true); // DB값 실제로 변함. sendRedirect(delete, insert, update)
		
		
		return forward;
	}

	private String Integer(String parameter) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
