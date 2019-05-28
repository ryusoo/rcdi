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
import com.rcdi.action.BoardListAction;
import com.rcdi.action.BoardModifyAction;
import com.rcdi.action.BoardViewAction;
import com.rcdi.action.CommentListAction;
import com.rcdi.action.ConstractAction;
import com.rcdi.action.DownloadAction;
import com.rcdi.action.DropMemberAction;
import com.rcdi.action.DropMemberPlayAction;
import com.rcdi.action.GoodCheckAjaxAction;
import com.rcdi.action.GoodPlusAction;
import com.rcdi.action.GoodSwitchAjaxAction;
import com.rcdi.action.IdCheckAction;
import com.rcdi.action.IndexAction;
import com.rcdi.action.InfoUpdateAction;
import com.rcdi.action.InfoUpdatePlayAction;
import com.rcdi.action.LoginAjaxAction;
import com.rcdi.action.LogoutAjaxAction;
import com.rcdi.action.MemberAction;
import com.rcdi.action.MemberPlayAction;
import com.rcdi.action.ModifyPlayAction;
import com.rcdi.action.PwCheckAction;
import com.rcdi.action.PwUpdateAction;
import com.rcdi.action.PwUpdatePlayAction;
import com.rcdi.action.RegisterAjaxAction;
import com.rcdi.action.RegisterPlayAction;
import com.rcdi.action.RegisterViewAction;
import com.rcdi.action.RemovePlayAction;
import com.rcdi.action.ReplyAddAction;
import com.rcdi.action.ReplyRemoveAction;
import com.rcdi.action.LoginOutAction;


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
		} else if(command.contentEquals("/loginOut.rcdi")){ // ajax없이 referer로 로그아웃. 방법이 다름
			action = new LoginOutAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/logoutAjax.rcdi")){ // ajax로 로그아웃 같은 기능이지만 방법이 다름
			action = new LogoutAjaxAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/infoUpdate.rcdi")){ 
			action = new InfoUpdateAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/infoUpdatePlay.rcdi")){ 
			action = new InfoUpdatePlayAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/pwUpdate.rcdi")){ 
			action = new PwUpdateAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/pwCheck.rcdi")){ 
			action = new PwCheckAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/pwUpdatePlay.rcdi")){ 
			action = new PwUpdatePlayAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/dropMember.rcdi")){ 
			action = new DropMemberAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/dropMemberPlay.rcdi")){ 
			action = new DropMemberPlayAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/boardList.rcdi")){ 
			action = new BoardListAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/boardView.rcdi")){ 
			action = new BoardViewAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/commentlist.rcdi")){ 
			action = new CommentListAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/replyAdd.rcdi")){ 
			action = new ReplyAddAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/replyRemove.rcdi")){ 
			action = new ReplyRemoveAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/goodSwitch.rcdi")){ 
			action = new GoodSwitchAjaxAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/registerAjax.rcdi")){ 
			action = new RegisterAjaxAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/registerView.rcdi")){ 
			action = new RegisterViewAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/registerPlay.rcdi")){ 
			action = new RegisterPlayAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/goodCheck.rcdi")){ 
			action = new GoodCheckAjaxAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/download.rcdi")){ 
			action = new DownloadAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/removePlay.rcdi")){ 
			action = new RemovePlayAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/boardModify.rcdi")){ 
			action = new BoardModifyAction();
			forward = action.excute(request, response);
		} else if(command.contentEquals("/modifyPlay.rcdi")){ 
			action = new ModifyPlayAction();
			forward = action.excute(request, response);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		// forward가 널이면 페이지 이동이 없는데 != null이니까 페이지 이동한다.
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
