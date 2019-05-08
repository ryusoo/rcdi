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
import com.rcdi.action.MemberAction;


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
		
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());
		System.out.println("페이지 이동>>>"+command);
		
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
			action = new IdCheckAction();
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
