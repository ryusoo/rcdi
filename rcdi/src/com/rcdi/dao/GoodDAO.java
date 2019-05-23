package com.rcdi.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.rcdi.mybatis.SqlMapConfig;

public class GoodDAO {

	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession(); // SqlMapConfig 에 있는 getSqlSession()를 호출함
	SqlSession sqlSession;
	int result;
	
	
	private GoodDAO() {}
	
	private static GoodDAO instance = new GoodDAO();
	
	public static GoodDAO getInstance() {
		return instance;
	}
	
	
	public int goodCnt(int bno){
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.selectOne("goodCnt", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	
	
}
