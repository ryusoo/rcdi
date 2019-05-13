package com.rcdi.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.rcdi.dto.MemberDTO;
import com.rcdi.mybatis.SqlMapConfig;

public class LoginDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession(); // SqlMapConfig 에 있는 getSqlSession()를 호출함
	SqlSession sqlSession;
	int result = 0;
	
	private LoginDAO(){}
	private static LoginDAO instance = new LoginDAO();
	public static LoginDAO getInstance() {
		return instance;
	}
	
	// Login시 회원가입 유무 Check
	public MemberDTO loginCheck(String id, String pw) {
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO();
		// DTO 생성자로 다 만들어서 넣지않고 2개만 setter사용해서 간편하게 사용
		// DTO에 2개짜리 생성자 만드는 대신 이렇게 사용함.
		mDto.setId(id);
		mDto.setPw(pw);
		try {
			
			// 한 줄(컬럼여러개)이 정보가 오기 때문에 selectOne, 컬럼이 1개만 와도 selectOne
			mDto = sqlSession.selectOne("loginCheck", mDto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return mDto;
		
	}
	
	
	
	
	
}
