package com.rcdi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcdi.action.Action;
import com.rcdi.action.ActionForward;
import com.rcdi.action.ConstractAction;
import com.rcdi.action.IdCheckAction;
import com.rcdi.action.IndexAction;
import com.rcdi.action.LoginAjaxAction;
import com.rcdi.action.MemberAction;
import com.rcdi.action.MemberPlayAction;

import loginOut.LoginOutAction;


@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    public FrontController() {
        super();
        
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Action action = null;
		ActionForward forward = null;
		
		// 13. uri와 ctx를 빼서 command를 생성
		//		실행: /rcdi/idCheck.rcdi
		//			-/rcdi
		//-----------------------------------------
		//			= /idCheck.rcdi    >>> command 
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());
		System.out.println("페이지 이동>>>"+command);
		
		// 14. 생성된 command와 조건에 맞는 if문 실행
		//	   command = /idCheck.rcdi
		
		if(command.contentEquals("/index.rcdi")){
			action = new IndexAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/constract.rcdi")){
			action = new ConstractAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/member.rcdi")){
			action = new MemberAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/idCheck.rcdi")){
			// 15. idCheckAction 클래스 객체 생성
			//	    결과물: action 인스턴스
			//	   action 인스턴스를 활용하여 excute()메서드 실행
			//	    매개변수로 Controller의 request와 response를 전송
			//	    이동: IdCheckAction 클래스의 excute()로 이동
			action = new IdCheckAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/memberPlay.rcdi")){
			action = new MemberPlayAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/login.rcdi")){
			action = new LoginAjaxAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/loginOut.rcdi")){
			action = new LoginOutAction();
			forward = action.excute(request, response);
		}
		
		
		
		
		
		if (forward != null) {

			if (forward.isRedirect()) { 
				response.sendRedirect(forward.getPath());
			} else { 

				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath()); 
				rd.forward(request, response);
			}
		}
		
	}
	

}
