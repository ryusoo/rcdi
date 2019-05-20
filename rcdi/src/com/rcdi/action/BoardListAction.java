package com.rcdi.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcdi.dao.BoardDAO;
import com.rcdi.dto.BoardDTO;
import com.rcdi.dto.CriteriaDTO;
import com.rcdi.dto.PageMakerDTO;

public class BoardListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "board/list.jsp";
		
		CriteriaDTO criDto = new CriteriaDTO();
		int page = 1; // default 페이지. 기본 페이지는 1page. 일반 변수에 담음. CriteriaDTO에 넣지 않음.
		// 화면단에서는 1을 입력하지 않기 때문에 없어서 null이 온다. 그래서 아래를 타지 않음.
		// 사용자가 입력한 페이지로 가는 경우, 쿼리스트링으로 값을 주는 경우 ?page=5 이렇게 있는 경우 아래를 탄다.
		if(request.getParameter("page") != null) { // 이부분 체크해주는 것이 중요하다.
			page = Integer.parseInt(request.getParameter("page")); // 쿼리스트링으로 페이지를 선택할 때 page를 받는 과정임
		} 
		System.out.println("페이지번호:" + page);
		criDto.setPage(page); 
		
		String sort_type = "new";
		if(request.getParameter("sort_type") != null) {
			sort_type = request.getParameter("sort_type");
		}
		System.out.println("정렬타입:" + sort_type);
		
		// DB에서 게시글 목록 호출
		BoardDAO bDao = BoardDAO.getInstance();
		List<BoardDTO> list = bDao.listAll(criDto);
		
		// 페이지네이션 생성
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		int totalCount = bDao.totalCount(criDto); // result를 받음
		pageMaker.setTotalCount(totalCount);
		
		// View단으로 게시글목록 전송
		request.setAttribute("list", list);
		request.setAttribute("pageMaker", pageMaker);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("sort_type", sort_type);
		
		ActionForward forward = new ActionForward(); 
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		return forward;
	}

}
