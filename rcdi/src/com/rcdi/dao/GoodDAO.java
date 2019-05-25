package com.rcdi.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.rcdi.dto.GoodDTO;
import com.rcdi.mybatis.SqlMapConfig;

public class GoodDAO {

	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession(); // SqlMapConfig 에 있는 getSqlSession()를 호출함
	SqlSession sqlSession;
	int result;
	int result2;
	GoodDTO gDto = new GoodDTO();
	
	
	private GoodDAO() {}
	
	private static GoodDAO instance = new GoodDAO();
	
	public static GoodDAO getInstance() {
		return instance;
	}
	
	public int goodInsert(String id, int bno) {
		sqlSession = sqlSessionFactory.openSession(true);
		gDto = new GoodDTO();
		gDto.setBno(bno);
		gDto.setId(id);
		try {
			result2 = sqlSession.insert("goodInsert", gDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result2;
	}
	public int goodDelete(String id, int bno) {
		sqlSession = sqlSessionFactory.openSession(true);
		gDto = new GoodDTO();
		gDto.setBno(bno);
		gDto.setId(id);
		try {
			result = sqlSession.delete("goodDelete", gDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
		
	}

	public GoodDTO goodCheck(String id, int bno) {
		sqlSession = sqlSessionFactory.openSession();
		gDto = new GoodDTO();
		gDto.setBno(bno);
		gDto.setId(id);
		try {
			gDto = sqlSession.selectOne("goodCheck", gDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return gDto;
	}

	public int goodCurrent(int bno) {
		sqlSession = sqlSessionFactory.openSession();
		int goodcnt=0;
		try {
			goodcnt = sqlSession.selectOne("goodCurrent", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return goodcnt;

		
	}

	
	
	
}
