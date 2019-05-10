package com.rcdi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.rcdi.dao.MemberDAO;

public class IdCheckAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 16. Controller에서 전송한 request를 활용하여 ajax에서 보낸(member.jsp에서 보낸 )id: memId를 가져와 id 변수에 담음
		String id = request.getParameter("id");
		
		
		// 17. MemberDAO 객체 빌려와 mDao에 담음
		MemberDAO mDao = MemberDAO.getInstance();
		
		// 18. MemberDAO 클래스의 idCheck()메서드 실행
		// 	    매개변수로 id값 전달
		String result = mDao.idCheck(id);
		// 25. "-1" or "1"값을 result 변수에 담음
		
		//Ajax => JSON 방식 => return 할 때 보내는 값도 JSON방식
		
		// 26. Ajax 페이지로 결과값을 JSON 방식으로 전달하기 위해 Google Json-Simple 라이브러리를 사용핟여 JSONObject 생성
		// (Ajax에서 받는 data가 String으로 밖에 못 받는다. 그래서 json(문자열), xml로 보내는 방식이 있는데 xml이 오류가 많아(but, 현업은 xml 사용), json으로 보낸다.
		// xml로 셋팅한다는 것은 자바콩이 jObj(아래것) 자동으로 객체를 만들어 준다.)
		JSONObject jObj = new JSONObject();
		// int message = 1;
		
		// 27. Ajax로 전달할 데이터를 담음
		//     - message 변수에 result담음
		//	   - id변수에 id담음
		jObj.put("message", result);
		jObj.put("id", id);
		
		// forward로 보내는 것이 목적지와 방법을 쓰는 건데
		// 여기는 나에게 다시 돌아가는것이기 때문에 
		
		// 28. JSON 객체에 담은 데이터를 호출한 페이지로 전송하는 기능
		//     (원래의 페이지로 가야함. 안가면 시스템에러,, 다른페이지 가고싶으면 원페이지로 가서 이동해야함)
		// 	   결론 : message와 id를 가지고 Ajax로 이동!
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj); // 여기서 보낸다
		
		
		
		// Ajax 방식은 목적지가 자기 자신임으로 forward(목적지, 이동수단)을 return할 필요 없음
		
		return null;
	}

}
