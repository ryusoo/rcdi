package com.rcdi.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.rcdi.dto.BoardDTO;
import com.rcdi.dto.CriteriaDTO;
import com.rcdi.mybatis.SqlMapConfig;

public class BoardDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession(); // SqlMapConfig 에 있는 getSqlSession()를 호출함
	SqlSession sqlSession;
	int result;
	BoardDTO bDto = new BoardDTO();
	List<BoardDTO> list = null;
	boolean flag = false;
	
	private BoardDAO(){}
	
	private static BoardDAO instance = new BoardDAO();


	public static BoardDAO getInstance() {
		return instance;
	}
	
	// 게시글 목록
	public List<BoardDTO> listAll(CriteriaDTO criDto){
		sqlSession = sqlSessionFactory.openSession();// mybatis사용하기위해 worker생성
		try { // 결과가 sql문을 어떻게 실행하더라도 1줄까지만 나올 때 selectOne을 사용하고 3줄나오고 1줄나오고 하면 큰 것을 사용해서 selectList쓴다.
			list = sqlSession.selectList("listAll", criDto); // rcdiMapper.xml에서 listAll이름표가진 sql찾아감
			// sql을 실행하기 위해서 listAll이름표 가진 Mapper가서 sql문 실행하고 criDto를 매개변수로 줘라
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	// 페이지네이션에 필요한 게시글 Total 수 구하기
	public int totalCount(CriteriaDTO criDto) {
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.selectOne("totalCount", criDto); // 실행해야 할 sql문 이름 totalCount, 실행해야 할 sql 모아놓은 곳은 Mapper.xml이다
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();			
		}
		return result;
	}
	
	// 게시글 1건 (상세조회)
	public BoardDTO view(String bno) {
		sqlSession = sqlSessionFactory.openSession();
		try {
			bDto = sqlSession.selectOne("view", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return bDto;
	}
	
	// 게시글 조회수 증가 (+1)
	public void viewCnt(String bno, HttpSession session){
		sqlSession = sqlSessionFactory.openSession(true);
		try {
			long update_time = 0;
			
			// null이면 => 처음 조회수 1증가
			// null이 아니면 처음이 아님
			if(session.getAttribute("read_time_"+bno) != null) {
				// 이전에 게시글 조회한 시간
				update_time = (long)session.getAttribute("read_time_"+bno);
			}
			
			// 현재시간 구하기(밀리초단위)
			long current_time = System.currentTimeMillis();
			
			// 현재시간과 이전에 게시글 조회시간을 비교
			// 24시간(1일)이 지났으면 조회수를 1증가 아니면 조회수 증가 없음
			// 24 * 60 * 60 * 1000 = 24시간을 밀리초로 바꾸는 계산
			if(current_time - update_time > 24 * 60 * 60 * 1000) { // 60 * 1000 = 1분
				// 조회수 1증가
				sqlSession.update("viewCnt", bno);
				
				// 조회수 1증가한 최신 시간을 session에 담음
				session.setAttribute("read_time_"+bno, current_time);
				
				// ex) 30번 게시글을 조회하는 경우
				// read_time_30변수를 하나 만들고 현재시간을 담음
				
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
}
