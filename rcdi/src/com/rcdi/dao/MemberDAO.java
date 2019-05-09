package com.rcdi.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.rcdi.mybatis.SqlMapConfig;

public class MemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession(); // SqlMapConfig 에 있는 getSqlSession()를 호출함
	SqlSession sqlSession;

	private MemberDAO(){}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
		
		
		
}
	
	// 회원가입 ID중복체크(Ajax)
	public String idCheck(String id) {
		sqlSession = sqlSessionFactory.openSession();
		String result = "";
		try {
			result = sqlSession.selectOne("idCheck", id);
			
			if(result != null) { // id가 있다 = 중복
				result="-1";
			} else {
				result="1"; // 사용 가능한 ID
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
}
