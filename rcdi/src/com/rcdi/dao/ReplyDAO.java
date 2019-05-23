package com.rcdi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.rcdi.dto.ReplyDTO;
import com.rcdi.mybatis.SqlMapConfig;

public class ReplyDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	List<ReplyDTO> list = null;
	int result;
	
	private ReplyDAO() {}
	
	private static ReplyDAO instance = new ReplyDAO();
	
	public static ReplyDAO getInstance() {
		return instance;
	}
	
	// 해당 게시글 댓글 목록 조회
	public List<ReplyDTO> replyList(String bno) {
		sqlSession = sqlSessionFactory.openSession();
		try {
			list = sqlSession.selectList("replyList", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	public int replyAdd(ReplyDTO rDto) {
		sqlSession= sqlSessionFactory.openSession(true);
		try {
			result = sqlSession.insert("replyAdd", rDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	
	
	public int replyRemove(int rno) {
		sqlSession = sqlSessionFactory.openSession(true);
		try {
			result = sqlSession.delete("replyRemove", rno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}

}
