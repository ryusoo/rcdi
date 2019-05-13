package loginOut;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rcdi.action.Action;
import com.rcdi.action.ActionForward;

public class LoginOutAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session != null) {
			// Session을 초기화
			session.invalidate();
		}
		// 내 바로 앞의 이전페이지를 알려준다.
		String referer = request.getHeader("referer");
		
		System.out.println("url: "+ referer);
		
		String url = referer;
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
