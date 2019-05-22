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
		String url = "board/list.jsp"; // 단지 변수에 담은 상태
		
		CriteriaDTO criDto = new CriteriaDTO();
		
		// ▷페이지 번호 설정		
		int page = 1; // default 페이지. 기본 페이지는 1page. 일반 변수에 담음. CriteriaDTO에 넣지 않음.
		// 화면단에서는 1을 입력하지 않기 때문에 없어서 null이 온다. 그래서 아래를 타지 않음.
		// 사용자가 입력한 페이지로 가는 경우, 쿼리스트링으로 값을 주는 경우 ?page=5 이렇게 있는 경우 아래를 탄다.
		if(request.getParameter("page") != null) { 
			// 이부분 체크해주는 것이 중요하다.getParameter("page") 전 페이지(header.jsp에서 질문게시판 ${path}/boardList.rcdi}에게 page 달라고 하는 것
			// header.jsp에서 쿼리스트링, 폼태그, Ajax 아무것도 사용안해서 주는 데이터가 없다. 즉 null보낸다.
			page = Integer.parseInt(request.getParameter("page")); // 쿼리스트링으로 페이지를 선택할 때 page를 받는 과정임
		} 
		System.out.println("페이지번호:" + page);
		criDto.setPage(page); 
		
		// ▷페이지 정렬 설정
		String sort_type = "new";
		if(request.getParameter("sort_type") != null) {
			sort_type = request.getParameter("sort_type");
		}
		criDto.setSort_type(sort_type);
		System.out.println("정렬타입:" + sort_type);
		
		// ▷검색 설정(검색타입, 키워드)
		String search_option = null;
		String keyword = null;
		if(request.getParameter("keyword") != null) {
			search_option = request.getParameter("search_option");
			keyword = request.getParameter("keyword");
			criDto.setSearch_option(search_option);
			criDto.setKeyword(keyword);
			// 이 값들도 view에 보내줘야하는데 맨날 보내지 않고 값이 있을 때만 보내준다 그래서 if문 안에 써준다.
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			System.out.println("검색타입: "+ search_option);
			System.out.println("검색키워드: "+ keyword);
		} 
		System.out.println(criDto.toString());
		
		
		// DB에서 게시글 목록 호출
		BoardDAO bDao = BoardDAO.getInstance();
		List<BoardDTO> list = bDao.listAll(criDto);
		
		// 페이지네이션 생성
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		int totalCount = bDao.totalCount(criDto); // result를 받음
		pageMaker.setTotalCount(totalCount);
		
		// View단으로 게시글목록 전송
		// list.jsp에 request.setAtrribute();를 준다
		request.setAttribute("list", list); // 게시물 목록
		request.setAttribute("pageMaker", pageMaker); // 페이지네이션 생성정보
		request.setAttribute("totalCount", totalCount); // 게시물 총 개수
		request.setAttribute("sort_type", sort_type); // 반드시 sort_type보내줘야 정렬 정보를 가지고 다닌다. 페이지가 이동할 대 계속 가지고 다녀야 페이지 이동해도 계속 정렬 결과를 적용하기 때문이다
		
		ActionForward forward = new ActionForward(); 
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		return forward;
	}

}
